import 'package:flutter/material.dart';

class HomePageBookView extends StatelessWidget {
 final String? bookCover;
 final String? bookName;

 HomePageBookView({@required this.bookCover, @required this.bookName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black,
                  width: 2
              ),
            ),
            child: Image.asset(
              bookCover!,
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
            child: Text(
              bookName!.toUpperCase(),
              style: TextStyle(
                  fontFamily: "voll",
                  fontWeight: FontWeight.bold,
                  fontSize: 9
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}