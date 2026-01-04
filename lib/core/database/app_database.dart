import 'package:drift/drift.dart';
import 'package:drift/internal/versioned_schema.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_kitchen/core/database/db_migration.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/local/tables.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/local/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Products, FavoriteRecipes])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 4;

  /// We will handle migration process here
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        /// Create all tables
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        /// Run migration steps without foreign keys and re-enable them later
        /// (https://drift.simonbinder.eu/docs/advanced-features/migrations/#tips)
        await customStatement('PRAGMA foreign_keys = OFF');

        /// [migrationSteps] method coming from db_migration.dart file
        /// which drift generated
        await transaction(
          () => VersionedSchema.runMigrationSteps(
            migrator: m,
            from: from,
            to: to,

            /// From version 3 to 4
            steps: migrationSteps(
              from3To4: (Migrator m, Schema4 schema) async {
                /// Write version 4 changes here
                /// Add new columns to [Products]
                await m.addColumn(
                  schema.products,
                  schema.products.expirationDate,
                );
              },
            ),
          ),
        );
      },
      beforeOpen: (details) async {
        /// Enable foreign_keys
        await customStatement('PRAGMA foreign_keys = ON');
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
