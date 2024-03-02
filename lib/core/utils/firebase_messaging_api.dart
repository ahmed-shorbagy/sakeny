import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

Future<void> handleBackGroundMessage(RemoteMessage message) async {
  log('title : ${message.notification!.title}');
  log('body : ${message.notification!.body}');
  log('payload : ${message.data}');
}

class FireBaseAPi {
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();
    log('token : $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
  }

  Future<void> sendMessage(
      {required String title, required String messageBody}) async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Authorization':
          'Bearer ya29.c.c0AY_VpZhszJTkbx2T9G2gh_CO6pMMZAOB1ewxdy9huif8gZqPj5-6HDsoGVbH78lfvB9vIK6hnQsn1P1j_e42NfxhocA7JvlO2WJbdYCXv4IjKwULwGiID5TKSYr7AviWhJVNppgobpzVECauXWVQHXZoizS8ps5NO_VXJ6caWjBKJJGOMaabkkPQGU1LIphhUARLEsoxDbZGNhemxdYYzyuW1cQ5JeX1TOjv1xtfFpXECOFavoCq-5aaHEAIa6y3Az0-CduzeKpyHjKPEvFIUdwj77Jxb29jFQJ4Faya5qWLEJS4BO398mSfx1oVxt7rlLzTIgLWXzVSYm6t9zEx3iscfwocCFiyJxYRsx1-gbzH-MOZ9LFfeoZfT385PVuqcrc9_aV2Jj0e71nQgIMW3go1o8WRuV3nZmlyfzmZwadUbu7xcpVWobkkXgzB9_MFb7MJ18v4s4eBc4miBmFVbd_s02c9qS45wQfY45vr0sun2sax0chseVkoYtOzJWhW7-2o5iFoSOW2lk8sRzv_F2_8In3d8s1eu_ZlwmQ4fX8Wsd48XVtleOx-2myexmU02h92BqObS4hXf4jBudJVdVJ2YangO0pm09rh1XgpBFt8km6Ya1U9Wq-qaWO58Q4wzfZyv3lJOVboi2xr3Wv7v3SO-Xslcua3Reu7ZBak-4Q9wJMoQgVBvVyq96g_Xsz6IflIiabe0kFjprsvms2VmorSssZ6mJlB0MrU7az9opWVicO9_JjuXUdSVjn66Vp9fBVdvFn70Rt7QcY8_5zilbwUi4Mb5h9pqvyjs3WsyFjx4BOZX8n1lSF_is0gYBzyawjbenog-_tx42Vn7f7qutez8FkXJrfn93vBlBkIds5SYdOscnFpByMQ6BS_0UZeXXeSqh0QxYb4w5JdXqmWWOwm-R-8w4_JVmoQZMOjpn9niykRf0eQ7dSkipWq0-gYaWve6qI-7Fz_rutai3afZRxOd6eYZeg56bkSUh5yqfe12oBnhouJlaq',
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/sakeny-40c01/messages:send');

    var body = {
      "message": {
        "token":
            "eb2Yw2hVTEeyIUkmAQ7lel:APA91bHA4qM-GJeNM_Q3QeCVNSyVMbP9OM2j8YEIVt7LNDUJ96zkocrNRO4JXve_Lr39EHHuN-SNoUe1u0R5A72m8D7M1w2zzpBj0USzLwZ61TVvsCZ7y3LWxar39xvTyyHSjvQCZM6B",
        "notification": {"title": title, "body": messageBody}
      }
    };

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
  }
}

class AccessTokenFirbase {
  static String firebaseMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";
  Future<String> getAccessToken() async {
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "sakeny-40c01",
          "private_key_id": "1eebf2cefad33e6f694c0788c34ea503610a3328",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCtY/uMxGw/GCFY\nG+x4FOIs4nbnjdhLUhNvH0/iegyT6oJUAxaBwh7NnYl8tcS4btAkIIwUH2W1t8sf\nfT/pImLWF4HxAVnU5pow+/0gHv6oOcrtLCzefTuzaOLHi3zuYcOsm+ZVS332dBTj\nhax/yuN0VktbLMw1dt9iIquEeOoAzulzMS7tnKmbnh8S7sB6Ag9Qt05xnqTOyFKF\n+vOjR7thSnEuqQMlbR4p2iros99BZUabFpqdYi7fo2dj9P/wFnVMRwF7TVyAfgXE\nMNYYQoyVO2UhSlzeHCUC6kCJxD7pmqP4hO0ltl/f92/EpCK0jbYnb/BhGZvLib4B\nDWYUDvdJAgMBAAECggEAIsz9PVrkNgKwGJjcLJrWbXdTsbR6y91QmL5SYIyqDxsj\nptyKzSbq206J/I2YCwN0w7eDnftSRPd7bZnMNMzpxPopYreocc6J9phxDNwjtRyK\nYfF6nPpKO/9qeu4AeHEHXtLYl1iEUu2oDqVzAqA0aFJ0o/tZDkcKXU5Dmh5RqzEH\nDJucOZNbtiFYwEncy2De5iLceACFIok2cV6kyQNy6YGYMTVx4Ql1vMCJjK6fWwG0\nnIkm3+5Ls5EP+czEHWY52m7V9V5H3SLvELLhJB7s+NJwyf34w2sPnnyUZduPi1l4\nHVt35aAdhS7pzdKkYzKnV/QrUyqbxG0gvGk1TV3FLQKBgQDvmCDgvtAQ39DAdxVD\n3NpkPfH6aXq4ZL4eXogYfImbZxRgF0WiT6NDwFCZgcE1aptF18qe4T/T1kTflvhZ\nB0VJ/fCFhBfHeM6xI3us0Kib9U9xHgJ/oG6n3snqIhHEqU8vkXmm3J3TUfRfNr9Y\nKxF+Hc8noX6S7UXoq7H2JybeNQKBgQC5Q1zuWj8t30QWBGwX6ELOwwoEjlT5of3Y\nft7w27ipkNfVBnuQKFrXOKDpa5OYVc63I0dm2RXua872XiZ2km//40SifKqMxlq9\nRyYc4x324H+tphdJYSkbUFSnatsQF4L3XJibxCjZwVR9Vo8eoFU9hNtuyHjOkZiQ\nPLvacy8nRQKBgQCGt/F0rZXshwyny82nNN2Pk80l0n1whSTpipnXut7dBJ7OUQeU\ndlcE13P6fJ0Y3fKk2OtTXrA2+roLRqYp2Q66xhCh4l5EiMcfjyYRS9oip1Kd9hPN\nk3Xk6j56aeG3xMODqbbPfik4E1Lm3q/EcaMKWNSMIiA7mTK/2xrbn7QZKQKBgQCb\nN3EY0cu1JyXoPHRD43h1ursd7hILxEjlpgYrTit9BbmO5QuJUAYr42oNpu/V5a53\nibs81Ayn4PNZPrCDD1V+0m6ipEhQAa/sfTvVYAOu35CZcFp6REkodTk3uzMmXEyB\n6raBauu+5VdgW7E1O6evDyy5uIRerWVhE0FgWLjc8QKBgFyQCgTPNauyE4mA57In\nt5WarnATE9AQgB8X0IXAWK4v1pQrgdKJEptsW6bmfmmQvztK2Gh41IYFJFtCfcaH\nM9ZyDXRIt7hzGLRDBT/B1mk/EwEVOjzlvSYlXxLmwx4pqscTnKJsBEve3zjD214s\nbAK4I5Q8tqq10QahwBHdDkec\n-----END PRIVATE KEY-----\n",
          "client_email":
              "firebase-adminsdk-pqeme@sakeny-40c01.iam.gserviceaccount.com",
          "client_id": "114991433001429917793",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
              "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-pqeme%40sakeny-40c01.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        [firebaseMessagingScope]);
    final accesToken = client.credentials.accessToken.data;
    return accesToken;
  }
}
