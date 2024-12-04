import 'package:all_of_them/common/component/container_title.dart';
import 'package:all_of_them/common/component/show/modal_bottom_sheet_widget.dart';
import 'package:all_of_them/common/component/show/show_component_modal_bottom_sheet.dart';
import 'package:all_of_them/common/component/wrap/custom_wrap.dart';
import 'package:all_of_them/common/const/colors.dart';
import 'package:all_of_them/common/const/text_styles.dart';
import 'package:all_of_them/common/layout/default_app_bar.dart';
import 'package:all_of_them/common/layout/default_layout.dart';
import 'package:all_of_them/place/component/place_vertical_item_list.dart';
import 'package:all_of_them/place/model/place_category_type.dart';
import 'package:all_of_them/place/provider/place_category_provider.dart';
import 'package:all_of_them/place/provider/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PlaceCategoryScreen extends ConsumerWidget {
  static String get routeName => 'place_category';

  const PlaceCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placeRandomByCategoryProvider);
    final selectedButtonLabel = ref.watch(selectedPlaceCategoryProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '',
        titleWidget: GestureDetector(
          onTap: () {
            showCustomModalBottomSheet(
              context: Navigator.of(context, rootNavigator: true).context,
              bottomSheetWidget: ModalBottomSheetWidget(
                height: 220.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const ContainerTitle(title: '카테고리'),
                      const SizedBox(height: 8.0),
                      CustomWrap(
                        buttons: PlaceCategoryType.values
                            .map((e) => CustomWrapButtonModel(
                                  title: e.label,
                                  onTap: () {
                                    ref
                                        .read(selectedPlaceCategoryProvider
                                            .notifier)
                                        .state = e;
                                  },
                                ))
                            .toList(),
                        selectedButtonLabel: selectedButtonLabel.label,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(selectedButtonLabel.label, style: MyTextStyle.subtitle18B),
                const SizedBox(width: 4.0),
                PhosphorIcon(
                  PhosphorIcons.caretDown(),
                  color: MyColor.text,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
        action: const [
          SizedBox(width: 72.0),
        ],
      ),
      child: PlaceVerticalItemList(places: places),
    );
  }
}
