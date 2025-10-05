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

- `dart run build_runner build` - Generate code (for retrofit, json_serializable, freezed)
- `dart run build_runner build --delete-conflicting-outputs` - Clean rebuild
- `dart run build_runner watch` - Watch for changes and auto-generate

### App Icons

- `flutter packages pub run flutter_launcher_icons:main` - Generate app icons from assets/images/logo.png

## Architecture Overview

This Flutter app follows Clean Architecture principles with feature-based organization.

### Project Structure

```
lib/
├── main.dart                 # App entry point using ShadApp.custom with CupertinoApp + shadcn_ui
├── core/                     # Shared infrastructure
│   ├── data/                 # Core data components (ApiClient)
│   ├── domain/               # Core business logic
│   ├── presentation/         # Shared UI components (MainShellPage, ComingSoonPage)
│   ├── navigation/           # App routing (app_router.dart with StatefulShellRoute)
│   ├── services/             # Shared services (AuthService)
│   ├── utils/                # Utility functions (AppLogger, Environment)
│   └── constants/            # App-wide constants
└── features/                 # Feature modules
    ├── auth/                 # Authentication feature
    ├── chat/                 # AI Chat feature with streaming support
    ├── home/                 # Home/Movies listing feature
    ├── movies/               # Movies feature (details, search, favorites)
    ├── profile/              # User profile feature
    └── splash/               # Splash screen feature
```

Each feature follows a three-layer architecture:
- `data/` - API clients (datasources), models, and repository implementations
- `domain/` - Entities, repository interfaces, and use cases
- `presentation/` - Pages, widgets, and BLoC/Cubit viewmodels

### Key Dependencies and Patterns

#### State Management (BLoC Pattern)

- Uses `flutter_bloc` for state management
- Follow BLoC naming conventions:
  - Events: Past tense (e.g., `LoginButtonPressed`, `SendMessage`)
  - States: Nouns with status enums (e.g., `ChatState`, `ChatStatus`)
  - Initial events: `BlocSubjectStarted`
- Use `Cubit` for simple state, `Bloc` for complex event-driven logic
- All states use `freezed` for immutability and extend `Equatable`
- States are `@immutable`

#### Network Layer

- Uses `dio` for HTTP client (configured in `ApiClient`)
- Uses `retrofit` with code generation for API endpoints
- API interfaces defined with `@RestApi()` annotations
- **IMPORTANT**: Run `dart run build_runner build` after changing:
  - API endpoint definitions (any `@RestApi()` class)
  - Model classes with `@freezed` or `@JsonSerializable()`
  - Any file with `part 'filename.g.dart'` or `part 'filename.freezed.dart'`
- Generated files: `.g.dart` (retrofit/json_serializable), `.freezed.dart` (freezed)

#### Streaming Support

The chat feature uses Server-Sent Events (SSE) for real-time streaming:
- Repository returns `Stream<ChatStreamEvent>` with sealed class pattern
- Event types: `ChatStreamSessionId`, `ChatStreamToolStart`, `ChatStreamContent`, `ChatStreamDone`, `ChatStreamError`
- BLoC listens to stream and emits states progressively
- UI updates in real-time as chunks arrive

#### UI Framework

- Built with `shadcn_ui` + Cupertino design system integration
- Uses `ShadApp.custom` with `CupertinoApp` for iOS-native feel
- Red theme color scheme for both light and dark modes
- Navigation: `go_router` with `StatefulShellRoute.indexedStack` for bottom navigation
- Bottom navigation: Home (Movies), Scanner, Chat, Favorites, Profile
- Localization: English (en-US) and Khmer (km-KH) with automatic device detection
- Icons: Lucide icons for consistent iconography

#### JSON Handling and Models

- Uses `json_annotation` and `json_serializable` for JSON serialization
- Uses `freezed` for immutable data classes with code generation
- All models have `toJson()` and `fromJson()` methods
- Example pattern:
  ```dart
  @freezed
  class ChatSession with _$ChatSession {
    const factory ChatSession({
      required String id,
      required String title,
      // ...
    }) = _ChatSession;

    factory ChatSession.fromJson(Map<String, dynamic> json) =>
        _$ChatSessionFromJson(json);
  }
  ```

#### Environment Configuration

- Uses `flutter_dotenv` for environment variables
- Load with `await dotenv.load(fileName: ".env")`
- Environment variables loaded at app startup in `main.dart`

### Architecture Principles

1. **Layer Communication**: Only adjacent layers communicate (UI ↔ Logic ↔ Data)
2. **Single Source of Truth**: Repositories are SSOT for data
3. **Unidirectional Data Flow**: State flows up, events flow down
4. **Feature Organization**: Each feature is self-contained with its own layers
5. **Dependency Injection**: All dependencies injected for testability (using `injectable`)

### Code Quality Standards

- Follows `flutter_lints` rules (configured in analysis_options.yaml)
- Uses Dart 3.8.1+ features
- All state classes must be immutable and extend Equatable
- Keep build methods simple, extract complex widgets into separate methods or widgets
- Use `const` constructors when possible
- Prefer `StatelessWidget` over `StatefulWidget`

### Development Workflow

1. Create new features in `lib/features/[feature_name]/`
2. Follow the three-layer architecture (data/domain/presentation)
3. Add API endpoints using Retrofit in `data/datasources/`
4. Create models with `@freezed` annotation
5. **Run `dart run build_runner build` after adding/modifying APIs or models**
6. Implement repository in `data/repositories/`
7. Create BLoC/Cubit in `presentation/viewmodels/` with events and states
8. Build UI in `presentation/pages/` and `presentation/widgets/`
9. Run `flutter analyze` and `dart format .` before committing

### Current Implementation Status

**Completed Features:**
- **Authentication**: Login, register with JWT token management
- **Movies**: Listing, search, details, favorites with TMDB integration
- **Chat**: AI chat with streaming support, session management, archive/delete functionality
- **Profile**: User profile viewing and management
- **Navigation**: Bottom tab navigation with StatefulShellRoute

**Backend Integration:**
- Backend at `/Users/smaetongmenglay/Documents/development/lumo/lumo-backend`
- Django REST Framework with endpoints for auth, movies, chat, bookings
- Chat uses Server-Sent Events for streaming responses
- Chat sessions support rename, archive, unarchive, delete, and delete all operations

**UI Components:**
- shadcn_ui + Cupertino design system
- Custom movie cards, chat bubbles, session drawer
- Loading states, empty states, error handling
- Dark mode support

**Testing:**
- Test directory exists but no tests implemented yet
- Use `bloc_test` package for BLoC testing when implementing tests

### Important Notes

- **Always run code generation** after modifying models or API endpoints
- Chat feature uses SSE streaming - handle events with sealed classes
- Images stored in `assets/images/` (logo.png, logo-transparent.png)
- Auth tokens managed by `AuthService` in core/services
- All network requests use `ApiClient.instance` singleton
