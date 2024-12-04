import 'package:all_of_them/partner/model/partner_category_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPartnerCategoryProvider = StateProvider<PartnerCategoryType>(
  (ref) => PartnerCategoryType.values.first,
);
