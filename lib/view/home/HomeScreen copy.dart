import 'dart:html';

import 'package:Hector_Show_movie/utils/lang&page.dart';
import 'package:flutter/material.dart';
import 'package:Hector_Show_movie/data/remote/response/Status.dart';
import 'package:Hector_Show_movie/res/AppContextExtension.dart';
import 'package:Hector_Show_movie/view/widget/MyTextViewSubtittle.dart';
import 'package:Hector_Show_movie/view/widget/MyTextViewTittle.dart';
import 'package:Hector_Show_movie/view_model/home/MoviesListVM.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../data/remote/network/ApiEndPoints.dart';
import '../widget/MyErrorWidget.dart';
import '../widget/LoadingWidget.dart';

//import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/sidebarX.dart';
import 'HomeScreenWidgets.dart';

class HomeScreen extends StatefulWidget {
  static final String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MoviesListVM viewModel = MoviesListVM();
  final _key = GlobalKey<ScaffoldState>();
  final _controllerSideBar =
      SidebarXController(selectedIndex: 1, extended: true);

  @override
  void initState() {
    viewModel.fetchMovies("EN-us", "1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: SideBarX(
        controller: _controllerSideBar,
        function: changelang,
      ),
      appBar: _appBarBuilder(),
      body: ChangeNotifierProvider<MoviesListVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<MoviesListVM>(builder: (context, viewModel, _) {
          switch (viewModel.movieMain.status) {
            case Status.LOADING:
              print("ESTADO::LOADING");
              return LoadingWidget();
            case Status.ERROR:
              print("ESTADO :: ERROR LOADING");
              return MyErrorWidget(viewModel.movieMain.message ?? "NA");
            case Status.COMPLETED:
              print("ESTADO :: COMPLETED");
              return getMoviesGridView(
                  viewModel.movieMain.data?.results, context);
            default:
          }
          return SizedBox.shrink();
        }),
      ),
      floatingActionButton: _actionButton(),
      //floatingActionButtonAnimator: FloatingActionButtonAnimator.,
    );
  }

  PreferredSizeWidget _appBarBuilder() {
    var con = context.resources.color;
    return AppBar(
      title: Center(
          child: MyTextViewTittle(
        context.resources.strings.homeScreen,
      )),
      backgroundColor: con.colorPrimary,
      leading: SizedBox.shrink(),
      actions: [
        // SizedBox(height: 50, width: 40, child: languageSelector(_langController))
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: languageSelectorOpener(_key, Url as String),
        )
      ],
    );
  }

  Widget _actionButton() {
    return ButtonBar(
      children: [
        FloatingActionButton.small(
          onPressed: () async {
            if (int.parse(page) > 2) {}
            await pageDown(page);
          },
          backgroundColor: context.resources.color.colorPrimary,
          child: Icon(Icons.arrow_upward),
          hoverElevation: 0,
          elevation: 0,
        ),
        FloatingActionButton.small(
          onPressed: () async {
            await pageUp(page);
          },
          backgroundColor: context.resources.color.colorPrimary,
          child: Icon(Icons.arrow_downward),
          hoverElevation: 0,
          elevation: 0,
        ),
      ],
    );
  }

  pageUp(String page) {
    page = (int.parse(page) + 1).toString();
    viewModel.fetchMovies(lang, page);
  }

  pageDown(
    String page,
  ) {
    page = (int.parse(page) - 1).toString();
    viewModel.fetchMovies(lang, page);
  }

  changelang(String langu) {
    viewModel.fetchMovies(langu, page);
  }
}
