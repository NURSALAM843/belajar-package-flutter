import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropDownPackage extends StatelessWidget {
  DropDownPackage({super.key});

  List<Map<String, dynamic>> dataList = [
    {"country": "Indonesia", "id": 1},
    {"country": "Canada", "id": 2},
    {"country": "Timor Leste", "id": 3},
    {"country": "Italia", "id": 4},
    {"country": "Brazil", "id": 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Search"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: DropdownSearch<Map<String, dynamic>>(
          mode: Mode.MENU,
          items: dataList,
          onChanged: (value) => print(value?["id"] ?? null),
          selectedItem: {"country": "Canada", "id": 2},
          showClearButton: true,
          showSearchBox: true,
          popupItemBuilder: (context, item, isSelected) => ListTile(
            title: Text(item["country"].toString()),
          ),
          dropdownBuilder: (context, selectedItem) =>
              Text(selectedItem?["country"].toString() ?? "Belum Pilih Negara"),
        ),
      ),
    );
  }
}
