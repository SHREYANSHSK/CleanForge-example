# CleanForge Flutter Example

This project demonstrates the implementation of a Flutter application using the CleanForge mason brick. It showcases a robust, scalable architecture following Clean Architecture principles with GetX state management.

## Important Links
* Github Repo: https://github.com/SHREYANSHSK/cleanforge_bricks
* Detail Documentation: https://shreyanshsk.github.io/CleanForge-bricks/

## Project Overview

This example project serves as a reference implementation for the CleanForge mason brick, demonstrating best practices in Flutter application development with a focus on maintainability, scalability, and clean code.

## Features

### 📐 Architecture
- **Clean Architecture** implementation with clear separation of concerns
- Organized project structure with features-first approach
- Modular design for easy scalability

### 🎯 State Management
- **GetX** integration for efficient state management
- Reactive state handling with GetX controllers
- Dependency injection using GetX bindings

### 🎨 UI/UX
- **Advanced Theming System**
  - Light/dark mode support with persistent storage
  - System theme integration
  - Runtime theme switching with custom theme toggle
  - Pre-configured Material 3 widget themes
- Custom widgets and reusable components
- Responsive design utilities with screen adaptation

### 🛠️ Core Utilities
- **Error Handling**
  - Centralized error management
  - Custom exceptions and failures
  - Error logging system

- **Navigation**
  - Automatic route handling
  - Navigation observer for analytics
  - Type-safe routing

- **Networking**
  - REST client configuration
  - API endpoint management
  - Network state handling

- **Storage**
  - Local storage utilities
  - Secure key management
  - Persistent state handling

### 📚 Additional Features
- Comprehensive logging system
- Form validation helpers
- Resource management (colors, sizes, strings)
- Multimedia resource handling
- Network connectivity management

## Project Structure
The project follows a modular structure with each file having a specific responsibility:

```
lib/
├── main.dart                    # Entry point of the application, configures global settings and initializes app
├── app/
│   ├── app.dart                # Root widget of the application, sets up theme and initial routes
│   ├── app_binding.dart        # Global dependency injection configuration
│   └── page_not_found.dart     # Default 404 error page for invalid routes
├── common/
│   ├── core/
│   │   ├── theme/
│   │   │   ├── theme.dart     # Global theme configuration
│   │   │   ├── theme_controller.dart     # Controller file to control themes
│   │   │   └── widget_themes/ # Individual widget theme configurations
│   │   │       ├── appbar_theme.dart        # AppBar specific theming
│   │   │       ├── bottom_sheet_theme.dart  # BottomSheet customization
│   │   │       ├── checkbox_theme.dart      # Checkbox styling
│   │   │       ├── elevated_button_theme.dart # Button theming
│   │   │       └── text_theme.dart          # Typography definitions
│   │   └── utils/
│   │       ├── errors/
│   │       │   ├── exceptions.dart  # Custom exception definitions
│   │       │   └── failures.dart    # Error types for domain layer
│   │       ├── helpers/
│   │       │   └── helpers.dart     # Utility functions and extensions
│   │       ├── logger/
│   │       │   └── app_logger.dart  # Centralized logging configuration
│   │       ├── navigator_observer/
│   │       │   └── app_navigator_observer.dart # Navigation tracking and analytics
│   │       ├── type_def/
│   │       │   └── type_def.dart    # Common type definitions and aliases
│   │       └── use_cases/
│   │       │   └── use_cases.dart   # Base use case implementations
│   │       └── validators/
│   │           └── app_validators.dart   # Base use case implementations
│   ├── resources/
│   │   ├── app_resources/
│   │   │   ├── app_colors.dart      # Color palette definitions
│   │   │   ├── app_gaps.dart        # Spacing and padding constants
│   │   │   ├── app_gradients.dart   # Gradient style definitions
│   │   │   ├── app_sizes.dart       # Size constants and breakpoints
│   │   │   ├── app_strings.dart     # Localized strings and text constants
│   │   │   └── app_text_styles.dart # Text style definitions
│   │   ├── multimedia_resources/
│   │   │   ├── app_icons.dart       # Icon constants and custom icons
│   │   │   └── app_images.dart      # Image asset references
│   │   ├── network_resources/
│   │   │   ├── api_endpoints.dart   # API endpoint definitions
│   │   │   ├── network_info/
│   │   │   │   └── network_info.dart # Network connectivity handling
│   │   │   └── rest_client/
│   │   │      └──clients/
│   │   │      │   ├──dio_client.dart     # makes network requests with features like interceptors,
│   │   │      │   │                        automatic response decoding, and  request cancellation.
│   │   │      │   └──dio_interceptor.dart # intercept requests, responses, and errors
│   │   │      │                             before handled by the Dio client or returned to your application.
│   │   │      │
│   │   │      └── rest_client.dart  # Dio client configuration
│   │   └── storage_resources/
│   │       ├── local_client.dart     # Local storage implementation
│   │       └── local_keys.dart       # Storage key definitions
│   └── widgets/
│       └── toast_message.dart        # Global toast/snackbar implementation
│       └── theme_switch_icon.dart    # Global icon button widget to switch theme
├── features/
│   └── home/                        # Example feature module
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── local/           # Local storage implementations
│       │   │   └── remote/          # API client implementations
│       │   ├── models/
│       │   │   ├── home_model.dart         # Data models for API responses
│       │   │   └── home_request_model.dart # Request payload models
│       │   └── repositories/
│       │       └── home_repository_impl.dart # Repository implementation
│       ├── domain/
│       │   ├── entities/
│       │   │   └── home_entity.dart        # Business logic entities
│       │   ├── repositories/
│       │   │   └── home_repository.dart    # Repository interfaces
│       │   └── usecases/
│       │       └── home_usecase.dart       # Business logic use cases
│       └── presentation/
│           ├── bindings/
│           │   └── home_binding.dart       # Feature-level dependency injection
│           ├── controllers/
│           │   └── home_controller.dart    # GetX controllers
│           ├── pages/
│           │   └── home_page.dart         # UI screens
│           ├── states/
│           │   └── home_state.dart        # Feature state management
│           └── widgets/
│               └── home_widgets.dart      # Feature-specific UI components
└── routes/
    ├── app_pages.dart               # Route definitions and configurations
    └── app_routes.dart             # Route name constants
```

## Getting Started

1. Ensure you have Flutter installed and set up
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

Note: The files in this project were generated using Flutter v3.35.2. If you plan to use an older Flutter SDK, you may need to make changes to the CleanForge-generated code to ensure compatibility.

## API Reference

This example project utilizes mock Authentication APIs for demonstration purposes. The APIs are provided by FreeAPI service and include endpoints for user authentication, registration, and profile management.

For detailed API documentation and testing, visit:
[FreeAPI Authentication Documentation](https://freeapi.hashnode.space/api-guide/apireference/loginUser)

## Architecture Overview

This project follows Clean Architecture principles with the following layers:

- **Presentation**: UI components, controllers, and states
- **Domain**: Business logic and use cases
- **Data**: Data handling and repositories

Each feature is organized into these layers, promoting separation of concerns and maintainability.

## Documentation

For more detailed information about specific features and implementations, please refer to the following directories:

- `lib/common/core/`: Core functionality and utilities
- `lib/common/resources/`: Resource management
- `lib/features/`: Feature implementations
- `lib/routes/`: Navigation and routing

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
