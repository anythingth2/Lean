import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CameraController cameraController;
  List<CameraDescription> cameras;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      this.cameras = cameras;
      cameraController =
          CameraController(this.cameras[0], ResolutionPreset.low);
      cameraController.initialize().then((_) {
        setState(() {
          isReady = true;
        });
      });
    });
  }

  String get timestamp => DateTime.now().toString();
  void takeImage() async {
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

    debugPrint('capture! $filePath');
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
                FloatingActionButton(
                  child: Icon(Icons.camera_alt),
                  onPressed: takeImage,
                )
              ],
            )
          : CircularProgressIndicator(),
    );
  }
}
