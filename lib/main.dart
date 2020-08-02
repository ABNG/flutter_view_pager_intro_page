import 'package:flutter/material.dart';
import 'package:flutterintroductionpage/pages/MyPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _key;
  int _currentpage = 0;
  final int numPages = 3;
  final controller = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _key = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: Container(
          color: Colors.greenAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(
                  top: 20.0,
                ),
                child: FlatButton(
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  onPressed: () {
                    _key.currentState.showSnackBar(SnackBar(
                      content: Text("clicked skip"),
                    ));
                  },
                ),
              ),
              Expanded(
                child: PageView(   //model data use pageview.builder. or see apartment booking project from h: drive, Secondscreen, 
                  controller: controller,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentpage = page;
                    });
                  },
                  children: [
                    MyPage(
                      controller: controller,
                      currentpage: _currentpage,
                      numPages: numPages,
                      image: 'images/f1.jpg',
                    ),
                    MyPage(
                      controller: controller,
                      currentpage: _currentpage,
                      numPages: numPages,
                      image: 'images/f3.jpg',
                    ),
                    MyPage(
                      controller: controller,
                      currentpage: _currentpage,
                      numPages: numPages,
                      image: 'images/f4.jpg',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: _currentpage != numPages - 1
          ? FloatingActionButton(
              backgroundColor: Colors.purpleAccent,
              elevation: 5.0,
              onPressed: () {
                controller.nextPage(
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
          : Text(''),
    );
  }
}
