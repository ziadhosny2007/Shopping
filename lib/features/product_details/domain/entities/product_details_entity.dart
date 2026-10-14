class ProductDetailsEntity {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;

  List<String> images;

  ProductDetailsEntity({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.category = "",
    this.price = 0,
    this.discountPercentage = 0,
    this.rating = 0,

    this.images = const [],
  });
}
