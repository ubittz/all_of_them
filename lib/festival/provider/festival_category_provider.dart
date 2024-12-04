import 'package:all_of_them/festival/model/festival_category_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedFestivalCategoryProvider = StateProvider<FestivalCategoryType>(
  (ref) => FestivalCategoryType.values.first,
);
