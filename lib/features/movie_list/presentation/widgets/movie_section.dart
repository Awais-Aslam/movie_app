import 'package:flutter/material.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final Widget Function(BuildContext, dynamic) builder;
  final bool isHorizontal;

  const MovieSection({
    super.key,
    required this.title,
    required this.builder,
    this.isHorizontal = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          builder(context, null),
        ],
      ),
    );
  }
}
