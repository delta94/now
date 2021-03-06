import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageOrdersVerticalCard extends StatefulWidget {
  final String state;
  ManageOrdersVerticalCard({this.state});
  @override
  State<StatefulWidget> createState() => _ManageOrdersVerticalCardState();
}

class _ManageOrdersVerticalCardState extends State<ManageOrdersVerticalCard> {
  String urlToImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRcMynRQ0TtZ0YwF6jgzgqqiZ4ukK7s5Qjrg&usqp=CAU';

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.toNamed('/detailsorder/${widget.state}'),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 4.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 6.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFABBAD5),
              spreadRadius: 1.15,
              blurRadius: 1.25,
              offset: Offset(.0, 2.5), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: _size.width * .25,
              width: _size.width * .25,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(urlToImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Container(
                height: _size.width * .24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Orders - 7 Items',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: _size.width / 23.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Date: ',
                                style: TextStyle(
                                  fontSize: _size.width / 26.5,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '04/01/2021',
                                style: TextStyle(
                                  fontSize: _size.width / 28.0,
                                  color: Colors.blueAccent.shade700,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => null,
                          child: Text(
                            widget.state == 'Pending'
                                ? 'ACCEPT'
                                : widget.state == 'Ongoing'
                                    ? 'DONE'
                                    : 'VIEW DETAILS',
                            style: TextStyle(
                              fontSize: _size.width / 30.0,
                              color: Colors.blueAccent.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        GestureDetector(
                          onTap: () => null,
                          child: Text(
                            widget.state == 'Pending' ? 'CANCEL' : '',
                            style: TextStyle(
                              fontSize: _size.width / 28.0,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
