import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String? error;

  const ErrorDialog(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(36),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                error ?? 'UNKNOWN',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
