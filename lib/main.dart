import 'package:challange_1_ui/websocket_connection.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueAccent,
          ),
      initialRoute: '/',
      routes: {
        '/' : (context) => WebSocketConnection(),
      },
    ),
  );
}
