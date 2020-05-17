import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerornek/model/chart_provider.dart';
import 'package:providerornek/view/chart_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var charProvider = Provider.of<ChartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Listesi"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChartList(),
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: charProvider.getUrunlerim().length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(
                          icon: Icon(
                            charProvider.getSepetim().contains(
                                    charProvider.getUrunlerim()[index])
                                ? Icons.remove_shopping_cart
                                : Icons.add_shopping_cart,
                            color: Colors.lightBlueAccent,
                          ),
                          onPressed: () {
                            charProvider.sepetIslemi(
                                charProvider.getUrunlerim()[index]);
                          }),
                      title: Text(charProvider.getUrunlerim()[index].urun),
                      subtitle: Text(
                          charProvider.getUrunlerim()[index].fiyat.toString() +
                              "TL"),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
