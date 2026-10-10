class ProductItemEntity {
  int id = 0;
  String title = '';
  String description = '';
  double price=100;
  double discountPercentage = 0;
  double rating = 2;
  List<String> images = [];

  ProductItemEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.images,
  });
}
