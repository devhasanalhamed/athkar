import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../data/data.dart';

class MyInformation extends StatelessWidget {
  final String title;
  final IconData icon;
  final double width;
  final double height;

  MyInformation({
    required this.title,
    required this.icon,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  late String fajr;
  late String dhuhr;
  late String asr;
  late String maghrib;
  late String isha;

  Future<void> getData() async {
    String url =
        'https://api.aladhan.com/v1/timingsByCity?city=Riyadh&country=Saudi%20Arabia%20Arab%20Emirates&method=4';
    try {
      final response = await http.get(Uri.parse(url));
      final data = jsonDecode(response.body);
      final list = Data.fromJson(data['data']);
      fajr = list.timings.fajr;
      dhuhr = list.timings.dhuhr;
      asr = list.timings.asr;
      maghrib = list.timings.maghrib;
      isha = list.timings.fajr;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFail = false;
    return Container(
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
      child: FutureBuilder(
          future: getData().catchError((_) => isFail = true),
          builder: (context, connectionState) {
            if (connectionState.connectionState == ConnectionState.done && !isFail) {
              return Column(
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
                      Text(
                        'الفجر',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'الظهر',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'العصر',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'المغرب',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'العشاء',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        fajr,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        dhuhr,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        asr,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        maghrib,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        isha,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              );
            }
            else if(isFail){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('😭'),
                  Text('no internet connection'),
                ],
              );
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
