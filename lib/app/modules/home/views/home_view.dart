import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/data/movie.dart';
import 'package:flutter_application_1/app/modules/home/views/self.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/data/datalocal.dart';
import 'package:flutter_application_1/app/modules/home/views/view-next.dart';
import 'package:flutter_application_1/app/modules/home/views/Navbar_C.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      drawer: self(),
      appBar: AppBar(
        // leading: InkWell(
        //   onTap: () {
        //     Get.to(() => self());
        //   },
        //   child: Icon(
        //     Icons.sort,
        //     size: 32,
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: Text(
        //   "Didinya wae",
        //   style: TextStyle(fontSize: 24),
        // ),

        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(children: [
              Icon(
                Icons.notifications,
                size: 28,
              ),
              SizedBox(
                width: 7,
              ),
              Icon(
                Icons.search,
                size: 28,
              )
            ]),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Playing",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => self());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "view all",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent.shade400,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: 390,
                child: Obx(
                  () => homeController.movieList.isEmpty
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.movieList.length,
                          itemBuilder: (context, index) {
                            var data = homeController.movieList;
                            return CardMovie(index: index, data: data[index]);
                          },
                        ),
                )),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.grey.shade800),
                    child: Text(
                      "COMMING SOON",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "view all",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent.shade400,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 390,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "lib/app/data/Assets/${datalistfilm.Movis2[index]}.jpg",
                                height: 280,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  datalistfilm.Movis2[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )
                        ]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardMovie extends StatelessWidget {
  const CardMovie({
    super.key,
    required this.index,
    required this.data,
  });

  final int index;
  final Result data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () {
            Get.to(() => viewScreen(
                  movie: datalistfilm.Movies[index],
                ));
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 280,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500${data.posterPath}"))),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_filled_rounded,
                      color: Colors.white70,
                      size: 16,
                    ),
                    Text(
                      "100 hours",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_half,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Text(
                      "5",
                      style: TextStyle(color: Colors.amber),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
