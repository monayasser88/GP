import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';

class TicketContainer extends StatefulWidget {
  const TicketContainer({
    Key? key,
    required this.onTotalChanged,
    //required this.title, required this.description
  }) : super(key: key);
  final ValueChanged<double?> onTotalChanged;
  @override
  State<TicketContainer> createState() => _TicketContainerState();
}

class _TicketContainerState extends State<TicketContainer> {
  int selectedQuantity = 1;
  //int? price;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        elevation: 10,
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: Stack(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: kPrimaryColor, width: 5),
                    bottom: BorderSide(color: kPrimaryColor, width: 5),
                    left: BorderSide(color: Colors.grey, width: .5),
                    top: BorderSide(color: Colors.grey, width: .5),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Egypt',
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'pyramids plllllll llalallllllll lllllalalala lllllmiuvhj huygtvbm pmpmp mpmmpmm pmpm pmpmpkj hgfds asdfg hjkjhg fdfghj',
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Qty: ',
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  height: 40, // Set a specific height
                                  child: DropdownButton<int>(
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      color: kPrimaryColor,
                                      size: 22,
                                    ),
                                    // dropdownColor:
                                    //     Color.fromARGB(255, 255, 240, 189),
                                    value: selectedQuantity,
                                    onChanged: (newQuantity) {
                                      setState(() {
                                        selectedQuantity = newQuantity!;
                                        // Calculate and update total using the callback
                                        widget.onTotalChanged(
                                            200 * selectedQuantity.toDouble());
                                      });
                                    },
                                    items: List.generate(5, (index) {
                                      return DropdownMenuItem<int>(
                                        value: index + 1,
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.clear_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '200',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
