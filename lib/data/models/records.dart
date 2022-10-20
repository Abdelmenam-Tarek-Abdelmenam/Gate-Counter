// ignore_for_file: constant_identifier_names

const ITEMS_JSON = "items";
const DATE_JSON = "date";
const MATERIAL_ID_JSON = "materialId";
const QUANTITY_JSON = "quantity";

class Record {
  List<RecordItem> items;
  String date;
  Record({
    required this.items,
    required this.date,
  });

  factory Record.fromJson(Map<String, dynamic> jsonData) {
    return Record(
        items: jsonData[ITEMS_JSON].map((e) => RecordItem.fromJson(e)),
        date: jsonData[DATE_JSON]);
  }
}

class RecordItem {
  String materialId;
  int quantity;

  RecordItem(this.materialId, this.quantity);

  factory RecordItem.fromJson(Map<String, dynamic> jsonData) {
    return RecordItem(jsonData[MATERIAL_ID_JSON], jsonData[QUANTITY_JSON]);
  }
}
