import 'package:athkar/app/data/database/athkar_database.dart';
import 'package:athkar/app/data/models/athkar_model.dart';
import 'package:athkar/app/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AthkarPage extends StatefulWidget {
  static const routeName = 'athkar/page';

  const AthkarPage({Key? key}) : super(key: key);

  @override
  State<AthkarPage> createState() => _AthkarPageState();
}

class _AthkarPageState extends State<AthkarPage> {
  var indexer = 0;
  final myPageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    const myAppBar = MyAppBar(
      title: 'أذكار المساء',
      isHomePage: false,
    );
    List<Athkar> athkarList = Provider.of<AthkarDatabase>(context).athkarList;
    final screenSize = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        myAppBar.preferredSize.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppBar,
        body: Column(
          children: [
            SizedBox(
              height: screenSize * 0.02,
              child: Row(
                children: [
                  for (int i = 0; i < athkarList.length; i++)
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: indexer >= i ? Colors.blue : Colors.grey,
                          border: i == 0
                              ? null
                              : const Border(
                                  right: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize * 0.98,
              child: InkWell(
                onTap: () {
                  myPageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                onDoubleTap: () {
                  myPageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize * 0.02,
                    right: screenSize * 0.02,
                    left: screenSize * 0.02,
                    bottom: screenSize * 0.01,
                  ),
                  child: PageView(
                    controller: myPageController,
                    onPageChanged: (index) {
                      setState(() {
                        indexer = index;
                      });
                    },
                    children: [
                      for (int i = 0; i < athkarList.length; i++)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: screenSize * 0.70,
                              child: ListView(
                                children: [
                                  Text(
                                    athkarList[i].content,
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(
                                    height: screenSize * 0.2,
                                  ),
                                  Text(
                                    athkarList[i].fadl,
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.8)),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                const Divider(
                                  thickness: 3.0,
                                ),
                                Container(
                                  height: 60,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    shape: BoxShape.rectangle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Center(
                                    child: indexer == athkarList.length - 1
                                        ? const Text(
                                            'النهاية',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                        : const Text(
                                            'التالي',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
