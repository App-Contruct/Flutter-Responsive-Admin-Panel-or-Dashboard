// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthController, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_AuthController.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_AuthController.passwordValid'))
          .value;
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_AuthController.nameValid'))
          .value;

  late final _$isLoginAtom =
      Atom(name: '_AuthController.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_AuthController.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$nameAtom = Atom(name: '_AuthController.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthController.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$_AuthControllerActionController =
      ActionController(name: '_AuthController', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
        name: '_AuthController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
        name: '_AuthController.setName');
    try {
      return super.setName(value);
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
        name: '_AuthController.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLogin() {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
        name: '_AuthController.setIsLogin');
    try {
      return super.setIsLogin();
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin},
email: ${email},
name: ${name},
password: ${password},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
nameValid: ${nameValid}
    ''';
  }
}
