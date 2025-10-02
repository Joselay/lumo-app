# Repository Guidelines

## Project Structure & Module Organization
Keep Flutter entry logic in `lib/main.dart`. Shared utilities, data models, navigation, and dependency wiring belong under `lib/core`, while feature widgets and controllers live in `lib/features/<feature>`. Mirror this layout in tests with files under `test/<feature>/<subject>_test.dart`. Register PNG or SVG assets in `pubspec.yaml` and store them in `assets/images` or `assets/icons`. Review `docs/` before adjusting architectural patterns.

## Build, Test, and Development Commands
Run `flutter pub get` after dependency updates. Use `flutter analyze` to enforce the `flutter_lints` ruleset before every commit. Launch the app locally with `flutter run`, and execute all unit and widget suites through `flutter test`. For release builds, ensure a clean tree, then call `flutter build apk` or `flutter build ios` as needed.

## Coding Style & Naming Conventions
Follow two-space indentation and include trailing commas to keep diffs stable. Name files using `snake_case.dart`, classes in `PascalCase`, and members in `camelCase`; reserve `ALL_CAPS` for compile-time constants. Keep UI widgets lean by placing business logic in `core/domain` or the relevant feature controller. Use ASCII unless the existing file demands otherwise.

## Testing Guidelines
Write tests alongside features inside `test/` using `flutter_test` and the mocking patterns outlined in `docs/testing.md`. Match test filenames to their subject, such as `test/movies/movies_page_test.dart`. Add regression coverage whenever navigation, carousels, or async flows change. Validate locally with `flutter test` before pushing.

## Commit & Pull Request Guidelines
Compose sentence-style commit subjects (e.g., “Refine MoviesPage padding for tablet layouts”) that focus on a single concern. PRs should reference related issues, summarize functional changes, document local verification (commands, devices), and attach screenshots for UI adjustments. Request review only after `flutter analyze` and `flutter test` both succeed.
