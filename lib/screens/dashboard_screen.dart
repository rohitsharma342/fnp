import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../config/routes.dart';
import '../config/romantic_colors.dart';
import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../data/static_data.dart';
import '../widgets/product_card.dart';
import '../widgets/category_tab.dart';
import '../widgets/trending_carousel.dart';
import '../widgets/filter_modal.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/romantic_background.dart';
import '../widgets/romantic_app_bar.dart';
import '../widgets/floating_hearts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  int _currentNavIndex = 0;
  late AnimationController _heartController;
  final GlobalKey<FloatingHeartsState> _floatingHeartsKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _heartController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _heartController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    if (index == _currentNavIndex) return;
    
    switch (index) {
      case 0:
        setState(() => _currentNavIndex = 0);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.cart);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.profile);
        break;
    }
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterModal(),
    );
  }

  void _onHeartTap() {
    _floatingHeartsKey.currentState?.startHeartAnimation();
    _heartController.forward().then((_) {
      _heartController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RomanticBackground(
        showFloatingHearts: false,
        showShimmer: true,
        child: Stack(
          children: [
            SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: _buildRomanticHeader(),
                  ),
                  SliverToBoxAdapter(
                    child: _buildSearchBar(),
                  ),
                  SliverToBoxAdapter(
                    child: _buildCategoryTabs(),
                  ),
                  SliverToBoxAdapter(
                    child: _buildTrendingSection(),
                  ),
                  SliverToBoxAdapter(
                    child: _buildProductsHeader(),
                  ),
                  _buildProductGrid(),
                ],
              ),
            ),
            FloatingHearts(
              key: _floatingHeartsKey,
              heartCount: 6,
              autoStart: false,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cart, _) {
          return CustomBottomNav(
            currentIndex: _currentNavIndex,
            onTap: _onNavTap,
            cartItemCount: cart.totalQuantity,
          );
        },
      ),
    );
  }

  Widget _buildRomanticHeader() {
    final unreadCount = StaticData.getUnreadNotificationCount();
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: RomanticColors.sunsetGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hello, Sarah! ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: RomanticColors.dustyRose,
                      ),
                    ),
                    GestureDetector(
                      onTap: _onHeartTap,
                      child: AnimatedBuilder(
                        animation: _heartController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: 1.0 + (_heartController.value * 0.3),
                            child: Icon(
                              Icons.favorite,
                              color: RomanticColors.romanticRed,
                              size: 28,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'Find the perfect gift for your loved ones',
                  style: TextStyle(
                    fontSize: 15,
                    color: RomanticColors.dustyRose.withOpacity(0.8),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.favorites);
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: RomanticColors.romanticRed,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.notifications);
                      },
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: RomanticColors.dustyRose,
                        size: 24,
                      ),
                    ),
                  ),
                  if (unreadCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: RomanticColors.romanticRed,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: RomanticColors.romanticRed.withOpacity(0.3),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Text(
                          unreadCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, RomanticColors.warmCream.withOpacity(0.5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: RomanticColors.roseGold.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(
                  color: RomanticColors.blushPink.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  context.read<ProductProvider>().setSearchQuery(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search flowers, gifts, love notes...',
                  hintStyle: TextStyle(
                    color: RomanticColors.dustyRose.withOpacity(0.6),
                    fontStyle: FontStyle.italic,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: RomanticColors.dustyRose,
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: RomanticColors.dustyRose,
                          ),
                          onPressed: () {
                            _searchController.clear();
                            context.read<ProductProvider>().setSearchQuery('');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Consumer<ProductProvider>(
            builder: (context, provider, _) {
              return GestureDetector(
                onTap: _showFilterModal,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: provider.hasActiveFilters
                        ? RomanticColors.heartGradient
                        : LinearGradient(
                            colors: [Colors.white, RomanticColors.warmCream.withOpacity(0.5)],
                          ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: provider.hasActiveFilters
                            ? RomanticColors.softCoral.withOpacity(0.3)
                            : RomanticColors.roseGold.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: RomanticColors.blushPink.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.tune,
                    color: provider.hasActiveFilters
                        ? Colors.white
                        : RomanticColors.dustyRose,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Consumer<ProductProvider>(
      builder: (context, provider, _) {
        return Container(
          height: 50,
          margin: const EdgeInsets.only(top: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: StaticData.categories.length,
            itemBuilder: (context, index) {
              final category = StaticData.categories[index];
              final isSelected = provider.selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () => provider.setCategory(category),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? RomanticColors.heartGradient
                          : LinearGradient(
                              colors: [Colors.white, RomanticColors.softPeach.withOpacity(0.3)],
                            ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: isSelected
                              ? RomanticColors.softCoral.withOpacity(0.3)
                              : RomanticColors.roseGold.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: isSelected
                            ? Colors.transparent
                            : RomanticColors.blushPink.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.white : RomanticColors.dustyRose,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTrendingSection() {
    return Consumer<ProductProvider>(
      builder: (context, provider, _) {
        if (provider.searchQuery.isNotEmpty) return const SizedBox.shrink();
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: RomanticColors.heartGradient,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: RomanticColors.softCoral.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.local_fire_department,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Trending in Love',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: RomanticColors.dustyRose,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TrendingCarousel(products: provider.trendingProducts),
          ],
        );
      },
    );
  }

  Widget _buildProductsHeader() {
    return Consumer<ProductProvider>(
      builder: (context, provider, _) {
        final productCount = provider.filteredProducts.length;
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                provider.searchQuery.isNotEmpty
                    ? 'Love Matches ($productCount)'
                    : provider.selectedCategory == 'All'
                        ? 'All Gifts ($productCount)'
                        : '${provider.selectedCategory} ($productCount)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: RomanticColors.dustyRose,
                ),
              ),
              if (provider.hasActiveFilters)
                TextButton(
                  onPressed: () => provider.clearFilters(),
                  child: Text(
                    'Clear Filters',
                    style: TextStyle(
                      color: RomanticColors.romanticRed,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProductGrid() {
    return Consumer<ProductProvider>(
      builder: (context, provider, _) {
        final products = provider.filteredProducts;

        if (products.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        gradient: RomanticColors.romanticGradient,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.search_off,
                        size: 60,
                        color: RomanticColors.dustyRose,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No love matches found',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: RomanticColors.dustyRose,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Try searching for something more romantic',
                      style: TextStyle(
                        fontSize: 14,
                        color: RomanticColors.dustyRose.withOpacity(0.7),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 24),
                    OutlinedButton(
                      onPressed: () {
                        _searchController.clear();
                        provider.resetAll();
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: RomanticColors.dustyRose),
                        foregroundColor: RomanticColors.dustyRose,
                      ),
                      child: const Text('Reset Search'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProductCard(product: products[index]);
              },
              childCount: products.length,
            ),
          ),
        );
      },
    );
  }
}