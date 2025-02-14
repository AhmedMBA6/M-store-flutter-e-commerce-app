// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_splash_test1/utils/formatters/formatter.dart';

/// Model class representing user data
class UserModel {
// Keep those values final which you don not want update it
  final String id;
  final String userName;
  String firstName;
  String lastName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name
  String get fullName => "$firstName $lastName";

  /// Helper function to format phone number
  String get formattedPhoneNo => MFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name to first and last name.
  static List<String> namePart(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername =
        "$firstName$lastName"; // Combine first and last name
    String userNameWithPrefix = "cwt_$camelCaseUsername";
    return userNameWithPrefix;
  }

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(
      id: '',
      userName: '',
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  /// Convert model to Json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create a Usermodel from a firbase to document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          userName: data['Username'],
          firstName: data['FirstName'],
          lastName: data['LastName'],
          email: data['Email'],
          phoneNumber: data['PhoneNumber'],
          profilePicture: data['ProfilePicture'] ?? '');
    } else {
      return empty();
    }
  }
}
