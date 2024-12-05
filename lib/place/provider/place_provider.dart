import 'package:all_of_them/common/const/data.dart';
import 'package:all_of_them/place/model/place_model.dart';
import 'package:all_of_them/place/provider/place_category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/image_path.dart';
import '../../common/utils/data_utils.dart';

final placeRandomByCategoryProvider = Provider<List<PlaceModel>>((ref) {
  final places = ref.watch(placeProvider);
  final selectedCategory = ref.watch(selectedPlaceCategoryProvider);

  final randomPlaces = DataUtils.getRandomShuffledList<PlaceModel>(places);
  return randomPlaces;
});

final placeDetailProvider = Provider.family<PlaceModel, String>((ref, id) {
  final product =
      ref.watch(placeProvider).firstWhere((element) => element.id == id);
  return product;
});

final placeProvider =
    StateNotifierProvider<PlaceStateNotifier, List<PlaceModel>>((ref) {
  return PlaceStateNotifier();
});

class PlaceStateNotifier extends StateNotifier<List<PlaceModel>> {
  PlaceStateNotifier() : super([]) {
    state = getItems();
  }

  List<PlaceModel> getItems() {
    return List.generate(
      placeData.keys.length,
      (index) {
        return PlaceModel(
          id: placeData.values.elementAt(index).last,
          name: placeData.keys.elementAt(index),
          shortDescription: placeData.values.elementAt(index)[0],
          description: placeData.values.elementAt(index)[1],
          mainImageUrl: '${ImagePath.placeDirectory}$index.png',
          detailImageUrl: '${ImagePath.placeDirectory}$index.png',
          tags: [
            placeData.values.elementAt(index)[2],
            placeData.values.elementAt(index)[3],
          ],
        );
      },
    );
  }
}
