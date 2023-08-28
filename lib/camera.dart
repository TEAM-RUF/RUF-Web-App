import 'dart:html';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

// ignore: must_be_immutable
class CameraApp extends StatelessWidget {
  final String value;

  CameraApp(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: AppBody(
            value: value,
          ),
        ));
  }

  int weight = 35;
  int rep = 10;
  int set = 3;
  int rest = 10;
}

class AppBody extends StatefulWidget {
  final String value; // Add this line to receive the value
  AppBody({Key? key, required this.value}) : super(key: key);
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  bool cameraAccess = false;
  String? error;
  //List<CameraDescription>? cameras;
  CameraDescription? camera;
  @override
  void initState() {
    getCameras();
    super.initState();
  }

  final VideoElement video = VideoElement();

  Future<void> getCameras() async {
    try {
      await window.navigator.mediaDevices!
          .getUserMedia({'video': true, 'audio': false});
      setState(() {
        cameraAccess = true;
      });
      final List<CameraDescription> cameras = await availableCameras();
      final CameraDescription camera_ = cameras[0];
      setState(() {
        camera = camera_;
      });
    } on DomException catch (e) {
      setState(() {
        error = '${e.name}: ${e.message}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return Center(child: Text('Error: $error'));
    }
    if (!cameraAccess) {
      return const Center(child: Text('Camera access not granted yet.'));
    }
    if (camera == null) {
      return const Center(child: Text('Reading cameras'));
    }
    return CameraView(camera: camera!, value: widget.value);
  }
}

class CameraView extends StatefulWidget {
  //final List<CameraDescription> cameras;
  final CameraDescription camera;
  final String value;
  const CameraView({Key? key, required this.camera, required this.value})
      : super(key: key);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  String? error;
  CameraController? controller;
  late CameraDescription cameraDescription = widget.camera;

  Future<void> initCam(CameraDescription description) async {
    setState(() {
      controller = CameraController(description, ResolutionPreset.max);
    });

    try {
      await controller!.initialize();
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }

    setState(() {});
  }

  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  Future<void> initVideoPlayer() async {
    await _videoPlayerController.initialize();
    setState(() {
      print(_videoPlayerController.value.aspectRatio);
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        autoPlay: false,
        looping: false,
      );
    });
  }

  String select() {
    String val = 'videos/';
    if (widget.value == 'Bench Press') {
      val += 'benchpress.mp4';
    } else if (widget.value == 'Squat') {
      val += 'squat.mp4';
    } else if (widget.value == 'DeadLift') {
      val += 'deadlift.mp4';
    }
    return val;
  }

  @override
  void initState() {
    super.initState();
    initCam(cameraDescription);
    _videoPlayerController = VideoPlayerController.asset(select());
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      aspectRatio: 9 / 16,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
        body: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotatedBox(
              quarterTurns: 1,
              child: Container(
                  alignment: Alignment.centerLeft,
                  height: 500,
                  child: AspectRatio(
                      aspectRatio: 4 / 3, child: CameraPreview(controller!)))),
          ElevatedButton(
            onPressed: controller == null
                ? null
                : () async {
                    await controller!.startVideoRecording();
                    await Future.delayed(Duration(seconds: 100));
                    final file = await controller!.stopVideoRecording();
                    final bytes = await file.readAsBytes();
                    final uri = Uri.dataFromBytes(bytes,
                        mimeType: 'video/webm;codecs=vp8');

                    final link = AnchorElement(href: uri.toString());
                    link.download = 'recording.webm';
                    link.click();
                    link.remove();
                  },
            child: const Text('Record 100 second video.'),
          )
        ],
      ),
      const Padding(padding: EdgeInsets.only(right: 100)),
      Center(
          child: Container(
              alignment: Alignment.centerLeft,
              height: 700,
              child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: Chewie(
                    controller: _chewieController,
                  ))))
    ])));
  }
}
