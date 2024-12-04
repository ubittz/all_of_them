import 'package:all_of_them/partner/component/partner_card.dart';
import 'package:all_of_them/partner/model/partner_model.dart';
import 'package:all_of_them/partner/view/partner_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PartnerHorizontalItemList extends ConsumerWidget {
  final List<PartnerModel> partners;

  const PartnerHorizontalItemList({
    super.key,
    required this.partners,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 340.0,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        itemCount: partners.length,
        itemBuilder: (context, index) {
          final partner = partners[index];

          return GestureDetector(
            onTap: () {
              context.pushNamed(
                PartnerDetailScreen.routeName,
                pathParameters: {'id': partner.id},
              );
            },
            child: PartnerCard(partner: partner),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8.0);
        },
      ),
    );
  }
}
