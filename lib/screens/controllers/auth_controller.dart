import 'package:admin/core/widgets/custom_dialog.dart';
import 'package:admin/core/widgets/my_snackbar/my_snackbar.dart';
import 'package:admin/data/repositories/auth_repository.dart';
import 'package:admin/utils/email_valid.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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
    final _dialogLogin = CustomDialog.instance(context: context, message: 'Aguarde!');
    try{
      if(email == null || email!.isEmpty){
        CustomDialog.show(dialog: _dialogE);
        await Future.delayed(Duration(seconds: 1));
        CustomDialog.dismiss(dialog: _dialogE);
        return;
      }
      if(password == null || password!.isEmpty){
        CustomDialog.show(dialog: _dialogP);
        await Future.delayed(Duration(seconds: 1));
        CustomDialog.dismiss(dialog: _dialogP);
        return;
      }
      CustomDialog.show(dialog: _dialogLogin);
      final user = await AuthRepository().login(email!, password!);
      if(user != null){
        ///Salvar o usuario Logado
        print(user);
        CustomDialog.dismiss(dialog: _dialogLogin);
      } else {
        CustomDialog.dismiss(dialog: _dialogLogin);
        return;
      }
    } catch (e) {
      CustomDialog.dismiss(dialog: _dialogLogin);
      MySnackBar.show(context: context, message: e.toString());
      return;
    }
  }
}
