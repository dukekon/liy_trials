class TrialModel {
  final String name;
  final String image;
  final String description;

  TrialModel(this.name, this.image, this.description);
  TrialModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'description': description,
      };
}