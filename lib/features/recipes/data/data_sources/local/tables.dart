import 'package:drift/drift.dart';

class FavoriteRecipes extends Table {
  IntColumn get id => integer()();

  TextColumn get title => text()();

  TextColumn get image => text().nullable()();

  IntColumn get readyInMinutes => integer().nullable()();

  IntColumn get servings => integer().nullable()();

  TextColumn get summary => text().nullable()();

  TextColumn get instructions => text().nullable()();

  TextColumn get sourceUrl => text().nullable()();

  TextColumn get extendedIngredientsJson =>
      text().named('extended_ingredients_json').nullable()();

  TextColumn get analyzedInstructionsJson =>
      text().named('analyzed_instructions_json').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
