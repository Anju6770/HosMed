import 'package:batch_bhutan/1st_project/data/pharmacy_list.dart';
import 'package:batch_bhutan/1st_project/model/pharmacy_model.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';

class SearchDoc extends StatefulWidget {
  const SearchDoc({super.key});

  @override
  State<SearchDoc> createState() => _SearchDocState();
}

class _SearchDocState extends State<SearchDoc> {
  TextEditingController _controller = TextEditingController();
  List<MedicineShopModel> _filteredDocs = allMedicineShopData;


  void _filterDocs(String query) {
    List<MedicineShopModel> result = [];
    if (query.isEmpty) {
      result = allMedicineShopData;
    } else {
      result = allMedicineShopData
          .where((docs) =>
          docs.shopName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredDocs = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Pharmacy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: Icon(Icons.search,color: primaryColor,size: 30,),
                suffixIcon: Icon(Icons.keyboard_voice_rounded, size: 30,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value){
                _filterDocs(value);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredDocs.length,
                itemBuilder: (context, index) {
                  MedicineShopModel doc = _filteredDocs[index];
                  return ListTile(
                    leading: Image.asset(doc.shopUrl, width: 70, height: 70),
                    title: Text(doc.shopName),
                    subtitle: Text(doc.location),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
