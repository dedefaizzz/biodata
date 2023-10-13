import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // simpan dlm bentuk map & masukin dlm bentuk constructor
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'Dede Faiz';
    biodata['email'] = 'dedefaizzzzz@gmail.com';
    biodata['phone'] = '+628886899319';
    biodata['image'] = '20210924091134_IMG_8735_2.JPG';
    biodata['hobby'] = 'Main Game';
    biodata['address'] = 'Pedurungan, Semarang';
    biodata['describe'] = '''
Saya adalah programmer Flutter berpengalaman dengan keahlian dalam pengembangan aplikasi seluler. Selain itu, saya juga seorang gamer yang antusias. Kombinasi keahlian Flutter dan hobi bermain game membuat saya memiliki pandangan unik tentang pengembangan perangkat lunak yang kreatif dan menyenangkan. ''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BiodataKu",
      home: Scaffold(
        appBar: AppBar(title: const Text("BiodataKu")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            teksKotak(Colors.blueAccent, biodata['name'] ?? ''),
            Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
            SizedBox(height: 10),
            Row(
              children: [
                btnContact(Icons.alternate_email_rounded, Colors.lightGreen,
                    "mailto:${biodata['email']}"),
                btnContact(Icons.mark_email_unread_rounded, Colors.blueAccent,
                    "https://wa.me/${biodata['phone']}"),
                btnContact(
                    Icons.phone, Colors.deepPurple, "tel:${biodata['phone']}"),
              ],
            ),
            SizedBox(height: 10),
            textAttr("Hobby", biodata['hobby'] ?? ''),
            textAttr("Alamat", biodata['address'] ?? ''),
            SizedBox(height: 10),
            teksKotak(Colors.blueAccent, 'Deskripsi'),
            SizedBox(height: 10),
            Text(
              biodata['describe'] ?? '',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Row textAttr(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 85,
          child: Text("* $judul",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Text(" : ", style: TextStyle(fontSize: 20)),
        Text(teks, style: TextStyle(fontSize: 20))
      ],
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  Future launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
