import 'package:shopping/features/home/domain/entities/categories_response_entity.dart';

class CategoriesItemResponseDto {
  String? slug;
  String? name;
  String? url;
  String? image;

  CategoriesItemResponseDto({this.slug, this.name, this.url, this.image});

  CategoriesItemResponseDto.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
    image = json['image'];
  }

  CategoriesItemResponseEntity toEntity() {
    return CategoriesItemResponseEntity(name: name ?? "", slug: slug ?? "");
  }
}
