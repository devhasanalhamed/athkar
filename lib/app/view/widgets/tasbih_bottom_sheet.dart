import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/database/tasbih_database.dart';

class TasbihBottomSheet extends StatefulWidget {
  const TasbihBottomSheet({Key? key}) : super(key: key);

  @override
  State<TasbihBottomSheet> createState() => _TasbihBottomSheetState();
}

Future showTasbihDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      final tasbihController = TextEditingController();
      final numberController = TextEditingController();
      return Dialog(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                TextField(
                  controller: tasbihController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    hintText: 'أسم الذكر',
                  ),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: numberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    hintText: 'عدد الذكر',
                  ),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Provider.of<TasbihDatabase>(context, listen: false)
                        .addTasbih(
                      tasbihController.text,
                      int.parse(numberController.text),
                    );
                  },
                  child: const Text('إضافة'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class _TasbihBottomSheetState extends State<TasbihBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var tasbihList = Provider.of<TasbihDatabase>(context).tasbihList;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  showTasbihDialog(context);
                },
                icon: const Icon(Icons.add, size: 18, color: Colors.black),
              )
            ],
          ),
          ...tasbihList
              .map(
                (e) => Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Provider.of<TasbihDatabase>(context, listen: false)
                              .deleteTasbih(e.name);
                        });
                      },
                      icon: const Icon(Icons.close),
                      color: Colors.red,
                      iconSize: 26,
                    ),
                    const SizedBox(width: 40),
                    ChoiceChip(
                      label: Text(
                        e.name,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      onSelected: (_) {
                        Navigator.pop(context);
                      },
                      selected: false,
                    ),
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
