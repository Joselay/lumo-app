# Repository Guidelines

## Project Structure & Module Organization
The Flutter entry point lives in `lib/main.dart`. Shared code sits under `lib/core` (constants, data, domain, navigation, presentation, utils, and service wiring in `di`). Feature-specific widgets, controllers, and assets reside in `lib/features/<feature>`. Mirror that structure when adding tests under `test/`. Static assets belong in `assets/icons` or `assets/images` and must be registered in `pubspec.yaml`. Reference design docs under `docs/` before making sweeping architecture changes.

## Build, Test, and Development Commands
- `flutter pub get` — install or refresh dependencies.
- `flutter analyze` — run static analysis with the project's lint set.
- `flutter run` — launch the debug build on an attached device or simulator.
- `flutter test` — execute the unit and widget test suites.
- `flutter build apk` / `flutter build ios` — generate release binaries; ensure a clean workspace first.

## Coding Style & Naming Conventions
The repo relies on `flutter_lints` (see `analysis_options.yaml`); fix all analyzer issues prior to review. Format code with two-space indentation and include trailing commas to keep diffs small. Name files with `snake_case.dart`, classes in `PascalCase`, and members in `camelCase`. Reserve `ALL_CAPS` for compile-time constants. Keep UI widgets thin and push business rules into `core/domain` or feature-specific controllers, documenting non-obvious flows with brief comments.

## Testing Guidelines
Place new tests in `test/<feature>/<subject>_test.dart`, matching the structure in `lib/`. Use `flutter_test` for widget coverage and the mocking guidance in `docs/testing.md`. Add regression tests whenever you modify navigation, carousel behavior, or asynchronous data flows. Always finish with `flutter test` before committing.

## Commit & Pull Request Guidelines
Craft sentence-style commit subjects (e.g., “Refine MoviesPage padding for tablet layouts”) as seen in the current history, keeping each commit focused on a single concern. PRs should link issues, describe functional changes, list local verification (commands, devices), and include screenshots when the UI shifts. Request review only after analyzer and tests pass.
