# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information


import os
import sys
sys.path.insert(0, os.path.abspath('.'))

project = 'UNIT NANO C6'
copyright = '2024, Unit Electronics'
author = 'Cesar Bautista'
release = '0.0.1'
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
    'sphinx.ext.napoleon',
    'sphinx.ext.doctest',
    'sphinx.ext.intersphinx',
    'sphinx.ext.todo',
    'sphinx.ext.coverage',
    'sphinx.ext.mathjax',
    'sphinx.ext.ifconfig',
    'sphinx.ext.githubpages',
    'sphinx_togglebutton',
    'rst2pdf.pdfbuilder',
    'sphinx_tabs.tabs',
    'sphinx_copybutton',  # Add this extension


]
copybutton_prompt_text = ">>> "  # Removes prompts from code blocks
copybutton_only_copy_prompt_lines = False  # Copies all lines, including those without a prompt


templates_path = ['_templates']
html_theme_options = {
    "repository_url": "https://github.com/UNIT-Electronics-MX/unit_pulsar_esp32_c6",
    "repository_branch": "main",  # Rama principal de tu repositorio
      "path_to_docs": "docs/",  # Ruta a la documentación dentro del repositorio
    "use_repository_button": True,  # Muestra un botón que enlaza al repositorio
    "use_issues_button": True,  # Muestra un botón que enlaza a la sección de issues
    "use_edit_page_button": True,  # Muestra un botón para editar la página actual
}
exclude_patterns = []
master_doc = 'index'
numfig = True

html_theme = 'sphinx_book_theme'
html_logo = "_static/Logo-UNIT_Web-04-800x182.png"
html_static_path = ['_static']
latex_logo = "_static/Logo-UNIT_Web-04-800x182.png"
html_css_files = [
    'custom.css',
]
