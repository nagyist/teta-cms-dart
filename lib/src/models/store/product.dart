/// Product model
class TetaProduct {
  /// Product model
  TetaProduct({
    required this.id,
    required this.name,
    required this.prjId,
    this.price = 0.0,
    this.count = 0,
    this.isPublic = false,
    this.description,
    this.image,
    this.metadata,
  });

  /// Product id
  final String id;

  /// Product id
  final int prjId;

  /// Product name
  final String name;

  /// Product description
  final String? description;

  /// Product price
  final num price;

  /// Product count
  final num count;

  /// Product image
  final String? image;

  /// Is the product public?
  final bool isPublic;

  /// Product metadata
  final Map<String, dynamic>? metadata;

  /// Generate a model from a json schema
  static TetaProduct fromSchema(final Map<String, dynamic> json) => TetaProduct(
        id: json['_id'] as String? ?? '',
        prjId: json['prj_id'] as int? ?? 0,
        name: json['name'] as String? ?? '',
        price: double.tryParse(json['price'] as String? ?? '0') ?? 0,
        count: int.tryParse(json['count'] as String? ?? '0') ?? 0,
        isPublic: (json['isPublic'] as String? ?? 'false').toLowerCase() == 'true',
        description: json['description'] as String? ?? '',
        image: json['image'] as String? ?? '',
        metadata: <String, dynamic>{},
      );

  /// Generate a json from the model
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'description': description,
        'price': price,
        'count': count,
        'isPublic': isPublic,
        'image': image,
        'metadata': metadata,
      };
}
