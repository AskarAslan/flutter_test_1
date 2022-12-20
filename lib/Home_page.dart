import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int _selectedIndex = 0;

  final PageController controller = PageController();
  List<String> images = [
    "assets/Rectangle 2522.png",
    "assets/Rectangle 2522.png",
    "assets/Rectangle 2522.png",
  ];
  List<String> news = [
    "assets/Untitled/Ellipse 119.png",
    "assets/Untitled/Ellipse 119.png",
    "assets/Untitled/Ellipse 119.png",
    "assets/Untitled/Ellipse 119.png",
    "assets/Untitled/Ellipse 119.png",
    "assets/Untitled/Ellipse 119.png",
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final search = TextFormField(
      style:
          const TextStyle(color: Color.fromRGBO(60, 60, 67, 0.6), fontSize: 17),
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(0.0),
          child: Icon(
            Icons.search,
            color: Color.fromRGBO(60, 60, 67, 0.6),
          ), // icon is 48px widget.
        ),
        filled: true,
        fillColor: const Color(0xffF5F7F6),
        hintText: 'Поиск',
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

    final slider = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          height: 120,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index % images.length;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    images[index % images.length],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < images.length; i++)
              buildIndicator(currentIndex == i)
          ],
        ),
      ],
    );

    final title1 = Row(
      children: <Widget>[
        Image.asset(
          ("assets/Group 289210.png"),
        ),
        const SizedBox(width: 8.0),
        const Text(
          'Популярно сегодня',
          style: TextStyle(color: Color(0xFF0C1827), fontSize: 20),
        )
      ],
    );

    final popular = Center(
      child: SizedBox(
        height: 200,
        child: ListView.separated(
          padding: const EdgeInsets.only(right: 16, bottom: 8, top: 16),
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          separatorBuilder: ((context, _) => const SizedBox(
                width: 16,
              )),
          itemBuilder: (context, index) => buildCard(),
        ),
      ),
    );

    final title2 = Row(
      children: <Widget>[
        Image.asset(
          ("assets/Group 289210.png"),
        ),
        const SizedBox(width: 8.0),
        const Text(
          'Мой новостной поток',
          style: TextStyle(color: Color(0xFF0C1827), fontSize: 20),
        )
      ],
    );

    final newsCard = SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: const Color(0xFFF5F5F5),
            child: Column(
              children: [
                Image.asset(
                  "assets/Untitled/Ellipse 119.png",
                  height: 104,
                  width: 104,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 4),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Название',
                    style: TextStyle(
                      color: Color(0xFF0C1827),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

    final body = SizedBox(
      child: Column(
        children: <Widget>[
          search,
          const SizedBox(height: 24),
          slider,
          title1,
          popular,
          title2,
          newsCard
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(top: 56, left: 16.0, right: 16.0),
          children: <Widget>[
            body,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/Vector (1).png"),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Vector.png"),
            label: 'Мой стрим',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Ellipse 119.png"),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff44C9C5),
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget buildIndicator(bool isSelected) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
    child: Container(
      height: isSelected ? 8 : 8,
      width: isSelected ? 8 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? const Color(0xff0C1827) : const Color(0xffD9D9D9),
      ),
    ),
  );
}

Widget buildCard() => SizedBox(
      height: 132,
      width: 132,
      child: Column(children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Material(
                child: Ink.image(
              image: const AssetImage("assets/Rectangle 320.png"),
              fit: BoxFit.fill,
              child: InkWell(
                onTap: () {},
              ),
            )),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const Text(
          "Кошка спрыгнула с 25",
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
          style: TextStyle(color: Color.fromRGBO(12, 24, 39, 1), fontSize: 14),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "BBC",
            style:
                TextStyle(color: Color.fromRGBO(12, 24, 39, 0.5), fontSize: 14),
          ),
        )
      ]),
    );
