import 'package:shopping/features/product_details/domain/entities/product_details_entity.dart';

class ProductDetailsDto {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;

  List<String>? images;

  ProductDetailsDto({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,

    this.images,
  });

  ProductDetailsDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];

    images = json['images'].cast<String>();
  }

  ProductDetailsEntity toEntity() {
    return ProductDetailsEntity(
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
