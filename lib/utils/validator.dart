class Validator {
  static String? required({String? value}) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateNumber({String? value}) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter a number';
    }

    if (double.tryParse(value) == null) {
      return 'Enter valid number';
    }
    return null;
  }

  static String? validateNutrition({String? value}) {
    if (value == null || value.trim().isEmpty) return null;
    final parsed = double.tryParse(value.replaceAll(',', '.'));
    if (parsed == null) return 'Enter valid number';
    if (parsed < 0) return 'Enter positive number';
    return null;
  }
}
