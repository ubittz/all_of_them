import 'package:all_of_them/common/const/data.dart';
import 'package:all_of_them/common/const/image_path.dart';
import 'package:all_of_them/common/utils/data_utils.dart';
import 'package:all_of_them/partner/model/partner_model.dart';
import 'package:all_of_them/partner/provider/partner_category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final partnerRandomByCategoryProvider = Provider<List<PartnerModel>>((ref) {
  final partners = ref.watch(partnerProvider);
  final selectedCategory = ref.watch(selectedPartnerCategoryProvider);

  final randomPartners = DataUtils.getRandomShuffledList<PartnerModel>(partners);
  return randomPartners;
});

final partnerDetailProvider = Provider.family<PartnerModel, String>((ref, id) {
  final product =
      ref.watch(partnerProvider).firstWhere((element) => element.id == id);
  return product;
});

final partnerProvider =
    StateNotifierProvider<PartnerStateNotifier, List<PartnerModel>>((ref) {
  return PartnerStateNotifier();
});

class PartnerStateNotifier extends StateNotifier<List<PartnerModel>> {
  PartnerStateNotifier() : super([]) {
    state = getItems();
  }

  List<PartnerModel> getItems() {
    return List.generate(
      partnerData.keys.length,
      (index) {
        return PartnerModel(
          id: index.toString(),
          name: partnerData.keys.elementAt(index),
          job: partnerData.values.elementAt(index)[0],
          shortDescription: partnerData.values.elementAt(index)[1],
          description: partnerData.values.elementAt(index)[2],
          mainImageUrl: '${ImagePath.partnerDirectory}$index.png',
          detailImageUrl: '${ImagePath.partnerDirectory}$index.png',
          tags: [
            partnerData.values.elementAt(index)[3],
            partnerData.values.elementAt(index)[4],
          ],
        );
      },
    );
  }
}
