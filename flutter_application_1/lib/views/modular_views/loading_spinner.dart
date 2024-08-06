import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({super.key});

  static const double _size = 26;

  @override
  Widget build(BuildContext context) {
    return const UnconstrainedBox(
      child: Column(
        children: [
          SizedBox(height: 10),
          SizedBox(
            width: _size,
            height: _size,
            child: CircularProgressIndicator(color: Colors.red),
          ),
          SizedBox(height: 46),
        ],
      ),
    );
  }
}
