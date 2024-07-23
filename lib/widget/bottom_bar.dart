import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SizedBox(
        height: 50,
        child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorColor: Colors.transparent,
            tabs: const <Widget>[
              Tab(
                  icon: Icon(Icons.home, size: 10),
                  child: Text("HOME", style: TextStyle(fontSize: 9))),
              Tab(
                  icon: Icon(Icons.search, size: 10),
                  child: Text("검색", style: TextStyle(fontSize: 9))),
              Tab(
                  icon: Icon(Icons.save_alt, size: 10),
                  child: Text("저장한 콘텐츠 목록", style: TextStyle(fontSize: 9))),
              Tab(
                  icon: Icon(Icons.list, size: 10),
                  child: Text("더 보기", style: TextStyle(fontSize: 9))),
            ]),
      ),
    );
  }
}
