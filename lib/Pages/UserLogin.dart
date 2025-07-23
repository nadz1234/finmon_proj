import 'package:finmon_proj/Providers/trackProvider.dart';
import 'package:finmon_proj/component/gradientOutlineButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTracking = ref.watch(trackingProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Toggle Tracking")),
      body: Center(
        child: GradientOutlinedButton(
          onPressed: () {
            ref.read(trackingProvider.notifier).state = !isTracking;
          },
          text: isTracking ? 'Stop Tracking' : 'Start Tracking',
        ),
      ),
    );
  }
}
