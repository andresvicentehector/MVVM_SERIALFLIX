import 'package:Hector_Show_movie/res/AppContextExtension.dart';
import 'package:Hector_Show_movie/view/widget/MyTextViewContent.dart';
import 'package:flutter/material.dart';

import '../../models/moviesList/online/MoviesMain.dart';
import '../widget/MyTextViewSubtittle.dart';
import '../widget/MyTextViewTittle.dart';

showOverview(BuildContext context, Results? movieData) {
  return Padding(
    padding: EdgeInsets.only(left: context.resources.dimension.defaultMargin),
    child: Container(
      child: MyTextViewContent(
        movieData?.overview ?? "",
      ),
      alignment: AlignmentDirectional.topStart,
    ),
  );
}

margin(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
  );
}

listTileNameDataRating(BuildContext context, Results? movieData) {
  return ListTile(
      title: MyTextViewTittle(
        movieData?.name ?? "NA",
      ),
      subtitle: MyTextViewSubtittle(
        movieData?.firstAirDate ?? "NA",
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyTextViewSubtittle(
            movieData?.voteAverage.toString(),
          ),
          SizedBox(
            width: context.resources.dimension.verySmallMargin,
          ),
          Icon(
            Icons.star,
            color: context.resources.color.colorAccent,
          ),
        ],
      ));
}

trailerTittle(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: context.resources.dimension.defaultMargin),
    child: Container(
      child: MyTextViewTittle(context.resources.strings.titleTrailer),
      alignment: AlignmentDirectional.topStart,
    ),
  );
}

 // _trailerVideo() {}