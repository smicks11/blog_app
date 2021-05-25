// import 'package:flutter/material.dart';

// class FilterChipData {
//   final String label;
//   final Color color;
//   final Icon icon;
//   final bool isSelected;

//   const FilterChipData({
//     this.icon,
//     @required this.label,
//     @required this.color,
//     this.isSelected = false,
//   });

  

//   FilterChipData copy({
//     String label,
//     Color color,
//     bool isSelected,
//     Icon icon,
//   }) =>
//       FilterChipData(
//           label: label ?? this.label,
//           color: color ?? this.color,
//           isSelected: isSelected ?? this.isSelected,
//           icon: icon ?? this.icon);

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is FilterChipData &&
//           runtimeType == other.runtimeType &&
//           label == other.label &&
//           color == other.color &&
//           icon == other.icon &&
//           isSelected == other.isSelected;

//   @override
//   int get hashCode => label.hashCode ^ color.hashCode ^ isSelected.hashCode ^ icon.hashCode ;
// }
