import 'dart:convert';
import 'package:blocmodel/src/model/itemmodel.dart';
import 'package:http/http.dart' as http;

class MovieApiProvider{
  final _apikey="9b5549edb9db11b250052c0b05a96b19";

  Future<ItemModel> fetchMovieList() async{
    print("entered");
    final response=await http.get(Uri.parse("http://api.themoviedb.org/3/movie/popular?api_key=${_apikey}"));
    print("response====${response.statusCode.toString()}");
    if(response.statusCode==200){
      return ItemModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Failed to load post");
    }

  }
}