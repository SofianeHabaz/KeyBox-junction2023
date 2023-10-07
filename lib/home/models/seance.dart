class Seance {
  String id;
  String title;
  String description;
  DateTime date;
  String duree;

  Seance({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.duree,
  });

  Seance copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    String? duree,
  }) =>
      Seance(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        duree: duree ?? this.duree,
      );
  factory Seance.fromJson(Map<String, dynamic> json) => Seance(
        id: json['_id'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
        duree: json['duree'],
      );
  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'description': description,
        'date': date,
        'duree': duree,
      };
}
