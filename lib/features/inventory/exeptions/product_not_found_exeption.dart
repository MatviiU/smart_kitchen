class ProductNotFoundException implements Exception {
  ProductNotFoundException({required this.barcode});

  final String barcode;

  @override
  String toString() => 'ProductNotFound: $barcode';
}
