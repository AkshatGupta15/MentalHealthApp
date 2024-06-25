import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mentalheathstartup/screens/otp_page.dart';

class PhoneAuth extends StatefulWidget{
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();

}
class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();
  sendcode()async{
    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:'+91'+ phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          Get.snackbar('Error Occured 1', e.message ?? e.code);
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.to(OtpPage(vid: verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }on FirebaseAuthException catch (e){
      Get.snackbar("Error Occured", e.code);
    } catch(e){
      Get.snackbar("Error Occured", e.toString());
    }
  } 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter Phone Number...",
              suffixIcon: Icon(Icons.phone)
            ),

          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: (){
              sendcode();
            },
            child: Text("Verify Phone Number"))
        ],),
    );
  }
}