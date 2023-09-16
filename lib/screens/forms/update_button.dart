import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/consts.dart';

class ButtonUpdate extends StatefulWidget {
  const ButtonUpdate({Key? key}) : super(key: key);

  @override
  State<ButtonUpdate> createState() => _ButtonUpdateState();
}

class _ButtonUpdateState extends State<ButtonUpdate> {
  void _showFormDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: FormDialog(),
          actions: [
            TextButton(
              child: Text('Close', style: subtitle,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save', style: titleStyle,),
              onPressed: () {
                //send data
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'تحديت',
      textStyle: titleStyle,
      color: Colors.white,
      onTap: _showFormDialog,
    );
  }
}
class FormDialog extends StatefulWidget {
  @override
  _FormDialogState createState() => _FormDialogState();
}

class _FormDialogState extends State<FormDialog> {

  TextEditingController _populationController = TextEditingController();
  TextEditingController _blesseController = TextEditingController();
  TextEditingController _mortController = TextEditingController();

  // Added status related variables
  List<String> _statuses = ['حاجة مستعجلة', 'إحتياج متوسط', 'تمت المساعدة'];
  String? _selectedStatus;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          TextField(
            controller: _populationController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'السكان'),
          ),
          TextField(
            controller: _blesseController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'الجرحى'),
          ),
          TextField(
            controller: _mortController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'الشهداء'),
          ),
          SizedBox(
            height: 8,
          ),
          // Adding DropdownButton for status selection
          DropdownButton<String>(
            value: _selectedStatus,
            hint: Text('Select Status'),
            items: _statuses.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedStatus = newValue!;
              });
            },
          ),

        ],
      ),
    );
  }
}
