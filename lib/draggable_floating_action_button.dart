library draggable_floating_action_button;

import 'package:flutter/material.dart';

class DraggableFloatingActionButton extends StatefulWidget {
  final Function onPressed;
  final Icon icon;

  const DraggableFloatingActionButton({
    this.onPressed,
    this.icon,
  });

  @override
  _DraggableFloatingActionButtonState createState() =>
      _DraggableFloatingActionButtonState();
}

class _DraggableFloatingActionButtonState
    extends State<DraggableFloatingActionButton> {
  bool isLeftDragging = false;
  bool isRightDragging = false;
  bool mainFabRight = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88, //standard height of fab plus 16+16 margin above and below
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0), //standard fab padding
            child: mainFabRight
                ? DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      print(candidateData);
                      return isRightDragging
                          ? Opacity(
                              opacity: 0.3,
                              child: FloatingActionButton(
                                child: widget.icon,
                                onPressed: null,
                              ),
                            )
                          : null;
                    },
                    onWillAccept: (data) => true,
                    onAccept: (data) {
                      setState(() {
                        mainFabRight = false;
                      });
                    },
                  )
                : LongPressDraggable(
                    onDragStarted: () {
                      setState(() {
                        isLeftDragging = true;
                      });
                    },
                    onDragEnd: (_) {
                      setState(() {
                        isLeftDragging = false;
                      });
                    },
                    axis: Axis.horizontal,
                    child: FloatingActionButton(
                      child: widget.icon,
                      onPressed: widget.onPressed,
                    ),
                    feedback: FloatingActionButton(
                      child: widget.icon,
                      onPressed: null,
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.1,
                      child: FloatingActionButton(
                        child: widget.icon,
                        onPressed: null,
                      ),
                    ),
                  ),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: mainFabRight
                ? LongPressDraggable(
                    onDragStarted: () {
                      setState(() {
                        isRightDragging = true;
                      });
                    },
                    onDragEnd: (_) {
                      setState(() {
                        isRightDragging = false;
                      });
                    },
                    axis: Axis.horizontal,
                    child: FloatingActionButton(
                      child: widget.icon,
                      onPressed: widget.onPressed,
                    ),
                    feedback: FloatingActionButton(
                      child: widget.icon,
                      onPressed: null,
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.1,
                      child: FloatingActionButton(
                        child: widget.icon,
                        onPressed: null,
                      ),
                    ),
                  )
                : DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      print(candidateData);
                      if (isLeftDragging) {
                        return Opacity(
                          opacity: 0.3,
                          child: FloatingActionButton(
                            child: widget.icon,
                            onPressed: null,
                          ),
                        );
                      }
                    },
                    onWillAccept: (data) => true,
                    onAccept: (data) {
                      //make this the new main fab
                      setState(() {
                        mainFabRight = true;
                      });
                    },
                  ),
          )
        ],
      ),
    );
  }
}
