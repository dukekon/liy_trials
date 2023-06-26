class RecordModel {
  String name;
  String result;

  RecordModel({required this.name, required this.result});

  RecordModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        result = json['result'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'result': result,
      };

  @override
  String toString() {
    return 'RecordModel{name: $name, result: $result}';
  }
}
