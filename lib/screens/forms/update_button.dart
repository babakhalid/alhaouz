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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _populationController = TextEditingController();
  TextEditingController _blesseController = TextEditingController();
  TextEditingController _mortController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _populationController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Population'),
          ),
          TextField(
            controller: _blesseController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Blessé'),
          ),
          TextField(
            controller: _mortController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Mort'),
          ),


        ],
      ),
    );
  }
}