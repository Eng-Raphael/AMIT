class Product {
  final int id;
  final String name;
  final String title;
  final String image;
  final String description;
  final int cateid;
  final int price;

  Product({
    required this.id,
    required this.name,
    required this.title,
    required this.image,
    required this.description,
    required this.cateid,
    required this.price,
  });

  factory Product.fromJason(data) {
    return Product(
      id: data["id"] ?? 0,
      name: data["name"] ?? "null",
      title: data["title"] ?? "null",
      image: data["avatar"] ?? "null",
      description: data["description"] ?? "null",
      cateid: data["category_id"] ?? 0,
      price: int.parse(data["price"].toString()),
    );
  }
}
