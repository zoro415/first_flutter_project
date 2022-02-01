import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  int progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.google.com',
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (loadProgress) {
              setState(() {
                progress = loadProgress;
              });
              print(progress);
            },
          ),
          progress < 100
              ? Center(
                  child: CircularProgressIndicator(
                    value: progress / 100,
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
