import 'package:hive/hive.dart';

part 'jenis_kopi.g.dart';

@HiveType(typeId: 0)
class JenisKopi extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final int? internalId;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final double? price;

  @HiveField(5)
  final String? region;

  @HiveField(6)
  final int? weight;

  @HiveField(7)
  final List<String>? flavorProfile;

  @HiveField(8)
  final List<String>? grindOption;

  @HiveField(9)
  final int? roastLevel;

  @HiveField(10)
  final String? imageUrl;

  JenisKopi({
    this.id,
    this.internalId,
    this.name,
    this.description,
    this.price,
    this.region,
    this.weight,
    this.flavorProfile,
    this.grindOption,
    this.roastLevel,
    this.imageUrl,
  });

  factory JenisKopi.fromJson(Map<String, dynamic> json) {
    return JenisKopi(
      id: json['_id'] as String?,
      internalId: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as double?,
      region: json['region'] as String?,
      weight: json['weight'] as int?,
      flavorProfile: (json['flavor_profile'] as List?)?.map((dynamic e) => e as String).toList(),
      grindOption: (json['grind_option'] as List?)?.map((dynamic e) => e as String).toList(),
      roastLevel: json['roast_level'] as int?,
      imageUrl: json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'id': internalId,
      'name': name,
      'description': description,
      'price': price,
      'region': region,
      'weight': weight,
      'flavor_profile': flavorProfile,
      'grind_option': grindOption,
      'roast_level': roastLevel,
      'image_url': imageUrl,
    };
  }
}
