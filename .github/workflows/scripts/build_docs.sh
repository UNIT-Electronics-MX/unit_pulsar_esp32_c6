#!/bin/bash

# Script para ejecutar el proceso de copia de documentación de hardware
# Ubicación: .github/workflows/scripts/build_docs.sh
# Uso: .github/workflows/scripts/build_docs.sh

set -e  # Salir si hay algún error

echo "🔨 Iniciando construcción de documentación de hardware..."

# Obtener la ruta del directorio del proyecto (3 niveles arriba desde .github/workflows/scripts)
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
cd "$PROJECT_DIR"

echo "📂 Directorio del proyecto: $PROJECT_DIR"

# Verificar que Python está disponible
if ! command -v python3 &> /dev/null; then
    echo " Python3 no está instalado"
    exit 1
fi

# Crear directorio temporal para el entorno virtual
TEMP_VENV=$(mktemp -d)
echo " Creando entorno virtual temporal en: $TEMP_VENV"

# Crear entorno virtual
python3 -m venv "$TEMP_VENV"

# Activar entorno virtual
echo " Activando entorno virtual..."
source "$TEMP_VENV/bin/activate"

# Instalar dependencias
echo " Instalando dependencias..."
pip install --upgrade pip --quiet
pip install Jinja2 --quiet

# Ejecutar script de copia
echo "📋 Ejecutando script de copia..."
python3 .github/workflows/scripts/copy_hardware_docs.py

# Limpiar entorno virtual temporal
echo " Limpiando entorno virtual temporal..."
deactivate
rm -rf "$TEMP_VENV"

# Verificar que los archivos se generaron correctamente
if [ -f "docs/hardware.html" ]; then
    echo "✅ Documentación de hardware generada exitosamente!"
    echo "📄 Archivos generados:"
    echo "   - docs/hardware.html (página de hardware)"
    echo "   - docs/hardware/ (archivos copiados)"
    
    # Mostrar estadísticas
    if [ -d "docs/hardware" ]; then
        file_count=$(find docs/hardware -type f | wc -l)
        echo "📊 Total de archivos copiados: $file_count"
    fi
    
    # Verificar que la documentación de Sphinx sigue intacta
    if [ -f "docs/index.html" ]; then
        echo "💾 Documentación de Sphinx preservada: OK"
    else
        echo "⚠️  Nota: docs/index.html no existe (la documentación de Sphinx aún no ha sido generada)"
    fi
    
else
    echo "❌ Error: No se pudo generar la documentación de hardware"
    exit 1
fi

echo "✨ ¡Proceso completado!"
echo "📖 Documentación de hardware: docs/hardware.html"
echo "📖 Documentación de Sphinx: docs/index.html"