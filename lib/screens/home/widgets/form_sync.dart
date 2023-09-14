import 'package:alhaouz/models/association.dart';
import 'package:alhaouz/models/douar.dart' as d;
import 'package:alhaouz/utils/consts.dart';
import 'package:alhaouz/utils/network/api_rest.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomFormPage extends StatefulWidget {
  @override
  _CustomFormPageState createState() => _CustomFormPageState();
}

class _CustomFormPageState extends State<CustomFormPage> {

   List<Datum>? _association;
   List<d.Datum>? _douar;

  List<Map<String, dynamic>> douars = [
    {
      "name": "Douar 1",
      "value": 1,
    },
    {
      "name": "Douar 2",
      "value": 2,
    },
    // Add more douars here
  ];

  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAssociationList().then((fetchedData) {
      setState(() {
        _association = fetchedData.data!;
        // Similarly set the `douars` if it's a separate API call
      });
    });

    getAllDouarList().then((fetchedData) {
      setState(() {
        _douar = fetchedData.data!;
        // Similarly set the `douars` if it's a separate API call
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Coordination',),
      backgroundColor: buttoncolor,),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MultiSelectDialogField(
                items: _association!.map((association) {
                  return MultiSelectItem(
                      association.nameFr, association.nameFr!);
                }).toList(),
                searchable: true,
                title: const Text("Associations", style: titleStyle,),
                selectedColor: buttoncolor,
                onConfirm: (results) {
                  //_selectedAnimals = results;
                },
              ),
              SizedBox(height: 20),
              MultiSelectDialogField(
                items: _douar!.map((douar) {
                  return MultiSelectItem(douar.nomFr, douar.nomFr!);
                }).toList(),
                title: Text("Douar", style: titleStyle,),
                searchable: true,
                selectedColor: buttoncolor,
                onConfirm: (results) {
                  //_selectedAnimals = results;
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 20),

              AppButton(
                text: 'تحديت',
                textStyle: titleStyle,
                color: Colors.white,
                onTap: (){

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
