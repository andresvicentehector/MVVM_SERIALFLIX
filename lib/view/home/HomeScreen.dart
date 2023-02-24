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
  String flagUrl = "assets/images/flags/usa.png";

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
        function: _changelang,
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
    );
  }

  PreferredSizeWidget _appBarBuilder() {
    return AppBar(
      title: Center(
          child: MyTextViewTittle(
        context.resources.strings.homeScreen,
      )),
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: SizedBox.shrink(),
      actions: [
        // SizedBox(height: 50, width: 40, child: languageSelector(_langController))
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: languageSelectorOpener(_key, flagUrl),
        )
      ],
    );
  }

  Widget _actionButton() {
    return ButtonBar(
      children: [
        Container(
          width: 50,
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: CircleBorder(),
          ),
          child: IconButton(
              onPressed: () async {
                if (int.parse(page) > 1) {
                  print("after" + page);
                  await viewModel.updatePage(page);
                  print("Before " + page);
                  viewModel.fetchMovies(lang, page);
                }
              },
              icon: Icon(Icons.arrow_upward),
              color: Theme.of(context).colorScheme.secondary),
        ),
        Container(
          width: 50,
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: CircleBorder(),
          ),
          child: IconButton(
              onPressed: () async {
                if (int.parse(page) < viewModel.movieMain.data?.totalPages) {
                  page = (int.parse(page) + 1).toString();
                  viewModel.fetchMovies(lang, page);
                }
              },
              icon: Icon(Icons.arrow_downward),
              color: Theme.of(context).colorScheme.secondary),
        ),
      ],
    );
  }

  void _changelang(lang) {
    if (lang == "en-US") {
      flagUrl = "assets/images/flags/usa.png";
    } else {
      flagUrl = "assets/images/flags/spain.png";
    }

    viewModel.fetchMovies(lang, page);
  }
}
