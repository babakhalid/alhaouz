import 'dart:ui';
import 'package:alhaouz/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:alhaouz/models/douar.dart';
import 'package:alhaouz/models/job.dart';
import 'package:alhaouz/screens/details/details_page.dart';
import 'package:alhaouz/utils/network/api_rest.dart';
import 'job_details.dart';
import 'douar_item.dart';

class DouarsList extends StatefulWidget {
  DouarsList({Key? key, required this.filter, required this.zone}) : super(key: key);
  final String filter;
  final String zone;

  @override
  State<DouarsList> createState() => _JobListState();
}

class _JobListState extends State<DouarsList> {
  final jobList = Job.generateJobs();

  List<Datum> data = [];

  bool isLoading = false;

  bool isLastPage = false;

  bool load = false;

  int page = 1;

  late Map req;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is ScrollEndNotification) {
          if (!isLastPage && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            page++;
            load = true;
            isLoading = true;

            setState(() {});
          }
        }
        return isLastPage;
      },
        child: FutureBuilder<Douar>(
        future: getDouarList(widget.filter, page, widget.zone),
        builder: (_, snap) {
          if (snap.hasData) {
            isLastPage = snap.data!.data!.length != 10;

            if (page == 1) data.clear();
            if (page == snap.data!.currentPage) {
              data.addAll(snap.data!.data!);
              load = false;
            }
              if(data.isEmpty){
                return const Center(child: Text("لم يتغير وضع أي دوار في هذه الفئة", style: titleStyle, ),);
              }else {
                return Column(
                  children: [
                    ListView.builder(
                      itemCount: data.length,
                      padding: EdgeInsets.all(8),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var getListData = data[index];
                        return GestureDetector(
                          onTap: (){
                            Get.to(DetailsDouar(douar: getListData,));
                            //SchoolDetails(school: getListData).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                          },
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: DouarItem( douar: getListData, )),
                        );
                      },
                    ).expand(),
                    Loader().visible(load)
                  ],
                );
              }
            }
            return snapWidgetHelper(snap);
          },
        ),
      );
  }
}