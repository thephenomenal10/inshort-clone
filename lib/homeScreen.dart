import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshort_clone/storyView.dart';
import 'package:inshort_clone/utils/mySlide.dart';
import 'package:inshort_clone/data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (context, position) {
              return new GestureDetector(
                onHorizontalDragUpdate: (details) {
                  if (details.delta.direction > 0) {
                    Route route = MySlide(
                        builder: (context) =>
                            WebView(link: data[position]['link']));
                    Navigator.push(context, route);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.grey,
                      // offset: Offset(2.0, 1.0)
                    )
                  ]),
                  margin: EdgeInsets.all(2.0),
                  height: MediaQuery.of(context).size.height / 1.1,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          
                          children: <Widget>[
                            SizedBox(height: MediaQuery.of(context).size.height/10,),
                            Center(
                              // heightFactor: 1.1,
                              child: Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      new BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 1.0)
                                    ]),
                                child: Card(
                                  elevation: 20.0,
                                  shadowColor: Colors.grey,
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Image.network(
                                          "https://1.bp.blogspot.com/-7-LuU7W0scM/XtvnfIXSl4I/AAAAAAAAACA/pt-jwhfAooIY_EhZImTwCYKK-qz2IIp7QCNcBGAsYHQ/s1600/inshort.jpeg",
                                          alignment: Alignment.topCenter,
                                          height: 220,
                                          width: 700,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 12.0, left: 12.0),
                                        child: new Text(data[position]['title'],
                                            style: GoogleFonts.creteRound(
                                                textStyle: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,   
                                                ))),
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        indent: 20,
                                        endIndent: 20,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(18.0),
                                          child: new Text(
                                              data[position]['description'],
                                              style: GoogleFonts.creteRound(
                                                textStyle: TextStyle(
                                              fontSize: 18.0,
                                                )))),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
