import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:days/webveiw/webveiw.dart';
import 'package:flutter/material.dart';

import '../cubit/cubit.dart';

Widget articleBuilder(List list, context){
  return ConditionalBuilder(
    condition:  list.length > 0,
    builder:(context) {return ListView.separated(
      physics:  BouncingScrollPhysics(),
      itemBuilder: (context,index) =>buildArticleItem(list[index],context),
      separatorBuilder: (context,index) =>Divider(
        height: 2,
        thickness: 2.0,
      ),
      itemCount:list.length,
    );
    },
    fallback:(context)=> Center(child: CircularProgressIndicator()),
  );
}


void navigateTo(context, widget){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context)=>widget));
}
//"https://upload.wikimedia.org/wikipedia/commons/e/e7/Haystack_News_Logo.jpg"
Widget buildArticleItem(article,context){
  return InkWell(
    onTap: (){
      navigateTo(context,webView(article['link']));
    },
    child: Container(
      margin: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 169, 166, 179),
                offset: Offset(2, 8),
                blurRadius: 10,
              ),
              BoxShadow(color: Color.fromARGB(255, 255, 255, 255))
            ]),
        width: double.infinity,
        height: 310,
        child: Column(children: [
          Container(
            height: 100,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.fill,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                    "${article["image_url"]?? "https://upload.wikimedia.org/wikipedia/commons/e/e7/Haystack_News_Logo.jpg" }"

                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              // height: 190,
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "${article["title"]}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${article["pubDate"]}",
                        style: TextStyle(fontSize: 8, color: Colors.grey),
                      )
                    ],
                  ),
                  Text( "${article["category"][0]}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold)),
                  Text("${article["country"][0]}",
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    // height: 200,
                    child: Expanded(
                      child: Text("${article["description"]}",
                        overflow: TextOverflow.fade,
                        // maxLines: 5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    )




    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
    //   child: Row(
    //     children: [
    //       Container(
    //         width: 120.0,
    //         height: 120.0,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10.0),
    //           image: DecorationImage(
    //             // image: NetworkImage("${article["urlToImage"]}"),
    //               image: NetworkImage("https://cdn.pixabay.com/photo/2023/01/27/14/04/marble-quarries-7748771__340.jpg"),
    //               fit: BoxFit.cover
    //           ),
    //         ),
    //       ),
    //       SizedBox(width: 10.0,),
    //       Expanded(
    //         child: Container(
    //           height: 120.0,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Expanded(child: Text("${article["title"]}",
    //                 style: Theme.of(context).textTheme.bodyText1,
    //                 maxLines: 4,
    //                 overflow: TextOverflow.ellipsis,)),
    //
    //
    //               Text("${article["pubDate"]}",style: TextStyle(color: Colors.grey),)
    //             ],
    //           ),
    //         ),
    //       ),
    //
    //
    //
    //
    //
    //
    //     ],
    //   ),
    // ),
  );
}