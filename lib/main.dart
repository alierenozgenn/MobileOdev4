import 'package:flutter/material.dart';

void main() => runApp(UrunUygulamasi());

class UrunUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UrunEkrani(),
    );
  }
}

class UrunEkrani extends StatefulWidget {
  @override
  _UrunEkraniState createState() => _UrunEkraniState();
}

class _UrunEkraniState extends State<UrunEkrani> {
  // Ürün listesi
  final List<Map<String, dynamic>> urunler = [
    {'isim': 'Ürün 1', 'fiyat': 50},
    {'isim': 'Ürün 2', 'fiyat': 75},
    {'isim': 'Ürün 3', 'fiyat': 100},
    {'isim': 'Ürün 4', 'fiyat': 150},
    {'isim': 'Ürün 5', 'fiyat': 200},
    {'isim': 'Ürün 6', 'fiyat': 250},
  ];

  int seciliUrunIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Listesi"),
      ),
      body: Column(
        children: [
          // Yatay ListView
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: urunler.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      seciliUrunIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: seciliUrunIndex == index
                          ? Colors.blueAccent
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        urunler[index]['isim'],
                        style: TextStyle(
                          color: seciliUrunIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // GridView
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: urunler.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      seciliUrunIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: seciliUrunIndex == index
                          ? Colors.blue[100]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: seciliUrunIndex == index
                            ? Colors.blue
                            : Colors.grey[400]!,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            urunler[index]['isim'],
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${urunler[index]['fiyat']} TL',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
