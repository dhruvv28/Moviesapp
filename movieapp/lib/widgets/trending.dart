import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

import '../description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({required key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ModifiedText(
                text: 'Trending Movies',
                size: 26, color: Colors.white, key: null,
              ),
              SizedBox(height: 10),
              Container(
                  height: 270,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trending.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Description(
                                      name: trending[index]['title'],
                                      bannerUrl:
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['backdrop_path'],
                                      posterUrl:
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path'],
                                      description: trending[index]['overview'],
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      launchOn: trending[index]
                                      ['release_date'],
                                    )));
                          },
                          child:
                          trending[index]['title']!=null?Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path']),
                                    ),
                                  ),
                                  height: 200,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: ModifiedText(
                                      size: 15,
                                      text: trending[index]['title'] != null
                                          ? trending[index]['title']
                                          : 'Loading', color: Colors.white, key: null,),
                                )
                              ],
                            ),
                          ):Container(),
                        );
                      }))
            ],
            ),
        );
    }
}