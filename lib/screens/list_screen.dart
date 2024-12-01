import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item_model.dart';

class ListScreen extends StatelessWidget {
  // Contoh data dengan gambar (bisa diganti sesuai tema)
  final List<ItemModel> items = [
    ItemModel(
        id: 1,
        title: 'Nigiri Sushi',
        description:
            'Hidangan yang berisi irisan ikan mentah (sashimi) yang disajikan di atas nasi cuka (sushi) yang dibentuk lonjong.',
        imageUrl:
            'https://res.cloudinary.com/jnto/image/upload/w_1440,h_900,c_fill,f_auto,fl_lossy,q_60/v1/media/filer_public/47/7f/477f36c3-a329-437d-a571-d75cdaa73a6f/1_5_zv5jq9'),
    ItemModel(
        id: 2,
        title: 'Maki Sushi',
        description:
            'Maki terbuat dari nasi yang diisi dengan daging ikan di bagian tengahnya, lalu digulung oleh rumput laut.',
        imageUrl:
            'https://media.istockphoto.com/id/1053853732/id/foto/makanan-sushi-maki.jpg?s=612x612&w=0&k=20&c=7GXgxO-wU65kXLvbSzamWgIT9kynJIaqIAJ9_BlHxnw='),
    ItemModel(
        id: 3,
        title: 'Sashimi',
        description:
            'makanan Jepang berupa makanan laut dengan kesegaran prima yang langsung dimakan dalam keadaan mentah bersama penyedap seperti kecap asin, parutan jahe, dan wasabi.',
        imageUrl:
            'https://ik.imagekit.io/tvlk/blog/2021/01/Sashimi-shutterstock_1489742210-1024x683.jpeg?tr=dpr-2,w-675'),
    ItemModel(
        id: 4,
        title: 'Uramaki Sushi',
        description:
            'Bentuk dan isi uramaki mirip seperti maki sushi. Namun pada sushi ini bagian luarnya justru nasi, bukan nori.',
        imageUrl:
            'https://asset.kompas.com/crops/UbUPIi3fMlW1c6f7AMz6-7mELg8=/0x0:1000x667/1200x800/data/photo/2024/10/12/670a02196e4a9.jpg'),
    ItemModel(
        id: 5,
        title: 'Miso Soup',
        description:
            'Masakan Jepang berupa sup dengan bahan dasar dashi ditambah isi sup berupa sedikit makanan laut atau sayur-sayuran, dan diberi miso sebagai perasa. Sup miso dinikmati dengan mengangkat mangkuk sup dan meminum kuahnya, sedangkan isi sup dimakan menggunakan sumpit.',
        imageUrl:
            'https://frommybowl.com/wp-content/uploads/2019/06/Vegan_Miso_Soup_FromMyBowl-3.jpg'),
    ItemModel(
        id: 6,
        title: 'Ton Katsu',
        description:
            'daging babi goreng tepung), adalah masakan Jepang yang terdiri atas irisan daging babi yang dilapis tepung panir dan digoreng dalam minyak yang banyak. Terdapat dua jenis hire dan rosu. Seringkali disajikan dengan irisan kubis.',
        imageUrl:
            'https://asset.kompas.com/crops/q_rwg8bA4XoRjpKxpTEGOQvIa3M=/0x0:1000x667/1200x800/data/photo/2021/07/10/60e9106b920b3.jpeg'),
    ItemModel(
        id: 7,
        title: 'Okonomiyaki',
        description:
            ' makanan Jepang yang terbuat dari tepung terigu yang diencerkan dengan air kemudian ditambahkan kol dan telur. Berbagai bahan makanan seperti daging sapi, daging babi, ikan, cumi-cumi, udang, dan keju juga dapat ditambahkan untuk membuat okonomiyaki menjadi lebih enak.',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Okonomiyaki_001.jpg/800px-Okonomiyaki_001.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resto Jepang'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                items[index].imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image_not_supported);
                },
              ),
              title: Text(
                items[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                items[index].description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                // Navigasi ke halaman detail dengan parameter
                context.go('/detail', extra: items[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
