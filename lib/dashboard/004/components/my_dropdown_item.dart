import 'package:flutter/material.dart';

class MyDropdownButtonItem<T> extends StatelessWidget {
  final  T current;
  final List<T> data;
  final ValueChanged<T?>? onChanged;

  const MyDropdownButtonItem({
    super.key,
    required this.current,
    required this.data,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return  DropdownButtonHideUnderline(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xFFEFEFF4), // Color(0xFFCAF0F8), // Màu nền
          borderRadius: BorderRadius.circular(8), // Bo góc
          // border: Border.all(color: Colors.grey), // Viền
        ),
        child: DropdownButton<T>(
          value: current,
          icon: const Icon(Icons.arrow_drop_down),
          items: data
              .map<DropdownMenuItem<T>>((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Text('$value'),
            );
          }).toList(),
          onChanged: onChanged,
          dropdownColor: Colors.white, // Màu nền của menu dropdown
          borderRadius: BorderRadius.circular(8), // Bo góc dropdown
        ),
      ),
    );
  }
}
