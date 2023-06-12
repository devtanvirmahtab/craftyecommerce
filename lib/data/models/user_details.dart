class UserDetails{
  final String firstName,lastName,shippingAddress,email,city,mobileNumber;
  final int id;

  UserDetails(this.firstName, this.lastName, this.shippingAddress, this.email, this.city, this.id, this.mobileNumber);


  factory UserDetails.fromJson(Map<String,dynamic> map){
    return UserDetails(
        map['firstName'],
        map['lastName'],
        map['id'],
        map['shippingAddress'],
        map['email'],
        map['city'],
        map['mobileNumber']
    );
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = {};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['id'] = id;
    map['shippingAddress'] = shippingAddress;
    map['email'] = email;
    map['city'] = city;
    map['mobileNumber'] = mobileNumber;
    return map;
  }



}