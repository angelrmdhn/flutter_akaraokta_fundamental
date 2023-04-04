import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double angkaHasil = 0;
  var txtAngka1 = TextEditingController();
  var txtAngka2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          SizedBox(height: 20),
          hasil(),
          SizedBox(height: 20),
          isiAngka('First Number', txtAngka1),
          SizedBox(height: 20),
          isiAngka('Second Number', txtAngka2),
          SizedBox(height: 20),
          Row(
            children: [
              tombolKiri(penjumlahan, '+'),
              SizedBox(width: 42),
              tombolKanan(pengurangan, '-'),
            ],
          ),
          SizedBox(height: 36),
          Row(
            children: [
              tombolKiri(perkalian, 'x'),
              SizedBox(width: 42),
              tombolKanan(pembagian, '/'),
            ],
          ),
          SizedBox(height: 36),
        ],
      ),
    ));
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
        child: Container(
          height: 80,
          color: Colors.lightGreen,
          child: Container(
            margin: EdgeInsets.only(top: 28, bottom: 28, left: 20),
            child: Text('Calculator',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF))),
          ),
        ),
        preferredSize: Size.fromHeight(80));
  }

  Widget isiAngka(String hurufKu, TextEditingController controller) {
    return Container(
      width: 317,
      height: 70,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        style: TextStyle(fontSize: 20),
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: hurufKu,
            hintStyle: TextStyle(fontSize: 20),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: 2))),
      ),
    );
  }

  Widget hasil() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Result = $angkaHasil',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget tombolKiri(VoidCallback pasDitekan, String simbol) {
    return Container(
      width: 100,
      height: 80,
      margin: EdgeInsets.only(left: 55, right: 55),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.lightGreen,
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: pasDitekan,
          child: Center(child: Text(simbol))),
    );
  }

  Widget tombolKanan(VoidCallback pasDitekan, String simbol) {
    return Container(
      width: 100,
      height: 80,
      margin: EdgeInsets.only(right: 2, left: 2),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.lightGreen,
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          onPressed: pasDitekan,
          child: Center(child: Text(simbol))),
    );
  }

  void penjumlahan() {
    setState(() {
      angkaHasil = double.parse(txtAngka1.text) + double.parse(txtAngka2.text);
    });
  }

  void pengurangan() {
    setState(() {
      angkaHasil = double.parse(txtAngka1.text) - double.parse(txtAngka2.text);
    });
  }

  void perkalian() {
    setState(() {
      angkaHasil = double.parse(txtAngka1.text) * double.parse(txtAngka2.text);
    });
  }

  void pembagian() {
    setState(() {
      angkaHasil = double.parse(txtAngka1.text) / double.parse(txtAngka2.text);
    });
  }
}
