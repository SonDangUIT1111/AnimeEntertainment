import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPVerifyPage extends StatefulWidget {
  const OTPVerifyPage({super.key});

  @override
  State<OTPVerifyPage> createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {
  String _otpCode = "";
  final int _otpCodeLength = 4;
  bool isAPICallProcess = false;
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();
    SmsAutoFill().listenForCode.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "",
            height: 100,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "OTP Verification",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Enter OTP code sent to your mobile",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: PinFieldAutoFill(
              decoration: UnderlineDecoration(
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  colorBuilder:
                      FixedColorBuilder(Colors.black.withOpacity(.3))),
              currentCode: _otpCode,
              codeLength: _otpCodeLength,
              onCodeChanged: (code) {
                if (code!.length == _otpCodeLength) {
                  _otpCode = code;
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Verify"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }
}
