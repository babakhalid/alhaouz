import 'package:alhaouz/screens/home/widgets/icon_text.dart';
import 'package:flutter/material.dart';

import 'event_model.dart';


class JobItem extends StatefulWidget {
  JobItem({Key? key, required this.job, this.showTime = false})
      : super(key: key);

  final Job job;
  final bool showTime;

  @override
  State<JobItem> createState() => _JobItemState();
}

class _JobItemState extends State<JobItem> {
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
                  widget.job.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Image.asset("assets/icons/arrow.png"),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  widget.job.logoUrl,
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
                        widget.job.location,
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
                          widget.job.time,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
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