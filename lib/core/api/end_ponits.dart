class EndPoint {
  static String baseUrl = "https://kemet-gp2024.onrender.com/api/v1/";
  static String getChangePasswordEndPoint = "auth/changePassword";
  static String getUserLoggedTickets = "MyTickets";
  static String logoutEndpoint = "auth/logOut";
  static String createOrder(myTicketId) {
    return "createCashOrder/$myTicketId";
  }
  
  static String tourismWishList  = "tourismPlaceWL/getLoggedUserWishList";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
}
