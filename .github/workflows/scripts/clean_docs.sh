#!/bin/bash

# Script para limpiar archivos generados de documentación de hardware
# Ubicación: .github/workflows/scripts/clean_docs.sh
# Uso: .github/workflows/scripts/clean_docs.sh
# 
# IMPORTANTE: Este script solo limpia la documentación de hardware
# (docs/hardware/ y hardware.html) preservando la documentación de Sphinx

set -e  # Salir si hay algún error

echo "🧹 Limpiando documentación de hardware generada..."

# Obtener la ruta del directorio del proyecto (3 niveles arriba desde .github/workflows/scripts)
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
cd "$PROJECT_DIR"

echo "📂 Directorio del proyecto: $PROJECT_DIR"

# Verificar que el directorio docs existe
if [ ! -d "docs" ]; then
    echo "ℹ️  Directorio docs no existe, no hay nada que limpiar"
    exit 0
fi

# Contar archivos/directorios antes de limpiar
hardware_files_before=0
hardware_dirs_before=0

if [ -d "docs/hardware" ]; then
    hardware_files_before=$(find docs/hardware -type f 2>/dev/null | wc -l)
    hardware_dirs_before=$(find docs/hardware -type d 2>/dev/null | wc -l)
fi

if [ -f "docs/hardware.html" ]; then
    hardware_files_before=$((hardware_files_before + 1))
fi

echo "📊 Archivos de hardware antes de limpiar: $hardware_files_before"

# Eliminar solo los archivos de documentación de hardware
# Preservar toda la documentación de Sphinx
echo "🗑️  Eliminando documentación de hardware..."

# Eliminar directorio docs/hardware/
if [ -d "docs/hardware" ]; then
    rm -rf docs/hardware
    echo "  ✓ Eliminado: docs/hardware/"
fi

# Eliminar archivo hardware.html si existe
if [ -f "docs/hardware.html" ]; then
    rm -f docs/hardware.html
    echo "  ✓ Eliminado: docs/hardware.html"
fi

# Contar archivos después de limpiar
hardware_files_after=0

if [ -d "docs/hardware" ]; then
    hardware_files_after=$(find docs/hardware -type f 2>/dev/null | wc -l)
fi

if [ -f "docs/hardware.html" ]; then
    hardware_files_after=$((hardware_files_after + 1))
fi

# Mostrar estadísticas
files_deleted=$((hardware_files_before - hardware_files_after))

echo "✅ Eliminados: $files_deleted archivo(s) de hardware"
echo "💾 Documentación de Sphinx preservada"

# Verificar que la documentación de Sphinx sigue intacta
if [ -f "docs/index.html" ]; then
    echo "✓ Documentación de Sphinx: OK (index.html presente)"
else
    echo "⚠️  Advertencia: docs/index.html no encontrado (puede ser normal si aún no se ha generado)"
fi

echo "✨ Limpieza completada!"