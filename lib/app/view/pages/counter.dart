import 'package:athkar/app/view/widgets/appbar.dart';
import 'package:flutter/material.dart';

class MyCounterPage extends StatefulWidget {
  static String routeName = 'counter-page' ;
  const MyCounterPage({Key? key}) : super(key: key);

  @override
  State<MyCounterPage> createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'السبحة الإلكترونية',isHomePage: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('سبحان الله'),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.8)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '50',
                        ),
                        Text(
                          '/150',
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    child: Text('مسح'),
                    onPressed: (){},
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Wrap(
                  children: [
                    ChoiceChip(label: Text('te'), selected: false),
                    ChoiceChip(label: Text('te'), selected: false),
                    ChoiceChip(label: Text('te'), selected: false),
                    ChoiceChip(label: Text('te'), selected: false),
                    ChoiceChip(label: Text('te'), selected: false),
                    ChoiceChip(label: Text('te'), selected: false),
                    ChoiceChip(label: Text('te'), selected: false),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
