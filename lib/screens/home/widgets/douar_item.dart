import 'package:alhaouz/models/douar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:alhaouz/models/job.dart';
import 'icon_text.dart';

class DouarItem extends StatefulWidget {
  const DouarItem({Key? key, required this.douar})
      : super(key: key);


  final Datum douar;

  @override
  State<DouarItem> createState() => _JobItemState();
}

class _JobItemState extends State<DouarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.98,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 8),
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
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.grey.withOpacity(0.1),
                    ),
                    child: ProfilePicture(
                      name: widget.douar.nomFr!,
                      radius: 20,
                      fontsize: 16,
                      random: true,
                    )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.57,
                    child: Text(
                      widget.douar!.nomFr! +" | "+ widget.douar!.nomAr!,

                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    //widget.job.isMark = !widget.job.isMark;
                    // if(selected = true)
                    //   selected=false;
                  });
                },
                child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.grey.withOpacity(0.1),
                    ),
                 child: widget.douar.status == 0 ?
                 Image.asset("assets/icons/warning.png") :  Image.asset("assets/icons/danger.png")

                ),
              ),
            ],
          ),

          /*Text(
            widget.job.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),*/
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                  icon: Icons.location_on_outlined, text: "#" + widget.douar.id.toString() +" "+ widget.douar.communeFr.toString()),

                IconText(
                    icon: Icons.access_time_outlined, text: widget.douar.codeCommune!.toString())
            ],
          ),
        ],
      ),
    );
  }
}