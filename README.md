Markdown
# Belajar Terraform dengan Google Cloud Platform (GCP)

## 📚 Referensi Belajar

- **Tutorial Terraform (YouTube)**
  - https://youtu.be/jasUn8RguEg?si=8sGvoeNyHQsbx1-t
- **Dokumentasi Instalasi Terraform**
  - https://developer.hashicorp.com/terraform/install
- **Dokumentasi Instalasi Google Cloud CLI**
  - https://docs.cloud.google.com/sdk/docs/install-sdk?hl=id

---

# 💻 Instalasi & Konfigurasi Lingkungan

## 1. Instalasi Terraform
Ikuti panduan resmi dari HashiCorp:
https://developer.hashicorp.com/terraform/install

## 2. Instalasi Google Cloud CLI
Ikuti panduan resmi Google Cloud:
https://docs.cloud.google.com/sdk/docs/install-sdk?hl=id

## 3. Konfigurasi Google Cloud CLI

### A. Login ke Google Cloud
```bash
gcloud auth login
Perintah ini digunakan untuk melakukan autentikasi akun Google ke Google Cloud CLI lewat browser.

B. Memilih Project GCP
Bash
gcloud config set project PROJECT_ID
Contoh:

Bash
gcloud config set project project-56b2f5d2-7168-44bb-ab5
C. Login Application Default Credentials (ADC)
Bash
gcloud auth application-default login
Perintah ini wajib dijalankan agar Terraform dapat meminjam kredensial lokal laptop kamu untuk mengelola resource di Google Cloud.

D. Melihat Daftar Image Compute Engine
Untuk melihat daftar operating system image yang tersedia secara global di Google Cloud, gunakan perintah:

Bash
gcloud compute images list
🔌 Terraform Google Provider & Struktur Dasar
Dokumentasi resmi Google Provider untuk Terraform:
https://registry.terraform.io/providers/hashicorp/google/latest

Contoh Blok Provider
Terraform
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.39.0"
    }
  }
}

provider "google" {
  project = "project-56b2f5d2-7168-44bb-ab5"
  region  = "asia-southeast2"
}
🛠️ Perintah Dasar Terraform
1. Format Kode
Merapikan format penulisan file Terraform agar sesuai best practice.

Bash
terraform fmt
2. Validasi Konfigurasi
Memastikan konfigurasi Terraform tidak memiliki kesalahan sintaks atau argumen yang keliru sebelum dijalankan.

Bash
terraform validate
3. Inisialisasi Project
Mengunduh provider (plugin) dan menginisialisasi direktori kerja Terraform.

Bash
terraform init
Jalankan kembali jika:

Menambahkan provider baru

Mengubah versi provider

Mengubah konfigurasi backend Terraform

4. Melihat Rencana Perubahan
Menampilkan cetak biru (blueprint) resource yang akan dibuat, diubah, atau dihapus oleh Terraform di infrastruktur asli.

Bash
terraform plan
5. Menerapkan Konfigurasi
Menjalankan konfigurasi Terraform ke Google Cloud untuk membuat/mengubah infrastruktur.

Bash
terraform apply
📊 Konsep Lanjutan Terraform
1. Output Values
Output Values mirip dengan nilai kembalian (return value) pada fungsi di bahasa pemrograman. Kegunaannya adalah untuk menampilkan informasi penting ke terminal setelah terraform apply sukses dijalankan (seperti IP Publik VM, ID Database, dll), atau membagikan data tersebut ke modul Terraform lainnya.

Contoh Implementasi (outputs.tf atau main.tf):
Terraform
output "vm_public_ip" {
  value       = google_compute_instance.test.network_interface[0].access_config[0].nat_ip
  description = "IP Publik dari Virtual Machine Anda"
}
2. Terraform Refresh
Bash
terraform refresh
Perintah ini digunakan untuk membaca ulang kondisi riil infrastruktur di Google Cloud dan menyamakan datanya ke dalam file terraform.tfstate.

Catatan: Perintah ini tidak mengubah infrastruktur asli, ia hanya memperbarui catatan lokal Terraform jika ada perubahan manual dari luar (misal ada yang mengubah setelan lewat Console Browser). Sejak versi Terraform modern, proses refresh sudah otomatis berjalan setiap kali kamu mengetik terraform plan atau terraform apply.

3. Manajemen Terraform State
State adalah berkas peta (terraform.tfstate) yang mencatat semua resource yang dikelola oleh Terraform.

A. Melihat Semua List State
Menampilkan semua resource yang saat ini sedang dilacak dan dikelola oleh Terraform.

Bash
terraform state list
B. Melihat Detail dari Suatu State
Melihat informasi konfigurasi mendalam (seperti IP, MAC address, metadata) dari satu resource spesifik yang terdaftar di state.

Bash
terraform state show <resource_type>.<resource_name>
Contoh:

Bash
terraform state show google_compute_instance.test
C. Menghapus State
Menghapus pelacakan resource dari file state tanpa menghancurkan/menghapus resource aslinya di GCP Cloud. (Resource menjadi "terlepas" dari manajemen Terraform).

Bash
terraform state rm <resource_type>.<resource_name>
Contoh:

Bash
terraform state rm google_compute_instance.test-2
🎯 Penargetan & Penghapusan Spesifik (Targeted Actions)
Secara bawaan, Terraform mengelola seluruh file .tf secara massal. Jika kamu ingin membatasi eksekusi plan, apply, atau destroy hanya pada satu resource tertentu saja, gunakan parameter -target.

1. Cara Plan & Apply secara Spesifik
Bash
terraform plan -target=<resource_type>.<resource_name>
terraform apply -target=<resource_type>.<resource_name>
Contoh:

Bash
terraform apply -target=google_compute_instance.test
2. Menghapus Spesifik Resource
Menghancurkan satu resource tertentu di GCP tanpa mengganggu resource lainnya yang ada di file konfigurasi.

Bash
terraform destroy -target=<resource_type>.<resource_name>
Contoh:

Bash
terraform destroy -target=google_compute_instance.test-2
3. Menghapus Semua Resource
Menghapus seluruh infrastruktur yang terdaftar di dalam proyek Terraform saat ini.

Bash
terraform destroy
🧬 Resource Lifecycle
Secara default, jika kamu mengubah argumen resource yang membutuhkan pembuatan ulang (seperti mengganti OS Image), Terraform akan menghapus resource lama terlebih dahulu baru membuat yang baru. Perilaku ini bisa diatur menggunakan blok lifecycle di dalam resource.

Ada 3 argumen utama di dalam blok lifecycle:

Terraform
resource "google_compute_instance" "test" {
  # ... konfigurasi utama ...

  lifecycle {
    # 1. Membuat resource pengganti yang baru dulu sebelum menghapus yang lama
    create_before_destroy = true

    # 2. Mencegah resource dihapus secara tidak sengaja (Terraform akan menolak perintah destroy)
    prevent_destroy       = false

    # 3. Mengabaikan perubahan pada atribut tertentu saat mendeteksi perbedaan
    ignore_changes        = [ labels, tags ]
  }
}
📥 Panduan Step-by-Step Terraform Import
Terraform Import digunakan saat kamu memiliki resource yang sudah dibuat secara manual (misal lewat Console Browser GCP) dan kamu ingin memasukkan resource tersebut agar dikelola secara otomatis oleh script Terraform.

Langkah 1: Buat Blok Resource Kosong di File .tf
Buka file main.tf, lalu buat deklarasi resource kosong dengan tipe dan nama yang kamu inginkan.

Terraform
resource "google_compute_instance" "vm_manual" {
  # Biarkan kosong dulu atau isi argumen wajibnya saja tanpa detail
}
Langkah 2: Cari Alamat Identitas Unik Resource di GCP
Temukan ID unik dari resource tersebut. Untuk VM GCP, format ID-nya adalah:
projects/<project-id>/zones/<zone>/instances/<nama-vm>
Contoh: projects/project-56b2f5d2-7168-44bb-ab5/zones/asia-southeast2-a/instances/vm-buatan-tangan

Langkah 3: Jalankan Perintah terraform import
Jalankan perintah pengikatan di terminal dengan menyertakan <alamat_resource_terraform> <ID_GCP_asli>:

Bash
terraform import google_compute_instance.vm_manual projects/project-56b2f5d2-7168-44bb-ab5/zones/asia-southeast2-a/instances/vm-buatan-tangan
Jika sukses, data infrastruktur manual tadi kini sudah tersimpan di dalam berkas lokal terraform.tfstate kamu.

Langkah 4: Sinkronisasikan Kode dengan State (Jalankan Plan)
Ketik perintah:

Bash
terraform plan
Terraform akan membandingkan kode kosong kamu di Langkah 1 dengan data riil hasil impor. Lihat terminal, lalu lengkapi atribut di dalam file main.tf kamu (seperti machine_type, boot_disk, dll) hingga perintah terraform plan memunculkan pesan: "No changes. Infrastructure is up-to-date."

🔄 Alur Penggunaan Terraform (Workflow)
Plaintext
Membuat / Mengubah file .tf
        │
        ▼
terraform fmt          ◄─ Merapikan gaya penulisan kode
        │
        ▼
terraform validate     ◄─ Memeriksa kesalahan sintaks
        │
        ▼
terraform init         ◄─ Mengunduh provider/plugin (Jika awal/ada perubahan)
        │
        ▼
terraform plan         ◄─ Meninjau rencana perubahan infrastruktur
        │
        ▼
terraform apply        ◄─ Menerapkan perubahan & membuat resource ke GCP
        │
        ▼
Resource berhasil hidup / terkelola di GCP
📌 Catatan Tambahan untuk Developer
Selalu jalankan terraform fmt sebelum melakukan commit kode ke Git.

Manfaatkan terraform plan secara teliti untuk menghindari kesalahan arsitektur atau biaya yang membengkak di GCP sebelum melakukan apply.

Jangan pernah mengubah data di dalam file terraform.tfstate secara manual menggunakan text editor. Selalu gunakan perintah terraform state ....