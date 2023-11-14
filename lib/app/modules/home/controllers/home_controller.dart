import 'dart:convert';

import 'package:flutter_application_1/app/data/movie.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/data/datalocal.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var movieList = <Result>[].obs;
  var dataFormat = "";
  final data = datalistfilm();
  final Movies = datalistfilm.Movies;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    var url = "https://api.themoviedb.org/3/trending/movie/week?language=en-US";
    var token =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYjFiNDExZjg0YTM3MzlkZmNmNzc0ZTI0OTE0MDE3ZSIsInN1YiI6IjY1M2YyNGQ0NTE5YmJiMDBmZTVkNTFjZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ofsxmETO-CCCmZultKBavggQU2bfX7SJX8wbtW4mxRw";

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    var res = json.decode(response.body); //mengonversi string json yang ada dalam respon.body menjadi objek dart.
    Movie movie = Movie.fromJson(res); //mengambil data yang telah diuraikan dan mengonversi menjadi objek dart yang sesuai dengan model data Movie.
    movieList.assignAll(movie.results);
  }
}
