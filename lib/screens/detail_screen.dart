import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item_model.dart';

class DetailScreen extends StatelessWidget {
  final ItemModel? item;

  // Constructor untuk menerima data dari list
  DetailScreen({this.item});

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Detail Tidak Ditemukan')),
        body: Center(child: Text('Maaf, item tidak valid')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item!.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go('/list'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar utama
            Image.network(
              item!.imageUrl,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.image_not_supported, 
                    size: 50,
                  ),
                );
              },
            ),
            
            // Konten detail
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item!.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    item!.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  // Tambahan detail bisa ditambahkan di sini
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
