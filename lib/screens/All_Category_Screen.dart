import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _animationController;
  String _searchQuery = '';
  bool _isGridView = true;

  // 🔮 Excelerate Gradient Theme Colors
  final LinearGradient excelerateGradient = const LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF3A8DFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  final List<Category> categories = [
    Category(
      name: '3D Design',
      icon: Icons.view_in_ar_rounded,
      color: const Color(0xFF6C63FF),
      gradient: const LinearGradient(
        colors: [Color(0xFF8C82FF), Color(0xFF6C63FF)],
      ),
      coursesCount: 45,
    ),
    Category(
      name: 'Graphic Design',
      icon: Icons.palette_rounded,
      color: const Color(0xFF3A8DFF),
      gradient: const LinearGradient(
        colors: [Color(0xFF5EA3FF), Color(0xFF3A8DFF)],
      ),
      coursesCount: 78,
    ),
    Category(
      name: 'Web Development',
      icon: Icons.code_rounded,
      color: const Color(0xFF6C63FF),
      gradient: const LinearGradient(
        colors: [Color(0xFF8C82FF), Color(0xFF6C63FF)],
      ),
      coursesCount: 125,
    ),
    Category(
      name: 'SEO & Marketing',
      icon: Icons.trending_up_rounded,
      color: const Color(0xFF3A8DFF),
      gradient: const LinearGradient(
        colors: [Color(0xFF5EA3FF), Color(0xFF3A8DFF)],
      ),
      coursesCount: 56,
    ),
    Category(
      name: 'Finance & Accounting',
      icon: Icons.account_balance_rounded,
      color: const Color(0xFF6C63FF),
      gradient: const LinearGradient(
        colors: [Color(0xFF8C82FF), Color(0xFF6C63FF)],
      ),
      coursesCount: 89,
    ),
    Category(
      name: 'Personal Development',
      icon: Icons.psychology_rounded,
      color: const Color(0xFF3A8DFF),
      gradient: const LinearGradient(
        colors: [Color(0xFF5EA3FF), Color(0xFF3A8DFF)],
      ),
      coursesCount: 62,
    ),
    Category(
      name: 'Office Productivity',
      icon: Icons.settings_rounded,
      color: const Color(0xFF6C63FF),
      gradient: const LinearGradient(
        colors: [Color(0xFF8C82FF), Color(0xFF6C63FF)],
      ),
      coursesCount: 41,
    ),
    Category(
      name: 'HR Management',
      icon: Icons.people_rounded,
      color: const Color(0xFF3A8DFF),
      gradient: const LinearGradient(
        colors: [Color(0xFF5EA3FF), Color(0xFF3A8DFF)],
      ),
      coursesCount: 33,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  List<Category> get filteredCategories {
    if (_searchQuery.isEmpty) return categories;
    return categories
        .where((c) =>
        c.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F4FF), // soft lavender background
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: excelerateGradient),
        ),
        title: const Text(
          'All Categories',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.white, size: 20),
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isGridView ? Icons.view_list_rounded : Icons.grid_view_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() => _isGridView = !_isGridView);
              HapticFeedback.lightImpact();
            },
          ),
          const SizedBox(width: 8),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        children: [
          // 🔍 Search Bar
          Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            color: const Color(0xFFF5F4FF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: _searchQuery.isNotEmpty
                          ? const Color(0xFF6C63FF).withOpacity(0.4)
                          : Colors.transparent,
                      width: 1.5,
                    ),
                    boxShadow: [
                      if (_searchQuery.isNotEmpty)
                        BoxShadow(
                          color:
                          const Color(0xFF6C63FF).withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (v) => setState(() => _searchQuery = v),
                    decoration: InputDecoration(
                      hintText: 'Search categories...',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(Icons.search_rounded,
                          color: Colors.grey[400]),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear_rounded,
                            color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                          HapticFeedback.lightImpact();
                        },
                      )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
                if (_searchQuery.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 4),
                    child: Text(
                      '${filteredCategories.length} ${filteredCategories.length == 1 ? 'result' : 'results'} found',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // 🧩 Category Grid / List
          Expanded(
            child: filteredCategories.isEmpty
                ? _buildEmptyState()
                : _isGridView
                ? GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.95,
              ),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) => CategoryCard(
                category: filteredCategories[index],
                delay: index * 50,
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) => CategoryListTile(
                category: filteredCategories[index],
                delay: index * 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: excelerateGradient,
            shape: BoxShape.circle,
          ),
          child:
          const Icon(Icons.search_off_rounded, size: 48, color: Colors.white),
        ),
        const SizedBox(height: 20),
        const Text(
          'No categories found',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF2D3142),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Try searching with different keywords',
          style: TextStyle(fontSize: 14, color: Colors.grey[500]),
        ),
      ],
    ),
  );
}

// ─────────────────────────────────────────────────────────────
// Category model + widgets (unchanged except theme consistency)
// ─────────────────────────────────────────────────────────────

class Category {
  final String name;
  final IconData icon;
  final Color color;
  final Gradient gradient;
  final int coursesCount;

  Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.gradient,
    required this.coursesCount,
  });
}

class CategoryCard extends StatefulWidget {
  final Category category;
  final int delay;

  const CategoryCard({super.key, required this.category, required this.delay});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _scaleAnimation = Tween(begin: 0.8, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _fadeAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _fadeAnimation,
    child: ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {
          HapticFeedback.mediumImpact();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(widget.category.icon, color: Colors.white, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '${widget.category.name} selected',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),
                ],
              ),
              duration: const Duration(milliseconds: 2000),
              behavior: SnackBarBehavior.floating,
              backgroundColor: widget.category.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.all(16),
            ),
          );
        },
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: widget.category.color.withOpacity(0.15),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    gradient: widget.category.gradient,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: widget.category.color.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Icon(widget.category.icon,
                      color: Colors.white, size: 36),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    widget.category.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2D3142),
                      height: 1.3,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${widget.category.coursesCount} courses',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class CategoryListTile extends StatefulWidget {
  final Category category;
  final int delay;

  const CategoryListTile(
      {super.key, required this.category, required this.delay});

  @override
  State<CategoryListTile> createState() => _CategoryListTileState();
}

class _CategoryListTileState extends State<CategoryListTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _slideAnimation =
        Tween(begin: const Offset(0.3, 0), end: Offset.zero).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation =
        Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _fadeAnimation,
    child: SlideTransition(
      position: _slideAnimation,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: widget.category.color.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              HapticFeedback.lightImpact();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(widget.category.icon,
                          color: Colors.white, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '${widget.category.name} selected',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  duration: const Duration(milliseconds: 2000),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: widget.category.color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.all(16),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: widget.category.gradient,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: widget.category.color.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(widget.category.icon,
                        color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.category.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D3142),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${widget.category.coursesCount} courses available',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 16, color: Colors.grey[400]),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
