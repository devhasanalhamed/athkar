import 'package:athkar/app/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/database/tasbih_database.dart';

class MyCounterPage extends StatefulWidget {
  static String routeName = 'counter-page';

  const MyCounterPage({Key? key}) : super(key: key);

  @override
  State<MyCounterPage> createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {
  var tasbih = 'السبحة';
  var counter = 0;
  var rounds = 0;
  var total = 0;
  var maximumNumber = 0;

  @override
  Widget build(BuildContext context) {
    var x = Provider.of<TasbihDatabase>(context).tasbihList;
    return Scaffold(
      appBar: const MyAppBar(title: 'السبحة الإلكترونية', isHomePage: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () => setState(() {
                  if (counter != 0 && counter == maximumNumber) {
                    rounds += 1;
                    counter = 0;
                  }
                  counter += 1;
                  total += 1;
                }),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tasbih,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$counter',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                            ),
                          ),
                          if (maximumNumber != 0)
                            Text(
                              '/$maximumNumber',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (maximumNumber != 0) Text('عدد الدورات: $rounds'),
                    Text('مجموع التسبيح: $total'),
                    ElevatedButton(
                      child: const Text('مسح'),
                      onPressed: () {
                        setState(() {
                          counter = 0;
                          tasbih = 'السبحة';
                          counter = 0;
                          rounds = 0;
                          maximumNumber = 0;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add,size: 18,color: Colors.black),
                              )
                            ],
                          ),
                          ...x
                              .map(
                                (e) => ChoiceChip(
                                  label: Text(
                                    e.name,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  onSelected: (_) {
                                    Navigator.pop(context);
                                  },
                                  selected: false,
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 25,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 6,
              children: [
                ...x
                    .map(
                      (e) => ChoiceChip(
                        label: Text(
                          e.name,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        onSelected: (_) {
                          setState(() {
                            tasbih = e.name;
                            counter = 0;
                            rounds = 0;
                            maximumNumber = e.maxNumber;
                          });
                        },
                        selected: false,
                      ),
                    )
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
