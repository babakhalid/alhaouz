import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/consts.dart';

class AddContactDialog extends StatefulWidget {
  @override
  _AddContactDialogState createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('إضافة جهة إتصال'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'الإسم',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'الهاتف',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        AppButton(
          text: 'تحديت',
          textStyle: titleStyle,
          color: Colors.white,
          onTap: (){

          },
        ),
      ],
    );
  }
}