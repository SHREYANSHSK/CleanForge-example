# CleanForge Flutter Example

This project demonstrates the implementation of a Flutter application using the CleanForge mason brick. It showcases a robust, scalable architecture following Clean Architecture principles with GetX state management.

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

```
lib/
├── app/                    # App-level components
├── common/                 # Shared resources
│   ├── constants/         
│   ├── core/              # Core functionality
│   │   ├── theme/         # Theming system
│   │   ├── utils/         # Utilities
│   │   └── ...
│   ├── resources/         # App resources
│   └── widgets/           # Shared widgets
├── features/              # Feature modules
│   ├── home/
│   ├── login/
│   └── register/
└── routes/                # Route management
```

## Getting Started

1. Ensure you have Flutter installed and set up
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

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
