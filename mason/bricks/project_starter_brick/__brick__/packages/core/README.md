# {{name.titleCase()}} Core

The core infrastructure package for the {{name.titleCase()}} ecosystem. This package provides the essential building blocks for creating robust, scalable Flutter applications using **Feature-First Clean Architecture**.

## Features

- **Network Layer**: A configured `Dio` client with `DioSmartRetry` for resilience and `PrettyDioLogger` for debugging.
- **Dependency Injection**: Helper modules for `injectable` and `get_it`.
- **Storage**: `KeyValueStorage` abstraction (using `shared_preferences`) for simple data persistence.
- **Monitoring**: `AppBlocObserver` for tracking Bloc state changes.
- **Utils**: Common form input validators (`EmailInput`, `PasswordInput` via `formz`) and service interfaces (`ConnectivityService`, `PermissionService`).

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  {{name.snakeCase()}}_core: ^0.1.0
```

## Usage

### 1. Networking

Access the pre-configured `Dio` client through Dependency Injection or directly:

```dart
// Provided via DI module (recommmended)
class MyRepository {
  final Dio _dio;
  MyRepository(this._dio);
  // ...
}
```

### 2. Storage

Securely strings, booleans, or integers:

```dart
final storage = getIt<KeyValueStorage>();
await storage.setString('theme', 'dark');
```

## Contributing

This package is part of the [{{name.titleCase()}}](https://github.com/yagmure15/{{name.snakeCase()}}) monorepo. Please modify the code in `packages/core`.
