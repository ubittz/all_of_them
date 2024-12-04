import 'package:all_of_them/common/const/data.dart';
import 'package:all_of_them/festival/model/festival_model.dart';
import 'package:all_of_them/festival/provider/festival_category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/image_path.dart';
import '../../common/utils/data_utils.dart';

final festivalRandomByCategoryProvider = Provider<List<FestivalModel>>((ref) {
  final festivals = ref.watch(festivalProvider);
  final selectedCategory = ref.watch(selectedFestivalCategoryProvider);

  final randomFestivals = DataUtils.getRandomShuffledList<FestivalModel>(festivals);
  return randomFestivals;
});

final festivalDetailProvider = Provider.family<FestivalModel, String>((ref, id) {
  final product =
      ref.watch(festivalProvider).firstWhere((element) => element.id == id);
  return product;
});

final festivalProvider =
    StateNotifierProvider<FestivalStateNotifier, List<FestivalModel>>((ref) {
  return FestivalStateNotifier();
});

class FestivalStateNotifier extends StateNotifier<List<FestivalModel>> {
  FestivalStateNotifier() : super([]) {
    state = getItems();
  }

  List<FestivalModel> getItems() {
    return List.generate(
      festivalData.keys.length,
      (index) {
        return FestivalModel(
          id: index.toString(),
          name: festivalData.keys.elementAt(index),
          shortDescription: festivalData.values.elementAt(index)[0],
          description: festivalData.values.elementAt(index)[1],
          mainImageUrl: '${ImagePath.festivalDirectory}$index.png',
          detailImageUrl: '${ImagePath.festivalDirectory}$index.png',
          tags: [
            festivalData.values.elementAt(index)[2],
            festivalData.values.elementAt(index)[3],
          ],
        );
      },
    );
  }
}
