class ProductItemEntity {
  int id;
  String title;
  String description;
  double price;
  double discountPercentage;
  double rating;
  List<String> images;

  ProductItemEntity({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.price = 0,
    this.discountPercentage = 0,
    this.rating = 0,
    this.images = const [],
  });
}
