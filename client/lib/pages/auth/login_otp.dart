import 'package:flutter/material.dart';

class LoginOTPPage extends StatefulWidget {
  const LoginOTPPage({super.key});

  @override
  State<LoginOTPPage> createState() => _LoginOTPPageState();
}

class _LoginOTPPageState extends State<LoginOTPPage> {
  @override
  Widget build(BuildContext context) {
    String mobileNo = "";
    bool isAPICallProcess = false;
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(
          "sss",
          height: 180,
          fit: BoxFit.contain,
        ),
        Text('Login with mobile phone number'),
        SizedBox(
          height: 10,
        ),
        Text("Enter phone number"),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  child: Container(
                height: 47,
                width: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 3, 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                  "+91",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
              )),
              Flexible(
                flex: 5,
                child: TextFormField(
                  maxLines: 1,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: "Mobile phone",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {
                    if (value.length > 9) {
                      mobileNo = value;
                    }
                  },
                ),
              )
            ],
          ),
        ),
        Center(
            child: ElevatedButton(
          child: Text("Submit"),
          onPressed: () {},
        ))
      ]),
    );
  }
}
