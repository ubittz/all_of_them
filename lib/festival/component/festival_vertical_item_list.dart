import 'package:all_of_them/festival/component/festival_card.dart';
import 'package:all_of_them/festival/model/festival_model.dart';
import 'package:all_of_them/festival/view/festival_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FestivalVerticalItemList extends StatelessWidget {
  final List<FestivalModel> festivals;

  const FestivalVerticalItemList({
    super.key,
    required this.festivals,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final festival = festivals[index];
        return GestureDetector(
          onTap: () {
            context.pushNamed(
              FestivalDetailScreen.routeName,
              pathParameters: {'id': festival.id},
            );
          },
          child: FestivalCard(festival: festival),
        );
      },
      separatorBuilder: (_, index) {
        return const SizedBox(height: 20.0);
      },
      itemCount: festivals.length,
    );
  }
}
