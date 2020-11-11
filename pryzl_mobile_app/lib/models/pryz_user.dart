import 'package:cloud_firestore/cloud_firestore.dart';

/// A class that represents users.
class PryzUser {
  final String userName;
  final String email;
  final int followingCounter;
  final int followersCounter;
  final String name;
  final String phoneNumber;
  final String profilePictureUrl;
  final Timestamp creationDate;
  final List<PryzUserAuth> auth;
  final List<PryzUserDelivery> delivery;
  final List<PryzUserPayment> payment;

  const PryzUser(
      this.userName,
      this.email,
      this.followingCounter,
      this.followersCounter,
      this.name,
      this.phoneNumber,
      this.profilePictureUrl,
      this.creationDate,
      this.auth,
      this.delivery,
      this.payment);

  /// Convert Firestore DocumentSnapshot to dart object instance.
  factory PryzUser.fromDocument(DocumentSnapshot document) {
    var authList = [];
    var deliveryList = [];
    var paymentList = [];

    if (document['auth'] != null) {
      for (var obj in document['auth']) {
        authList.add(PryzUserAuth.fromDocument(obj));
      }
    }

    if (document['delivery'] != null) {
      for (var obj in document['delivery']) {
        deliveryList.add(PryzUserDelivery.fromDocument(obj));
      }
    }

    if (document['payment'] != null) {
      for (var obj in document['paymemt']) {
        paymentList.add(PryzUserPayment.fromDocument(obj));
      }
    }

    return PryzUser(
        document['userName'],
        document['email'],
        document['followingCounter'],
        document['followersCounter'],
        document['name'],
        document['phoneNumber'],
        document['profilePictureUrl'],
        document['creationDate'],
        authList,
        deliveryList,
        paymentList);
  }
}

/// A class that represents user's auth methods.
class PryzUserAuth {
  final String password;
  final String salt;
  final String authenticationMethod;

  const PryzUserAuth(this.password, this.salt, this.authenticationMethod);

  /// Convert Firestore DocumentSnapshot to dart object instance.
  factory PryzUserAuth.fromDocument(DocumentSnapshot document) {
    return PryzUserAuth(document['password'], document['salt'],
        document['authenticationMethod']);
  }
}

/// A class that represents user's orders.
class PryzUserDelivery {
  final String street;
  final String postCode;
  final String city;
  final String floor;
  final String deliveryNotes;

  const PryzUserDelivery(
      this.street, this.postCode, this.city, this.floor, this.deliveryNotes);

  /// Convert Firestore DocumentSnapshot to dart object instance.
  factory PryzUserDelivery.fromDocument(DocumentSnapshot document) {
    return PryzUserDelivery(document['street'], document['postCode'],
        document['city'], document['floor'], document['deliveryNotes']);
  }
}

/// to be completed ...
class PryzUserPayment {
  final String method;

  const PryzUserPayment(this.method);

  factory PryzUserPayment.fromDocument(DocumentSnapshot document) {
    return PryzUserPayment(document['method']);
  }
}
