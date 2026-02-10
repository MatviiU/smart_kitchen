import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/core/theme/build_context_extension.dart';
import 'package:smart_kitchen/domain/entities/ingredient_entity.dart';
import 'package:smart_kitchen/domain/entities/recipe_entity.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipe_detail_cubit.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipe_detail_state.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/favorite_icon.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
        actions: [
          BlocBuilder<RecipeDetailCubit, RecipeDetailState>(
            builder: (context, state) {
              if (state is! RecipeDetailLoaded) {
                return const SizedBox.shrink();
              }

              return IconButton(
                onPressed: () =>
                    context.read<RecipeDetailCubit>().toggleFavorite(),
                icon: FavoriteIcon(
                  variant: state.isFavorite
                      ? FavoriteIconVariant.filledPrimary
                      : FavoriteIconVariant.outline,
                  color: context.colors.primary,
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<RecipeDetailCubit, RecipeDetailState>(
        builder: (context, state) {
          return switch (state) {
            RecipeDetailInitial() || RecipeDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            RecipeDetailLoaded(
              recipe: final recipe,
              isFavorite: final isFavorite,
            ) =>
              _RecipeDetailsBody(recipe: recipe, isFavorite: isFavorite),
            RecipeDetailError() => Center(child: Text(state.message)),
          };
        },
      ),
    );
  }
}

class _RecipeDetailsBody extends StatelessWidget {
  const _RecipeDetailsBody({required this.recipe, required this.isFavorite});

  final RecipeEntity recipe;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RecipeImage(imageUrl: recipe.imageUrl),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              recipe.title,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _MetaChip(
                  icon: Icons.schedule,
                  label: '${recipe.readyInMinutes} min',
                ),
                _MetaChip(
                  icon: Icons.people_alt_outlined,
                  label: '${recipe.servings} servings',
                ),
                _MetaChip(
                  icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                  label: isFavorite ? 'Favorite' : 'Not favorite',
                ),
              ],
            ),
          ),
          if (recipe.summary.trim().isNotEmpty)
            _Section(
              title: 'Summary',
              child: Text(
                _stripHtml(recipe.summary),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ),
          _Section(
            title: 'Ingredients',
            child: _IngredientsList(ingredients: recipe.ingredients),
          ),
          _Section(
            title: 'Instructions',
            child: _InstructionsList(
              instructions: recipe.instructions,
              steps: recipe.steps,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecipeImage extends StatelessWidget {
  const _RecipeImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final hasValidUrl = imageUrl.trim().startsWith('http');
    if (!hasValidUrl) {
      return Container(
        height: 240,
        width: double.infinity,
        color: context.colors.surfaceContainerHigh,
        alignment: Alignment.center,
        child: Icon(
          Icons.restaurant_menu_outlined,
          size: 56,
          color: context.colors.onSurfaceVariant,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: context.colors.surfaceContainerHigh,
            alignment: Alignment.center,
            child: Icon(
              Icons.broken_image_outlined,
              size: 48,
              color: context.colors.onSurfaceVariant,
            ),
          );
        },
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: context.colors.onSurfaceVariant),
          const SizedBox(width: 6),
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _IngredientsList extends StatelessWidget {
  const _IngredientsList({required this.ingredients});

  final List<IngredientEntity> ingredients;

  @override
  Widget build(BuildContext context) {
    if (ingredients.isEmpty) {
      return Text(
        'No ingredients available.',
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colors.onSurfaceVariant,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredients.map((ingredient) {
        final amountText = ingredient.amount > 0 ? '${ingredient.amount} ' : '';
        final unitText = ingredient.unit.isNotEmpty
            ? '${ingredient.unit} '
            : '';
        final prefix = '$amountText$unitText'.trim();
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Icon(
                  Icons.circle,
                  size: 7,
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  prefix.isEmpty
                      ? ingredient.name
                      : '$prefix${ingredient.name}',
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _InstructionsList extends StatelessWidget {
  const _InstructionsList({required this.instructions, required this.steps});

  final String instructions;
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    if (steps.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(steps.length, (index) {
          final step = steps[index].trim();
          if (step.isEmpty) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colors.primary.withValues(alpha: 0.16),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${index + 1}',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(step, style: context.textTheme.bodyMedium),
                ),
              ],
            ),
          );
        }),
      );
    }

    final plainInstructions = _stripHtml(instructions).trim();
    return Text(
      plainInstructions.isEmpty
          ? 'No instructions available.'
          : plainInstructions,
      style: context.textTheme.bodyMedium?.copyWith(
        color: context.colors.onSurfaceVariant,
      ),
    );
  }
}

String _stripHtml(String htmlText) {
  return htmlText
      .replaceAll(RegExp('<[^>]*>'), ' ')
      .replaceAll(RegExp('&nbsp;'), ' ')
      .replaceAll(RegExp('\\s+'), ' ')
      .trim();
}
