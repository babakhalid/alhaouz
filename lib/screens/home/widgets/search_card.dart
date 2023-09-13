import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alhaouz/screens/search/search_screen.dart';

import '../../search/widgets/search_example.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36.0),
      child: Container(
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          image: DecorationImage(
            image: AssetImage('assets/images/atlas.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen(),),),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/search.png',
                      width: 20,
                    ),SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}