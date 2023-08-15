
import 'package:days/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }
  var nameContoller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Quiz App!"),
        titleSpacing: 16.0,
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kindly Enter your name:",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                ],
                keyboardType: TextInputType.name,
                controller: nameContoller,
                decoration: InputDecoration(
                  counterText: "${nameContoller.text.length}/20",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),


                  label: Text('Enter your name') ,
                ),
                validator: (val){
                  if (val!.isEmpty){
                        return "Please enter your correct name";
                  }
                  if(val.length>=21){
                    return "your name is too heigh";
                  }
                  if(val[0].toUpperCase() !=val[0]){
                    return "Please enter your name in upper ";
                  }
                  return null;
                },
                onFieldSubmitted: (text){

                    if(formKey.currentState!.validate()){

                      print("//////////you are loin now ///////////");
                      print(nameContoller.text.length);

                    }

                },
                onChanged: (text){
                  setState(() {

                  });
                },

              ),
            ),

            SizedBox(height: 24.0,),
            TextButton(onPressed: (){
              if(formKey.currentState!.validate()){
                if(nameContoller.text.length<=20){
                    print("//////////you are loin now ///////////");
                    print(nameContoller.text.length);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>HomeScreen()));


                }



              }
            }, child: Text("login",style: TextStyle(color: Colors.blue,fontSize: 20.0),))
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
//
// import 'NewsApp.dart';
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final formkey = GlobalKey<FormState>();
//   final scafoldkey = GlobalKey<ScaffoldState>();
//
//   final name = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scafoldkey,
//       appBar: AppBar(
//         title: const Text('Welcome to Quiz app!'),
//       ),
//       body: Form(
//         key: formkey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'kindly, Enter your name:',
//               style: TextStyle(
//                 fontSize: 20.0,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 40.0, top: 20.0, right: 40.0, bottom: 40.0),
//               child: TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red,content: Text('The name is considered valid if the first letter is capitalized and the name is not a number and does not exceed 20 letters !'),),);
//                     return 'Enter your name !';
//
//                   }
//                   else if(RegExp(r'\d').hasMatch(value)  || value[0] != (value[0].toUpperCase()) ||value.length>20) {
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text('The name is considered valid if the first letter is capitalized and the name is not a number and does not exceed 20 letters !'),),);
//                     return 'Enter a valid name !';
//                   }
//                   else{
//                     return null;
//                   }
//                 },
//                 controller: name,
//                 decoration: InputDecoration(
//                   counterText:'${name.text.length}/20',
//                   counterStyle: TextStyle(
//                     color: (name.text.length > 20) ? Colors.red : Colors.grey,
//                   ),
//                   border: const OutlineInputBorder(),
//                   focusedBorder: const OutlineInputBorder(),
//                   hintText: 'Enter your name',
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                   });
//                 },
//               ),
//             ),
//             TextButton(
//               onPressed:(){
//                 if(formkey.currentState!.validate()){
//                   Navigator.push(context, MaterialPageRoute(builder: (context){
//                      return NewsAppScreen();
//                     // Empty(
//                     //   name : name.text,
//                     // );
//                   }));
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.blue,content: Text('Saved successfully !'),),);
//
//                 }
//               }, child:
//             const Text(
//               'Log in',
//               style: TextStyle(
//                 fontSize: 25.0,
//               ),
//             ),)
//           ],
//         ),
//       ),
//     );
//   }
// }