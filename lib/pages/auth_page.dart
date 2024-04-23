import 'package:app_15_1_24/styleApp.dart';
import 'package:flutter/material.dart';
import 'Map_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Login to your account', style: StylesText.sizeTextWhite,),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            children: const [
              FormWidget(),
              Padding(padding: EdgeInsets.only(top: 10),),
              Text('Введите логин и пароль, если у Вас нет аккаунта зарегистрируйтесь! Login: admin, Password: admin',
                style: StylesText.sizeTextBlack,),
            ],
          ),
        )
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget ({super.key});

  @override
  FormWidgetState createState() => FormWidgetState();

}


class FormWidgetState extends State<FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;


  void _enter() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;


    if (login == 'admin' && password == 'admin') {
      errorText = null;
      final  navigator = Navigator.of(context);
      navigator.push(
        MaterialPageRoute<void>(builder: (context) => MapPage()),
      );
    } else {
      setState(() {
        errorText = 'Не верный логин или пароль';
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    const TextStyle sizeTextBlack = TextStyle(fontSize: 18.0, color: Colors.black);
    const textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (errorText != null) Text(
            errorText, style: const TextStyle(color: Colors.red)),
        const Padding(padding: EdgeInsets.only(top: 10),),
        const Text(
          'Username/Логин',
          style: sizeTextBlack,
        ),
        const Padding(padding: EdgeInsets.only(top: 10),),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        const Padding(padding: EdgeInsets.only(top: 10),),
        const Text(
          'Password/Пароль',
          style: sizeTextBlack,
        ),
        const Padding(padding: EdgeInsets.only(top: 10),),
        TextField(
          decoration: textFieldDecorator,
          controller: _passwordTextController,
          obscureText: true,
        ),
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(right: 10, top: 50),),
            TextButton.icon(
              style: AppButtonStyle.blueButton,
              onPressed: _enter,
              label: const Text('Enter/Войти'),
              icon: const Icon(Icons.account_box_outlined),
            ),
          ],
        )
      ],
    );
  }
}

