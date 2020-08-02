import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final currentpage;
  final numPages;
  final controller;
  final image;

  MyPage({this.currentpage, this.numPages, this.controller, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              "PAY IT",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "You Can Click Here for More Info Ok You Got It Now.",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageIndicator(),
          ),
          Spacer(), // to move last widget to bottom
          currentpage == numPages - 1
              ? Container(
                  height: 60.0,
                  width: double.infinity,
                  color: Colors.purpleAccent,
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }

  List<Widget> pageIndicator() {
    List<Widget> indicator = [];
    for (int i = 0; i < numPages; i++) {
      indicator.add(i == currentpage ? _indicator(true) : _indicator(false));
    }
    return indicator;
  }

  Widget _indicator(bool value) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: value ? 24.0 : 16.0,
      decoration: BoxDecoration(
          color: value ? Colors.lime : Colors.brown.shade300,
          borderRadius: BorderRadius.circular(12.0)),
    );
  }
}
