# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Building and Running

- `flutter run` - Run the app in development mode
- `flutter build apk` - Build APK for Android
- `flutter build ios` - Build for iOS

### Code Quality

- `flutter analyze` - Run static analysis using flutter_lints
- `dart format .` - Format code according to Dart standards
- `flutter test` - Run all tests

### Code Generation

- `dart run build_runner build` - Generate code (for retrofit, json_serializable)
- `dart run build_runner build --delete-conflicting-outputs` - Clean rebuild
- `dart run build_runner watch` - Watch for changes and auto-generate

## Architecture Overview

This Flutter app follows Clean Architecture principles with feature-based organization:

### Project Structure

```
lib/
├── main.dart                 # App entry point using ShadApp (shadcn_ui)
├── core/                     # Shared infrastructure
│   ├── data/                 # Core data components
│   ├── domain/               # Core business logic
│   ├── presentation/         # Shared UI components
│   ├── di/                   # Dependency injection setup
│   ├── utils/                # Utility functions
│   └── constants/            # App-wide constants
└── features/                 # Feature modules
    ├── auth/                 # Authentication feature
    │   ├── data/
    │   │   ├── datasources/  # API clients, local storage
    │   │   └── repositories/ # Repository implementations
    │   ├── domain/
    │   │   ├── entities/     # Business models
    │   │   ├── repositories/ # Repository interfaces
    │   │   └── usecases/     # Business logic
    │   └── presentation/
    │       ├── pages/        # Screen widgets
    │       ├── widgets/      # Feature-specific components
    │       └── viewmodels/   # BLoC/Cubit state management
    └── home/                 # Home feature (similar structure)
```

### Key Dependencies and Patterns

#### State Management (BLoC Pattern)

- Uses `flutter_bloc` for state management
- Follow BLoC naming conventions from docs/bloc.md:
  - Events: Past tense (e.g., `LoginButtonPressed`)
  - States: Nouns (e.g., `LoginState`, `LoginStatus`)
  - Initial events: `BlocSubjectStarted`
- Use `Cubit` for simple state, `Bloc` for complex event-driven logic
- All states extend `Equatable` and are `@immutable`

#### Network Layer

- Uses `dio` for HTTP client
- Uses `retrofit` with code generation for API endpoints
- API interfaces defined with `@RestApi()` annotations
- Run `dart run build_runner build` after changing API definitions

#### UI Framework

- Built with `shadcn_ui` design system (ShadApp as root widget)
- Uses Material Design 3 principles
- Navigation handled by `go_router`

#### Dependency Injection

- Uses `injectable` for DI setup
- Run code generation after adding new injectable classes

#### JSON Handling

- Uses `json_annotation` and `json_serializable`
- Models have `toJson()` and `fromJson()` methods
- Run code generation after model changes

### Architecture Principles (from docs/flutter_app_architecture.md)

1. **Layer Communication**: Only adjacent layers communicate (UI ↔ Logic ↔ Data)
2. **Single Source of Truth**: Repositories are SSOT for data
3. **Unidirectional Data Flow**: State flows up, events flow down
4. **Feature Organization**: Each feature is self-contained with its own layers
5. **Dependency Injection**: All dependencies injected for testability

### Testing Guidelines (from docs/testing.md)

- Always use `group()` in test files, named after the class under test
- Name test cases with "should" for expected behavior
- Tests must verify real functionality, not just mock behavior
- Use `bloc_test` package for testing BLoCs and Cubits

### Code Quality Standards

- Follows `flutter_lints` rules (configured in analysis_options.yaml)
- Uses Dart 3.8.1+ features
- All state classes must be immutable and extend Equatable
- Keep build methods simple, extract complex widgets
- Use `const` constructors when possible
- Prefer `StatelessWidget` over `StatefulWidget`

### Development Workflow

1. Create new features in `lib/features/[feature_name]/`
2. Follow the three-layer architecture (data/domain/presentation)
3. Add dependencies to the appropriate layer
4. Use dependency injection for all external dependencies
5. Run code generation after API or model changes
6. Run tests and analysis before committing

- Always use shadcn_ui flutter
