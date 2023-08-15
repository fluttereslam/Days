
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



/// Stateful widget to fetch and then display video content.
// Duration  Possisionn = Duration.zero;
// Duration  duration = Duration.zero;
var scaffoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();

class VideoApp extends StatefulWidget {

  final String? src;
  const VideoApp({Key? key, this.src}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {

  late  VideoPlayerController controller;
  Duration  Possisionn = Duration.zero;
  Duration  duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    controller = VideoPlayerController.network(widget.src!);
    await Future.wait([controller.initialize()]);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black38,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0,
          ),
        ),
        body: Container(
                  height:MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:  controller.value.isInitialized
                      ? VideoPlayer(controller)
                      : Container(
                    child: Center(
                      child:
                      CircularProgressIndicator(),
                    ),
                  ),

                )




      // ListView.separated(
      //     itemBuilder: (context,index){
      //       return Stack(
      //         alignment: Alignment.center,
      //         children: [
      //           Container(
      //             height:MediaQuery.of(context).size.height,
      //             width: MediaQuery.of(context).size.width,
      //             child:  videoCubit.get(context).controller.value.isInitialized
      //                ?
      //           VideoPlayer(videoCubit.get(context).controller)
      //                 : Container(
      //               child: Center(
      //                 child:
      //                 CircularProgressIndicator(),
      //               ),
      //             ),
      //
      //           ),
      //           Positioned(
      //             bottom: 20,
      //             child: Container(
      //               //padding: EdgeInsets.symmetric(horizontal: 32),
      //               width: 250,
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   InkWell(
      //                       onTap: (){
      //                         videoCubit.get(context).playapause();
      //                       },
      //                       child: Icon(videoCubit.get(context).controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.orange,)),
      //                   Expanded(
      //                     child: Slider(
      //                         min: 0,
      //                         max: videoCubit.get(context).duration.inSeconds.toDouble(),
      //                         value: videoCubit.get(context).Possisionn.inSeconds.toDouble(),
      //                         activeColor: Colors.white,
      //                         inactiveColor: Colors.white,
      //                         thumbColor: Colors.orange,
      //                         onChanged: (value)async{
      //                           final position = Duration(seconds: value.toInt());
      //                           await videoCubit.get(context).controller.seekTo(position);
      //                         }),
      //                   ),
      //
      //                 ],
      //               ),
      //             ),
      //           ),
      //           IconButton(onPressed: (){
      //             print("${videoCubit.get(context).videos[videoCubit.get(context).index]}");
      //           },
      //               icon: Icon(Icons.add_a_photo))
      //         ],
      //       );
      //     },
      //     separatorBuilder: (context,index)=>SizedBox(height: 20,),
      //     itemCount: 3)
      // ),


    );

  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
   // controller.removeListener((){});
  }


}
