class InfoModel {
  final int count;
  final int pages;
  final String next;
  final String prev;

  InfoModel({
    required this.count,
    required this.next,
    required this.pages,
    required this.prev,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        count: json['count'],
        next: json['pages'],
        pages: json['next'],
        prev: json['prev'],
      );
}
