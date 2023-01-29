import 'package:flutter/material.dart';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';
import 'dart:async';

class CredentialsBloc extends Validators {
  final _repository = Repository();

  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _invalidController = BehaviorSubject<String>();

  Stream<String> get username =>
      _usernameController.stream.transform(validateUsername);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitCredentialsvalid =>
      Rx.combineLatest2(username, password, (u, p) => true);

  Stream<String> get invalidCredentials => _invalidController.stream;

  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  get clearTextFields {
    _usernameController.drain();
    _passwordController.drain();
  }

  submitCredentials() async {
    final user = await _repository.login(
        _usernameController.value, _passwordController.value);
    if (user.userId == -1) {
      _invalidController.sink.addError("Invalid Username or password");
    }
  }
}
