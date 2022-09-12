import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {

  @observable
  bool isLogin = true;

  @action
  void setIsLogin() => isLogin = !isLogin;


}
