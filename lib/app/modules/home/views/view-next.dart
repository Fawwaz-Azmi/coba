import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/data/datalocal.dart';
// ignore: unused_import
import 'package:get/get.dart';

// ignore: must_be_immutable
class viewScreen extends StatelessWidget {
  String? movie;
  viewScreen({this.movie});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff212429),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage("lib/app/data/Assets/${movie}.jpg"),
                    fit: BoxFit.cover,
                    opacity: -0.6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
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
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.favorite_outline_outlined,
                              color: Colors.white,
                              size: 25,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                ),
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "lib/app/data/Assets/${movie}.jpg",
                              height: 250,
                              width: 180,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
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
