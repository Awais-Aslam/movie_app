import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  final String actorName;
  final String? profilePath;

  const ActorCard({super.key, required this.actorName, this.profilePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 80,
              height: 80,
              color: Colors.grey[300],
              child: profilePath != null
                  ? Image.network(
                      'https://image.tmdb.org/t/p/w500$profilePath',
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.person, size: 40),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            actorName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
