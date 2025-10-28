import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/local/database/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Products])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

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
}
