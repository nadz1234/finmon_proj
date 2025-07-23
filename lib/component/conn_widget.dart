import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:finmon_proj/Providers/connectivityProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectionStatusWidget extends ConsumerWidget {
  const ConnectionStatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivity = ref.watch(connectivityProvider);

    return connectivity.when(
      data: (status) {
        String message;
        Color color;

        switch (status) {
          case ConnectivityResult.mobile:
            message = 'Connected (Mobile)';
            color = Colors.green;
            break;
          case ConnectivityResult.wifi:
            message = 'Connected (Wi-Fi)';
            color = Colors.green;
            break;
          case ConnectivityResult.none:
          default:
            message = 'No Internet Connection';
            color = Colors.red;
        }

        return Container(
          color: color,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off, color: Colors.white),
              const SizedBox(width: 8),
              Text(message, style: const TextStyle(color: Colors.white)),
            ],
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text("Error: $e"),
    );
  }
}
