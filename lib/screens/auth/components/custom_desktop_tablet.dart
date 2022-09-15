
import 'package:admin/utils/constants.dart';
import 'package:admin/core/widgets/custom_dialog.dart';
import 'package:admin/core/widgets/custom_text_field/custom_text_field.dart';
import 'package:admin/utils/responsive.dart';
import 'package:admin/screens/auth/components/custom_button_login.dart';
import 'package:admin/screens/controllers/auth_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomDesktopTabletScreem extends StatefulWidget {
  const CustomDesktopTabletScreem({Key? key, required this.authController}) : super(key: key);

  final AuthController authController;

  @override
  State<CustomDesktopTabletScreem> createState() => _CustomDesktopTabletScreemState();
}

class _CustomDesktopTabletScreemState extends State<CustomDesktopTabletScreem>  with TickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: Responsive.isDesktop(context) ? 500 : 460,
          width: Responsive.isDesktop(context) ? 450 : 400,
          decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width / 15,
                child: Lottie.asset('json/login2.json',
                    width: 200, height: 170,
                    fit: BoxFit.fill,
                    controller: _controller, onLoaded: (composition) {
                      _controller..duration = composition.duration..forward();
                    }),
              ),
              const SizedBox(height: 5),
              Observer(builder: (_) =>
                  FadeOut(
                    duration: Duration(seconds: 1),
                    child: Text(widget.authController.isLogin ? 'LOGIN' : 'CADASTRO',
                      style: GoogleFonts.montserrat(fontSize: 16, color: secondaryColor,
                          fontWeight: FontWeight.bold)),),),
              Observer(builder: (_) => widget.authController.isLogin ?
              Text('Olá! Bem-vindo de volta!', style: GoogleFonts.montserrat(color: Colors.grey)
              ):Text('Vamos realizar seu cadastro!', style: GoogleFonts.montserrat(color: Colors.grey))),
              const SizedBox(height: 10),

              ///Fields Inputs
              Observer(builder: (_) => widget.authController.isLogin ?
              Container() :
              Observer(builder: (_) => CustomTextField(
                  hintText: 'Nome Completo',
                  prefixIcon: Icons.person,
                  inputType: TextInputType.text,
                errorText: widget.authController.nameError,
                onChanged: widget.authController.setName,
              )
              )),
              Observer(builder: (_) =>
                  CustomTextField(
                    hintText: 'Insirá seu e-mail',
                    prefixIcon: Icons.email,
                    inputType: TextInputType.emailAddress,
                    errorText: widget.authController.emailError,
                    onChanged: widget.authController.setEmail,
                  )),
              Observer(builder: (_) =>
                  CustomTextField(
                    hintText: 'Insirá sua senha',
                    prefixIcon: Icons.lock,
                    inputType: TextInputType.text,
                    errorText: widget.authController.passwordError,
                    onChanged: widget.authController.setPassword,
                    obscureText: true,
                  )),

              Observer(builder: (_) =>  widget.authController.isLogin ?
              const SizedBox(height: 10,) : Container()),

              Observer(builder: (_) => widget.authController.isLogin ?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: (){},
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Text('Esqueci minha senha >', style:
                            TextStyle(color: Colors.grey, decoration: TextDecoration.underline)),
                          )
                      ),
                    ),
                  ),
                ],
              ): Container()),
              const SizedBox(height: 5,),
              Observer(builder: (_) =>
                  CustomButtonLogin(
                    onPressed: () async {
                      await widget.authController.login(context);
                    },
                    color: Colors.blue,
                    title: widget.authController.isLogin ? 'Login' : 'Registrar',)),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Observer(builder: (_) =>
                     Text(widget.authController.isLogin ?
                     'Ainda não tem conta?' : 'Já tenho Conta,',
                       style: TextStyle(color: Colors.grey),)),
                  const SizedBox(width: 5,),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () async {
                          widget.authController.setIsLogin();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                          child: Observer(builder: (_) =>
                              Text(widget.authController.isLogin ? 'Registrar' : 'Login',
                            style: TextStyle(color: bgColor, fontWeight: FontWeight.bold),),)
                        )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
