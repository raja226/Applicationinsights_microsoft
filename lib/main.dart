import 'package:azure_app_insights/azure_application_insights_example.dart';
import 'package:flutter/material.dart';
import 'package:azure_application_insights/azure_application_insights.dart';
import 'package:http/http.dart';

// Instrumentation key for Azure Application Insights
const String instrumentationKey = 'c1dae880-a0c7-41d6-8e4e-799587a67ea8';

void main() {
  // Instantiate OtherClass
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      final telemetryManager = TelemetryManager(instrumentationKey);

  telemetryManager.trackTrace("informationSeverity");
telemetryManager.trackEvent("incrementCounterTapped");
  //await telemetryManager.flushTelemetry();

  // telemetryManager.closeClient();
  //     final telemetrySender =
  //         TelemetrySender('c1dae880-a0c7-41d6-8e4e-799587a67ea8');
  //     telemetrySender.setUser('Rajasekhar Gogula');
  //     telemetrySender.setProperty('custom', 'Value check');
  //     telemetrySender.trackInformation('_incrementCounter tapped');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
