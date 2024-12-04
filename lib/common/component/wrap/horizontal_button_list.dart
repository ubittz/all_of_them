// import 'package:all_of_them/common/const/colors.dart';
// import 'package:flutter/material.dart';
//
// import '../../const/text_styles.dart';
//
// class HorizontalButtonList extends StatefulWidget {
//   final List<HorizontalButtonModel> buttons;
//   final int initialSelectedIndex;
//
//   const HorizontalButtonList({
//     super.key,
//     required this.buttons,
//     this.initialSelectedIndex = 0,
//   });
//
//   @override
//   State<HorizontalButtonList> createState() => _HorizontalButtonListState();
// }
//
// class _HorizontalButtonListState extends State<HorizontalButtonList> {
//   HorizontalButtonModel? selectedButton;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 36.0,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (_, index) {
//           final button = widget.buttons[index];
//           return _ContainerInkWell(
//             title: button.title,
//             isSelected: selectedButton == null
//                 ? index == widget.initialSelectedIndex
//                 : selectedButton!.title == button.title,
//             onTap: () {
//               setState(() {
//                 selectedButton = button;
//               });
//               button.onTap();
//             },
//           );
//         },
//         separatorBuilder: (_, index) {
//           return const SizedBox(width: 8.0);
//         },
//         itemCount: widget.buttons.length,
//       ),
//     );
//   }
// }
//
// class HorizontalButtonModel {
//   final String title;
//   final VoidCallback onTap;
//
//   const HorizontalButtonModel({
//     required this.title,
//     required this.onTap,
//   });
// }
//
// class _ContainerInkWell extends StatelessWidget {
//   final String title;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const _ContainerInkWell({
//     super.key,
//     required this.title,
//     required this.isSelected,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: isSelected ? MyColor.primary : MyColor.empty,
//           border: Border.all(
//             width: 1.0,
//             color: isSelected ? MyColor.empty : MyColor.lightGrey,
//           ),
//           borderRadius: BorderRadius.circular(100.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
//           child: Text(
//             title,
//             style: MyTextStyle.description14M.copyWith(
//               color: isSelected ? MyColor.white : MyColor.darkGrey,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
