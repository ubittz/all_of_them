import 'package:all_of_them/place/model/place_category_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPlaceCategoryProvider = StateProvider<PlaceCategoryType>(
  (ref) => PlaceCategoryType.values.first,
);
