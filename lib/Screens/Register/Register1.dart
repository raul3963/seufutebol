// import 'dart:math';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_sms/flutter_sms.dart';
// import 'package:seufutebol/Models/TextFieldModel.dart';
// import 'package:seufutebol/Models/phone%20aut.dart';
// import 'package:seufutebol/Screens/Register/autentificar.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../main.dart';
//
// class Register1 extends StatefulWidget {
//   const Register1({Key? key}) : super(key: key);
//
//   @override
//   _Register1State createState() => _Register1State();
// }
//
// TextEditingController CTRL_Nome = TextEditingController();
// TextEditingController CTRL_Telefone = TextEditingController();
//
// class _Register1State extends State<Register1> {
//   void _sendSMS(String message, List<String> recipients) async {
//     String _result = await FlutterSms.sendSMS(
//         message: message, recipients: recipients).catchError((onError) {
//       print(onError);
//     });
//     print(_result);
//   }
//
//   String _smsVerificationCode = "";
//   _verificationComplete(AuthCredential authCredential, BuildContext context) {
//     FirebaseAuth.instance.signInWithCredential(authCredential).then((authResult) {
//       final snackBar = SnackBar(content: Text("Success!!! UUID is: " + authResult.user!.uid));
//       Scaffold.of(context).showSnackBar(snackBar);
//     });
//   }
//
//   _smsCodeSent(String verificationId, List<int> code) {
//     // set the verification code so that we can use it to log the user in
//     _smsVerificationCode = verificationId;
//   }
//
//   _verificationFailed(FirebaseAuthException authException, BuildContext context) {
//     final snackBar = SnackBar(content: Text("Exception!! message:" + authException.message.toString()));
//     Scaffold.of(context).showSnackBar(snackBar);
//   }
//
//   _codeAutoRetrievalTimeout(String verificationId) {
//     // set the verification code so that we can use it to log the user in
//     _smsVerificationCode = verificationId;
//   }
//
//   _verifyPhoneNumber(BuildContext context) async {
//     String phoneNumber = "+55 " + CTRL_Telefone.text;
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     await _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         timeout: Duration(seconds: 5),
//         verificationCompleted: (authCredential) => _verificationComplete(authCredential, context),
//         verificationFailed: (authException) => _verificationFailed(authException, context),
//         codeAutoRetrievalTimeout: (verificationId) => _codeAutoRetrievalTimeout(verificationId),
//         // called when the SMS code is sent
//         codeSent: (verificationId, [int? code]){});
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     setState() {
//       TitleAppBar = "Registrar";
//     }
//
//
//     int Verification_Number;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("$TitleAppBar"),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, "Configuracao");
//               },
//               icon: Icon(Icons.build))
//         ],
//       ),
//       body: ListView(
//         children: [
//           Container(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: CTRL_Telefone,
//                 decoration: InputDecoration(labelText: "Phone Number",
//                     prefixText: "+55",
//                     border: OutlineInputBorder()),
//               ),
//             ),
//           ),
//           Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: RaisedButton(
//                   child: Text("Verificar"),
//                   onPressed: () {
//                     _sendSMS("seu codigo é 254463", ["+55 992405669"]);
//                     Navigator.pushNamed(context, "autpage");
//                   },
//
//                 ),
//               )
//           )
//         ],
//       ),
//     );
//   }
// }
