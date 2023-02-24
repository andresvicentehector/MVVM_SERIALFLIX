import 'package:flutter/material.dart';
import 'package:Hector_Show_movie/res/AppContextExtension.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../models/moviesList/online/MoviesMain.dart';
import '../../utils/imageurl.dart';
import '../details/MovieDetailsScreen.dart';
import '../widget/MyTextViewSubtittle.dart';
import '../widget/MyTextViewTittle.dart';

class HomeScreenGridView extends StatelessWidget {
  final List<Results>? moviesList;
  const HomeScreenGridView({this.moviesList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        padding: EdgeInsets.zero,
        itemCount: moviesList?.length,
        itemBuilder: (context, position) {
          return _getMovieGridViewBuilder(moviesList?[position], context);
        });
  }
}

Widget _getMovieGridViewBuilder(Results? item, BuildContext context) {
  return GestureDetector(
      onTap: (() => _sendDataToMovieDetailScreen(context, item)),
      //onLongPress: ,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: FadeInImage(
          placeholder: AssetImage('assets/images/s.png'),
          image: NetworkImage(imageUrl! + (item?.posterPath ?? "")),
          fit: BoxFit.cover,
        ),
      ));
}

Widget getMoviesListView(List<Results>? moviesList, BuildContext context) {
  return ListView.builder(
      itemCount: moviesList?.length,
      itemBuilder: (context, position) {
        //return _getMovieListItem(moviesList?[position].results);
        //print(moviesList.toString());
        return _getMovieListItem(moviesList?[position], context);
      });
}

Widget _getMovieListItem(Results? item, BuildContext context) {
  return Card(
    child: ListTile(
      leading: ClipRRect(
        child: Image.network(
          imageUrl! + (item?.posterPath ?? ""),
          errorBuilder: (context, error, stackTrace) {
            return new Image.asset('assets/images/img_error.png');
          },
          fit: BoxFit.fill,
          width: context.resources.dimension.listImageSize,
          height: context.resources.dimension.listImageSize,
        ),
        borderRadius: BorderRadius.circular(
            context.resources.dimension.imageBorderRadius),
      ),
      title: MyTextViewTittle(item?.name ?? "NA"),
      subtitle: MyTextViewSubtittle(item?.popularity.toString() ?? "NA"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //MyTextView("${Utils.setAverageRating(item.ratings ?? [])}",context.resources.color.colorBlack,context.resources.dimension.mediumText),
          SizedBox(
            width: context.resources.dimension.verySmallMargin,
          ),
          Icon(
            Icons.star,
            color: context.resources.color.colorAccent,
          ),
        ],
      ),
      onTap: () {
        _sendDataToMovieDetailScreen(context, item);
      },
    ),
    elevation: context.resources.dimension.lightElevation,
  );
}

Widget languageSelectorOpener(final _key, String flagUrl) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
        image: DecorationImage(
          image: AssetImage(flagUrl),
          fit: BoxFit.cover,
        ),
      ),
      width: 30,
      padding: EdgeInsets.all(30),
    ),
    onTap: () {
      _key.currentState?.openDrawer();
    },
    onDoubleTap: () {},
  );
}

void _sendDataToMovieDetailScreen(BuildContext context, Results? item) {
  Navigator.pushNamed(context, MovieDetailsScreen.id, arguments: item);
}
