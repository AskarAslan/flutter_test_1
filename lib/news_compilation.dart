import 'package:flutter/material.dart';

class NewsCompilation extends StatefulWidget {
  const NewsCompilation({super.key});

  @override
  State<NewsCompilation> createState() => _NewsCompilationState();
}

class _NewsCompilationState extends State<NewsCompilation> {
  @override
  Widget build(BuildContext context) {
    final skip = Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 44, right: 16),
        child: SizedBox(
          height: 52,
          width: 110,
          child: TextButton(
            child: const Text(
              "Пропустить",
              style: TextStyle(color: Color(0xFF44C9C5), fontSize: 16),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );

    final text = RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'Добро пожаловать в',
          style: TextStyle(color: Color(0xff0C1827), fontSize: 20),
          children: <TextSpan>[
            TextSpan(
              text: '\ninVoice',
              style: TextStyle(color: Color(0xff44C9C5), fontSize: 20),
            )
          ]),
    );

    const text1 = Center(
      child: Text(
        'Давайте соберем вашу первую \nновостную подборку',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 14),
      ),
    );

    final form1 = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF5F7F6),
        hintText: 'Как назовём подборку?',
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
    final form2 = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF5F7F6),
        hintText: 'Язык новостей',
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
    final form3 = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF5F7F6),
        hintText: 'Категория',
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
    final form4 = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF5F7F6),
        hintText: 'Подкатегория',
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
            onPressed: () {},
            child: const Text('Сохранить',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            skip,
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              children: <Widget>[
                const SizedBox(height: 48.0),
                text,
                const SizedBox(height: 20.0),
                text1,
                const SizedBox(height: 24.0),
                form1,
                const SizedBox(height: 16.0),
                form2,
                const SizedBox(height: 16.0),
                form3,
                const SizedBox(height: 16.0),
                form4,
                const SizedBox(height: 16.0),
                loginButton
              ],
            ),
          ],
        ),
      ),
    );
  }
}
