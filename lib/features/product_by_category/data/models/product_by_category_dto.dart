import 'package:shopping/features/product_by_category/domain/entities/product_by_category_entity.dart';

class ProductByCategoryDto {
  List<ItemsDto>? list;
  int? total;
  int? skip;
  int? limit;

  ProductByCategoryDto({this.list, this.total, this.skip, this.limit});

  ProductByCategoryDto.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ItemsDto>[];
      json['list'].forEach((v) {
        list!.add(ItemsDto.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  ProductByCategoryEntity toEntity() {
    return ProductByCategoryEntity(
      limit: limit ?? 0,
      list: list?.map((item) => item.toEntity()).toList() ?? [],
      skip: skip ?? 0,
      total: total ?? 0,
    );
  }
}

class ItemsDto {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  String? returnPolicy;
  int? minimumOrderQuantity;
  List<String>? images;
  String? thumbnail;

  ItemsDto({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.images,
    this.thumbnail,
  });

  ItemsDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'].cast<String>();
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];

    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];

    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
  }
  ItemsEntity toEntity() {
    return ItemsEntity(
      category: category ?? "",
      description: description ?? "",
      discountPercentage: discountPercentage ?? 0,
      id: id ?? 0,
      images: images ?? [],
      price: price ?? 0,
      rating: rating ?? 0,
      title: title ?? "",
    );
  }
}
