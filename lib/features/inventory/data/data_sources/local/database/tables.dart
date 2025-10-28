import 'package:drift/drift.dart';

class Products extends Table{
  TextColumn get barcode => text()();
  TextColumn get name => text()();
  TextColumn get brand => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get quantity => text().nullable()();
  TextColumn get categories => text().nullable()();
  TextColumn get ingredients => text().nullable()();
  TextColumn get allergens => text().nullable()();
  RealColumn get calories => real().nullable()();
  RealColumn get protein => real().nullable()();
  RealColumn get fat => real().nullable()();
  RealColumn get carbs => real().nullable()();

  @override
  Set<Column> get primaryKey => {barcode};
}
