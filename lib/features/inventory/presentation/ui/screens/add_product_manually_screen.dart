import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/domain/entities/nutrition_entity.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_cubit.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/product_add_manually_form_body.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/product_form_actions.dart';

class AddProductManuallyScreen extends StatefulWidget {
  const AddProductManuallyScreen({
    super.key,
    this.prefilledBarcode,
    this.prefilledAllergens,
    this.prefilledBrand,
    this.prefilledCalories,
    this.prefilledCarbs,
    this.prefilledCategories,
    this.prefilledFat,
    this.prefilledIngredients,
    this.prefilledName,
    this.prefilledProtein,
    this.prefilledQuantity,
  });

  final String? prefilledName;
  final String? prefilledBarcode;
  final String? prefilledBrand;
  final String? prefilledQuantity;
  final String? prefilledCategories;
  final String? prefilledIngredients;
  final String? prefilledAllergens;
  final double? prefilledCalories;
  final double? prefilledFat;
  final double? prefilledCarbs;
  final double? prefilledProtein;

  @override
  State<AddProductManuallyScreen> createState() =>
      _AddProductManuallyScreenState();
}

class _AddProductManuallyScreenState extends State<AddProductManuallyScreen> {
  final _formKey = GlobalKey<FormState>();
  var _unit = 'pcs';

  late final TextEditingController _nameController;
  late final TextEditingController _brandController;
  late final TextEditingController _quantityController;
  late final TextEditingController _categoriesController;
  late final TextEditingController _allergensController;
  late final TextEditingController _ingredientsController;
  late final TextEditingController _barcodeController;
  late final TextEditingController _caloriesController;
  late final TextEditingController _fatController;
  late final TextEditingController _carbsController;
  late final TextEditingController _proteinController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.prefilledName ?? '');
    _brandController = TextEditingController(text: widget.prefilledBrand ?? '');
    _quantityController = TextEditingController(
      text: widget.prefilledQuantity ?? '',
    );
    _categoriesController = TextEditingController(
      text: widget.prefilledCategories ?? '',
    );
    _allergensController = TextEditingController(
      text: widget.prefilledAllergens ?? '',
    );
    _ingredientsController = TextEditingController(
      text: widget.prefilledIngredients ?? '',
    );
    _barcodeController = TextEditingController(
      text: widget.prefilledBarcode ?? '',
    );
    _caloriesController = TextEditingController(
      text: widget.prefilledCalories?.toString() ?? '',
    );
    _fatController = TextEditingController(
      text: widget.prefilledFat?.toString() ?? '',
    );
    _carbsController = TextEditingController(
      text: widget.prefilledCarbs?.toString() ?? '',
    );
    _proteinController = TextEditingController(
      text: widget.prefilledProtein?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _quantityController.dispose();
    _categoriesController.dispose();
    _allergensController.dispose();
    _ingredientsController.dispose();
    _barcodeController.dispose();
    _caloriesController.dispose();
    _fatController.dispose();
    _carbsController.dispose();
    _proteinController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final newProduct = ProductEntity.fromForm(
        barcode: _barcodeController.text.trim(),
        name: _nameController.text.trim(),
        brand: _brandController.text.trim(),
        quantity: _quantityController.text.trim(),
        categories: _categoriesController.text.trim(),
        ingredients: _ingredientsController.text.trim(),
        allergens: _allergensController.text.trim(),
        nutrition: NutritionEntity(
          calories: double.tryParse(_caloriesController.text.trim()) ?? 0,
          protein: double.tryParse(_proteinController.text.trim()) ?? 0,
          fat: double.tryParse(_fatController.text.trim()) ?? 0,
          carbs: double.tryParse(_carbsController.text.trim()) ?? 0,
        ),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Product saved')));
      context.read<InventoryCubit>().addProductManually(product: newProduct);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product Manually'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ProductAddManuallyFormBody(
              nameController: _nameController,
              brandController: _brandController,
              quantityController: _quantityController,
              categoriesController: _categoriesController,
              allergensController: _allergensController,
              ingredientsController: _ingredientsController,
              barcodeController: _barcodeController,
              caloriesController: _caloriesController,
              fatController: _fatController,
              carbsController: _carbsController,
              proteinController: _proteinController,
              unit: _unit,
              onChanged: (unit) => setState(() => _unit = unit ?? 'pcs'),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(12),
        child: ProductFormActions(onSave: _onSave),
      ),
    );
  }
}
