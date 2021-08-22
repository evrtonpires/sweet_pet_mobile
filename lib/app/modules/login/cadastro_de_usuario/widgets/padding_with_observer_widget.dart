import 'package:flutter/material.dart';

class PaddingWithObserverWidget extends StatefulWidget {
  const PaddingWithObserverWidget({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PaddingWithObserverWidgetState createState() =>
      _PaddingWithObserverWidgetState();
}

class _PaddingWithObserverWidgetState extends State<PaddingWithObserverWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .05,
        right: MediaQuery.of(context).size.width * .05,
        top: MediaQuery.of(context).size.width * .05,
        bottom: MediaQuery.of(context).size.width * .05,
      ),
      child: widget.child,
    );
  }
}
