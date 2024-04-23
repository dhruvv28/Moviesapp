// import 'package:flutter/material.dart';
// import 'package:movieapp/utils/text.dart';


// class TopRatedMovies extends StatelessWidget {
//   final List toprated;

//   const TopRatedMovies({key, required this.toprated}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ModifiedText(
//                 text: 'Top Rated Movies',
//                 size: 26, color: Colors.white, key: null,
//               ),
//               SizedBox(height: 10),
//               Container(
//                   height: 270,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: toprated.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           width: 140,
//                           child: Column(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: NetworkImage(
//                                         'https://image.tmdb.org/t/p/w500' +
//                                             toprated[index]['poster_path']),
//                                   ),
//                                 ),
//                                 height: 200,
//                               ),
//                               SizedBox(height: 5),
//                               Container(
//                                 child: ModifiedText(
//                                     size: 15,
//                                     text: toprated[index]['title'] != null
//                                         ? toprated[index]['title']
//                                         : 'Loading', color: Colors.white, key: null,),
//                               )
//                             ],
//                           ),
//                         );
//                       }))
//             ],
//             ),
//         );
//     }
// }
import 'package:flutter/material.dart';
import 'package:movieapp/description.dart';
import 'package:movieapp/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Top Rated Movies',
            size: 26,
            color: Colors.white,
            key: null,
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToDescription(context, toprated[index]);
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],
                              ),
                            ),
                          ),
                          height: 200,
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: ModifiedText(
                            size: 15,
                            text: toprated[index]['title'] != null
                                ? toprated[index]['title']
                                : 'Loading',
                            color: Colors.white,
                            key: null,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDescription(BuildContext context, Map<String, dynamic> movieData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Description(
          name: movieData['title'],
          bannerUrl: 'https://image.tmdb.org/t/p/w500' + movieData['backdrop_path'],
          posterUrl: 'https://image.tmdb.org/t/p/w500' + movieData['poster_path'],
          description: movieData['overview'],
          vote: movieData['vote_average'].toString(),
          launchOn: movieData['release_date'],
        ),
      ),
    );
  }
}
