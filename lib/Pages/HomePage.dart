import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CameraController cameraController;
  List<CameraDescription> cameras;
  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      this.cameras = cameras;
      cameraController =
          CameraController(this.cameras[0], ResolutionPreset.low);
      cameraController.initialize().then((_) {
        setState(() {
          cameraController = cameraController;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lean'),
      ),
      body: Container(
        child: AspectRatio(
          child: CameraPreview(this.cameraController),
          aspectRatio: this.cameraController.value.aspectRatio,
        ),
      ),
    );
  }
}
