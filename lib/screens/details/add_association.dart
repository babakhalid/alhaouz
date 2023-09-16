import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/consts.dart';

class AddAssociationDialog extends StatefulWidget {
  final String id_douar;

  const AddAssociationDialog({super.key, required this.id_douar});
  @override
  _AddAssociationDialogState createState() => _AddAssociationDialogState();
}

class _AddAssociationDialogState extends State<AddAssociationDialog> {
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
      title: Text('إضافة جمعية'),
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
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'العنوان',
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