import 'dart:convert';

class UserModel {
  String firstName;
  String lastName;
  String username;
  String email;
  String uid;
  String job;
  String about;
  String location;
  String tagline;
  String industry;
  String education;
  int createdAt;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.uid,
    required this.job,
    required this.about,
    required this.location,
    required this.tagline,
    required this.industry,
    required this.education,
    required this.createdAt,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? uid,
    String? job,
    String? about,
    String? location,
    String? tagline,
    String? industry,
    String? education,
    int? createdAt,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      job: job ?? this.job,
      about: about ?? this.about,
      location: location ?? this.location,
      tagline: tagline ?? this.tagline,
      industry: industry ?? this.industry,
      education: education ?? this.education,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'uid': uid,
      'job': job,
      'about': about,
      'location': location,
      'tagline': tagline,
      'industry': industry,
      'education': education,
      'createdAt': createdAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      username: map['username'],
      email: map['email'],
      uid: map['uid'],
      job: map['job'],
      about: map['about'],
      location: map['location'],
      tagline: map['tagline'],
      industry: map['industry'],
      education: map['education'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, username: $username, email: $email, uid: $uid, job: $job, about: $about, location: $location, tagline: $tagline, industry: $industry, education: $education, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.username == username &&
        other.email == email &&
        other.uid == uid &&
        other.job == job &&
        other.about == about &&
        other.location == location &&
        other.tagline == tagline &&
        other.industry == industry &&
        other.education == education &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        username.hashCode ^
        email.hashCode ^
        uid.hashCode ^
        job.hashCode ^
        about.hashCode ^
        location.hashCode ^
        tagline.hashCode ^
        industry.hashCode ^
        education.hashCode ^
        createdAt.hashCode;
  }
}
