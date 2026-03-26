import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/theme.dart';
import '../config/routes.dart';
import '../config/romantic_colors.dart';
import '../models/product_model.dart';
import '../providers/favorites_provider.dart';
import '../providers/cart_provider.dart';
import 'romantic_card.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: (_) => _controller.forward(),
            onTapUp: (_) {
              _controller.reverse();
              Navigator.pushNamed(
                context,
                AppRoutes.productDetails,
                arguments: widget.product,
              );
            },
            onTapCancel: () => _controller.reverse(),
            child: RomanticCard(
              showGlow: true,
              showShimmer: false,
              margin: const EdgeInsets.all(4),
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageSection(context),
                  _buildInfoSection(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: CachedNetworkImage(
            imageUrl: widget.product.images.first,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: RomanticColors.romanticGradient,
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: RomanticColors.romanticGradient,
              ),
              child: const Icon(
                Icons.image_not_supported,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Consumer<FavoritesProvider>(
            builder: (context, favorites, _) {
              final isFavorite = favorites.isFavorite(widget.product.id);
              return GestureDetector(
                onTap: () => favorites.toggleFavorite(widget.product.id),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: RomanticColors.roseGold.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 18,
                    color: isFavorite ? RomanticColors.romanticRed : RomanticColors.dustyRose,
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.product.discountPercentage > 0)
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                gradient: RomanticColors.heartGradient,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: RomanticColors.softCoral.withOpacity(0.4),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                '${widget.product.discountPercentage.toInt()}% OFF',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        if (!widget.product.isInStock)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: const Center(
                child: Text(
                  'OUT OF STOCK',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: RomanticColors.dustyRose,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 14,
                  color: RomanticColors.champagne,
                ),
                const SizedBox(width: 4),
                Text(
                  widget.product.rating.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  ' (${widget.product.reviewCount})',
                  style: TextStyle(
                    fontSize: 12,
                    color: RomanticColors.dustyRose.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.product.originalPrice != null)
                      Text(
                        '\$${widget.product.originalPrice!.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: RomanticColors.dustyRose.withOpacity(0.6),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: RomanticColors.romanticRed,
                      ),
                    ),
                  ],
                ),
                Consumer<CartProvider>(
                  builder: (context, cart, _) {
                    final inCart = cart.isInCart(widget.product.id);
                    return GestureDetector(
                      onTap: widget.product.isInStock
                          ? () {
                              if (!inCart) {
                                cart.addToCart(widget.product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: RomanticColors.romanticRed,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text('Added with love'),
                                      ],
                                    ),
                                    duration: const Duration(seconds: 1),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: RomanticColors.dustyRose,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                );
                              }
                            }
                          : null,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: inCart
                              ? LinearGradient(
                                  colors: [RomanticColors.dustyRose, RomanticColors.roseGold],
                                )
                              : RomanticColors.heartGradient,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: (inCart ? RomanticColors.dustyRose : RomanticColors.softCoral)
                                  .withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          inCart ? Icons.check : Icons.add_shopping_cart,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}