import 'dart:ui';
import 'package:alhaouz/screens/events/event_item.dart';
import 'package:flutter/material.dart';

import 'event_details.dart';
import 'event_model.dart';


class JobList extends StatelessWidget {
  JobList({Key? key}) : super(key: key);

  final jobList = Job.generateJobs();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Stack(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: JobDetail(
                        jobList[index],
                      ),
                    ),
                  );
                },
                child: JobItem(
                  job: jobList[index],
                ),
              ),
            ],
          ),
          separatorBuilder: (_, index) => SizedBox(
            width: 15,
          ),
          itemCount: jobList.length),
    );
  }
}