import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:Hector_Show_movie/models/moviesList/online/MoviesMain.dart';
import 'package:Hector_Show_movie/models/moviesList/offline/moviesHive.dart';
import 'package:Hector_Show_movie/view/details/MovieDetailsScreen.dart';
import 'package:Hector_Show_movie/view/home/HomeScreen.dart';
import 'package:Hector_Show_movie/res/AppContextExtension.dart';

initializer() async {
  WidgetsFlutterBinding.ensureInitialized();

  //IMPORTANT TO IPAD::::::Should you decide to opt out of multitasking you can do this by setting "Requires full screen" to true in the Xcode Deployment Info.
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(MovieHiveAdapter());
  Hive.registerAdapter(ResultsHiveAdapter());
  await Hive.openBox("moviesBox");
}

void main() async {
  await initializer();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
                brightness: Brightness.light,
                primary: context.resources.color.colorPrimary,
                secondary: context.resources.color.colorPrimaryText)
            .copyWith(
                tertiary: context.resources.color.colorBlack,
                tertiaryContainer: context.resources.color.colorContainer),
      ),
      /* darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
                brightness: Brightness.dark,
                primary: context.resources.colorDark.colorPrimary,
                background: Colors.black12,
                onBackground: Colors.white,
                secondary: context.resources.colorDark.colorPrimaryText)
            .copyWith(
                tertiary: context.resources.colorDark.colorBlack,
                tertiaryContainer: context.resources.colorDark.colorContainer),
      ),*/
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        MovieDetailsScreen.id: (context) => MovieDetailsScreen(
            ModalRoute.of(context)!.settings.arguments as Results),
      },
    );
  }
}
