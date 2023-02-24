import 'package:Hector_Show_movie/view/details/MovieDetailsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:Hector_Show_movie/models/moviesList/online/MoviesMain.dart';

import 'package:Hector_Show_movie/res/AppContextExtension.dart';

import '../../utils/imageurl.dart';
import '../widget/MyTextViewTittle.dart';

class MovieDetailsScreen extends StatefulWidget {
  static final String id = "movie_details";

  final Results? movieData;

  // receive data from the HomeScreen as a parameter
  MovieDetailsScreen(this.movieData);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder(),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.resources.dimension.smallMargin),
            child: Column(
              children: [
                _imageBuilder(),
                _miscelaneousBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBarBuilder() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context)
            .colorScheme
            .secondary, // change this color to your desired color
      ),
      title: MyTextViewTittle(
        context.resources.strings.movieDetailScreen,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  _imageBuilder() {
    return Center(
      child: Image.network(
        imageUrl! + (widget.movieData?.posterPath ?? ""),
        errorBuilder: (context, error, stackTrace) {
          return new Image.asset('assets/images/img_error.png');
        },
        fit: BoxFit.cover,
        height: context.resources.dimension.imageHeight,
      ),
    );
  }

  _miscelaneousBuilder() {
    return Card(
      //color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          listTileNameDataRating(context, widget.movieData),
          showOverview(context, widget.movieData),
          margin(context),
          // trailerTittle(context),
          margin(context),
          //_trailerVideo(),
        ],
      ),
      elevation: context.resources.dimension.highElevation,
      margin: EdgeInsets.all(context.resources.dimension.smallMargin),
      color: Theme.of(context).colorScheme.tertiaryContainer,
    );
  }
}
