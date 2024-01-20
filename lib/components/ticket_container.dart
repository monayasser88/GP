import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';

class TicketContainer extends StatelessWidget {
    const TicketContainer({
    super.key,
    required this.title, required this.description
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child:  Material(
        elevation: 10,
        child: SizedBox(
          width: double.infinity,
          height: 160,
          child: Stack(children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(color: kPrimaryColor, width: 5),
                      bottom: BorderSide(color: kPrimaryColor, width: 5),
                      left: BorderSide(color: Colors.grey, width: .5),
                      top: BorderSide(color: Colors.grey, width: .5))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              //'Egypt',
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              description,
                              //'pyramids plllllll llalallllllll lllllalalala lllllmiuvhj huygtvbm pmpmp mpmmpmm pmpm pmpmpkj hgfds asdfg hjkjhg fdfghj',
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                              maxLines: 3,
                              //overflow: TextOverflow.clip,
                              //softWrap: true,
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.clear_rounded,
                      size: 30,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
