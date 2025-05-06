ESP-IDF Getting Started
========================

The ESP-IDF (Espressif IoT Development Framework) is the official development framework for ESP32 series chips. It provides a comprehensive suite of tools, libraries, and APIs to facilitate application development for ESP32 devices.

This section offers a step-by-step guide to setting up the ESP-IDF environment for the ESP32-C6 chip, including installation instructions and basic usage examples. While the focus is on the ESP32-C6, the guidelines are generally applicable to other ESP32 chips.

**Supported Environment:** Ubuntu 20.04 or later.

For users on other operating systems, please consult the official ESP-IDF documentation for platform-specific instructions.

.. note::

   **ESP-IDF** is compatible with Windows and macOS, but the installation process may differ. Refer to the official documentation for detailed instructions.

   .. raw:: html

      <div style="text-align: center; margin-top: 10px;">
          <p>Visit the official ESP-IDF documentation for platform-specific guidance:</p>
          <a href="https://docs.espressif.com/projects/esp-idf/en/stable/esp32/get-started/index.html" target="_blank" style="text-decoration: none;">
              <button style="background-color: #0078D7; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">
                  Open ESP-IDF Documentation
              </button>
          </a>
      </div>

.. attention::
   A stable internet connection is required during installation, as some steps involve downloading necessary files.


Installation Steps
------------------

1. **Install Prerequisites**  
   Ensure all required dependencies are installed. Execute the following commands in a terminal:

   .. code-block:: bash

      sudo apt-get update
      sudo apt-get install git wget flex bison gperf python3 python3-pip python3-setuptools python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util device-tree-compiler

2. **Clone the ESP-IDF Repository**  
   Clone the ESP-IDF repository from GitHub. Optionally, specify a particular version or branch.

   .. code-block:: bash

      git clone https://github.com/espressif/esp-idf.git

3. **Set Up the Environment**  
   Navigate to the cloned ESP-IDF directory and execute the setup script to configure environment variables.

   .. code-block:: bash

      cd esp-idf
      ./install.sh
      . ./export.sh

   .. note::

      To install tools for all supported chips, use the following command::

         ./install.sh --all

4. **Install Additional Tools**  
   For ESP32-C6-specific tools, run:

   .. code-block:: bash

      ./install.sh --esp32c6

   .. note::

      The `install.sh` script downloads and installs the required tools and dependencies for the ESP32-C6 chip. The duration depends on your internet speed.

5. **Verify Installation**  
   Confirm the installation by checking the ESP-IDF version:

   .. code-block:: bash

      idf.py --version


Customizing the Installation Path
---------------------------------

To customize the installation path of ESP-IDF, set the `IDF_PATH` environment variable. For example:

.. code-block:: bash

   export IDF_PATH=/path/to/your/esp-idf
   . $IDF_PATH/export.sh
   . $IDF_PATH/install.sh

.. note::

   Replace `/path/to/your/esp-idf` with the desired installation directory. This ensures the `IDF_PATH` variable points to the correct location, and the `export.sh` and `install.sh` scripts are executed from there.


First Steps with ESP-IDF
-------------------------

1. **Create a New Project**  
   Create a directory for your ESP-IDF project and navigate to it:

   .. code-block:: bash

      mkdir my_project
      cd my_project

2. **Generate a Basic Application**  
   Use the `idf.py` tool to create a basic application template:

   .. code-block:: bash

      idf.py create-project my_app

3. **Build the Project**  
   Navigate to the project directory and build the application:

   .. code-block:: bash

      cd my_app
      idf.py build

4. **Flash the Application**  
   Connect your ESP32-C6 board to your computer and flash the application:

   .. code-block:: bash

      idf.py -p /dev/ttyUSB0 flash

5. **Monitor the Output**  
   Monitor the output from the ESP32-C6 board:

   .. code-block:: bash

      idf.py -p /dev/ttyUSB0 monitor

6. **Modify the Code**  
   Edit the code in the `main` directory of your project. The main application file is typically named `main.c` or `main.cpp`. After making changes, rebuild and flash the project.

7. **Clean the Project**  
   To remove all build artifacts, run:

   .. code-block:: bash

      idf.py fullclean

8. **Update ESP-IDF**  
   To update ESP-IDF to the latest version, navigate to the ESP-IDF directory and execute:

   .. code-block:: bash

      git pull
      ./install.sh
      . ./export.sh

9. **Uninstall ESP-IDF**  
   To uninstall ESP-IDF, delete the cloned repository and unset related environment variables:

   .. code-block:: bash

      rm -rf esp-idf
      unset IDF_PATH
      unset PATH
      unset LD_LIBRARY_PATH
      unset PYTHONPATH
      unset CMAKE_PREFIX_PATH

10. **Explore ESP-IDF Examples**  
    The ESP-IDF repository includes numerous example projects demonstrating various features. These can be found in the `examples` directory. Copy and modify any example project as needed.

11. **Refer to ESP-IDF Documentation**  
    For comprehensive information, including API references and guides, visit the official ESP-IDF documentation: `ESP-IDF Documentation <https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html>`__.

12. **Join the ESP-IDF Community**  
    For assistance or discussions, join the ESP-IDF community on GitHub or the Espressif Community Forum. The community is active and provides support for various ESP32 development topics.