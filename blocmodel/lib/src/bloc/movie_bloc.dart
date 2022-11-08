
import 'package:blocmodel/src/model/itemmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:blocmodel/src/resources/repository.dart';

class MovieBloc{

  final _repository=repository();
  final _moviefetcher=PublishSubject<ItemModel>();
  Stream<ItemModel> get allmovies=>_moviefetcher.stream;
  fetchallmovies() async{
    ItemModel itemModel=await _repository.fetchAllMovies();
    _moviefetcher.sink.add(itemModel);
  }
  dispose()
  {
    _moviefetcher.close();
  }

}
final bloc=MovieBloc();