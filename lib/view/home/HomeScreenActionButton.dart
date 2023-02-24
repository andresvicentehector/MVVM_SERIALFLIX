import 'package:flutter/material.dart';

import '../../models/moviesList/online/MoviesMain.dart';

class ActionButton extends StatelessWidget {
  final String page;
  final String lang;
  final int moviesPages;
  final Function updatePageUp;
  final Function updatePageDown;

  const ActionButton(
      {required this.page,
      required this.lang,
      required this.moviesPages,
      required this.updatePageDown,
      required this.updatePageUp});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        Container(
          width: 50,
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: CircleBorder(),
          ),
          child: _iconButtonUpBuilder(context),
        ),
        Container(
          width: 50,
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: CircleBorder(),
          ),
          child: _iconButtonDownBuilder(context),
        ),
      ],
    );
  }

  Widget _iconButtonDownBuilder(BuildContext context) {
    return IconButton(
        onPressed: () async {
          if (int.parse(page) < moviesPages) {
            await updatePageUp(
              page,
            );
          }
        },
        icon: Icon(Icons.arrow_downward),
        color: Theme.of(context).colorScheme.secondary);
  }

  Widget _iconButtonUpBuilder(BuildContext context) {
    return IconButton(
        onPressed: () async {
          if (int.parse(page) > 1) {
            //print("after" + page);
            await updatePageDown(
              page,
            );

            //print("Before " + page);
            //viewModel.fetchMovies(lang, page);
          }
        },
        icon: Icon(Icons.arrow_upward),
        color: Theme.of(context).colorScheme.secondary);
  }
}
