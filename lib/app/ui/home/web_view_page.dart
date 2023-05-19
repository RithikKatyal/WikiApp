import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String? webViewUrl;
  final String? title;

  WebViewPage({this.webViewUrl, this.title});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return _MainWidget(context);
  }

  Widget _MainWidget(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: IndexedStack(
                      index: _index,
                      children: [
                        const Center(child: CircularProgressIndicator(),),
                        WebView(
                          initialUrl: this.widget.webViewUrl,
                          onPageFinished: (String url){
                            setState(() {
                              _index = 1;
                            });
                          },
                        ),
                      ]
                  ),
                ),
              )
            ],
          )),
    );
  }
}
