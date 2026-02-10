import 'package:drift/drift.dart';
import 'package:smart_kitchen/core/database/app_database.dart';
import 'package:smart_kitchen/domain/entities/nutrition_entity.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/remote/models/nutrition_remote_dto.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/remote/models/product_remote_dto.dart';

class ProductMapper {
  static ProductEntity mapRemoteDtoToEntity(
    ProductRemoteDto dto,
    bool isFavoriteStatus,
  ) {
    return ProductEntity(
      barcode: dto.code ?? '',
      name: dto.productName ?? 'Unknown Product',
      brand: dto.brands ?? 'Unknown Brand',
      imageUrl: dto.imageFrontUrl ?? '',
      quantity: dto.quantity ?? '',
      categories: dto.categories ?? '',
      ingredients: dto.ingredientsText ?? '',
      allergens: dto.allergens ?? '',
      isFavorite: isFavoriteStatus,
      nutrition: _mapNutritionDtoToEntity(dto.nutriments),
    );
  }

  static NutritionEntity _mapNutritionDtoToEntity(NutritionRemoteDTO? dto) {
    if (dto == null) {
      return NutritionEntity.empty();
    }

    return NutritionEntity(
      calories: dto.energyKcal100G?.toDouble() ?? 0.0,
      protein: dto.proteins100G ?? 0.0,
      fat: dto.fat100G ?? 0.0,
      carbs: dto.carbohydrates100G ?? 0.0,
    );
  }

  static ProductEntity mapDbDataToEntity(Product dbProduct) {
    return ProductEntity(
      barcode: dbProduct.barcode,
      name: dbProduct.name,
      brand: dbProduct.brand ?? '',
      imageUrl: dbProduct.imageUrl ?? '',
      quantity: dbProduct.quantity ?? '',
      categories: dbProduct.categories ?? '',
      ingredients: dbProduct.ingredients ?? '',
      allergens: dbProduct.allergens ?? '',
      isFavorite: dbProduct.isFavorite,
      nutrition: NutritionEntity(
        calories: dbProduct.calories ?? 0.0,
        protein: dbProduct.protein ?? 0.0,
        fat: dbProduct.fat ?? 0.0,
        carbs: dbProduct.carbs ?? 0.0,
      ),
      expirationDate: dbProduct.expirationDate,
    );
  }

  static ProductsCompanion mapEntityToDbCompanion(ProductEntity entity) {
    return ProductsCompanion(
      barcode: Value(entity.barcode),
      name: Value(entity.name),
      brand: Value(entity.brand),
      imageUrl: Value(entity.imageUrl),
      quantity: Value(entity.quantity),
      categories: Value(entity.categories),
      ingredients: Value(entity.ingredients),
      allergens: Value(entity.allergens),
      isFavorite: Value(entity.isFavorite),
      calories: Value(entity.nutrition.calories),
      protein: Value(entity.nutrition.protein),
      fat: Value(entity.nutrition.fat),
      carbs: Value(entity.nutrition.carbs),
      expirationDate: Value(entity.expirationDate),
    );
  }
}
