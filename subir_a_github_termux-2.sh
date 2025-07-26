#!/data/data/com.termux/files/usr/bin/bash

echo "📁 Moviéndose a carpeta de descargas..."
cd /storage/emulated/0/Download

echo "📦 Descomprimiendo proyecto..."
unzip -o app_seguros_segura.zip -d app-seguros-segura

cd app-seguros-segura

echo "🔧 Inicializando repositorio Git..."
git init
git add .
git commit -m 'Subida automática desde Termux: proyecto con firma digital'

echo "🌐 Configurando remoto..."
git branch -M main
git remote add origin https://github.com/alexrd2025/app-seguros-segura.git

echo "⬆️ Subiendo archivos..."
echo "🔑 Cuando te pida contraseña, pega el token de acceso personal de GitHub."
git push -u origin main
