import 'package:flutter/material.dart';

class DropdownMenu extends StatefulWidget {
  DropdownMenu({Key? key, required this.items, required this.itemChosen})
      : super(key: key);

  final List<String> items;
  String? itemChosen;

  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String? value;
  String? itemChosen;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 4),
      ), //BoxDecoration
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            value: value,
            iconSize: 36,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            isExpanded: true,
            items: widget.items.map(buildMenuItem).toList(),
            onChanged: (value) {
              setState(() {
                this.value = value;
                widget.itemChosen = value;
              });
            }), //Drop down button
      ),
    ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
