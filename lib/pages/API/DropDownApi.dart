import 'dart:convert';

import 'package:dasar_flutter_section_4/models/city.dart';
import 'package:dasar_flutter_section_4/models/province.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropdownApi extends StatelessWidget {
  DropdownApi({super.key});

  String? idProv;

  final String apiKey =
      "9cd4d341a968e2e7016ad1e35595a0595c866331e646670b7530900008c7e45c";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API WILAYAH INDONESIA"),
        actions: const [],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<Province>(
            mode: Mode.MENU,
            onChanged: (value) => idProv = value?.id,
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? "Belum Memilih Provinsi"),
            showClearButton: true,
            showSearchBox: true,
            popupItemBuilder: (context, item, isSelected) => ListTile(
              title: Text(item.name),
            ),
            onFind: (text) async {
              var response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey"));

              if (response.statusCode != 200) {
                return [];
              }
              List allProvince =
                  (json.decode(response.body) as Map<String, dynamic>)["value"];
              List<Province> allModelProvince = [];

              allProvince.forEach((element) {
                allModelProvince.add(
                  Province(
                    id: element["id"],
                    name: element["name"],
                  ),
                );
              });
              return allModelProvince;
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          DropdownSearch<City>(
            mode: Mode.MENU,
            onChanged: (value) => print(value?.toJson()),
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? "Belum Memilih Kota/Kabupaten"),
            showClearButton: true,
            showSearchBox: true,
            popupItemBuilder: (context, item, isSelected) => ListTile(
              title: Text(item.name),
            ),
            onFind: (text) async {
              var response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProv"));

              if (response.statusCode != 200) {
                return [];
              }
              List allCity =
                  (json.decode(response.body) as Map<String, dynamic>)["value"];
              List<City> allModelCity = [];

              allCity.forEach((element) {
                allModelCity.add(
                  City(
                    id: element["id"],
                    idProvinsi: element["id_provinsi"],
                    name: element["name"],
                  ),
                );
              });
              return allModelCity;
            },
          ),
        ],
      ),
    );
  }
}
