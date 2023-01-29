import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';
import 'validators.dart';

class ProductsBloc extends Validators {
  final _productsController = BehaviorSubject<List<ItemModel>>();
  final _urlController = BehaviorSubject<String>();
  final _thresholdController = BehaviorSubject<String>();
  final _addedProductController = BehaviorSubject<ItemModel>();

  final _repository = Repository();

  Stream<List<ItemModel>> get products => _productsController.stream;
  Stream<ItemModel> get addedProduct => _addedProductController.stream;

  Stream<String> get productUrl =>
      _urlController.stream.transform(validateProductUrl);
  Stream<String> get threshold =>
      _thresholdController.stream.transform(validateThresholdPrice);
  Stream<bool> get submitUrlValid =>
      Rx.combineLatest2(productUrl, threshold, (p, t) => true);

  // Change data
  Function(String) get changeProductUrl => _urlController.sink.add;
  Function(String) get changeThresholdPrice => _thresholdController.sink.add;

  fetchProducts() async {
    final items = await _repository.fetchProducts();
    _productsController.sink.add(items);
    print('Fetched');
  }

  submit() async {
    final item = await _repository.addProduct(
        _urlController.value, _thresholdController.value);
    _addedProductController.sink.add(item);
  }

  void dispose() {
    _productsController.close();
    _urlController.close();
    _thresholdController.close();
  }
}
