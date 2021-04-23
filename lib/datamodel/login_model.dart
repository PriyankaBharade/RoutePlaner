
class LoginModel {
  LoginModel({
        required this.status,
        required this.responseCode,
        required this.message,
        required this.customerId,
        required this.accessToken,
        required this.customerName,
        required this.phone,
        required this.email,
    });

    bool status;
    int responseCode;
    String message;
    String customerId;
    String accessToken;
    String customerName;
    String phone;
    String email;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        responseCode: json["responseCode"],
        message: json["message"],
        customerId: json["customerId"],
        accessToken: json["accessToken"],
        customerName: json["customer_name"],
        phone: json["phone"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "responseCode": responseCode,
        "message": message,
        "customerId": customerId,
        "accessToken": accessToken,
        "customer_name": customerName,
        "phone": phone,
        "email": email,
    };
}