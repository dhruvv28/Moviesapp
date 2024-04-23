import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description,bannerUrl,posterUrl,vote,launchOn;

  const Description(
      {
        super.key,
        required this.name,
        required this.description,
        required this.bannerUrl,
        required this.posterUrl,
        required this.vote,
        required this.launchOn
      }
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: ListView(
            children: [
              Container(
                height: 250,
                child: Stack(
                  children:[
                    Positioned(child:Container(
                      height:250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerUrl,fit:BoxFit.cover,),
                  )),
                  Positioned(bottom:10,child: ModifiedText(text:'⭐ average Rating - '+vote, size: 18, color: Colors.black, key: null,))
               ],
             ),
           ),
          SizedBox(height:15,),
          Container(padding:EdgeInsets.all(10),
            child: ModifiedText(text:name!=true?name:'Not loaded', color: Colors.white, size:24, key: null,),)
            ,Container(padding: EdgeInsets.only(left:10),
            child:ModifiedText(text:'releasing on -'+launchOn,size:14, color: Colors.white, key: null,),),
          Row(
            children:[
              Container(
              margin: EdgeInsets.all(5),
                height:200,
                width:100,
                child:Image.network(posterUrl),
              ),
              Flexible(
                child: Container(
                  child:ModifiedText(text:description,size:18, color: Colors.white
                  , key: null,),
                  ),
                )
              ],
            )],
          ),
        ),
     );
   }
}
