import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter_native_image/flutter_native_image.dart';

class ObjectDetectionPage extends StatefulWidget {
  bool isDetection;
  ObjectDetectionPage({this.isDetection});

  @override
  _ObjectDetectionPageState createState() => _ObjectDetectionPageState();
}

class _ObjectDetectionPageState extends State<ObjectDetectionPage> {
  CameraController cameraController;
  List<CameraDescription> cameras;
  bool isReady = false;
  final CloudLabelDetector labelDetector =
      FirebaseVision.instance.cloudLabelDetector();
  _ObjectDetectionPageState();
  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      this.cameras = cameras;
      cameraController =
          CameraController(this.cameras[0], ResolutionPreset.medium);
      cameraController.initialize().then((_) {
        setState(() {
          isReady = true;
        });
      });
    });
  }

  String get timestamp => DateTime.now().toString();
  Future<File> takeImage() async {
    if (!cameraController.value.isInitialized ||
        cameraController.value.isTakingPicture) {
      return null;
    }

    Directory extDir = await getTemporaryDirectory();
    String dirPath = '${extDir.path}/MeClaim/picture';
    await Directory(dirPath).create(recursive: true);
    String filePath = '$dirPath/${timestamp}.jpg';

    try {
      await cameraController.takePicture(filePath);
    } catch (e) {
      return null;
    }

    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(filePath);
    print(
        'capture $filePath width:${properties.width} height:${properties.height}');

    File resizedFile = await FlutterNativeImage.compressImage(filePath,
        targetHeight: properties.height ~/ 10,
        targetWidth: properties.width ~/ 10);
    return resizedFile;
  }

  Future<List<Label>> classify(File file) async {
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(file);
    List<Label> labels = await this.labelDetector.detectInImage(visionImage);
    labels.forEach((label) => print('${label.label} ${label.confidence}'));
    return labels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lean'),
        centerTitle: true,
      ),
      body: isReady
          ? Column(
              children: <Widget>[
                Container(
                  child: AspectRatio(
                    child: CameraPreview(this.cameraController),
                    aspectRatio: this.cameraController.value.aspectRatio,
                  ),
                ),
                Offstage(
                  offstage: !widget.isDetection,
                  child: FloatingActionButton(
                    child: Icon(Icons.camera_alt),
                    onPressed: () async {
                      File file = await takeImage();
                      List<Label> labels = await classify(file);
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Found object!'),
                                content: ListView(
                                  children: labels
                                      .map<Widget>((label) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Text(
                                                '${label.label} ${label.confidence}'),
                                          ))
                                      .toList(),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    child: Text(
                                      'OK',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  )
                                ],
                              ));
                    },
                  ),
                )
              ],
            )
          : CircularProgressIndicator(),
    );
  }
}
