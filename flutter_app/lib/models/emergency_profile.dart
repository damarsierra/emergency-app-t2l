import 'package:cloud_firestore/cloud_firestore.dart';

class EmergencyProfile {
  String firstName;
  String lastName;
  int phoneNum;
  int userPin;
  String? referenceId;

  EmergencyProfile(
      {required this.firstName,
        required this.lastName,
        required this.phoneNum,
        required this.userPin,
        this.referenceId});

  factory EmergencyProfile.fromSnapshot(DocumentSnapshot snapshot) {
    final newEmergencyProfile = EmergencyProfile.fromJson(snapshot.data() as Map<String, dynamic>);
    newEmergencyProfile.referenceId = snapshot.reference.id;
    return newEmergencyProfile;
  }

  factory EmergencyProfile.fromJson(Map<String, dynamic> json) => _emergencyProfileFromJson(json);

  Map<String, dynamic> toJson() => _emergencyProfileToJson(this);

}

EmergencyProfile _emergencyProfileFromJson(Map<String, dynamic> json) {
  return EmergencyProfile(
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    phoneNum: json['phone_num'] as int,
    userPin: json['user_pin'] as int,

  );
}

Map<String, dynamic> _emergencyProfileToJson(EmergencyProfile instance) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone_num': instance.phoneNum,
  'user_pin': instance.userPin,
};

