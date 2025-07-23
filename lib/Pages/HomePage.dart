import 'dart:async';
import 'package:finmon_proj/Providers/trackProvider.dart';
import 'package:finmon_proj/service/location.dart';
import 'package:finmon_proj/service/postLocation.dart';
import 'package:finmon_proj/component/conn_widget.dart';
import 'package:finmon_proj/component/gradientOutlineButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Timer? _timer;
  String locationText = "Location will appear here";
  late final ProviderSubscription<bool> _subscription;
  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    _subscription = ref.listenManual<bool>(trackingProvider, (previous, next) {
      if (next == true) {
        _startTracking();
      } else {
        _stopTracking();
      }
    });
  }

  void _startTracking() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) async {
      final position = await LocationService().getCurrentLocation();
      setState(() {
        locationText = "Lat: ${position.latitude}, Long: ${position.longitude}";
      });

      postLocation(
        deviceId: '',
        latitude: position.latitude,
        longitude: position.longitude,
        timestamp: DateTime.now().toIso8601String(),
      );
    });
  }

  void _stopTracking() {
    _timer?.cancel();
    _timer = null;
    setState(() {
      locationText = "Tracking stopped.";
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
    _subscription.close();
  }

  @override
  Widget build(BuildContext context) {
    final isTracking = ref.watch(trackingProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('My Tracker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationText),
            const SizedBox(height: 20),
            Text("Trackng is ${isTracking ? "ON" : "OFF"}"),
          ],
        ),
      ),
    );
  }
}
