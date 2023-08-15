
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:days/story/data.dart';
// import 'package:days/story/storymodel.dart';
// import 'package:days/story/usermodel.dart';
// import 'package:days/story/video.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     return MaterialApp(
//       title: 'Flutter Instagram Stories',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: StoryScreen(stories: stories),
//     );
//   }
// }
//
// class StoryScreen extends StatefulWidget {
//   final List<Story> stories;
//
//   const StoryScreen({required this.stories});
//
//   @override
//   _StoryScreenState createState() => _StoryScreenState();
// }
//
// class _StoryScreenState extends State<StoryScreen>
//     with SingleTickerProviderStateMixin {
//   late PageController _pageController;
//  late AnimationController _animController;
//   late VideoPlayerController _videoController;
//   int _currentIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//     _animController = AnimationController(vsync: this);
//
//     final Story firstStory = widget.stories.first;
//     _loadStory(story: firstStory, animateToPage: false);
//
//     _animController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _animController.stop();
//         _animController.reset();
//         setState(() {
//           if (_currentIndex + 1 < widget.stories.length) {
//             _currentIndex += 1;
//             _loadStory(story: widget.stories[_currentIndex]);
//           } else {
//             // Out of bounds - loop story
//             // You can also Navigator.of(context).pop() here
//             _currentIndex = 0;
//             _loadStory(story: widget.stories[_currentIndex]);
//           }
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     _animController.dispose();
//     _videoController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Story story = widget.stories[_currentIndex];
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(0.0),
//         child: AppBar(
//           elevation: 0,
//         ),
//       ),
//       body: GestureDetector(
//         onTapDown: (details) => _onTapDown(details, story),
//         child: Stack(
//           children: <Widget>[
//             PageView.builder(
//               controller: _pageController,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: widget.stories.length,
//               itemBuilder: (context, i) {
//                 final Story story = widget.stories[i];
//                 switch (story.media) {
//                   case MediaType.image:
//                     return Container(
//                      // padding: EdgeInsets.all(5),
//                       margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 60),
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(20),
//                         image: DecorationImage(image: NetworkImage("${story.url}"),fit: BoxFit.fill,)
//                       ),
//                      // child: Image.network("${story.url}",fit: BoxFit.fill,),
//
//                     );
//                   case MediaType.video:
//
//                       return Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 60),
//                           width: double.infinity,
//                           height: double.infinity,
//
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(20)
//                           ),
//                           child: (_videoController.value.isInitialized)
//                               ?ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: VideoPlayer(_videoController))
//                               : Center(
//                             child:
//                             CircularProgressIndicator(color: Colors.orange,),));
//
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//             Positioned(
//               top: 30.0,
//               left: 30.0,
//               right: 30.0,
//               child: Column(
//                 children: [
//                   Row(
//                     children: widget.stories
//                         .asMap()
//                         .map((i, e) {
//                       return MapEntry(
//                         i,
//                         AnimatedBar(
//                           animController: _animController,
//                           position: i,
//                           currentIndex: _currentIndex,
//                         ),
//                       );
//                     }).values.toList(),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 5,
//                       vertical: 10.0,
//                     ),
//                     child: UserInfo(user: story.user),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomSheet: Container(
//         height: 60,
//         width: double.infinity,
//        // color: Colors.orange,
//         child: Row(
//           children: [
//             Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: IconButton(onPressed: (){
//               print("${_currentIndex}");
//             },
//                 icon: Icon(Icons.favorite_border,color: Colors.green,size: 35,)),
//           )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _onTapDown(TapDownDetails details, Story story) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double dx = details.globalPosition.dx;
//     if (dx < screenWidth / 3) {
//       setState(() {
//         if (_currentIndex - 1 >= 0) {
//           _currentIndex -= 1;
//           _loadStory(story: widget.stories[_currentIndex]);
//         }
//       });
//     } else if (dx > 2 * screenWidth / 3) {
//       setState(() {
//         if (_currentIndex + 1 < widget.stories.length) {
//           _currentIndex += 1;
//           _loadStory(story: widget.stories[_currentIndex]);
//         } else {
//           // Out of bounds - loop story
//           // You can also Navigator.of(context).pop() here
//           _currentIndex = 0;
//           _loadStory(story: widget.stories[_currentIndex]);
//         }
//       });
//     } else {
//       if (story.media == MediaType.video) {
//         if (_videoController.value.isPlaying) {
//           _videoController.pause();
//           _animController.stop();
//         } else {
//           _videoController.play();
//           _animController.forward();
//         }
//       }
//     }
//   }
//
//   void _loadStory({required Story story, bool animateToPage = true}) {
//     _animController.stop();
//     _animController.reset();
//     switch (story.media) {
//       case MediaType.image:
//         _animController.duration = story.duration;
//         _animController.forward();
//         break;
//       case MediaType.video:
//         // _videoController = null;
//         // _videoController?.dispose();
//         _videoController = VideoPlayerController.network(story.url)
//           ..initialize().then((_) {
//             setState(() {});
//             if (_videoController.value.isInitialized) {
//               _animController.duration = _videoController.value.duration;
//               _videoController.play();
//               _animController.forward();
//             }
//           });
//         break;
//     }
//     if (animateToPage) {
//       _pageController.animateToPage(
//         _currentIndex,
//         duration: const Duration(milliseconds: 1),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
//   // Future initializePlayer(src) async {
//   //   _videoController= VideoPlayerController.network(src);
//   //   await Future.wait([_videoController.initialize()]);
//   //   setState(() {
//   //     if (_videoController.value.isInitialized) {
//   //       _animController.duration = _videoController.value.duration;
//   //       _videoController.play();
//   //       _animController.forward();
//   //     }
//   //   });
//   //
//   // }
// }
//
// class AnimatedBar extends StatelessWidget {
//   final AnimationController animController;
//   final int position;
//   final int currentIndex;
//
//   const AnimatedBar({
//     Key? key,
//     required this.animController,
//     required this.position,
//     required this.currentIndex,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 1.5),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return Stack(
//               children: <Widget>[
//                 _buildContainer(
//                   double.infinity,
//                   position < currentIndex
//                       ? Colors.white
//                       : Colors.white.withOpacity(0.5),
//                 ),
//                 position == currentIndex
//                     ? AnimatedBuilder(
//                   animation: animController,
//                   builder: (context, child) {
//                     return _buildContainer(
//                       constraints.maxWidth * animController.value,
//                       Colors.white,
//                     );
//                   },
//                 )
//                     : const SizedBox.shrink(),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Container _buildContainer(double width, Color color) {
//     return Container(
//       height: 3.0,
//       width: width,
//       decoration: BoxDecoration(
//         color: color,
//         border: Border.all(
//           color: Colors.black26,
//           width: 0.8,
//         ),
//         borderRadius: BorderRadius.circular(3.0),
//       ),
//     );
//   }
// }
//
// class UserInfo extends StatelessWidget {
//   final User user;
//
//   const UserInfo({
//     Key? key,
//     required this.user,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         CircleAvatar(
//           radius: 18.0,
//           backgroundColor: Colors.grey[300],
//           backgroundImage: NetworkImage(
//             user.profileImageUrl,
//           ),
//         ),
//         const SizedBox(width: 10.0),
//         Expanded(
//           child: Text(
//             user.name,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18.0,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         IconButton(
//           icon: const Icon(
//             Icons.close_outlined,
//             size: 30.0,
//             color: Colors.white,
//           ),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ],
//     );
//   }
// }
//




///&***************************        main main               ***************************************/////



import 'package:days/AllNewsRepo.dart';
import 'package:days/hussen/cubit/cubit.dart';
import 'package:days/pick_image/pickerhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'NewsApp.dart';
import 'NewsCard.dart';
import 'blocObserver/blockObserver.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'hussen/chose_date.dart';
import 'hussen/cubit/states.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
     // BlocProvider(create: (BuildContext context)=> NewsCubit()..getBussiness(),
      BlocProvider(create: (BuildContext context)=> calenderCubit(),
       child: BlocConsumer<calenderCubit,calenderStates>(

      listener: (context,state){},
      builder: (context,state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme:
            AppBarTheme(
              backwardsCompatibility:false,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.blueAccent,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.light
              ),
              backgroundColor: Colors.blue,


            ),

            primarySwatch: Colors.blue,
          ),
          home: Appointment(),
        );
      },
    ),);


  }
}
