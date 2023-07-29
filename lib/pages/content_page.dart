
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    VideoPlayerController.asset('assets/my_page/result_video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: _controller?.value.isInitialized ?? false
            ? Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller!.value.size.width,
                  height: _controller!.value.size.height,
                  child: VideoPlayer(_controller!),
                ),
              ),
            ),
            Positioned(
              top: height * 0.5,
              child: Image.asset('assets/my_page/shadow.png',
                width: width , height: height * 0.61
              ),
            ),
            Positioned(
              top: height * 0.07,
              left: width * 0.04,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 32),
              ),
            ),
            Positioned(
              top: height * 0.001,
              left : width * 0.34,
              child: Image.asset('assets/my_page/detail_profile.png',
                  width: width * 0.3, height: height * 0.2),
            ),
            Positioned(
              bottom: height * 0.115,
              left : width * 0.12,
              child: Image.asset('assets/my_page/info.png',
                  width: width * 0.8, height: height * 0.35),
            ),
            Positioned(
              top: height * 0.76,
              left: width * 0.07,
              child: Image.asset('assets/my_page/chat.png',
                  width: width * 0.4, height: height * 0.3),
            ),
            Positioned(
              top: height * 0.735,
              left: width * 0.35,
              child: Image.asset('assets/my_page/buying.png',
                  width: width * 0.8, height: height * 0.35),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: (){
                  setState(() {
                    _controller!.value.isPlaying
                        ? _controller!.pause()
                        : _controller!.play();
                  });
                },
                child: Icon(
                  _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,

                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                highlightElevation: 0,
              ),
            ),
          ],
        )
            : CircularProgressIndicator(),
      ),
      // floatingActionButton:
      // FloatingActionButton(onPressed: () {
      //   setState(() {
      //     _controller!.value.isPlaying
      //         ? _controller!.pause()
      //         : _controller!.play();
      //   });
      // },
      //   child: Icon(_controller!.value.isPlaying ? Icons.pause : Icons.play_arrow),
      //   backgroundColor: Colors.transparent, // 투명한 배경색 설정
      //   elevation: 0, // 그림자 높이 제거
      //   highlightElevation: 0, ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
