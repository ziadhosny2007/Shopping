class ItemEntity {
  int id;
  String title;
  String description;
  double price;
  double discountPercentage;
  double rating;
  List<String> images;

  ItemEntity({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.price = 100.0,
    this.discountPercentage = 0.0,
    this.rating = 2,
    this.images = const [],
  });
}
