import 'package:flutter/material.dart';
import 'package:test_wordperess/api/store_api.dart';
import 'package:test_wordperess/models/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late Future<List<Product>?> listproduct;

  @override
  void initState() {
    listproduct = fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<List<Product>?>(
        future: fetchAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found.'));
          } else {
            var listproduct = snapshot.data!;
            return ListView.builder(
              itemCount: listproduct.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width,
                          height: size.height * 0.3,
                          child: listproduct[index].images != null &&
                                  listproduct[index].images!.isNotEmpty
                              ? Image.network(listproduct[index].images![0])
                              : const Icon(Icons.image_not_supported),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(listproduct[index].name ?? 'No Name'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                              '${listproduct[index].price ?? 'No Price'} تومان'),
                        ),
                        const SizedBox(height: 20)
                      ],
                    ));
              },
            );
          }
        },
      ),
    );
  }
}



/*
ListTile(
                    title: Text(listproduct[index].name ?? 'No Name'),
                    subtitle:
                        Text('${listproduct[index].price ?? 'No Price'} تومان'),
                    leading: listproduct[index].images != null &&
                            listproduct[index].images!.isNotEmpty
                        ? Image.network(listproduct[index].images![0])
                        : const Icon(Icons.image_not_supported),
                  ),
*/ 