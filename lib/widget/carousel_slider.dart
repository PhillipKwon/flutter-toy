import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toy/model/model_movie.dart';
import 'package:flutter_toy/screen/detail_screen.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  CarouselImage({required this.movies});

  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie> movies = [];
  List<Widget> images = [];
  List<String> keywords = [];
  List<bool> likes = [];

  int _currentPage = 0;
  String _currentKeyword = "";

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.network(m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();

    _currentKeyword = keywords[0];
  }

  @override
  void didUpdateWidget(CarouselImage oldWidget) {
    if (widget.movies != oldWidget.movies) {
      setState(() {
        movies = widget.movies;
        images = movies.map((m) => Image.network(m.poster)).toList();
        keywords = movies.map((m) => m.keyword).toList();
        likes = movies.map((m) => m.like).toList();

        _currentKeyword = keywords.isNotEmpty ? keywords[0] : "";
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              onPageChanged: (index, reason) => {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[_currentPage];
                })
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      likes[_currentPage]
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  likes[_currentPage] = !likes[_currentPage];
                                  // 업데이트할 필드와 값을 담은 맵
                                  Map<String, dynamic> updatedData = {
                                    'like': likes[_currentPage],
                                  };

                                  movies[_currentPage]
                                      .reference
                                      .update(updatedData)
                                      .then((value) => print(
                                          "DocumentSnapshot successfully updated!"))
                                      .catchError((error) => print(
                                          "Failed to update DocumentSnapshot: $error"));
                                });
                              },
                              icon: Icon(Icons.check),
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  likes[_currentPage] = !likes[_currentPage];
                                  // 업데이트할 필드와 값을 담은 맵
                                  Map<String, dynamic> updatedData = {
                                    'like': likes[_currentPage],
                                  };

                                  movies[_currentPage]
                                      .reference
                                      .update(updatedData)
                                      .then((value) => print(
                                          "DocumentSnapshot successfully updated!"))
                                      .catchError((error) => print(
                                          "Failed to update DocumentSnapshot: $error"));
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                      Text(
                        '내가 찜한 콘텐츠',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith(
                        (states) => Colors.white,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                        ),
                        Text(
                          '재생',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return DetailScreen(
                                  movie: movies[_currentPage],
                                );
                              },
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        icon: Icon(Icons.info),
                      ),
                      Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(movies, _currentPage),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == i
            ? Color.fromRGBO(255, 255, 255, 0.9)
            : Color.fromRGBO(255, 255, 255, 0.4),
      ),
    ));
  }

  return results;
}
