// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<String> quantity = GeneratedColumn<String>(
    'quantity',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoriesMeta = const VerificationMeta(
    'categories',
  );
  @override
  late final GeneratedColumn<String> categories = GeneratedColumn<String>(
    'categories',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ingredientsMeta = const VerificationMeta(
    'ingredients',
  );
  @override
  late final GeneratedColumn<String> ingredients = GeneratedColumn<String>(
    'ingredients',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allergensMeta = const VerificationMeta(
    'allergens',
  );
  @override
  late final GeneratedColumn<String> allergens = GeneratedColumn<String>(
    'allergens',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
    'calories',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
    'carbs',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expirationDateMeta = const VerificationMeta(
    'expirationDate',
  );
  @override
  late final GeneratedColumn<DateTime> expirationDate =
      GeneratedColumn<DateTime>(
        'expiration_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    barcode,
    name,
    brand,
    imageUrl,
    quantity,
    categories,
    ingredients,
    allergens,
    isFavorite,
    calories,
    protein,
    fat,
    carbs,
    expirationDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('categories')) {
      context.handle(
        _categoriesMeta,
        categories.isAcceptableOrUnknown(data['categories']!, _categoriesMeta),
      );
    }
    if (data.containsKey('ingredients')) {
      context.handle(
        _ingredientsMeta,
        ingredients.isAcceptableOrUnknown(
          data['ingredients']!,
          _ingredientsMeta,
        ),
      );
    }
    if (data.containsKey('allergens')) {
      context.handle(
        _allergensMeta,
        allergens.isAcceptableOrUnknown(data['allergens']!, _allergensMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    }
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    }
    if (data.containsKey('expiration_date')) {
      context.handle(
        _expirationDateMeta,
        expirationDate.isAcceptableOrUnknown(
          data['expiration_date']!,
          _expirationDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {barcode};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quantity'],
      ),
      categories: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categories'],
      ),
      ingredients: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredients'],
      ),
      allergens: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allergens'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories'],
      ),
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      ),
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat'],
      ),
      carbs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs'],
      ),
      expirationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expiration_date'],
      ),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String barcode;
  final String name;
  final String? brand;
  final String? imageUrl;
  final String? quantity;
  final String? categories;
  final String? ingredients;
  final String? allergens;
  final bool isFavorite;
  final double? calories;
  final double? protein;
  final double? fat;
  final double? carbs;
  final DateTime? expirationDate;
  const Product({
    required this.barcode,
    required this.name,
    this.brand,
    this.imageUrl,
    this.quantity,
    this.categories,
    this.ingredients,
    this.allergens,
    required this.isFavorite,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.expirationDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['barcode'] = Variable<String>(barcode);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<String>(quantity);
    }
    if (!nullToAbsent || categories != null) {
      map['categories'] = Variable<String>(categories);
    }
    if (!nullToAbsent || ingredients != null) {
      map['ingredients'] = Variable<String>(ingredients);
    }
    if (!nullToAbsent || allergens != null) {
      map['allergens'] = Variable<String>(allergens);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    if (!nullToAbsent || calories != null) {
      map['calories'] = Variable<double>(calories);
    }
    if (!nullToAbsent || protein != null) {
      map['protein'] = Variable<double>(protein);
    }
    if (!nullToAbsent || fat != null) {
      map['fat'] = Variable<double>(fat);
    }
    if (!nullToAbsent || carbs != null) {
      map['carbs'] = Variable<double>(carbs);
    }
    if (!nullToAbsent || expirationDate != null) {
      map['expiration_date'] = Variable<DateTime>(expirationDate);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      barcode: Value(barcode),
      name: Value(name),
      brand: brand == null && nullToAbsent
          ? const Value.absent()
          : Value(brand),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      categories: categories == null && nullToAbsent
          ? const Value.absent()
          : Value(categories),
      ingredients: ingredients == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredients),
      allergens: allergens == null && nullToAbsent
          ? const Value.absent()
          : Value(allergens),
      isFavorite: Value(isFavorite),
      calories: calories == null && nullToAbsent
          ? const Value.absent()
          : Value(calories),
      protein: protein == null && nullToAbsent
          ? const Value.absent()
          : Value(protein),
      fat: fat == null && nullToAbsent ? const Value.absent() : Value(fat),
      carbs: carbs == null && nullToAbsent
          ? const Value.absent()
          : Value(carbs),
      expirationDate: expirationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expirationDate),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      barcode: serializer.fromJson<String>(json['barcode']),
      name: serializer.fromJson<String>(json['name']),
      brand: serializer.fromJson<String?>(json['brand']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      quantity: serializer.fromJson<String?>(json['quantity']),
      categories: serializer.fromJson<String?>(json['categories']),
      ingredients: serializer.fromJson<String?>(json['ingredients']),
      allergens: serializer.fromJson<String?>(json['allergens']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      calories: serializer.fromJson<double?>(json['calories']),
      protein: serializer.fromJson<double?>(json['protein']),
      fat: serializer.fromJson<double?>(json['fat']),
      carbs: serializer.fromJson<double?>(json['carbs']),
      expirationDate: serializer.fromJson<DateTime?>(json['expirationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'barcode': serializer.toJson<String>(barcode),
      'name': serializer.toJson<String>(name),
      'brand': serializer.toJson<String?>(brand),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'quantity': serializer.toJson<String?>(quantity),
      'categories': serializer.toJson<String?>(categories),
      'ingredients': serializer.toJson<String?>(ingredients),
      'allergens': serializer.toJson<String?>(allergens),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'calories': serializer.toJson<double?>(calories),
      'protein': serializer.toJson<double?>(protein),
      'fat': serializer.toJson<double?>(fat),
      'carbs': serializer.toJson<double?>(carbs),
      'expirationDate': serializer.toJson<DateTime?>(expirationDate),
    };
  }

  Product copyWith({
    String? barcode,
    String? name,
    Value<String?> brand = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> quantity = const Value.absent(),
    Value<String?> categories = const Value.absent(),
    Value<String?> ingredients = const Value.absent(),
    Value<String?> allergens = const Value.absent(),
    bool? isFavorite,
    Value<double?> calories = const Value.absent(),
    Value<double?> protein = const Value.absent(),
    Value<double?> fat = const Value.absent(),
    Value<double?> carbs = const Value.absent(),
    Value<DateTime?> expirationDate = const Value.absent(),
  }) => Product(
    barcode: barcode ?? this.barcode,
    name: name ?? this.name,
    brand: brand.present ? brand.value : this.brand,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    quantity: quantity.present ? quantity.value : this.quantity,
    categories: categories.present ? categories.value : this.categories,
    ingredients: ingredients.present ? ingredients.value : this.ingredients,
    allergens: allergens.present ? allergens.value : this.allergens,
    isFavorite: isFavorite ?? this.isFavorite,
    calories: calories.present ? calories.value : this.calories,
    protein: protein.present ? protein.value : this.protein,
    fat: fat.present ? fat.value : this.fat,
    carbs: carbs.present ? carbs.value : this.carbs,
    expirationDate: expirationDate.present
        ? expirationDate.value
        : this.expirationDate,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      name: data.name.present ? data.name.value : this.name,
      brand: data.brand.present ? data.brand.value : this.brand,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      categories: data.categories.present
          ? data.categories.value
          : this.categories,
      ingredients: data.ingredients.present
          ? data.ingredients.value
          : this.ingredients,
      allergens: data.allergens.present ? data.allergens.value : this.allergens,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      calories: data.calories.present ? data.calories.value : this.calories,
      protein: data.protein.present ? data.protein.value : this.protein,
      fat: data.fat.present ? data.fat.value : this.fat,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      expirationDate: data.expirationDate.present
          ? data.expirationDate.value
          : this.expirationDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('barcode: $barcode, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('quantity: $quantity, ')
          ..write('categories: $categories, ')
          ..write('ingredients: $ingredients, ')
          ..write('allergens: $allergens, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('expirationDate: $expirationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    barcode,
    name,
    brand,
    imageUrl,
    quantity,
    categories,
    ingredients,
    allergens,
    isFavorite,
    calories,
    protein,
    fat,
    carbs,
    expirationDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.barcode == this.barcode &&
          other.name == this.name &&
          other.brand == this.brand &&
          other.imageUrl == this.imageUrl &&
          other.quantity == this.quantity &&
          other.categories == this.categories &&
          other.ingredients == this.ingredients &&
          other.allergens == this.allergens &&
          other.isFavorite == this.isFavorite &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.fat == this.fat &&
          other.carbs == this.carbs &&
          other.expirationDate == this.expirationDate);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> barcode;
  final Value<String> name;
  final Value<String?> brand;
  final Value<String?> imageUrl;
  final Value<String?> quantity;
  final Value<String?> categories;
  final Value<String?> ingredients;
  final Value<String?> allergens;
  final Value<bool> isFavorite;
  final Value<double?> calories;
  final Value<double?> protein;
  final Value<double?> fat;
  final Value<double?> carbs;
  final Value<DateTime?> expirationDate;
  final Value<int> rowid;
  const ProductsCompanion({
    this.barcode = const Value.absent(),
    this.name = const Value.absent(),
    this.brand = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.quantity = const Value.absent(),
    this.categories = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.allergens = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.expirationDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String barcode,
    required String name,
    this.brand = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.quantity = const Value.absent(),
    this.categories = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.allergens = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.expirationDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : barcode = Value(barcode),
       name = Value(name);
  static Insertable<Product> custom({
    Expression<String>? barcode,
    Expression<String>? name,
    Expression<String>? brand,
    Expression<String>? imageUrl,
    Expression<String>? quantity,
    Expression<String>? categories,
    Expression<String>? ingredients,
    Expression<String>? allergens,
    Expression<bool>? isFavorite,
    Expression<double>? calories,
    Expression<double>? protein,
    Expression<double>? fat,
    Expression<double>? carbs,
    Expression<DateTime>? expirationDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (barcode != null) 'barcode': barcode,
      if (name != null) 'name': name,
      if (brand != null) 'brand': brand,
      if (imageUrl != null) 'image_url': imageUrl,
      if (quantity != null) 'quantity': quantity,
      if (categories != null) 'categories': categories,
      if (ingredients != null) 'ingredients': ingredients,
      if (allergens != null) 'allergens': allergens,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (fat != null) 'fat': fat,
      if (carbs != null) 'carbs': carbs,
      if (expirationDate != null) 'expiration_date': expirationDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? barcode,
    Value<String>? name,
    Value<String?>? brand,
    Value<String?>? imageUrl,
    Value<String?>? quantity,
    Value<String?>? categories,
    Value<String?>? ingredients,
    Value<String?>? allergens,
    Value<bool>? isFavorite,
    Value<double?>? calories,
    Value<double?>? protein,
    Value<double?>? fat,
    Value<double?>? carbs,
    Value<DateTime?>? expirationDate,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      barcode: barcode ?? this.barcode,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      categories: categories ?? this.categories,
      ingredients: ingredients ?? this.ingredients,
      allergens: allergens ?? this.allergens,
      isFavorite: isFavorite ?? this.isFavorite,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      expirationDate: expirationDate ?? this.expirationDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(quantity.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(categories.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(ingredients.value);
    }
    if (allergens.present) {
      map['allergens'] = Variable<String>(allergens.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (expirationDate.present) {
      map['expiration_date'] = Variable<DateTime>(expirationDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('barcode: $barcode, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('quantity: $quantity, ')
          ..write('categories: $categories, ')
          ..write('ingredients: $ingredients, ')
          ..write('allergens: $allergens, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('expirationDate: $expirationDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoriteRecipesTable extends FavoriteRecipes
    with TableInfo<$FavoriteRecipesTable, FavoriteRecipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteRecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _readyInMinutesMeta = const VerificationMeta(
    'readyInMinutes',
  );
  @override
  late final GeneratedColumn<int> readyInMinutes = GeneratedColumn<int>(
    'ready_in_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _servingsMeta = const VerificationMeta(
    'servings',
  );
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
    'servings',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceUrlMeta = const VerificationMeta(
    'sourceUrl',
  );
  @override
  late final GeneratedColumn<String> sourceUrl = GeneratedColumn<String>(
    'source_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extendedIngredientsJsonMeta =
      const VerificationMeta('extendedIngredientsJson');
  @override
  late final GeneratedColumn<String> extendedIngredientsJson =
      GeneratedColumn<String>(
        'extended_ingredients_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _analyzedInstructionsJsonMeta =
      const VerificationMeta('analyzedInstructionsJson');
  @override
  late final GeneratedColumn<String> analyzedInstructionsJson =
      GeneratedColumn<String>(
        'analyzed_instructions_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    image,
    readyInMinutes,
    servings,
    summary,
    instructions,
    sourceUrl,
    extendedIngredientsJson,
    analyzedInstructionsJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteRecipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('ready_in_minutes')) {
      context.handle(
        _readyInMinutesMeta,
        readyInMinutes.isAcceptableOrUnknown(
          data['ready_in_minutes']!,
          _readyInMinutesMeta,
        ),
      );
    }
    if (data.containsKey('servings')) {
      context.handle(
        _servingsMeta,
        servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta),
      );
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('source_url')) {
      context.handle(
        _sourceUrlMeta,
        sourceUrl.isAcceptableOrUnknown(data['source_url']!, _sourceUrlMeta),
      );
    }
    if (data.containsKey('extended_ingredients_json')) {
      context.handle(
        _extendedIngredientsJsonMeta,
        extendedIngredientsJson.isAcceptableOrUnknown(
          data['extended_ingredients_json']!,
          _extendedIngredientsJsonMeta,
        ),
      );
    }
    if (data.containsKey('analyzed_instructions_json')) {
      context.handle(
        _analyzedInstructionsJsonMeta,
        analyzedInstructionsJson.isAcceptableOrUnknown(
          data['analyzed_instructions_json']!,
          _analyzedInstructionsJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteRecipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteRecipe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      readyInMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ready_in_minutes'],
      ),
      servings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}servings'],
      ),
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      ),
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      ),
      sourceUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_url'],
      ),
      extendedIngredientsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extended_ingredients_json'],
      ),
      analyzedInstructionsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}analyzed_instructions_json'],
      ),
    );
  }

  @override
  $FavoriteRecipesTable createAlias(String alias) {
    return $FavoriteRecipesTable(attachedDatabase, alias);
  }
}

class FavoriteRecipe extends DataClass implements Insertable<FavoriteRecipe> {
  final int id;
  final String title;
  final String? image;
  final int? readyInMinutes;
  final int? servings;
  final String? summary;
  final String? instructions;
  final String? sourceUrl;
  final String? extendedIngredientsJson;
  final String? analyzedInstructionsJson;
  const FavoriteRecipe({
    required this.id,
    required this.title,
    this.image,
    this.readyInMinutes,
    this.servings,
    this.summary,
    this.instructions,
    this.sourceUrl,
    this.extendedIngredientsJson,
    this.analyzedInstructionsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || readyInMinutes != null) {
      map['ready_in_minutes'] = Variable<int>(readyInMinutes);
    }
    if (!nullToAbsent || servings != null) {
      map['servings'] = Variable<int>(servings);
    }
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    if (!nullToAbsent || sourceUrl != null) {
      map['source_url'] = Variable<String>(sourceUrl);
    }
    if (!nullToAbsent || extendedIngredientsJson != null) {
      map['extended_ingredients_json'] = Variable<String>(
        extendedIngredientsJson,
      );
    }
    if (!nullToAbsent || analyzedInstructionsJson != null) {
      map['analyzed_instructions_json'] = Variable<String>(
        analyzedInstructionsJson,
      );
    }
    return map;
  }

  FavoriteRecipesCompanion toCompanion(bool nullToAbsent) {
    return FavoriteRecipesCompanion(
      id: Value(id),
      title: Value(title),
      image: image == null && nullToAbsent
          ? const Value.absent()
          : Value(image),
      readyInMinutes: readyInMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(readyInMinutes),
      servings: servings == null && nullToAbsent
          ? const Value.absent()
          : Value(servings),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      sourceUrl: sourceUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceUrl),
      extendedIngredientsJson: extendedIngredientsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(extendedIngredientsJson),
      analyzedInstructionsJson: analyzedInstructionsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(analyzedInstructionsJson),
    );
  }

  factory FavoriteRecipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteRecipe(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String?>(json['image']),
      readyInMinutes: serializer.fromJson<int?>(json['readyInMinutes']),
      servings: serializer.fromJson<int?>(json['servings']),
      summary: serializer.fromJson<String?>(json['summary']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      sourceUrl: serializer.fromJson<String?>(json['sourceUrl']),
      extendedIngredientsJson: serializer.fromJson<String?>(
        json['extendedIngredientsJson'],
      ),
      analyzedInstructionsJson: serializer.fromJson<String?>(
        json['analyzedInstructionsJson'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String?>(image),
      'readyInMinutes': serializer.toJson<int?>(readyInMinutes),
      'servings': serializer.toJson<int?>(servings),
      'summary': serializer.toJson<String?>(summary),
      'instructions': serializer.toJson<String?>(instructions),
      'sourceUrl': serializer.toJson<String?>(sourceUrl),
      'extendedIngredientsJson': serializer.toJson<String?>(
        extendedIngredientsJson,
      ),
      'analyzedInstructionsJson': serializer.toJson<String?>(
        analyzedInstructionsJson,
      ),
    };
  }

  FavoriteRecipe copyWith({
    int? id,
    String? title,
    Value<String?> image = const Value.absent(),
    Value<int?> readyInMinutes = const Value.absent(),
    Value<int?> servings = const Value.absent(),
    Value<String?> summary = const Value.absent(),
    Value<String?> instructions = const Value.absent(),
    Value<String?> sourceUrl = const Value.absent(),
    Value<String?> extendedIngredientsJson = const Value.absent(),
    Value<String?> analyzedInstructionsJson = const Value.absent(),
  }) => FavoriteRecipe(
    id: id ?? this.id,
    title: title ?? this.title,
    image: image.present ? image.value : this.image,
    readyInMinutes: readyInMinutes.present
        ? readyInMinutes.value
        : this.readyInMinutes,
    servings: servings.present ? servings.value : this.servings,
    summary: summary.present ? summary.value : this.summary,
    instructions: instructions.present ? instructions.value : this.instructions,
    sourceUrl: sourceUrl.present ? sourceUrl.value : this.sourceUrl,
    extendedIngredientsJson: extendedIngredientsJson.present
        ? extendedIngredientsJson.value
        : this.extendedIngredientsJson,
    analyzedInstructionsJson: analyzedInstructionsJson.present
        ? analyzedInstructionsJson.value
        : this.analyzedInstructionsJson,
  );
  FavoriteRecipe copyWithCompanion(FavoriteRecipesCompanion data) {
    return FavoriteRecipe(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      image: data.image.present ? data.image.value : this.image,
      readyInMinutes: data.readyInMinutes.present
          ? data.readyInMinutes.value
          : this.readyInMinutes,
      servings: data.servings.present ? data.servings.value : this.servings,
      summary: data.summary.present ? data.summary.value : this.summary,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      sourceUrl: data.sourceUrl.present ? data.sourceUrl.value : this.sourceUrl,
      extendedIngredientsJson: data.extendedIngredientsJson.present
          ? data.extendedIngredientsJson.value
          : this.extendedIngredientsJson,
      analyzedInstructionsJson: data.analyzedInstructionsJson.present
          ? data.analyzedInstructionsJson.value
          : this.analyzedInstructionsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRecipe(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('readyInMinutes: $readyInMinutes, ')
          ..write('servings: $servings, ')
          ..write('summary: $summary, ')
          ..write('instructions: $instructions, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('extendedIngredientsJson: $extendedIngredientsJson, ')
          ..write('analyzedInstructionsJson: $analyzedInstructionsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    image,
    readyInMinutes,
    servings,
    summary,
    instructions,
    sourceUrl,
    extendedIngredientsJson,
    analyzedInstructionsJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteRecipe &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image &&
          other.readyInMinutes == this.readyInMinutes &&
          other.servings == this.servings &&
          other.summary == this.summary &&
          other.instructions == this.instructions &&
          other.sourceUrl == this.sourceUrl &&
          other.extendedIngredientsJson == this.extendedIngredientsJson &&
          other.analyzedInstructionsJson == this.analyzedInstructionsJson);
}

class FavoriteRecipesCompanion extends UpdateCompanion<FavoriteRecipe> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> image;
  final Value<int?> readyInMinutes;
  final Value<int?> servings;
  final Value<String?> summary;
  final Value<String?> instructions;
  final Value<String?> sourceUrl;
  final Value<String?> extendedIngredientsJson;
  final Value<String?> analyzedInstructionsJson;
  const FavoriteRecipesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.readyInMinutes = const Value.absent(),
    this.servings = const Value.absent(),
    this.summary = const Value.absent(),
    this.instructions = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.extendedIngredientsJson = const Value.absent(),
    this.analyzedInstructionsJson = const Value.absent(),
  });
  FavoriteRecipesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.image = const Value.absent(),
    this.readyInMinutes = const Value.absent(),
    this.servings = const Value.absent(),
    this.summary = const Value.absent(),
    this.instructions = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.extendedIngredientsJson = const Value.absent(),
    this.analyzedInstructionsJson = const Value.absent(),
  }) : title = Value(title);
  static Insertable<FavoriteRecipe> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? image,
    Expression<int>? readyInMinutes,
    Expression<int>? servings,
    Expression<String>? summary,
    Expression<String>? instructions,
    Expression<String>? sourceUrl,
    Expression<String>? extendedIngredientsJson,
    Expression<String>? analyzedInstructionsJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (readyInMinutes != null) 'ready_in_minutes': readyInMinutes,
      if (servings != null) 'servings': servings,
      if (summary != null) 'summary': summary,
      if (instructions != null) 'instructions': instructions,
      if (sourceUrl != null) 'source_url': sourceUrl,
      if (extendedIngredientsJson != null)
        'extended_ingredients_json': extendedIngredientsJson,
      if (analyzedInstructionsJson != null)
        'analyzed_instructions_json': analyzedInstructionsJson,
    });
  }

  FavoriteRecipesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? image,
    Value<int?>? readyInMinutes,
    Value<int?>? servings,
    Value<String?>? summary,
    Value<String?>? instructions,
    Value<String?>? sourceUrl,
    Value<String?>? extendedIngredientsJson,
    Value<String?>? analyzedInstructionsJson,
  }) {
    return FavoriteRecipesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      readyInMinutes: readyInMinutes ?? this.readyInMinutes,
      servings: servings ?? this.servings,
      summary: summary ?? this.summary,
      instructions: instructions ?? this.instructions,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      extendedIngredientsJson:
          extendedIngredientsJson ?? this.extendedIngredientsJson,
      analyzedInstructionsJson:
          analyzedInstructionsJson ?? this.analyzedInstructionsJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (readyInMinutes.present) {
      map['ready_in_minutes'] = Variable<int>(readyInMinutes.value);
    }
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (sourceUrl.present) {
      map['source_url'] = Variable<String>(sourceUrl.value);
    }
    if (extendedIngredientsJson.present) {
      map['extended_ingredients_json'] = Variable<String>(
        extendedIngredientsJson.value,
      );
    }
    if (analyzedInstructionsJson.present) {
      map['analyzed_instructions_json'] = Variable<String>(
        analyzedInstructionsJson.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRecipesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('readyInMinutes: $readyInMinutes, ')
          ..write('servings: $servings, ')
          ..write('summary: $summary, ')
          ..write('instructions: $instructions, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('extendedIngredientsJson: $extendedIngredientsJson, ')
          ..write('analyzedInstructionsJson: $analyzedInstructionsJson')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $FavoriteRecipesTable favoriteRecipes = $FavoriteRecipesTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    products,
    favoriteRecipes,
  ];
}

typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String barcode,
      required String name,
      Value<String?> brand,
      Value<String?> imageUrl,
      Value<String?> quantity,
      Value<String?> categories,
      Value<String?> ingredients,
      Value<String?> allergens,
      Value<bool> isFavorite,
      Value<double?> calories,
      Value<double?> protein,
      Value<double?> fat,
      Value<double?> carbs,
      Value<DateTime?> expirationDate,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> barcode,
      Value<String> name,
      Value<String?> brand,
      Value<String?> imageUrl,
      Value<String?> quantity,
      Value<String?> categories,
      Value<String?> ingredients,
      Value<String?> allergens,
      Value<bool> isFavorite,
      Value<double?> calories,
      Value<double?> protein,
      Value<double?> fat,
      Value<double?> carbs,
      Value<DateTime?> expirationDate,
      Value<int> rowid,
    });

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categories => $composableBuilder(
    column: $table.categories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allergens => $composableBuilder(
    column: $table.allergens,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expirationDate => $composableBuilder(
    column: $table.expirationDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categories => $composableBuilder(
    column: $table.categories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allergens => $composableBuilder(
    column: $table.allergens,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expirationDate => $composableBuilder(
    column: $table.expirationDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get categories => $composableBuilder(
    column: $table.categories,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allergens =>
      $composableBuilder(column: $table.allergens, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<double> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<DateTime> get expirationDate => $composableBuilder(
    column: $table.expirationDate,
    builder: (column) => column,
  );
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> barcode = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> quantity = const Value.absent(),
                Value<String?> categories = const Value.absent(),
                Value<String?> ingredients = const Value.absent(),
                Value<String?> allergens = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<double?> calories = const Value.absent(),
                Value<double?> protein = const Value.absent(),
                Value<double?> fat = const Value.absent(),
                Value<double?> carbs = const Value.absent(),
                Value<DateTime?> expirationDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                barcode: barcode,
                name: name,
                brand: brand,
                imageUrl: imageUrl,
                quantity: quantity,
                categories: categories,
                ingredients: ingredients,
                allergens: allergens,
                isFavorite: isFavorite,
                calories: calories,
                protein: protein,
                fat: fat,
                carbs: carbs,
                expirationDate: expirationDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String barcode,
                required String name,
                Value<String?> brand = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> quantity = const Value.absent(),
                Value<String?> categories = const Value.absent(),
                Value<String?> ingredients = const Value.absent(),
                Value<String?> allergens = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<double?> calories = const Value.absent(),
                Value<double?> protein = const Value.absent(),
                Value<double?> fat = const Value.absent(),
                Value<double?> carbs = const Value.absent(),
                Value<DateTime?> expirationDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                barcode: barcode,
                name: name,
                brand: brand,
                imageUrl: imageUrl,
                quantity: quantity,
                categories: categories,
                ingredients: ingredients,
                allergens: allergens,
                isFavorite: isFavorite,
                calories: calories,
                protein: protein,
                fat: fat,
                carbs: carbs,
                expirationDate: expirationDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
      Product,
      PrefetchHooks Function()
    >;
typedef $$FavoriteRecipesTableCreateCompanionBuilder =
    FavoriteRecipesCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> image,
      Value<int?> readyInMinutes,
      Value<int?> servings,
      Value<String?> summary,
      Value<String?> instructions,
      Value<String?> sourceUrl,
      Value<String?> extendedIngredientsJson,
      Value<String?> analyzedInstructionsJson,
    });
typedef $$FavoriteRecipesTableUpdateCompanionBuilder =
    FavoriteRecipesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> image,
      Value<int?> readyInMinutes,
      Value<int?> servings,
      Value<String?> summary,
      Value<String?> instructions,
      Value<String?> sourceUrl,
      Value<String?> extendedIngredientsJson,
      Value<String?> analyzedInstructionsJson,
    });

class $$FavoriteRecipesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteRecipesTable> {
  $$FavoriteRecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get readyInMinutes => $composableBuilder(
    column: $table.readyInMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extendedIngredientsJson => $composableBuilder(
    column: $table.extendedIngredientsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get analyzedInstructionsJson => $composableBuilder(
    column: $table.analyzedInstructionsJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteRecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteRecipesTable> {
  $$FavoriteRecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get readyInMinutes => $composableBuilder(
    column: $table.readyInMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extendedIngredientsJson => $composableBuilder(
    column: $table.extendedIngredientsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get analyzedInstructionsJson => $composableBuilder(
    column: $table.analyzedInstructionsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteRecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteRecipesTable> {
  $$FavoriteRecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get readyInMinutes => $composableBuilder(
    column: $table.readyInMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceUrl =>
      $composableBuilder(column: $table.sourceUrl, builder: (column) => column);

  GeneratedColumn<String> get extendedIngredientsJson => $composableBuilder(
    column: $table.extendedIngredientsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get analyzedInstructionsJson => $composableBuilder(
    column: $table.analyzedInstructionsJson,
    builder: (column) => column,
  );
}

class $$FavoriteRecipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteRecipesTable,
          FavoriteRecipe,
          $$FavoriteRecipesTableFilterComposer,
          $$FavoriteRecipesTableOrderingComposer,
          $$FavoriteRecipesTableAnnotationComposer,
          $$FavoriteRecipesTableCreateCompanionBuilder,
          $$FavoriteRecipesTableUpdateCompanionBuilder,
          (
            FavoriteRecipe,
            BaseReferences<
              _$AppDatabase,
              $FavoriteRecipesTable,
              FavoriteRecipe
            >,
          ),
          FavoriteRecipe,
          PrefetchHooks Function()
        > {
  $$FavoriteRecipesTableTableManager(
    _$AppDatabase db,
    $FavoriteRecipesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteRecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteRecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteRecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<int?> readyInMinutes = const Value.absent(),
                Value<int?> servings = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<String?> sourceUrl = const Value.absent(),
                Value<String?> extendedIngredientsJson = const Value.absent(),
                Value<String?> analyzedInstructionsJson = const Value.absent(),
              }) => FavoriteRecipesCompanion(
                id: id,
                title: title,
                image: image,
                readyInMinutes: readyInMinutes,
                servings: servings,
                summary: summary,
                instructions: instructions,
                sourceUrl: sourceUrl,
                extendedIngredientsJson: extendedIngredientsJson,
                analyzedInstructionsJson: analyzedInstructionsJson,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> image = const Value.absent(),
                Value<int?> readyInMinutes = const Value.absent(),
                Value<int?> servings = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<String?> sourceUrl = const Value.absent(),
                Value<String?> extendedIngredientsJson = const Value.absent(),
                Value<String?> analyzedInstructionsJson = const Value.absent(),
              }) => FavoriteRecipesCompanion.insert(
                id: id,
                title: title,
                image: image,
                readyInMinutes: readyInMinutes,
                servings: servings,
                summary: summary,
                instructions: instructions,
                sourceUrl: sourceUrl,
                extendedIngredientsJson: extendedIngredientsJson,
                analyzedInstructionsJson: analyzedInstructionsJson,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteRecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteRecipesTable,
      FavoriteRecipe,
      $$FavoriteRecipesTableFilterComposer,
      $$FavoriteRecipesTableOrderingComposer,
      $$FavoriteRecipesTableAnnotationComposer,
      $$FavoriteRecipesTableCreateCompanionBuilder,
      $$FavoriteRecipesTableUpdateCompanionBuilder,
      (
        FavoriteRecipe,
        BaseReferences<_$AppDatabase, $FavoriteRecipesTable, FavoriteRecipe>,
      ),
      FavoriteRecipe,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$FavoriteRecipesTableTableManager get favoriteRecipes =>
      $$FavoriteRecipesTableTableManager(_db, _db.favoriteRecipes);
}
