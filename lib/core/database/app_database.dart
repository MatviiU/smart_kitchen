import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/local/tables.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/local/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Products, FavoriteRecipes])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator migrator) async {
        await migrator.createAll();
      },
      onUpgrade: (Migrator migrator, int from, int to) async {
        if (from == 1) {
          await migrator.createTable(favoriteRecipes);
        }
        if (from <= 2) {
          await migrator.addColumn(products, products.isFavorite);
        }
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'smart_kitchen',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<Product?> getProductByBarcodeFromDb({required String barcode}) {
    return (select(
      products,
    )..where((tbl) => tbl.barcode.equals(barcode))).getSingleOrNull();
  }

  Future<void> saveProductToDb({required ProductsCompanion product}) {
    return into(products).insertOnConflictUpdate(product);
  }

  Future<void> deleteProductByBarcodeFromDb({required String barcode}) {
    return (delete(products)..where((tbl) => tbl.barcode.equals(barcode))).go();
  }

  Future<List<Product>> getAllProductsFromDb() => select(products).get();

  Future<bool> getProductFavoriteStatus({required String barcode}) async {
    final product = await (select(
      products,
    )..where((tbl) => tbl.barcode.equals(barcode))).getSingleOrNull();
    return product?.isFavorite ?? false;
  }

  Future<void> updateProductFavoriteStatus({
    required String barcode,
    required bool isFavorite,
  }) async {
    final query = update(products)..where((tbl) => tbl.barcode.equals(barcode));

    await query.write(ProductsCompanion(isFavorite: Value(isFavorite)));
  }

  Stream<List<Product>> watchFavoriteProducts() {
    return (select(
      products,
    )..where((tbl) => tbl.isFavorite.equals(true))).watch();
  }

  Future<List<FavoriteRecipe>> getAllFavoriteRecipesFromDb() =>
      select(favoriteRecipes).get();

  Future<FavoriteRecipe?> getFavoriteRecipeFromDb({required int id}) {
    return (select(
      favoriteRecipes,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<bool> isRecipeFavoriteInDb({required int id}) {
    return (select(favoriteRecipes)..where((tbl) => tbl.id.equals(id)))
        .watchSingleOrNull()
        .map((recipe) => recipe != null);
  }

  Future<void> saveFavoriteRecipeToDb({
    required FavoriteRecipesCompanion recipe,
  }) {
    return into(favoriteRecipes).insertOnConflictUpdate(recipe);
  }

  Future<void> deleteFavoriteRecipeFromDb({required int id}) {
    return (delete(favoriteRecipes)..where((tbl) => tbl.id.equals(id))).go();
  }
}
