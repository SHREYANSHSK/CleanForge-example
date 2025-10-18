/// [APIEndpoints] centralizes API endpoint definitions in clean architecture
/// Provides a single source of truth for all API routes
/// Best Practice: Maintains API endpoint consistency across the app
abstract class APIEndpoints {
  // log in user data endpoint
  static String homeDataByIdEndPoint = "/users/current-user";

  // Register endpoint
  static String registerUserEndpoint = "/users/register";

  // Login endpoint
  static String loginUserEndpoint = "/users/login";

  // Logout endpoint
  static String logoutUserEndpoint = "/users/logout";
}
