class TrainingModel {
  int? id;
  String? name;

  TrainingModel(this.id, this.name);

  TrainingModel.fromJson(Map<String, Object?> map) {
    id = map['id'] as int;
    name = map['nome'] as String;
  }
}
