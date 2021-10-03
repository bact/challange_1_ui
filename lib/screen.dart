import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final assetName;
  final text;

  const Screen({Key key, @required this.assetName, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(child: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                Icons.info,
                color: Colors.white,
                size: 30,
              ),
            ),),
            Image(
              image: AssetImage(assetName),
            ),Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 100,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(30, 1, 30, 20),
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
              
            ),
          ],
        ),
      ),),
    );
  }
}
