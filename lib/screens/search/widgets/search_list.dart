import 'package:flutter/material.dart';
import 'package:alhaouz/models/job.dart';
import 'package:alhaouz/screens/home/widgets/douar_item.dart';


class SearchList extends StatelessWidget {
  SearchList({Key? key}) : super(key: key);
  final jobList=Job.generateJobs();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      /*child:
      ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => DouarItem(
            job: jobList[index],
            showTime: true,
          ),
          separatorBuilder: (_, index) => SizedBox(
            height: 15,
          ),
          itemCount: jobList.length),*/
    );
  }
}