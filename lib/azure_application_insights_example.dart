import 'package:azure_application_insights/azure_application_insights.dart';
import 'package:http/http.dart';

class TelemetryManager {
  final String instrumentationKey;
  late final TelemetryClient telemetryClient;

  TelemetryManager(this.instrumentationKey) {
    _initializeTelemetry();
    _setupTelemetryProperties();
  }

  void _initializeTelemetry() {
    final client = Client();
    final processor = BufferedProcessor(
      next: TransmissionProcessor(
        instrumentationKey: instrumentationKey,
        httpClient: client,
        timeout: const Duration(seconds: 10),
      ),
    );
    telemetryClient = TelemetryClient(processor: processor);
  }

  void _setupTelemetryProperties() {
    telemetryClient.context
      ..applicationVersion = '1.0'
      ..user.id = 'Raja226';

    telemetryClient.context.properties['custom'] = 'a custom property value';
  }

  void trackTrace(String message, {Severity severity = Severity.information, Map<String, Object>? additionalProperties}) {
    telemetryClient.trackTrace(
      severity: Severity.information,
      message: message,
    );
  }

  void trackEvent(String name, {Map<String, Object>? additionalProperties}) {
    telemetryClient.trackEvent(
      name: name,
      //additionalProperties: additionalProperties,
    );
  }

  Future<void> flushTelemetry() async {
    await telemetryClient.flush();
  }

  // void closeClient() {
  //   telemetryClient.dispose();
  // }

}
