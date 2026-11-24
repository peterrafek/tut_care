
import 'package:equatable/equatable.dart';
import 'package:tut_care/domain/entities/address/address_entity.dart';

class UserDataEntity extends Equatable {
  const UserDataEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.passwordResetCode,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final List<String>? wishlist;
  final List<AddressEntity>? addresses;
  final String? passwordResetCode;

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    gender,
    phone,
    photo,
    role,
    wishlist,
    addresses,
    passwordResetCode,
  ];
}
