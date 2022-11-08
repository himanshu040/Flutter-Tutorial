import 'package:blocmodel/src/bloc/movie_bloc.dart';
import 'package:blocmodel/src/model/itemmodel.dart';
import 'package:flutter/material.dart';
class MovieList  extends StatelessWidget {
  const MovieList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.fetchallmovies();
    return Scaffold(
      appBar: AppBar(
        title: Text("POPULAR MOVIES"),
      ),
      body: StreamBuilder(
        stream: bloc.allmovies,
        builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
          if(snapshot.hasData)
            return buildList(snapshot);
          else
            if(snapshot.hasError)
              return Text(snapshot.error.toString());
          return Center(
            child: CircularProgressIndicator(),
          );
        },

      ),
    ) ;
  }
  Widget buildList( AsyncSnapshot<ItemModel> snapshot){
    return GridView.builder(gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder:(BuildContext context,int index){
             return Image.network( 'https://image.tmdb.org/t/p/w185${snapshot.data!.results[index].poster_path}',
               fit: BoxFit.cover,);
        },
    itemCount: snapshot.data!.results.length,);
  }
}
