import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Youtube List Items'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemExtent: 106.0,
        itemBuilder: (BuildContext context, int index) {
          return YoutubeListItem(
            imageUrl: 'http://i3.ytimg.com/vi/sPW7nDBqt8w/hqdefault.jpg',
            user: 'Flutter',
            numViews: 999000,
            title: 'The Flutter YouTube Channel is Here!',
          );
        },
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  _Thumbnail({
    Key key,
    this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.network(imageUrl),
      flex: 2,
    );
  }
}


class YoutubeListItem extends StatelessWidget {
  YoutubeListItem({
    this.imageUrl,
    this.user,
    this.numViews,
    this.title,
  });

  final String imageUrl;
  final String user;
  final int numViews;
  final String title;

  Widget _buildVideoDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(
              user,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            Text(
              '$numViews views',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
      flex: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _Thumbnail(imageUrl: imageUrl),
            _buildVideoDescription(),
            InkWell(
              borderRadius: BorderRadius.circular(8.0),
              onLongPress: () {},
              child: Icon(Icons.more_vert, size: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
