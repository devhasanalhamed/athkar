import 'package:athkar/app/view/pages/counter.dart';
import 'package:flutter/material.dart';



class MyInformation extends StatelessWidget {
  final String title;
  final IconData icon;
  final double width;
  final double height;

  const MyInformation({
    required this.title,
    required this.icon,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(MyCounterPage.routeName),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.deepPurple,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Icon(
                    icon,
                    size: 50,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('الفجر',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: 8),
                Text('الظهر',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: 8),
                Text('العصر',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: 8),
                Text('المغرب',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: 8),
                Text('العشاء',style: Theme.of(context).textTheme.titleSmall,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('الفجر',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: 8),
                Text('الظهر',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: 8),
                Text('العصر',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: 8),
                Text('المغرب',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: 8),
                Text('العشاء',style: Theme.of(context).textTheme.titleSmall,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
