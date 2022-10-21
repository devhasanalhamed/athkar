import 'package:athkar/app/view/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AthkarPage extends StatefulWidget {
  static const routeName = 'athkar/page';

  const AthkarPage({Key? key}) : super(key: key);

  @override
  State<AthkarPage> createState() => _AthkarPageState();
}

class _AthkarPageState extends State<AthkarPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const MyAppBar(
        title: 'fs',
        isHomePage: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize * 0.02),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(child: Text('سبحان الله')),
              ),
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
                '5',
                style: Theme.of(context).textTheme.titleSmall,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
