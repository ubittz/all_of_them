import 'package:all_of_them/place/component/place_card.dart';
import 'package:all_of_them/place/model/place_model.dart';
import 'package:all_of_them/place/view/place_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlaceVerticalItemList extends StatelessWidget {
  final List<PlaceModel> places;

  const PlaceVerticalItemList({
    super.key,
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final place = places[index];
        return GestureDetector(
          onTap: () {
            context.pushNamed(
              PlaceDetailScreen.routeName,
              pathParameters: {'id': place.id},
            );
          },
          child: PlaceCard(place: place),
        );
      },
      separatorBuilder: (_, index) {
        return const SizedBox(height: 20.0);
      },
      itemCount: places.length,
    );
  }
}
