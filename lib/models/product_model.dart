class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final List<String> images;
  final String category;
  final List<String> occasions;
  final double rating;
  final int reviewCount;
  final bool isInStock;
  final bool isTrending;
  final bool isBestSeller;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.images,
    required this.category,
    required this.occasions,
    required this.rating,
    required this.reviewCount,
    this.isInStock = true,
    this.isTrending = false,
    this.isBestSeller = false,
  });

  double get discountPercentage {
    if (originalPrice != null && originalPrice! > price) {
      return ((originalPrice! - price) / originalPrice! * 100).roundToDouble();
    }
    return 0;
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? originalPrice,
    List<String>? images,
    String? category,
    List<String>? occasions,
    double? rating,
    int? reviewCount,
    bool? isInStock,
    bool? isTrending,
    bool? isBestSeller,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      images: images ?? this.images,
      category: category ?? this.category,
      occasions: occasions ?? this.occasions,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isInStock: isInStock ?? this.isInStock,
      isTrending: isTrending ?? this.isTrending,
      isBestSeller: isBestSeller ?? this.isBestSeller,
    );
  }
}