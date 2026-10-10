import 'package:shopping/features/home/domain/entities/item_entity.dart';

class ItemDto {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  List<String>? images;
  String? thumbnail;

  ItemDto({
    this.id,
    this.title,
    this.description,
    this.category,
    this.discountPercentage,
    this.price,
    this.rating,
    this.stock,
    this.brand,
    this.images,
    this.thumbnail,
  });

  factory ItemDto.fromJson(Map<String, dynamic> json) {
    return ItemDto(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num?)?.toDouble(),
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      images: (json['images'] as List?)
          ?.map((e) => e.toString())
          .toList(),
      thumbnail: json['thumbnail'],
    );
  }

  ItemEntity toEntity() {
    return ItemEntity(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      price: price ?? 0.0,
      discountPercentage: discountPercentage ?? 0.0,
      rating: rating ?? 0.0,
      images: images ?? [],
    );
  }
}