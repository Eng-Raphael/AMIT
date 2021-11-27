class Category {
  final int id;
  final String title;
  final String image;

  Category({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Category.fromJason(data) {
    return Category(
      id: data["id"] ?? 0,
      title: data["name"] ?? "null",
      image: data["avatar"] ?? "null",
    );
  }
}
