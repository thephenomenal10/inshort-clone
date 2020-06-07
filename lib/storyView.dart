import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:inshort_clone/homeScreen.dart';
import 'package:inshort_clone/utils/mySlide.dart';

class WebView extends StatefulWidget {

  final String link;

  const WebView({Key key, this.link}) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  Route route = MySlide(
                    builder: (context) => Home()
                       );
                  Navigator.push(context, route);
                }
              },
          child: new Center(
        child: new WebviewScaffold(
          appBar: AppBar(
            title: new Text("Read Full Story",),
            backgroundColor: Colors.black,
          ),
          url: widget.link,
          allowFileURLs: true,withZoom: true,
        ),
      ),
    );
  }
}