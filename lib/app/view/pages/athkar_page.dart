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
  var rounds = 1;
  var counter = 1;

  @override
  Widget build(BuildContext context) {
    List<Athkar> athkarList = Provider.of<AthkarDatabase>(context).athkarList;
    final screenSize = MediaQuery.of(context).size.height;

    int counts() {
      var x = 0;
      for (int i = 0; i < athkarList.length; i++) {
        x += athkarList[i].rounds;
      }
      return x;
    }

    void next (bool skip){
      if (indexer < athkarList.length - 1 && rounds == 1 ||indexer < athkarList.length - 1 && skip) {
        setState(() {
          indexer += 1;
          rounds = athkarList[indexer].rounds;
          counter +=1;
        });
      } else if (indexer < athkarList.length - 1) {
        setState(() {
          rounds -= 1;
          counter +=1;
        });
      }
    }

    void previous (){
      setState(() {
        indexer -= 1;
        rounds = 1;
        counter -=1;
      });
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'أذكار المساء',
          isHomePage: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(screenSize * 0.02),
          child: InkWell(
            onTap: () => next(false),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        athkarList[indexer].name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        athkarList[indexer].content,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        athkarList[indexer].fadl,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: indexer == athkarList.length - 1?()=> Navigator.of(context).pop():() => next(true),
                    child:  indexer == athkarList.length - 1?const Text('النهاية'):const Text('تخطي'),
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
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                          child: Text(
                        '${(counter / counts() * 100).toInt()}%',
                        textDirection: TextDirection.ltr,
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                    ),
                    if (indexer > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: TextButton(
                          onPressed: previous,
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(0.0)),
                          ),
                          child: const Text('السابق'),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
