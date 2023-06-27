import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const UnconstrainedBox(
      child: Column(
        children: [
          SizedBox(height: 10),
          SizedBox(
            width: 26,
            height: 26,
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 46),
        ],
      ),
    );
  }
}