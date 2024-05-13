import 'package:flutter/material.dart';
import 'package:project_flutter/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    String password = '123';

    var widht = MediaQuery.of(context).size.width;
    TextEditingController teEmail = TextEditingController();
    TextEditingController tePassword = TextEditingController();

    signIn(BuildContext context){
      if (tePassword.text == password) {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home(),)
        );
      } else {
        print('You\'re wrong');
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xffF1F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: widht,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(image: AssetImage(
                      'assets/images/img_background.png',
                    ), 
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Welcome Back 👋',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 5,),
                const Text(
                  'Today is a new day. It\'s your day \nSign in to start managing your project.',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: teEmail,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                    fillColor: Colors.grey,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blueAccent
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.1)
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    hintText: 'example@google.com',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.8)
                    )
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: tePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                    fillColor: Colors.grey.withOpacity(0.1),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blueAccent
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.1)
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.8)
                    )
                  ),
                ),
                const SizedBox(height: 2,),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){}, child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: widht,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff162D3A),
                      foregroundColor: Colors.white
                    ),
                    onPressed: (){
                      signIn(context);
                    },
                    child: const Text('Sign In'),
                  ),
                ),
                const SizedBox(height: 40,),
                const Row(
                  children: [
                    Expanded(
                      child: Divider()
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Or sign in with'
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Divider()
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(155, 40)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/ic_google.png', width: 20,),
                          const SizedBox(width: 15,),
                          const Text(
                            'Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(155, 40)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/ic_facebook.png', width: 20,),
                          const SizedBox(width: 15,),
                          const Text(
                            'Facebook',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}