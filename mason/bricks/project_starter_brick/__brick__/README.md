# {{name.titleCase()}}

## 📦 Yeni Proje Başlatma (Mason Template)

Bu projeyi bir şablon (template) olarak kullanarak saniyeler içinde yeni bir proje oluşturabilirsiniz. Bu özellik, `apps/client` yapısını ve `packages/core` modülünü otomatik olarak kopyalar, isimlendirir ve yapılandırır.

### Nasıl Kullanılır?

1. **Mason'ı Yükleyin (Eğer yoksa):**
   ```bash
   dart pub global activate mason_cli
   ```

2. **Brick'i Global Olarak Ekleyin:**
   Kendi GitHub reponuzdan şablonu indirin (Sadece 1 kez yapmanız yeterli):
   ```bash
   mason add -g project_starter_brick git https://github.com/yagmure15/{{name.snakeCase()}}.git --path mason/bricks/project_starter_brick
   ```

3. **Yeni Bir Proje Oluşturun:**
   Bilgisayarınızın herhangi bir yerinde (Boş bir klasörde):
   ```bash
   mason make project_starter_brick --name <yeni_proje_adi>
   ```
   **Örnek:**
   ```bash
   mason make project_starter_brick --name yemek_sepeti
   ```
   Bu işlem size şunları içeren hazır bir proje verir:
   - `apps/yemek_sepeti` (Client uygulaması)
   - `packages/yemek_sepeti_core` (İsmi özelleştirilmiş Core modülü)
   - `packages/design_system`
   - Tüm konfigürasyonlar (Flavorlar, Build Runner vb.)

---

## 🏗 Mimari: Feature-First Clean Architecture

Bu proje **Feature-First Clean Architecture** prensiplerini benimser. Bu, kodun teknik katmanlar (data, domain, presentation) yerine **özelliklere (features)** göre organize edildiği anlamına gelir.

### Klasör Yapısı

```
lib/
├── features/                  # Özellikler burada bulunur
│   ├── auth/                  # Örnek: Kimlik doğrulama özelliği
│   │   ├── data/              # Veri katmanı (API, Veritabanı)
│   │   ├── domain/            # İş mantığı (Entities, UseCases - Saf Dart)
│   │   └── presentation/      # UI (Pages, Bloc/Cubit)
├── core/                      # Proje genelinde kullanılan ortak yapılar
├── config/                    # Uygulama konfigürasyonları (Flavor, Firebase vb.)
└── main.dart                  # Uygulama giriş noktası
```

- **Domain Katmanı**: İş kurallarının bulunduğu yerdir. Flutter bağımlılığı içermez (Saf Dart).
- **Data Katmanı**: Veri kaynakları (API, DB) ile haberleşir ve Domain katmanı için veriyi hazırlar.
- **Presentation Katmanı**: Kullanıcının gördüğü ekranlar ve durum yönetimi (State Management) buradadır.

---

## 🚀 Teknoloji Yığını ve Paketler

Projede kullanılan temel kütüphaneler ve tercih edilme sebepleri:

| Paket | Ne İşe Yarar? | Neden Seçildi? |
|-------|---------------|----------------|
| **flutter_bloc** | State Management | Endüstri standardı, test edilebilir ve öngörülebilir durum yönetimi sağlar. |
| **get_it** & **injectable** | Dependency Injection | Bağımlılıkları (Repository, Bloc vb.) yönetmek ve testlerde mocklayabilmek için. |
| **dio** | Network (HTTP) | Http istekleri için güçlü, interceptor destekli ve gelişmiş bir istemci. |
| **auto_route** | Navigasyon | Tip güvenli (Type-safe), parametreleri kolay yönetilen ve Deep Link desteği olan bir router. |
| **freezed** | Model Generation | Immutable (değişmez) sınıflar ve Union Type'lar oluşturmak için. `copyWith` gibi metodları otomatik yazar. |
| **slang** | Localization (Dil) | Tip güvenli ve hızlı çalışan, JSON tabanlı çoklu dil desteği. |
| **flutter_secure_storage** | Güvenli Depolama | Token, şifre gibi hassas verileri cihazın güvenli alanında (Keychain/Keystore) saklar. |
| **melos** | Monorepo Aracı | Birden fazla paketi (core, design_system, app) tek bir yerden yönetmek için. |
| **mason** | Kod Üretimi | Standartlara uygun yeni özellik (feature) veya proje oluşturmak için şablon sistemi. |
| **formz** | Form Doğrulama | Email, Şifre gibi alanların validasyonunu UI'dan ayırıp Domain katmanında yapmak için. |
| **connectivity_plus** | İnternet Kontrolü | Cihazın internet bağlantısı var mı (Wifi/Mobil) kontrol etmek için. |
| **permission_handler** | İzin Yönetimi | Kamera, Galeri gibi izinleri istemek için. |

---

## 📘 Core Yardımcı Sınıflar Nasıl Kullanılır?

### 1. Basit Depolama (KeyValueStorage)
`flutter_secure_storage` sadece şifreler içindir. Basit veriler (Theme tercihi, Onboarding görüldü mü vb.) için `KeyValueStorage` kullanın.

```dart
// Dependency Injection ile çağırın
final storage = getIt<KeyValueStorage>();

// Kaydet
await storage.setString('theme_mode', 'dark');

// Oku
final theme = storage.getString('theme_mode');
```

### 2. Form Doğrulama (Formz)
Form validasyonlarını `Bloc` içinde yapmak için hazır sınıflar eklenmiştir (`EmailInput`, `PasswordInput`, `RequiredTextInput`).

```dart
// 1. State içinde tanımla
final email = EmailInput.pure();

// 2. Kullanıcı yazarken güncelle (Bloc Event)
final newEmail = EmailInput.dirty(event.text);
print(newEmail.isValid); // true/false
print(newEmail.error);   // Hata varsa döner
```

### 3. İnternet ve İzinler

```dart
// İnternet var mı?
final hasConnection = await getIt<ConnectivityService>().hasConnection;

// Kamera izni iste
final granted = await getIt<PermissionService>().requestPermission(Permission.camera);
```

### 4. Hata Yönetimi (`Result` / `Failure`)

Tek bir hata modeli vardır; `dartz`/`Either` kullanılmaz.

- **Data source**'lar sadece fırlatır (Dio hataları, `ServerException` gibi `AppException`'lar, parse hataları).
- **Repository**'ler çağrıyı `Result.guard(...)` ile sarar; fırlatılan her şey `failureFromException` ile tek yerde
  `Failure`'a çevrilir (401 → `UnauthorizedFailure`, 422 → `ValidationFailure(errors)`, timeout → `NetworkFailure` ...).
- **Use case / Cubit** `Result<T>` alır ve `switch` ile dallanır; state `Failure`'ın kendisini taşır.
- **UI** metni `failure.localizedMessage` (slang `errors` namespace'i) ile gösterir.

```dart
// Repository
Future<Result<User>> getUser() async {
  final result = await Result.guard(_remote.getUser);   // Future<UserModel>
  return result.map((model) => model.toEntity());
}

// Cubit
switch (await _getUser()) {
  case Success(:final data):       emit(UserState.loaded(data));
  case FailureResult(:final failure): emit(UserState.error(failure));
}

// UI
error: (failure) => Text(failure.localizedMessage),

// Belirli bir hataya tepki vermek için (public union sınıfları):
if (failure case UnauthorizedFailure()) context.router.replaceAll([const LoginRoute()]);
```

`Result` yardımcıları: `fold`, `map`, `flatMap`, `dataOrNull`, `failureOrNull`, `isSuccess`/`isFailure`.

---

## 🛠 Geliştirme Araçları ve Komutlar

Bu proje bir **Monorepo** yapısındadır (Melos ile yönetilir). Yani `apps/` altında uygulamalar, `packages/` altında ortak kütüphaneler bulunur.

### Flutter SDK (FVM)

Proje, Flutter SDK sürümünü [FVM](https://fvm.app) ile sabitler (`.fvmrc` → **Flutter 3.47.1 / Dart 3.13.1**).
Tüm `pubspec.yaml` dosyalarındaki `environment.sdk` constraint'i de bu sürüme göre (`^3.13.1`) ayarlanmıştır.

```bash
dart pub global activate fvm   # FVM yoksa
fvm install                    # .fvmrc içindeki sürümü kurar
```

> **Not:** Melos, `flutter` / `dart` komutlarını `PATH` üzerinden çalıştırır. Global FVM sürümünüz
> projeninkinden farklıysa melos komutlarını `fvm exec` ile çalıştırın (örn. `fvm exec melos bootstrap`),
> tekil komutlar için `fvm flutter ...` / `fvm dart ...` kullanın.

### Hazırlık (Setup)

Projeyi ilk kez indirdiğinizde bağımlılıkları kurmak ve bağlamak için:

```bash
fvm exec melos bootstrap
```
*Alternatif:* Kök dizinde `fvm flutter pub get` çalıştırılabilir ancak Melos kullanmak daha sağlıklıdır.

### Ortam Değişkenleri (.env)

`apps/client` altındaki `.env.dev`, `.env.staging`, `.env.prod` dosyaları **git'e girmez**; şablon olarak
`.env.example` kullanılır. Kod üretiminden (`melos run gen`) önce oluşturun:

```bash
cd apps/client
cp .env.example .env.dev && cp .env.example .env.staging && cp .env.example .env.prod
```

Değerler `envied` ile (`obfuscate: true`) `lib/env/env_*.g.dart` dosyalarına derlenir; bu dosyalar da
git-ignore'dadır ve `melos run gen` ile yeniden üretilir. CI, `.env.example`'ı kopyalayarak çalışır.

### Firebase

`lib/config/firebase_options.dart` FlutterFire placeholder'ıdır. Firebase'i etkinleştirmek için:

```bash
cd apps/client && flutterfire configure
```

Yapılandırılana kadar uygulama yine açılır; `MonitoringService` konsola log yazan
`LoggerMonitoringService`'e düşer (Analytics/Crashlytics devre dışı).

### Flavor'lar (dev / staging / prod)

Her ortamın kendi Dart giriş noktası (`lib/main_<flavor>.dart`), Android `productFlavor`'ı
(`com.example.{{name.snakeCase()}}.dev` gibi `applicationIdSuffix` + kendi `app_name`'i + `src/<flavor>/res` ikonları)
ve iOS scheme'i vardır. Her zaman `--flavor` ile çalıştırın (VS Code launch config'leri hazır):

```bash
cd apps/client
fvm flutter run --flavor dev -t lib/main_dev.dart
fvm flutter build apk --flavor prod -t lib/main_prod.dart
```

### Sık Kullanılan Komutlar

Melos sayesinde kök dizinden tüm paketleri yönetebilirsiniz:

- **Kod Üretimi:** Önce `slang` çevirilerini (`dart run slang`), ardından tüm paketlerde `build_runner`'ı çalıştırır.
  ```bash
  melos run gen
  ```
  Adımları ayrı ayrı çalıştırmak için: `melos run gen:slang` ve `melos run gen:build_runner`.
- **Analiz:** Kod kalitesini kontrol eder.
  ```bash
  melos run analyze
  ```
- **Format:** Kodları formatlar.
  ```bash
  melos run format
  ```
- **Temizlik:** `flutter clean` komutunu tüm paketlerde çalıştırır.
  ```bash
  melos run clean
  ```

---

## 🧱 Mason ile Yeni Feature Oluşturma

Projeye yeni bir özellik eklerken manuel dosya oluşturmak yerine **Mason** kullanıyoruz. Bu sayede mimariye uygun (Data, Domain, Presentation katmanları hazır) klasör yapısı otomatik oluşur.

1. **Mason'ı Yükle (Eğer yoksa):**
   ```bash
   dart pub global activate mason_cli
   ```

2. **Brick'leri Yükle:**
   Kök dizindeki `mason.yaml` `feature_brick`'i tanımlar; tek seferlik:
   ```bash
   mason get
   ```

3. **Yeni Feature Oluştur:**
   Örneğin `settings` adında bir özellik eklemek için (kök dizinden):
   ```bash
   mason make feature_brick --name settings -o apps/client/lib/features
   fvm exec melos run gen
   ```
   Bu komut `apps/client/lib/features/settings` altına Clean Architecture dosyalarını
   (Model + `toEntity()`, Repository, UseCase, Cubit/State, Page) ve slang çeviri dosyalarını
   (`presentation/translations/settings_en.i18n.json`, `settings_tr.i18n.json` → `t.settings.title`) oluşturur.
   `post_gen` hook'u sayfayı `core/router/app_router.dart`'a (import + `AutoRoute`) otomatik kaydeder;
   DI kaydı `@injectable` anotasyonları sayesinde `melos run gen` ile gelir.

---

## 🏃‍♂️ Uygulamayı Çalıştırma (Flavors)

Projede 3 farklı ortam (Environment) bulunur: **Dev**, **Staging**, **Prod**.
Ortam değişkenleri (Endpointler, API Keyler) `.env` dosyalarından yönetilir (`envied` paketi ile).

### Adım 1: Env Dosyalarını Hazırla
Kök dizinde `.env.example` benzeri dosyalardan şunları oluşturun ve içlerini doldurun:
- `.env.dev`
- `.env.staging`
- `.env.prod`

### Adım 2: Konfigürasyonu Üret
Env dosyalarını değiştirdiğinizde kodu tekrar üretmelisiniz:
```bash
melos run gen
```

### Adım 3: Çalıştır
İstediğiniz ortamda başlatın:

- **Geliştirme (Dev):**
  ```bash
  flutter run --flavor dev -t lib/main_dev.dart
  ```
- **Test (Staging):**
  ```bash
  flutter run --flavor staging -t lib/main_staging.dart
  ```
- **Canlı (Prod):**
  ```bash
  flutter run --flavor prod -t lib/main_prod.dart
  ```

---

## 🌍 Çoklu Dil (Localization)

`slang` paketi kullanılmaktadır. Çeviri dosyaları `lib/core/translations` veya modüllerin altında `.i18n.json` formatında bulunur.

1. JSON dosyasını düzenleyin (Örn: `strings_tr.i18n.json`).
2. `melos run gen` komutunu çalıştırın.
3. Kod içinde `Translations.of(context).hello` şeklinde kullanın.

---

## 💡 İpuçları

- **Bir şeyi değiştirmeden önce:** Mutlaka o şeyin `core` paketinde mi yoksa sadece `client` uygulamasında mı olduğuna bakın. Ortak bir yapıysa `packages/core` altında olmalıdır.
- **Hata alırsan:** Genelde `melos run gen` komutunu çalıştırmak (build_runner) çözümdür. Freezed, AutoRoute, Injectable gibi kütüphaneler kod üretimine dayalıdır.
- **Dependency Injection:** Yeni bir repository veya service yazarsanız, başına `@lazySingleton` veya `@injectable` eklemeyi unutmayın, yoksa diğer sınıflar onu bulamaz.
