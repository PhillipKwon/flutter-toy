import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/bbongflix_logo.png'),
                backgroundColor: Colors.black,
                radius: 100,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'KwonFlix',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.red,
              width: 140,
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Linkify(
                text: "https://github.com/PhillipKwon",
                onOpen: (link) async {
                  if (await canLaunchUrl(link.url as Uri)) {
                    await launchUrl(link.url as Uri);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
