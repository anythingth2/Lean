import 'AppRouter.dart';
import 'package:camera/camera.dart';

class Util {
  static AppRouter router = AppRouter();

  static List<CameraDescription> cameras;

  static initilize() async {
    cameras = await availableCameras();
    print('init');
  }
}
