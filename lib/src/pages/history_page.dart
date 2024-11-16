import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/model/model_bloc.dart';
import '../widgets/history_card.dart';
import '../widgets/no_data.dart';
import '../widgets/title_text.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModelBloc, ModelState>(
      builder: (context, state) {
        if (state is ModelsLoaded) {
          if (state.models.isEmpty) {
            return const Column(
              children: [
                SizedBox(height: 14),
                TitleText('History'),
                Expanded(child: NoData()),
              ],
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.models.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    const SizedBox(height: 14),
                    const TitleText('History'),
                    const SizedBox(height: 26),
                    HistoryCard(model: state.models[index]),
                  ],
                );
              }
              return HistoryCard(model: state.models[index]);
            },
          );
        }

        return Container();
      },
    );
  }
}
