import 'package:flutter/material.dart';

class EmptyRadioList extends StatelessWidget {
  const EmptyRadioList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No Radio Stations avialable for the filters selected 😔",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 32),
        textAlign: TextAlign.center,
      ),
    );
  }
}
