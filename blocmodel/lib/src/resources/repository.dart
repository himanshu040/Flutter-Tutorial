import 'package:blocmodel/src/model/itemmodel.dart';
import 'package:blocmodel/src/resources/api_provider.dart';

class repository{
  final movieapiprovider=MovieApiProvider();
  Future<ItemModel> fetchAllMovies() =>movieapiprovider.fetchMovieList();
}