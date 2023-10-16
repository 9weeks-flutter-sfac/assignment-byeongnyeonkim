import 'package:flutter/material.dart';
import 'package:profileapp/model/company.dart';

class CompanyTile extends StatelessWidget {
  const CompanyTile({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            style: TextStyle(
              fontSize: 24,
            ),
            'Company'),
        Text(company.name),
        SizedBox(height: 8),
        Text(company.catchPhrase),
        SizedBox(height: 8),
        Text(company.bs),
      ],
    );
  }
}
