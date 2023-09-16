import 'package:alhaouz/screens/home/widgets/icon_text.dart';
import 'package:flutter/material.dart';

import '../../models/association.dart';




class AssociationItem extends StatefulWidget {
  AssociationItem({Key? key, required this.association, this.showTime = false})
      : super(key: key);

  final Datum association;
  final bool showTime;

  @override
  State<AssociationItem> createState() => _JobItemState();
}

class _JobItemState extends State<AssociationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  widget.association.nameFr! + " | " + widget.association.nameAr!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(

                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        widget.association.adresse!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),

              Container(

                child: Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        widget.association.type!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}