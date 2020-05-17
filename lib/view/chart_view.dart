import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerornek/model/chart_provider.dart';

class ChartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providerChart = Provider.of<ChartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepetim"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: providerChart.getSepetim().length,
                itemBuilder: (_, index) {
                  var itemValue = providerChart.getSepetim()[index];
                  return ListTile(
                    title: Text(itemValue.urun),
                    subtitle: Text(itemValue.fiyat.toString() + " TL"),
                    trailing: IconButton(
                        icon: Icon(Icons.remove_circle,
                        color: Colors.redAccent,),
                        onPressed: () {
                          providerChart.sepetIslemi(itemValue);
                        }),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: Colors.teal,
            height: 100,
            width: double.infinity,
            child: Center(
                child: Text(
                    "Total = " + providerChart.totalPrice.toString() + " TL",
                    style: TextStyle(color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),)),
          ),
        ],
      ),
    );
  }
}
