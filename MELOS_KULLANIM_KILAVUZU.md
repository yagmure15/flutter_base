# Melos Kullanım Kılavuzu

Bu proje, çoklu paket (monorepo) yönetimi için **Melos** kullanmaktadır. Melos, workspace içindeki tüm paketleri tek bir yerden yönetmenizi, birbirine bağlamanızı ve toplu komutlar çalıştırmanızı sağlar.

## 1. Kurulum

Bu projede geliştirmeye başlamadan önce Melos'u global olarak kurmanız önerilir:

```bash
dart pub global activate melos
```

Eğer global kurulum yapmak istemezseniz, proje içindeki dependency üzerinden de kullanabilirsiniz ancak global kurulum kullanım kolaylığı sağlar.

## 2. Başlangıç (Bootstrap)

Projeyi ilk çektiğinizde veya `pubspec.yaml` dosyalarında değişiklik yaptığınızda, paketleri birbirine bağlamak ve bağımlılıkları yüklemek için şu komutu çalıştırın:

```bash
melos bootstrap
# veya kısaca
melos bs
```

Bu komut:
- Tüm paketler için `flutter pub get` çalıştırır.
- Paketleri yerel olarak birbirine linkler (sembolik bağlantı oluşturur), böylece bir pakette yaptığınız değişiklik diğerinde anında görünür.

## 3. Günlük Kullanım ve Scriptler

`melos.yaml` dosyasında tanımlanmış faydalı komutlar bulunmaktadır. Bu komutları `melos run <script-adı>` şeklinde çalıştırabilirsiniz.

### Analiz
Tüm projedeki statik analiz hatalarını görmek için:
```bash
melos run analyze
```

### Kod Formatlama
Tüm dosyalardaki kod stilini düzeltmek için:
```bash
melos run format
```

### Kod Üretimi (Build Runner)
`json_serializable`, `freezed`, `auto_route` gibi kütüphanelerin kod üretimini tüm paketlerde tek seferde yapmak için:
```bash
melos run gen
```
Bu komut sadece `build_runner` bağımlılığı olan paketlerde çalışır.

### Testleri Çalıştırma
Tüm testleri çalıştırmak için:
```bash
melos run test
```
Bu komut sadece `test` klasörü olan paketlerde çalışır.

### Temizlik
Tüm `build` klasörlerini ve geçici dosyaları silmek için:
```bash
melos run clean
```

## 4. Yeni Paket Ekleme

Monorepo yapısına yeni bir paket eklerken:

1. `packages/` klasörü altına yeni paketinizi oluşturun (örn: `flutter create --template=package packages/my_new_package`).
2. Ana dizindeki `melos.yaml` zaten `packages/*` altındaki her şeyi kapsadığı için ekstra bir config ayarına gerek yoktur.
3. `melos bootstrap` çalıştırarak yeni paketin sisteme dahil olmasını sağlayın.

## 5. Melos ile İleri Seviye Komutlar

Herhangi bir shell komutunu tüm paketlerde çalıştırmak için `exec` kullanabilirsiniz.

Örneğin, tüm paketlerdeki `pubspec.lock` dosyasını silmek isterseniz:
```bash
melos exec -- rm pubspec.lock
```

Sadece belirli bir pakette komut çalıştırmak isterseniz `--scope` kullanabilirsiniz:
```bash
melos exec --scope="design_system" -- flutter pub get
```

Daha fazla bilgi için [Melos Resmi Dokümantasyonu](https://melos.invertase.dev/) incelenebilir.
