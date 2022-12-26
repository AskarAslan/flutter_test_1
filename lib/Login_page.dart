import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_1/Register_page.dart';
import 'package:flutter_test_1/auth_service.dart';
import 'package:flutter_test_1/home_page.dart';
import 'package:flutter_test_1/language_cubit.dart';
import 'package:flutter_test_1/news_compilation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<String> items = ['Ru', 'Kk', 'En'];
  Map<String, String> items2 = {"Ru": "ru", "Kk": "kk", "En": "en"};
  String? selectedItem = 'Ru';
  void validateEmail(String val) {
    RegExp regexLogin = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val.isEmpty) {
      setState(() {
        _errorMessageLogin = "Email can not be empty";
      });
    } else if (!regexLogin.hasMatch(val)) {
      setState(() {
        _errorMessageLogin = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessageLogin = "";
      });
    }
  }

  void validatePassword(String val) {
    RegExp regexPassword =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

    if (val.isEmpty) {
      setState(() {
        _errorMessagePassword = "Password can not be empty";
      });
    } else if (!regexPassword.hasMatch(val)) {
      setState(() {
        _errorMessagePassword = "Invalid Password";
      });
    } else {
      setState(() {
        _errorMessagePassword = "";
      });
    }
  }

  String _errorMessageLogin = '';
  String _errorMessagePassword = '';
  @override
  void initState() {
    loginController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dropdown = Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 16),
        child: SizedBox(
          height: 64,
          width: 64,
          child: DropdownButtonFormField<String>(
            borderRadius: BorderRadius.circular(12),
            icon: const Visibility(
                visible: false, child: Icon(Icons.arrow_downward)),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF5F7F6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
            value: selectedItem,
            items: items.map(
              (item) {
                return DropdownMenuItem<String>(
                    value: item,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ));
              },
            ).toList(),
            onChanged: (item) {
              setState(() {
                selectedItem = item;
                context
                    .read<LanguageCubit>()
                    .changeLang(context, items2[item]!);
              });
            },
          ),
        ),
      ),
    );

    final logo = Padding(
      padding: const EdgeInsets.only(left: 110, right: 110),
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
      onChanged: (val) {
        validateEmail(val);
      },
      controller: loginController,
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
      onChanged: (val) {
        validatePassword(val);
      },
      controller: passwordController,
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

    final loginButton = Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
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
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewsCompilation(),
                  ),
                );
              }
            },
            child: const Text('Войти',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            _errorMessageLogin,
            style: const TextStyle(color: Colors.red),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            _errorMessagePassword,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    );

    final text = Center(
      child: Text(
        AppLocalizations.of(context)!.settings,
        // 'Или войдите через другие сервисы',
        style: const TextStyle(color: Color(0xFF081320), fontSize: 16),
      ),
    );

    final otherAuth = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 169,
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
          child: GestureDetector(
            child: Container(
              width: 169,
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
            onTap: () {
              AuthService().signInWithGoogle();
            },
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
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
              (Route<dynamic> route) => false);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              dropdown,
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                children: <Widget>[
                  const SizedBox(height: 19.0),
                  logo,
                  const SizedBox(height: 60.0),
                  email,
                  const SizedBox(height: 16.0),
                  password,
                  const SizedBox(height: 16.0),
                  loginButton,
                  const SizedBox(height: 9.0),
                  text,
                  const SizedBox(height: 26.0),
                  otherAuth,
                  const SizedBox(height: 20.0),
                  forgotLabel,
                  const SizedBox(height: 38.0),
                  register
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
