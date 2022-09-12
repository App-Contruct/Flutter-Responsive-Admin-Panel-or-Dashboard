import 'package:admin/core/widgets/custom_dialog.dart';
import 'package:admin/utils/email_valid.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ndialog/ndialog.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {

  @observable
  bool isLogin = true;

  @observable
  String? email;

  @observable
  String? name;

  @observable
  String? password;

  @action
  void setEmail(String value) => email = value;

  @action
  void setName(String value) => name = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setIsLogin() => isLogin = !isLogin;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();
  String? get emailError =>
      email == null || emailValid ? null : 'Insirá um e-mail válido';

  @computed
  bool get passwordValid => password != null && password!.length >= 6;
  String? get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if (password!.length <= 6 ) {
      return 'A senha deve ter no minimo 6 caracteres';
    } else {
      return 'Senha inválida';
    }
  }

  @computed
  bool get nameValid => name != null && name!.length >= 6;
  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.length < 3 ) {
      return 'O nome deve ter no minimo 3 caracteres';
    } else {
      return 'Nome Inválido';
    }
  }


  Future<void> login(BuildContext context) async {

    final _dialogE = CustomDialog.instance(context: context, message: 'Email Inválido!');
    final _dialogP = CustomDialog.instance(context: context, message: 'Email Inválido!');
    try{
      if(email == null || email!.isEmpty){
        CustomDialog.show(dialog: _dialogE);
        await Future.delayed(Duration(seconds: 1));
        CustomDialog.dismiss(dialog: _dialogE);
      }
      if(password == null || password!.isEmpty){
        CustomDialog.show(dialog: _dialogP);
        await Future.delayed(Duration(seconds: 1));
        CustomDialog.dismiss(dialog: _dialogP);
      }

      CustomDialog.show(dialog: _dialogP);
      await Future.delayed(Duration(seconds: 3));
      CustomDialog.dismiss(dialog: _dialogP);

    } catch (e) {

    }
  }
}
