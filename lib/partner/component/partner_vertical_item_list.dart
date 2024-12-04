import 'package:all_of_them/partner/component/partner_vertical_item_list_card.dart';
import 'package:all_of_them/partner/model/partner_model.dart';
import 'package:all_of_them/partner/view/partner_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PartnerVerticalItemList extends StatelessWidget {
  final List<PartnerModel> partners;

  const PartnerVerticalItemList({
    super.key,
    required this.partners,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 20.0),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final partner = partners[index];
        return GestureDetector(
          onTap: () {
            context.pushNamed(
              PartnerDetailScreen.routeName,
              pathParameters: {'id': partner.id},
            );
          },
          child: PartnerVerticalItemListCard.fromModel(model: partner),
        );
      },
      separatorBuilder: (_, index) {
        return const SizedBox(height: 20.0);
      },
      itemCount: partners.length,
    );
  }
}
