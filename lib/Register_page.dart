import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_1/Login_page.dart';
import 'package:flutter_test_1/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;
  bool _isObscure = true;
  bool _isObscure1 = true;
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
        hintText: 'Email',
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
      obscureText: _isObscure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
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

    final passwordConfirm = TextFormField(
      autofocus: false,
      obscureText: _isObscure1,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(_isObscure1 ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isObscure1 = !_isObscure1;
              });
            }),
        filled: true,
        fillColor: const Color(0xffF5F7F6),
        hintText: 'Подтверждение пароля',
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

    final chechBox = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color(0xff44C9C5);
            }
            return const Color(0xff44C9C5);
          }),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const SizedBox(height: 8.0),
        Flexible(
          child: RichText(
            text: TextSpan(
                text: 'Я принимаю условия',
                style: const TextStyle(color: Color(0xff0C1827), fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          ' Пользовательского солашения и Политики конфиденциальности',
                      style: const TextStyle(
                          color: Color(0xff44C9C5), fontSize: 12),
                      recognizer: TapGestureRecognizer()..onTap = () {})
                ]),
          ),
        ),
        // const Flexible(
        //   child: Text(
        //       "Я принимаю условия Пользовательского солашения и Политики конфиденциальности",
        //       style: TextStyle(
        //         fontSize: 12,
        //       )),
        // )
      ],
    );

    final register = Container(
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
        child: const Text('Зарегистрироваться',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            )),
      ),
    );

    final login = Center(
      child: TextButton(
        child: const Text(
          'Войти',
          style: TextStyle(color: Color(0xFF44C9C5), fontSize: 16),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
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
            passwordConfirm,
            const SizedBox(height: 20.0),
            chechBox,
            const SizedBox(height: 113.0),
            register,
            const SizedBox(height: 11.0),
            login
          ],
        ),
      ),
    );
  }
}
