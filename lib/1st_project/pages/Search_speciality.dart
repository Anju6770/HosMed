import 'package:batch_bhutan/1st_project/data/1doctors_list.dart';
import 'package:batch_bhutan/1st_project/data/specialty_list.dart';
import 'package:batch_bhutan/1st_project/model/specialty.dart';
import 'package:batch_bhutan/1st_project/pages/1doctors_home.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';

class SearchDoc extends StatefulWidget {
  const SearchDoc({super.key});

  @override
  State<SearchDoc> createState() => _SearchDocState();
}

class _SearchDocState extends State<SearchDoc> {
  TextEditingController _controller = TextEditingController();
  List<Specialty> _filteredDocs = jobs;

  void _filterDocs(String query) {
    List<Specialty> result = [];
    if (query.isEmpty) {
      result = jobs;
    } else {
      result = jobs
          .where((docs) =>
          docs.name.toLowerCase().contains(query.toLowerCase()))
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
        title: Text('Search Hospital'),
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
                  Specialty doc = _filteredDocs[index];
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>detailsOfDoctors(category: listed[index],)));
                    },
                    child: ListTile(
                      leading: Container(
                        margin: EdgeInsets.all(5),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: AssetImage(doc.image),fit: BoxFit.cover),
                            color: Colors.blueAccent
                          ),),
                      title: Text(doc.name),
                      subtitle: Text(doc.doc),
                    ),
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
