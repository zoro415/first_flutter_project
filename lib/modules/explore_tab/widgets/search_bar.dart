import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'custom_search_delegate.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: CustomSearchDelegate());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: EdgeInsets.all(15),
        //while using decoration attribute, we cannot use color attribute of conatiner
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(Icons.search_outlined),
            SizedBox(
              width: 10,
            ),
            Text(
              'Search for products',
              style: TextStyle(color: greyColor),
            )
          ],
        ),
      ),
    );
  }
}
