import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/strings.dart';
import '../cubit/movie_credits_cubit.dart';
import '../states/movie_credits_states.dart';
import 'actor_card.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Strings.cast,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<MovieCreditsCubit, MovieCreditsStates>(
          builder: (context, state) {
            return state.maybeMap(
              loading: (_) => const Center(child: CircularProgressIndicator()),
              movieCreditsLoaded: (movieCast) {
                final actorsInActing = movieCast.actors
                    .where((actor) => actor.knownForDepartment == Strings.acting)
                    .toList();
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: actorsInActing.length,
                    itemBuilder: (context, index) {
                      final actor = actorsInActing[index];
                      return ActorCard(
                          actorName: actor.name,
                          profilePath: actor.profilePath);
                    },
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
