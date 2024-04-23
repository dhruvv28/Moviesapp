// import 'package:flutter/material.dart';
// import 'package:movieapp/utils/text.dart';

// class TV extends StatelessWidget {
//   final List tv;

//   const TV({required key, required this.tv}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ModifiedText(
//                 text: 'Popular TV Shows',
//                 size: 26, color: Colors.white, key: null,
//               ),
//               SizedBox(height: 10),
//               Container(
//                 // color: Colors.red,
//                   height: 200,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: tv.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           padding: EdgeInsets.all(5),
//                           // color: Colors.green,
//                           width: 250,
//                           child: Column(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   image: DecorationImage(
//                                       image: NetworkImage(
//                                           'https://image.tmdb.org/t/p/w500' +
//                                               tv[index]['backdrop_path']),
//                                       fit: BoxFit.cover),
//                                 ),
//                                 height: 140,
//                                 width: 250,
//                               ),
//                               SizedBox(height: 5),
//                               Container(
//                                 child: ModifiedText(
//                                     size: 15,
//                                     text: tv[index]['original_name'] != null
//                                         ? tv[index]['original_name']
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

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Popular TV Shows',
            size: 26,
            color: Colors.white,
            key: null,
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToDescription(context, tv[index]);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['backdrop_path'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 140,
                          width: 250,
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: ModifiedText(
                            size: 15,
                            text: tv[index]['original_name'] != null
                                ? tv[index]['original_name']
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


void _navigateToDescription(BuildContext context, Map<String, dynamic> tvData) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Description(
        name: tvData['original_name'] ?? 'Unknown Name',
        bannerUrl:
            'https://image.tmdb.org/t/p/w500' + (tvData['backdrop_path'] ?? ''),
        posterUrl: 'https://image.tmdb.org/t/p/w500' + (tvData['poster_path'] ?? ''),
        description: tvData['overview'] ?? 'No description available',
        vote: (tvData['vote_average'] ?? 0.0).toString(),
        launchOn: tvData['release_date'] ?? 'No release date',
      ),
    ),
  );
}
}
