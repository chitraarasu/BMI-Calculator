import 'dart:typed_data';

import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResultPage extends StatelessWidget {
  final String bmiText;
  final String resultText;
  final String interpretation;

  final controller = ScreenshotController();

  ResultPage({
    @required this.bmiText,
    @required this.resultText,
    @required this.interpretation,
  });
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: controller,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Your Result',
                  style: kresultTitle,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ReusableCard(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kresultStatus,
                    ),
                    Text(
                      bmiText,
                      style: kresultScore,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kresultAdvice,
                    ),
                    TextButton(
                      onPressed: () async {
                        final image = await controller.capture();
                        await saveImage(image);
                        await Fluttertoast.showToast(
                            msg: "✔ ScreenShot Saved",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                        child: Text(
                          'Save Result',
                          style: kresultSave,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kinactiveCardColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              text: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'ScreenShot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);

    return result['filePath'];
  }
}
