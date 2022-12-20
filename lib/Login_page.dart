import 'package:flutter/material.dart';
import 'package:flutter_test_1/Register_page.dart';
import 'package:flutter_test_1/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: const EdgeInsets.only(left: 110, right: 110, top: 100),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Image.asset(
          "assets/Frame44.png",
          fit: BoxFit.contain,
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF5F7F6),
        hintText: 'Логин',
        contentPadding: const EdgeInsets.only(left: 10, top: 16, bottom: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF5F7F6),
        hintText: 'Пароль',
        contentPadding: const EdgeInsets.only(left: 10, top: 16, bottom: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );

    final loginButton = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF4AD1C5),
            Color(0xFF239CC6),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(48, 173, 198, 0.24),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          disabledForegroundColor: Colors.transparent.withOpacity(0.38),
          disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
        child: const Text('Войти',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            )),
      ),
    );

    const text = Center(
      child: Text(
        'Или войдите через другие сервисы',
        style: TextStyle(color: Color(0xFF081320), fontSize: 16),
      ),
    );

    final otherAuth = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: const Color(0xffF5F7F6),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    ("assets/logos_facebook.png"),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Facebook',
                    style: TextStyle(color: Color(0xFF081320), fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: const Color(0xffF5F7F6),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 29, right: 30, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    ("assets/flat-color-icons_google.png"),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Google',
                    style: TextStyle(color: Color(0xFF081320), fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final forgotLabel = Center(
      child: TextButton(
        child: const Text(
          'Забыли пароль?',
          style: TextStyle(color: Color(0xFF44C9C5), fontSize: 16),
        ),
        onPressed: () {},
      ),
    );
    final register = Center(
      child: TextButton(
        child: const Text(
          'Регистрация',
          style: TextStyle(color: Color(0xFF44C9C5), fontSize: 16),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ),
          );
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          children: <Widget>[
            logo,
            const SizedBox(height: 60.0),
            email,
            const SizedBox(height: 16.0),
            password,
            const SizedBox(height: 16.0),
            loginButton,
            const SizedBox(height: 39.0),
            text,
            const SizedBox(height: 26.0),
            otherAuth,
            const SizedBox(height: 20.0),
            forgotLabel,
            const SizedBox(height: 38.0),
            register
          ],
        ),
      ),
    );
  }
}
