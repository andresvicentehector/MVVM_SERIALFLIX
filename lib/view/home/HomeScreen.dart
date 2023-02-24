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
import 'HomeScreenActionButton.dart';
import 'HomeScreenGridView.dart';

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
    viewModel.fetchMovies(viewModel.page, viewModel.lang);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoviesListVM>(
      create: (BuildContext context) => viewModel,
      child: Consumer<MoviesListVM>(builder: (context, viewModel, _) {
        switch (viewModel.movieMain.status) {
          case Status.LOADING:
            //print("ESTADO::LOADING");
            return LoadingWidget();
          case Status.ERROR:
            //print("ESTADO :: ERROR LOADING");
            return MyErrorWidget(viewModel.movieMain.message ?? "NA");
          case Status.COMPLETED:
            //print("ESTADO :: COMPLETED");
            return Scaffold(
              key: _key,
              drawer: SideBarX(
                  controller: _controllerSideBar,
                  function: viewModel.changeLang,
                  page: viewModel.page),
              appBar: _appBarBuilder(),
              body: HomeScreenGridView(
                  moviesList: viewModel.movieMain.data?.results),
              floatingActionButton: ActionButton(
                lang: viewModel.lang,
                page: viewModel.page,
                moviesPages: viewModel.movieMain.data?.totalPages,
                updatePageDown: viewModel.updatePageDown,
                updatePageUp: viewModel.updatePageUp,
              ),
            );
          default:
        }
        return SizedBox.shrink();
      }),
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
          child: languageSelectorOpener(_key, viewModel.flagUrl),
        )
      ],
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
    );
  }
}
