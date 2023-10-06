import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLogin extends StatefulWidget {
  const FacebookLogin({Key? key}) : super(key: key);

  @override
  _FacebookLoginState createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {
  @override
  String name = "";
  String img = "/assets/images/facebook_login.png";
  String email = "";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FB Login'),
      ),
      body: SingleChildScrollView(
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.lightBlueAccent.shade100,
          child: Column(
            children: [
              Image.asset(
                img,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(name),
                subtitle: Text(
                  email,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final LoginResult result =
                      await FacebookAuth.instance.login();
                  if (result.status == LoginStatus.success) {
                    final AccessToken accessToken = result.accessToken!;
                    log(accessToken.token);
                    final userData = await FacebookAuth.instance.getUserData();
                    log(userData.toString());
                    setState(() {
                      name = userData["name"];
                      email = userData["email"];
                      img = userData['picture']['data']['url'];
                    });
                  }
                },
                child: Text('Facebook Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
