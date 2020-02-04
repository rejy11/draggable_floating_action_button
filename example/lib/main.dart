import 'package:draggable_floating_action_button/draggable_floating_action_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Draggable FAB'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text('You can move the FAB after a long press!'),
              ),
            ),
            DraggableFloatingActionButton(
              onPressed: () {
                print('Fab Pressed');
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
