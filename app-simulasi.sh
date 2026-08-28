#!/bin/bash
# testing secret manager
DB_PASSWORD=$(gcloud secrets versions access latest --secret="latihan-db-password")

echo "Aplikasi jalan dengan password yang diambil dari Secret Manager (panjang: ${#DB_PASSWORD} karakter)" 