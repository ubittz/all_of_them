import 'package:all_of_them/common/const/text_styles.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';

class CustomWrap extends StatefulWidget {
  final List<CustomWrapButtonModel> buttons;
  final String selectedButtonLabel;

  const CustomWrap({
    super.key,
    required this.buttons,
    required this.selectedButtonLabel,
  });

  @override
  State<CustomWrap> createState() => _HorizontalButtonListState();
}

class _HorizontalButtonListState extends State<CustomWrap> {
  CustomWrapButtonModel? selectedButton;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 12.0,
      children: List.generate(
        widget.buttons.length,
        (int index) => _ContainerInkWell(
          title: widget.buttons[index].title,
          isSelected: selectedButton == null
              ? widget.buttons[index].title == widget.selectedButtonLabel
              : selectedButton!.title == widget.buttons[index].title,
          onTap: () {
            widget.buttons[index].onTap();
            selectedButton = widget.buttons[index];
            setState(() {});
          },
        ),
      ),
    );
  }
}

class CustomWrapButtonModel {
  final String title;
  final VoidCallback onTap;

  const CustomWrapButtonModel({
    required this.title,
    required this.onTap,
  });
}

class _ContainerInkWell extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _ContainerInkWell({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? MyColor.primary : MyColor.empty,
          border: Border.all(
            width: 1.0,
            color: isSelected ? MyColor.empty : MyColor.text,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Text(
            title,
            style: MyTextStyle.subtitle18R.copyWith(
              color: isSelected ? MyColor.white : null,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
