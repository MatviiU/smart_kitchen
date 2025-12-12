import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/filter_selector_view_only.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/icon_holder.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/recipe_card.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/search_bar.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/section_title.dart';

enum FavoriteIconVariant { outline, filledPrimary }

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = _buildTheme(context);

    return Theme(
      data: theme,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
          leading: const IconHolder(icon: Icons.menu),
          centerTitle: true,
          title: const Text(
            'Recipes',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.015,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const CustomSearchBar(),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: FilterSelectorViewOnly(),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SectionTitle(title: 'Smart Suggestions'),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const RecipeCard(
                      title: 'Recipe Title',
                      meta: 'Ingredients | Time',
                      imageUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDZdNLEc2Qxtq42BzI2SH7EutfpUrIGE3_oAOqV5QaDRpyZNKKCcg84XzUj0bkkxW4mzpDnAJC_NY0_oED-pWrR5meTsAEPnnEONJ2XiIKKa2MML5DyOB-98u0aOEpI6tNYFkMc_ftkxlcvpkFsWCNBzOMEfoypn4O5jcYQvdtluCgX9Z-3WIeUV3FIv9Htr7RHXUB0T3uolHnawotO8vYeBrLQZ0fJlgJTc9sbFKk5dHCmx9Bj1fnHkwtgY0BIQY4jg1MZ7YZnuFw',
                      favoriteVariant: FavoriteIconVariant.outline,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ThemeData _buildTheme(BuildContext context) {
    const primary = Color(0xFF13EC13);
    const lightSurface = Color(0xFFF6F8F6);
    const darkSurface = Color(0xFF102210);

    final base = Theme.of(context).brightness == Brightness.dark
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);

    final scheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: base.brightness,
    );

    return base.copyWith(
      colorScheme: scheme.copyWith(
        primary: primary,
        surface: base.brightness == Brightness.dark
            ? darkSurface
            : lightSurface,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(base.textTheme),
      appBarTheme: AppBarTheme(
        foregroundColor: base.brightness == Brightness.dark
            ? Colors.white
            : const Color(0xFF111811),
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: base.brightness == Brightness.dark
              ? Colors.white
              : const Color(0xFF111811),
        ),
        iconTheme: IconThemeData(
          color: base.brightness == Brightness.dark
              ? Colors.white
              : const Color(0xFF111811),
        ),
      ),
      scaffoldBackgroundColor: base.brightness == Brightness.dark
          ? darkSurface
          : lightSurface,
      cardTheme: CardThemeData(
        color: base.brightness == Brightness.dark
            ? Colors.white.withValues(alpha: 0.08)
            : Colors.white,
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
