#!/bin/bash

# Script para agregar enlace a hardware.html en el index.html de Sphinx
# Ubicación: .github/workflows/scripts/add_hardware_link.sh
# Uso: .github/workflows/scripts/add_hardware_link.sh

set -e  # Salir si hay algún error

echo "🔗 Agregando enlace a documentación de hardware en Sphinx..."

# Obtener la ruta del directorio del proyecto
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
cd "$PROJECT_DIR"

INDEX_FILE="docs/index.html"

# Verificar que existe el index.html de Sphinx
if [ ! -f "$INDEX_FILE" ]; then
    echo "ℹ️  Archivo $INDEX_FILE no existe aún"
    echo "   El enlace se agregará cuando se genere la documentación de Sphinx"
    exit 0
fi

# Verificar que hardware.html existe
if [ ! -f "docs/hardware.html" ]; then
    echo "⚠️  Advertencia: docs/hardware.html no existe"
    exit 0
fi

# Verificar si ya existe el enlace para evitar duplicados
if grep -q "hardware.html" "$INDEX_FILE"; then
    echo "✓ El enlace a hardware.html ya existe en index.html"
    exit 0
fi

# Crear un script de inyección HTML
HARDWARE_LINK='<div style="position: fixed; top: 80px; right: 20px; z-index: 1000;"><a href="hardware.html" class="btn btn-sm" style="background-color: #6366f1; color: white; padding: 8px 16px; border-radius: 6px; text-decoration: none; box-shadow: 0 2px 4px rgba(0,0,0,0.1); display: inline-flex; align-items: center; gap: 8px; font-weight: 500;" title="Ver documentación de hardware"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16"><path d="M5 0a.5.5 0 0 1 .5.5V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2A2.5 2.5 0 0 1 14 4.5h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14a2.5 2.5 0 0 1-2.5 2.5v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14A2.5 2.5 0 0 1 2 11.5H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2A2.5 2.5 0 0 1 4.5 2V.5A.5.5 0 0 1 5 0m-.5 3A1.5 1.5 0 0 0 3 4.5v7A1.5 1.5 0 0 0 4.5 13h7a1.5 1.5 0 0 0 1.5-1.5v-7A1.5 1.5 0 0 0 11.5 3zM5 6.5A1.5 1.5 0 0 1 6.5 5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5zM6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5z"/></svg> Hardware</a></div>'

# Crear backup
cp "$INDEX_FILE" "${INDEX_FILE}.backup"

# Inyectar el enlace justo después de <body>
# Usando sed para insertar después de la etiqueta <body>
sed -i "/<body>/a\\
$HARDWARE_LINK" "$INDEX_FILE"

# Verificar que la inyección fue exitosa
if grep -q "hardware.html" "$INDEX_FILE"; then
    echo "✅ Enlace agregado exitosamente a $INDEX_FILE"
    rm "${INDEX_FILE}.backup"
else
    echo "❌ Error al agregar el enlace, restaurando backup"
    mv "${INDEX_FILE}.backup" "$INDEX_FILE"
    exit 1
fi

echo "✨ ¡Proceso completado!"
