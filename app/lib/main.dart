import 'package:flutter/material.dart';

void main() {
  runWidget(
    const WebGateway(child: MainApp()
    ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello Astro!'),
        ),
      ),
    );
  }
}

class WebGateway extends StatefulWidget {
  final Widget child;

  const WebGateway({super.key, required this.child});

  @override
  State<WebGateway> createState() {
    return _WebGatewayState();
  }
}

class _WebGatewayState extends State<WebGateway> with WidgetsBindingObserver {
  late Widget child;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _updateView();
  }

  @override
  void didUpdateWidget(WebGateway oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateView();
  }

  @override
  void didChangeMetrics() {
    _updateView();
  }

  void _updateView() {
    final flutterView = WidgetsBinding.instance.platformDispatcher.views.single;
    setState(() {
      child = View(view: flutterView, child: widget.child);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}