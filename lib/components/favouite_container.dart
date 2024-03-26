import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_text.dart';
import 'package:gp_project/constraints.dart';

class FavoriteContainer extends StatelessWidget {
  const FavoriteContainer(
      {super.key,
      // required this.title,
      // required this.description,
      // required this.image
      });
  // final String title;
  // final String description;
  // final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        elevation: 10,
        child: SizedBox(
          width: double.infinity,
          height: 160,
          child: Stack(children: [
            Container(
                decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(color: kPrimaryColor, width: 5),
                      bottom: BorderSide(color: kPrimaryColor, width: 5),
                      left: BorderSide(color: Colors.grey, width: .5),
                      top: BorderSide(color: Colors.grey, width: .5)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        //image: AssetImage(image),
                        image: AssetImage('assets/congratsImage.png'),
                        height: 250,
                        width: 130,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: 8, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(title: 'pyramids',),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                //description,
                                'pyramids plllllll llalallllllll lllllalalala lllllmiuvhj huygtvbm pmpmp mpmmpmm pmpm pmpmpkj hgfds asdfg hjkjhg fdfghj',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Icon(
                          Icons.clear_rounded,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
