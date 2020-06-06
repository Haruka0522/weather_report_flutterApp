import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<String> _data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, int index){
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              _data[index],
            ));
        },
      ),
        
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }


  void fetchPosts() async {
    const url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=400040';
    // the App.build method, and use it to set our appbar title.
    http.get(url)
        .then((response){
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}");
          setState(() {
            Map<String, dynamic> map = json.decode(response.body);
          });
          });
    }

    @override
    void initState() {
      _data = [];
      fetchPosts();

      super.initState();
    }
}
