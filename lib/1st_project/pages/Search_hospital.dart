import 'package:batch_bhutan/1st_project/data/Home_list.dart';
import 'package:batch_bhutan/1st_project/data/docs_list.dart';
import 'package:batch_bhutan/1st_project/model/Home_model.dart';
import 'package:batch_bhutan/1st_project/pages/1hospital.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';

class SearchDoc extends StatefulWidget {
  const SearchDoc({super.key});

  @override
  State<SearchDoc> createState() => _SearchDocState();
}

class _SearchDocState extends State<SearchDoc> {
  TextEditingController _controller = TextEditingController();
  List<HomeModel> _filteredDocs = hospital;


  void _filterDocs(String query) {
    List<HomeModel> result = [];
    if (query.isEmpty) {
      result = hospital;
    } else {
      result = hospital
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
                  HomeModel doc = _filteredDocs[index];
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>hospitalProject(homeModel: hospital[index], dos: allDocs[index], index: index,)));
                    },
                    child: ListTile(
                      leading: Image.asset(doc.image, width: 70, height: 70),
                      title: Text(doc.name),
                      subtitle: Text(doc.location),
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
