# {{name.titleCase()}}

Bu proje, ölçeklenebilir, test edilebilir ve bakımı kolay mobil uygulamalar geliştirmek için tasarlanmış modern bir **{{name.titleCase()}}** (Temel) projesidir.

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

---

## 🛠 Geliştirme Araçları ve Komutlar

Bu proje bir **Monorepo** yapısındadır (Melos ile yönetilir). Yani `apps/` altında uygulamalar, `packages/` altında ortak kütüphaneler bulunur.

### Hazırlık (Setup)

Projeyi ilk kez indirdiğinizde bağımlılıkları kurmak ve bağlamak için:

```bash
melos bootstrap
```
*Alternatif:* Kök dizinde `flutter pub get` çalıştırılabilir ancak Melos kullanmak daha sağlıklıdır.

### Sık Kullanılan Komutlar

Melos sayesinde kök dizinden tüm paketleri yönetebilirsiniz:

- **Kod Üretimi (Build Runner):** Tüm paketlerde `build_runner` çalıştırır.
  ```bash
  melos run gen
  ```
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

2. **Feature Brick'ini Ekle:**
   Proje içindeki `project_starter_brick` şablonunu kullanabilirsiniz. (Genelde `mason add` ile eklenir).

3. **Yeni Feature Oluştur:**
   Örneğin `settings` adında bir özellik eklemek için:
   ```bash
   mason make feature_brick --name settings
   ```
   Bu komut `lib/features/settings` altına gerekli tüm Clean Architecture dosyalarını (Repository, UseCase, Cubit, Page) oluşturacaktır.

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
