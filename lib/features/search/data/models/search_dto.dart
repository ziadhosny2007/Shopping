
import 'package:shopping/features/search/domain/entities/search_entity.dart';

class SearchItemDto {
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

  SearchItemDto({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.images,
    this.thumbnail,
  });

  factory SearchItemDto.fromJson(Map<String, dynamic> json) {
    return SearchItemDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title']?.toString(),
      description: json['description']?.toString(),
      category: json['category']?.toString(),
      price: (json['price'] as num?)?.toDouble(),
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt(),
      brand: json['brand']?.toString(),
      images: (json['images'] as List?)
          ?.map((e) => e.toString())
          .toList(),
      thumbnail: json['thumbnail']?.toString(),
    );
  }

  SearchItemEntity toEntity() {
    return SearchItemEntity(
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
