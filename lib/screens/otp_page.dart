import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalheathstartup/wrapper.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  final String vid;
  const OtpPage({
    required this.vid,
    super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  var code = '';

  signin()async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.vid, 
      smsCode: code);
    try{
    await FirebaseAuth.instance.signInWithCredential(credential).then((value){
      Get.offAll(Wrapper());
    });
    }on FirebaseAuthException catch (e){
      Get.snackbar("Error Occured", e.code);
    } catch(e){
      Get.snackbar("Error Occured", e.toString());
    }

  }
  
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otp Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Pinput(
            length: 6,
            onChanged: (value){
              setState(() {
                code= value;
              });
            },
          ),
          ElevatedButton(
            onPressed: (){
              signin();
            }
          , child: Text("Verify"))
        ],
      ),
    );
  }
}