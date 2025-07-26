#!/data/data/com.termux/files/usr/bin/bash

echo "🔍 Iniciando limpieza..." | tee limpieza.log

# Buscar archivos basura
find . -type f \( \
    -name "*\.trashed*" -o \
    -name "*.orig" -o \
    -name "*.tmp" -o \
    -name "*.swp" -o \
    -name ".DS_Store" \
\) > archivos_a_borrar.txt

# Mostrar y eliminar archivos encontrados
if [ -s archivos_a_borrar.txt ]; then
    echo "🗑️ Archivos eliminados (por lista):" | tee -a limpieza.log
    while IFS= read -r archivo; do
        echo " - $archivo" | tee -a limpieza.log
        rm -f "$archivo"
    done < archivos_a_borrar.txt
else
    echo "✅ No se encontraron archivos basura por lista." | tee -a limpieza.log
fi

# Borrado de respaldo: forzar eliminación de cualquier archivo que contenga "trashed"
echo "🧹 Borrado forzado de respaldo (*.trashed*)" | tee -a limpieza.log
find . -type f -name '*trashed*' -exec echo " - {}" \; -exec rm -f {} \; >> limpieza.log

# Añadir patrones a .gitignore
touch .gitignore
for patron in '*\.trashed*' '*.orig' '*.tmp' '*.swp' '.DS_Store'; do
    grep -qxF "$patron" .gitignore || echo "$patron" >> .gitignore
done

# Hacer commit si hay cambios
git add .gitignore limpieza.log
git commit -m "🧹 Limpieza avanzada y log de respaldo generado"
git push

# Eliminar archivo temporal
rm -f archivos_a_borrar.txt

echo "✅ Limpieza completa." | tee -a limpieza.log
