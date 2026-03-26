import '../models/product_model.dart';
import '../models/user_model.dart';
import '../models/address_model.dart';
import '../models/order_model.dart';
import '../models/cart_item_model.dart';

class StaticData {
  static List<String> categories = [
    'All',
    'Flowers',
    'Cakes',
    'Gifts',
    'Plants',
    'Combos',
  ];

  static List<String> occasions = [
    'Birthday',
    'Anniversary',
    'Valentine\'s Day',
    'Mother\'s Day',
    'Wedding',
    'Congratulations',
    'Get Well Soon',
    'Thank You',
  ];

  static List<Product> products = [
    Product(
      id: '1',
      name: 'Red Rose Bouquet',
      description: 'A stunning bouquet of 12 fresh red roses, symbolizing love and passion. Perfect for romantic occasions, anniversaries, or to simply express your deepest feelings. Each rose is carefully selected for its beauty and freshness.',
      price: 49.99,
      originalPrice: 59.99,
      images: [
        'https://images.unsplash.com/photo-1518621736915-f3b1c41bfd00?w=800',
        'https://images.unsplash.com/photo-1455659817273-f96807779a8a?w=800',
        'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=800',
      ],
      category: 'Flowers',
      occasions: ['Valentine\'s Day', 'Anniversary', 'Birthday'],
      rating: 4.8,
      reviewCount: 256,
      isTrending: true,
      isBestSeller: true,
    ),
    Product(
      id: '2',
      name: 'Mixed Flower Arrangement',
      description: 'A vibrant arrangement featuring a beautiful mix of seasonal flowers including lilies, carnations, and chrysanthemums. This colorful display brings joy and brightness to any room.',
      price: 65.00,
      originalPrice: 75.00,
      images: [
        'https://images.unsplash.com/photo-1487530811176-3780de880c2d?w=800',
        'https://images.unsplash.com/photo-1508610048659-a06b669e3321?w=800',
      ],
      category: 'Flowers',
      occasions: ['Birthday', 'Congratulations', 'Thank You'],
      rating: 4.6,
      reviewCount: 189,
      isTrending: true,
    ),
    Product(
      id: '3',
      name: 'Chocolate Truffle Cake',
      description: 'Indulge in layers of rich chocolate sponge, velvety chocolate ganache, and luxurious truffle cream. This decadent cake is a chocolate lover\'s dream come true.',
      price: 45.00,
      images: [
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=800',
        'https://images.unsplash.com/photo-1606890737304-57a1ca8a5b62?w=800',
      ],
      category: 'Cakes',
      occasions: ['Birthday', 'Anniversary', 'Congratulations'],
      rating: 4.9,
      reviewCount: 342,
      isBestSeller: true,
    ),
    Product(
      id: '4',
      name: 'Premium Gift Hamper',
      description: 'A luxurious gift hamper containing gourmet chocolates, premium cookies, aromatic candles, and a personalized greeting card. Perfect for making any occasion special.',
      price: 89.99,
      originalPrice: 110.00,
      images: [
        'https://images.unsplash.com/photo-1549465220-1a8b9238cd48?w=800',
        'https://images.unsplash.com/photo-1513885535751-8b9238bd345a?w=800',
      ],
      category: 'Gifts',
      occasions: ['Birthday', 'Thank You', 'Congratulations'],
      rating: 4.7,
      reviewCount: 178,
      isTrending: true,
    ),
    Product(
      id: '5',
      name: 'Peace Lily Plant',
      description: 'An elegant Peace Lily in a decorative ceramic pot. Known for its air-purifying qualities and beautiful white blooms, it makes a thoughtful and lasting gift.',
      price: 35.00,
      images: [
        'https://images.unsplash.com/photo-1593691509543-c55fb32d8de5?w=800',
        'https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?w=800',
      ],
      category: 'Plants',
      occasions: ['Get Well Soon', 'Thank You', 'Congratulations'],
      rating: 4.5,
      reviewCount: 124,
    ),
    Product(
      id: '6',
      name: 'Sunflower Delight',
      description: 'Brighten someone\'s day with this cheerful arrangement of fresh sunflowers. These radiant blooms symbolize happiness, optimism, and warmth.',
      price: 42.00,
      images: [
        'https://images.unsplash.com/photo-1597848212624-a19eb35e2651?w=800',
        'https://images.unsplash.com/photo-1551731409-43eb3e517a1a?w=800',
      ],
      category: 'Flowers',
      occasions: ['Birthday', 'Get Well Soon', 'Thank You'],
      rating: 4.6,
      reviewCount: 156,
    ),
    Product(
      id: '7',
      name: 'Red Velvet Cake',
      description: 'A classic Red Velvet cake with cream cheese frosting. Its distinctive red color and smooth, velvety texture make it a showstopper for any celebration.',
      price: 52.00,
      originalPrice: 60.00,
      images: [
        'https://images.unsplash.com/photo-1616541823729-00fe0aacd32c?w=800',
        'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=800',
      ],
      category: 'Cakes',
      occasions: ['Birthday', 'Anniversary', 'Valentine\'s Day'],
      rating: 4.8,
      reviewCount: 287,
      isTrending: true,
    ),
    Product(
      id: '8',
      name: 'Teddy Bear & Chocolates',
      description: 'A cuddly teddy bear paired with premium assorted chocolates. This adorable combo is perfect for expressing love and affection.',
      price: 55.00,
      images: [
        'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
        'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800',
      ],
      category: 'Combos',
      occasions: ['Valentine\'s Day', 'Birthday', 'Anniversary'],
      rating: 4.7,
      reviewCount: 198,
      isBestSeller: true,
    ),
    Product(
      id: '9',
      name: 'Orchid Elegance',
      description: 'A sophisticated arrangement of exotic orchids in a premium vase. These elegant blooms represent luxury, beauty, and refinement.',
      price: 78.00,
      originalPrice: 95.00,
      images: [
        'https://images.unsplash.com/photo-1566873535350-a3f5d4a804b7?w=800',
        'https://images.unsplash.com/photo-1612722432474-b971cdcea546?w=800',
      ],
      category: 'Flowers',
      occasions: ['Anniversary', 'Congratulations', 'Thank You'],
      rating: 4.9,
      reviewCount: 145,
    ),
    Product(
      id: '10',
      name: 'Fruit & Nut Cake',
      description: 'A rich fruit cake loaded with dried fruits, nuts, and a hint of rum flavor. Perfect for those who appreciate traditional baking.',
      price: 48.00,
      images: [
        'https://images.unsplash.com/photo-1621303837174-89787a7d4729?w=800',
        'https://images.unsplash.com/photo-1562440499-64c9a111f713?w=800',
      ],
      category: 'Cakes',
      occasions: ['Wedding', 'Anniversary', 'Congratulations'],
      rating: 4.5,
      reviewCount: 112,
    ),
    Product(
      id: '11',
      name: 'Succulent Garden',
      description: 'A charming arrangement of assorted succulents in a wooden planter. Low maintenance and long-lasting, perfect for any home or office.',
      price: 38.00,
      images: [
        'https://images.unsplash.com/photo-1509423350716-97f9360b4e09?w=800',
        'https://images.unsplash.com/photo-1485955900006-10f4d324d411?w=800',
      ],
      category: 'Plants',
      occasions: ['Thank You', 'Congratulations', 'Get Well Soon'],
      rating: 4.6,
      reviewCount: 167,
    ),
    Product(
      id: '12',
      name: 'Luxury Spa Gift Set',
      description: 'Pamper your loved one with this luxurious spa set including bath bombs, scented candles, body lotion, and a soft bathrobe.',
      price: 120.00,
      originalPrice: 150.00,
      images: [
        'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800',
        'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=800',
      ],
      category: 'Gifts',
      occasions: ['Birthday', 'Mother\'s Day', 'Thank You'],
      rating: 4.8,
      reviewCount: 89,
      isTrending: true,
    ),
    Product(
      id: '13',
      name: 'Pink Tulip Bouquet',
      description: 'A delicate bouquet of fresh pink tulips representing grace and elegance. These spring favorites are perfect for expressing gentle love.',
      price: 55.00,
      images: [
        'https://images.unsplash.com/photo-1520763185298-1b434c919102?w=800',
        'https://images.unsplash.com/photo-1518621736915-f3b1c41bfd00?w=800',
      ],
      category: 'Flowers',
      occasions: ['Mother\'s Day', 'Birthday', 'Thank You'],
      rating: 4.7,
      reviewCount: 134,
    ),
    Product(
      id: '14',
      name: 'Flowers & Cake Combo',
      description: 'The perfect celebration combo featuring a beautiful flower arrangement and a delicious chocolate cake. Everything you need to make their day special.',
      price: 85.00,
      originalPrice: 100.00,
      images: [
        'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=800',
        'https://images.unsplash.com/photo-1464349095431-e9a21285b5f3?w=800',
      ],
      category: 'Combos',
      occasions: ['Birthday', 'Anniversary', 'Congratulations'],
      rating: 4.9,
      reviewCount: 276,
      isBestSeller: true,
      isTrending: true,
    ),
    Product(
      id: '15',
      name: 'Personalized Photo Frame',
      description: 'A beautiful wooden photo frame with custom engraving. Upload your favorite photo and add a personal message to create a unique keepsake.',
      price: 32.00,
      images: [
        'https://images.unsplash.com/photo-1544967082-d9d25d867d66?w=800',
        'https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?w=800',
      ],
      category: 'Gifts',
      occasions: ['Birthday', 'Anniversary', 'Wedding'],
      rating: 4.4,
      reviewCount: 98,
    ),
    Product(
      id: '16',
      name: 'White Lily Arrangement',
      description: 'An elegant arrangement of pristine white lilies symbolizing purity and sympathy. Perfect for expressing condolences or celebrating new beginnings.',
      price: 58.00,
      images: [
        'https://images.unsplash.com/photo-1460039230329-eb070fc6c77c?w=800',
        'https://images.unsplash.com/photo-1468327768560-75b778cbb551?w=800',
      ],
      category: 'Flowers',
      occasions: ['Wedding', 'Get Well Soon', 'Thank You'],
      rating: 4.7,
      reviewCount: 143,
      isInStock: false,
    ),
  ];

  static User currentUser = User(
    id: 'user_001',
    name: 'Sarah Johnson',
    email: 'sarah.johnson@email.com',
    phone: '+1 234 567 8900',
    profileImage: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
    addresses: [
      Address(
        id: 'addr_001',
        label: 'Home',
        fullName: 'Sarah Johnson',
        phone: '+1 234 567 8900',
        addressLine1: '123 Maple Street',
        addressLine2: 'Apt 4B',
        city: 'New York',
        state: 'NY',
        pincode: '10001',
        isDefault: true,
      ),
      Address(
        id: 'addr_002',
        label: 'Office',
        fullName: 'Sarah Johnson',
        phone: '+1 234 567 8901',
        addressLine1: '456 Business Ave',
        addressLine2: 'Floor 12',
        city: 'New York',
        state: 'NY',
        pincode: '10002',
      ),
    ],
  );

  static List<Order> orders = [
    Order(
      id: 'ORD_001',
      items: [
        CartItem(product: products[0], quantity: 1),
        CartItem(product: products[2], quantity: 1),
      ],
      deliveryAddress: currentUser.addresses[0],
      subtotal: 94.99,
      deliveryFee: 5.99,
      total: 100.98,
      status: OrderStatus.delivered,
      orderDate: DateTime.now().subtract(const Duration(days: 15)),
      deliveryDate: DateTime.now().subtract(const Duration(days: 13)),
      paymentMethod: 'Credit Card',
    ),
    Order(
      id: 'ORD_002',
      items: [
        CartItem(product: products[3], quantity: 1),
      ],
      deliveryAddress: currentUser.addresses[1],
      subtotal: 89.99,
      deliveryFee: 5.99,
      total: 95.98,
      status: OrderStatus.shipped,
      orderDate: DateTime.now().subtract(const Duration(days: 3)),
      paymentMethod: 'PayPal',
    ),
    Order(
      id: 'ORD_003',
      items: [
        CartItem(product: products[7], quantity: 2),
        CartItem(product: products[4], quantity: 1),
      ],
      deliveryAddress: currentUser.addresses[0],
      subtotal: 145.00,
      deliveryFee: 0.00,
      total: 145.00,
      status: OrderStatus.processing,
      orderDate: DateTime.now().subtract(const Duration(days: 1)),
      paymentMethod: 'Credit Card',
    ),
  ];

  static List<Map<String, dynamic>> notifications = [
    {
      'id': '1',
      'title': 'Order Shipped!',
      'message': 'Your order #ORD_002 has been shipped and is on its way.',
      'time': DateTime.now().subtract(const Duration(hours: 2)),
      'isRead': false,
      'type': 'order',
    },
    {
      'id': '2',
      'title': 'Special Offer!',
      'message': 'Get 20% off on all flower arrangements this weekend!',
      'time': DateTime.now().subtract(const Duration(hours: 5)),
      'isRead': false,
      'type': 'promo',
    },
    {
      'id': '3',
      'title': 'Order Delivered',
      'message': 'Your order #ORD_001 has been delivered successfully.',
      'time': DateTime.now().subtract(const Duration(days: 13)),
      'isRead': true,
      'type': 'order',
    },
    {
      'id': '4',
      'title': 'Valentine\'s Day Sale',
      'message': 'Don\'t miss our Valentine\'s Day collection. Order now!',
      'time': DateTime.now().subtract(const Duration(days: 2)),
      'isRead': true,
      'type': 'promo',
    },
  ];

  static List<Product> getTrendingProducts() {
    return products.where((p) => p.isTrending).toList();
  }

  static List<Product> getBestSellers() {
    return products.where((p) => p.isBestSeller).toList();
  }

  static List<Product> getProductsByCategory(String category) {
    if (category == 'All') return products;
    return products.where((p) => p.category == category).toList();
  }

  static List<Product> searchProducts(String query) {
    final lowercaseQuery = query.toLowerCase();
    return products.where((p) {
      return p.name.toLowerCase().contains(lowercaseQuery) ||
          p.description.toLowerCase().contains(lowercaseQuery) ||
          p.category.toLowerCase().contains(lowercaseQuery) ||
          p.occasions.any((o) => o.toLowerCase().contains(lowercaseQuery));
    }).toList();
  }

  static int getUnreadNotificationCount() {
    return notifications.where((n) => n['isRead'] == false).length;
  }
}