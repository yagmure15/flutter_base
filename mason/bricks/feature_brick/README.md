# feature_brick

Generates a Feature-First Clean Architecture slice for `apps/client`:

```
<name>/
├── data/         datasource, model (freezed + json, `toEntity()`), repository impl
├── domain/       entity (freezed), repository contract, use case
└── presentation/ cubit + sealed state (freezed), page (auto_route), slang translations
```

## Usage

```bash
mason get                                   # once, from the workspace root
mason make feature_brick --name settings -o apps/client/lib/features
fvm exec melos run gen                      # DI, router, freezed, slang
```

The `post_gen` hook registers the page in `core/router/app_router.dart`
(import + `AutoRoute(page: SettingsRoute.page)`); DI registration comes from the
`@injectable` annotations when `melos run gen` runs.

Translations use the slang namespace convention (`<camelCaseName>_<locale>.i18n.json`),
accessible as `t.<camelCaseName>.title`.
