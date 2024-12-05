import 'package:flutter/material.dart';
import 'materials.dart';

class DetailCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Materials().header(Materials().getFootColors()[0], 'DETAIL PRODUK'),
      body: Center(
        child: Materials().marketcard('images/pict-toko.png'),
      ),
    );
  }
}