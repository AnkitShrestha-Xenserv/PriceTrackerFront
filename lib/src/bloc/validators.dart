import 'dart:async';

class Validators {
  final validateProductUrl = StreamTransformer<String, String>.fromHandlers(
    handleData: (productUrl, sink) {
      if (productUrl.startsWith('https://www.daraz.com.np')) {
        sink.add(productUrl);
      } else {
        sink.addError('Invalid Url');
      }
    },
  );

  final validateThresholdPrice = StreamTransformer<String, String>.fromHandlers(
    handleData: (thresholdPrice, sink) {
      if (thresholdPrice.contains(RegExp(r"/^\d+$/"))) {
        sink.addError('Please enter a valid number ');
      } else if (int.parse(thresholdPrice) < 0) {
        sink.addError('Please enter a number greater than 0');
      } else {
        sink.add(thresholdPrice);
      }
    },
  );

  final validateUsername = StreamTransformer<String, String>.fromHandlers(
    handleData: (username, sink) {
      if (username.isEmpty) {
        sink.addError('Cannot be empty');
      } else {
        sink.add(username);
      }
    },
  );
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.isEmpty) {
        sink.addError('Cannot be empty');
      } else {
        sink.add(password);
      }
    },
  );
}
