import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/data/datalocal.dart';
import 'package:flutter_application_1/app/data/movie.dart';
import 'package:flutter_application_1/app/modules/home/controllers/Database_controller.dart';
// ignore: unused_import
import 'package:get/get.dart';

// ignore: must_be_immutable
class viewScreen extends StatelessWidget {
  String? movie;
  Result? movieData;
  viewScreen({super.key, this.movie, this.movieData});

  @override
  Widget build(BuildContext context) {
    final DatabaseController databaseController = Get.put(DatabaseController());

    return Scaffold(
      backgroundColor: Color(0xff212429),
      body: Stack(
        children: [
          Image.network(
              "https://image.tmdb.org/t/p/w500${movieData?.posterPath}",
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover),
          Opacity(
            opacity: 1,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xff212429)],
                ).createShader(bounds);
              },
              blendMode: BlendMode.darken,
              child: Container(
                height: 400,
                width: double.infinity,
                color: Colors.transparent,
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                          InkWell(
                            onTap: () {
                              // databaseController.addToFav(movieData!.title);
                              databaseController.cheklist(movieData!.title);
                            },
                            child: Icon(
                              Icons.bookmark_add_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500${movieData?.posterPath}",
                            height: 260,
                            width: 180,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               child: SafeArea(
//                 child: Column(children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     // height: MediaQuery.of(context).size.height / 2.1,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       image: DecorationImage(
//                           image: NetworkImage(
//                               "https://image.tmdb.org/t/p/w500${movieData?.posterPath}"),
//                           // image: AssetImage("lib/app/data/Assets/${movie}.jpg"),
//                           fit: BoxFit.cover,
//                           opacity: -0.6),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Icon(
//                                   Icons.arrow_back,
//                                   color: Colors.white,
//                                   size: 28,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.share_outlined,
//                                     color: Colors.white,
//                                     size: 25,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Icon(
//                                     Icons.bookmark_add_outlined,
//                                     color: Colors.white,
//                                     size: 30,
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 60),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.red.withOpacity(0.5),
//                                         spreadRadius: 1,
//                                         blurRadius: 5,
//                                       ),
//                                     ]),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(30),
//                                   child: SizedBox(
//                                       child: Container(
//                                     height: 250,
//                                     width: 180,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             image: NetworkImage(
//                                                 "https://image.tmdb.org/t/p/w500${movieData?.posterPath}"))),
//                                   )),
//                                   // child: Image.asset(
//                                   //   "lib/app/data/Assets/${movie}.jpg",
//                                   //   height: 250,
//                                   //   width: 180,
//                                   // ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ]),
//               ),
//             ),
//           ],
//         ));
//   }
// }
// Padding(
//     padding: EdgeInsets.all(20),
//     child: Text(
//       movie!,
//       style: TextStyle(
//         fontSize: 25,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//     ))
