# Proje Araştırma Notları

## 1. Crontab (Zamanlayıcı)
Linux'ta periyodik işler için kullanılır.
Format: `Dakika Saat Gün Ay HaftanınGünü Komut`

## 2. Yedekleme Stratejisi
Veri kaybını önlemek için 'tar' komutu ile sıkıştırma yöntemi seçildi.
Disk alanından tasarruf etmek için .tar.gz formatı kullanılıyor.

## 3. Güvenlik Önlemleri
Script çalışırken dosya okuma/yazma izinleri (chmod +x) kontrol edilmeli.
