import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/widgets/toprated.dart';
import 'package:movieapp/widgets/trending.dart';
import 'package:movieapp/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies =[];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '342a9a3f065b074435c3ccc8ae932a0d';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNDJhOWEzZjA2NWIwNzQ0MzVjM2NjYzhhZTkzMmEwZCIsInN1YiI6IjY1MWVlNmJjZjA0ZDAxMDBmZmVkZTViNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YVwVj5E7b76AwKktBUZvoYk9TtQ6lD30OxpibiqL8j4';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies()async{
    TMDB TmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
      )
    );
    Map trendingresult = await TmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await TmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await TmdbWithCustomLogs.v3.tv.getPopular();

    // print(trendingresult);

    setState(() {
      trendingmovies  = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const ModifiedText(text: 'Flutter movie app', color: Colors.white, size: 20, key: null,),
        backgroundColor: const Color.fromARGB(255, 180, 68, 0),
      ),
      body: ListView(
        children: [
          TV(tv: tv, key: null,),
          TopRatedMovies(toprated: topratedmovies,),
          TrendingMovies(trending:trendingmovies, key: null,),
        ],
      ),
    );
  }
}



