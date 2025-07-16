Desktop Environment 
===================

The environment setup is the first step to start working with the PULSAR C6 board.
The following steps will guide you through the setup process.

1. Install the required software
2. Set up the development environment
3. Install the required libraries
4. Set up the board


Install the required software
-----------------------------

The following software is required to start working with the PULSAR C6 board:

1. **Python 3.7 or later**: Python is required to run the scripts and tools provided by the PULSAR C6 board.
2. **Git**: Git is required to clone the PULSAR C6 board repository.
3. **MinGW**: MinGW is a native Windows port of the GNU Compiler Collection (GCC), with freely distributable import libraries and header files for building native Windows applications.
4. **Visual Studio Code**: Visual Studio Code is a code editor that is required to write and compile the code.


This section will guide you through the installation process of the required software.

Python 3.7 or later
-------------------

Python is a programming language that is required to run the scripts and tools, 

To install Python, follow the instructions below:

1. Download the Python installer from the:

    .. raw:: html
        
        <a href="https://www.python.org/downloads/" target="_blank">Python website</a>

2. Run the installer and follow the instructions.

.. figure:: /_static/python.png
    :width: 80%
    :align: center

    Add python to PATH


.. attention::

   Make sure to check the box that says "Add Python to PATH" during the installation process.

Open a terminal and run the following command to verify the installation:

.. code-block:: bash

   python --version

If the installation was successful, you should see the Python version number.

Git
---

Git is a version control system that is required to clone the repositories in general.
To install Git, follow the instructions below:

1. Download the Git installer from the

    .. raw:: html
        
        <a href="https://git-scm.com/downloads" target="_blank">Git website</a>

2. Run the installer and follow the instructions.
3. Open a terminal and run the following command to verify the installation:

.. code-block:: bash

   git --version

If the installation was successful, you should see the Git version number.

MinGW
-----

MinGW is a native Windows port of the GNU Compiler Collection (GCC), with freely distributable import libraries and header files for building native Windows applications.
MinGW provides a complete Open Source programming toolset that is suitable for the development of native Windows applications, and which do not depend on any 3rd-party 
C-Runtime DLLs. MinGW, being Minimalist, does not, and never will, attempt to provide a POSIX runtime environment for POSIX application deployment on MS-Windows. 
If you want POSIX application deployment on this platform, please consider Cygwin instead.

To install MinGW, follow the instructions below:

1. Download the MinGW installer from the

    .. raw:: html
        
        <a href="#" target="_blank">MinGW website</a>

2. Run the installer and follow the instructions.

.. figure:: /_static/mingw.png
    :width: 80%
    :align: center

    MinGW installer




.. note:: 
    
   During the installation process, make sure to select the following packages:
   
   - mingw32-base
   - mingw32-gcc-g++
   - msys-base



.. figure:: /_static/mingw2.png
    :width: 80%
    :align: center

    MinGW installation


3. Open a terminal and run the following command to verify the installation:

.. code-block:: bash

   mingw --version
    
If the installation was successful, you should see the MinGW version number.

Environment Variable Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Remember that for Windows operating systems, an extra step is necessary, which is to open the environment variable -> Edit environment variable::

    C:\MinGW\bin



Locate the file
~~~~~~~~~~~~~~~

After installing MinGW, you will need to locate the `mingw32-make.exe` file. This file is typically found in the `C:/MinGW/bin` directory. Once located, rename the file to `make.exe`.

.. _make_file:
.. figure:: /_static/make_file.png
   :align: center
   :alt: Locating the mingw32-make.exe file.
   :width: 90%

   Locating the `mingw32-make.exe` file

Rename it
~~~~~~~~~

After locating `mingw32-make.exe`, rename it to `make.exe`. This change is necessary for compatibility with many build scripts that expect the command to be named `make`.

.. _rename:
.. figure:: /_static/rename.png
   :align: center
   :alt: Renaming mingw32-make.exe to make.exe.
   :width: 90%
   
   Renaming `mingw32-make.exe` to `make.exe`

.. warning::  
    If you encounter any issues, create a copy of the file and then rename the copy to `make.exe`.

Add the path to the environment variable
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Next, you need to add the path to the MinGW bin directory to your system's environment variables. This allows the `make` command to be recognized from any command prompt.

1. Open the Start Search, type in "env", and select "Edit the system environment variables".
2. In the System Properties window, click on the "Environment Variables" button.
3. In the Environment Variables window, under "System variables", select the "Path" variable and click "Edit".
4. In the Edit Environment Variable window, click "New" and add the path::

    C:\MinGW\bin

.. _var_env:
.. figure:: /_static/var_env.png
   :align: center
   :alt: Adding MinGW bin directory to environment variables.
   :width: 60%
   
   Adding MinGW bin directory to environment variables

Visual Studio Code
------------------

Visual Studio Code is a code editor that is required to write and compile the code.

To install Visual Studio Code, follow the instructions below:

1. Download the Visual Studio Code installer from the

    .. raw:: html
        
        <a href="https://code.visualstudio.com/download" target="_blank">Visual Studio Code website</a>


2. Run the installer and follow the instructions.

.. figure:: /_static/vscode.png
    :width: 80%
    :align: center

    Visual Studio Code installer

.. note::

    During the installation process, make sure to check the box that says "Open with Code".


3. Open a terminal and run the following command to verify the installation:

.. code-block:: bash

   code --version

4. Install extensions for Visual Studio Code:

    .. figure:: /_static/vscode_gf.png
        :width: 80%
        :align: center

        Visual Studio Code extensions


Arduino IDE Installation
------------------------

The Arduino IDE is a popular open-source platform for building and programming microcontroller-based projects. It provides a user-friendly interface and a wide range of libraries to simplify the development process.

To install the Arduino IDE, follow the instructions for your operating system in the 

.. raw:: html

    <a href="https://unit-electronics-mx.github.io/wiki_uelectronics/docs/Code/Compatibility_Arduino_upython/Arduino/" target="_blank">Unit Electronics Package Installation Guide</a>.


Thonny IDE Installation
------------------------

Thonny is a Python IDE that is designed for beginners. It provides a simple interface and built-in support for MicroPython, making it an excellent choice for programming the PULSAR C6 board.

Follow the instructions for your operating system in the 

.. raw:: html

    <a href="https://unit-electronics-mx.github.io/wiki_uelectronics/docs/Code/Compatibility_Arduino_upython/upython" target="_blank">Micropython Compatibility Guide</a>.
    <br> </br>



