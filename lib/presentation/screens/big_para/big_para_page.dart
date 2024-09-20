import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class BigParaPage extends StatefulWidget {
  const BigParaPage({super.key, required this.title});

  final String title;

  @override
  State<BigParaPage> createState() => _BigParaPageState();
}

class _BigParaPageState extends State<BigParaPage> {
  List<List<String>> _goldData = [];

  @override
  void initState() {
    super.initState();
    fetchGoldPrices();
  }

  Future<void> fetchGoldPrices() async {
    const url = 'https://mbigpara.hurriyet.com.tr/altin/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var document = parse(response.body);
      var tList = document.querySelector('div.tList');

      if (tList != null) {
        var ulElements = tList.querySelectorAll('ul.tBody');

        List<List<String>> goldData = [];

        for (var ul in ulElements) {
          var liElements = ul.querySelectorAll('li');
          List<String> rowData = [];
          for (var li in liElements) {
            rowData.add(li.text.trim());
          }
          if (rowData.isNotEmpty) {
            goldData.add(rowData);
          }
        }

        setState(() {
          _goldData = goldData;
        });
      } else {
        setState(() {
          _goldData = [
            ['div.tList not found']
          ];
        });
      }
    } else {
      setState(() {
        _goldData = [
          ['Failed to load data']
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gold Prices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _goldData.isNotEmpty
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(),
                  columns: const [
                    DataColumn(label: Text('Varlık')),
                    DataColumn(label: Text('Alış')),
                    DataColumn(label: Text('Satış')),
                    DataColumn(label: Text('%')),
                    DataColumn(label: Text('Saat')),
                  ],
                  rows: _goldData
                      .map((rowData) => DataRow(
                            cells: rowData.map((cellData) => DataCell(Text(cellData))).toList(),
                          ))
                      .toList(),
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
