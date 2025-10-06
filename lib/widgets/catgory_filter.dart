import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class catagoryFilter extends StatelessWidget {
  const catagoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: Colors.grey,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(children: [
          Text(
            'sort by',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Gap(23),
          Image.asset('asssets/icons/Frame 39639.png'),
          Spacer(),
          Image.asset('asssets/icons/lucide_settings-2.png'),
          Gap(10),
          Text(
            'filter',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Gap(20),
          Image.asset('asssets/icons/ion_grid-outline.png'),
          Gap(20),
          Icon(Icons.verified_user_sharp)
        ]),
      ),
    );
  }
}
