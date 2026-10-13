class ProductByCategoryEntity {
  List<ItemsEntity> list;
  int total;
  int skip;
  int limit;

  ProductByCategoryEntity({
    this.list = const [],
    this.total = 0,
    this.skip = 0,
    this.limit = 0,
  });
}

class ItemsEntity {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;

  List<String> images;

  ItemsEntity({
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
