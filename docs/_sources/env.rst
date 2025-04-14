Environment Setup
=====================

MicroPython Installation on DualMCU 
-----------------------------------
This repository contains a basic example of how to install MicroPython on the DualMCU using the ESP32 microcontroller. The main goal is for you to find this repository useful and be able to incorporate parts of this implementation into your projects.

Environment Setup
~~~~~~~~~~~~~~~~~
Before you start, it is recommended to perform the following setup:

Install MicroPython
^^^^^^^^^^^^^^^^^^^^

This will allow you to download the firmware to the DualMCU using the `Thonny IDE <https://thonny.org/>`_.

1. Go to **"Run"** -> **"Configure interpreter"** to complete the setup.

.. _figure_configure_interpreter:

.. figure:: /_static/config_interpreter.png
    :alt: Interpreter Configuration
    :width: 60%
    :align: center

    Interpreter Configuration

Firmware Update
~~~~~~~~~~~~~~~~~
.. tabs::

    .. tab:: ESP32
                    
            To use MicroPython, it is recommended to consider an update. Follow these steps to update your DualMCU ESP32:

            1. Start your DualMCU ESP32 by pressing the FLASH button.
            2. Click on **"Install or Update MicroPython"**.
            3. A new window will open. Use the following configuration:


                - **Variant**: Espessif ESP32/WROOM
                - **Version**: 1.20.0
                
            .. _figure_installer:

            .. figure:: /_static/installer.png
                :alt: Installer
                :width: 70%
                :align: center

                ESP32 Installer Configuration



            4. Press **Install** and wait for the installation to finish.

            These steps will allow you to update and properly configure MicroPython on your DualMCU ESP32.
    
    .. tab:: RP2040
                    
            To use MicroPython, it is recommended to consider an update. Follow these steps to update your DualMCU RP2040:

            1. Start your DualMCU RP2040 by pressing the FLASH button.
            2. Click on **"Install or Update MicroPython"**.
            3. A new window will open. Use the following configuration:

                - **Variant**: Raspberry Pi Pico / Pico H
                - **Version**: 1.23.0
            .. _figure_rp2040_installer:

            .. figure:: /_static/rp2040_installer.png
                :alt: Installer
                :width: 70%
                :align: center

                RP2040 Installer Configuration

            4. Press **Install** and wait for the installation to finish.

            These steps will allow you to update and properly configure MicroPython on your DualMCU ESP32.


Running the Example
~~~~~~~~~~~~~~~~~~~~

Once you have set up the environment, you can open and run the example, open Thonny, and follow these steps:

1. Go to the bottom right corner and select the **"MicroPython (ESP32)"** option.

.. _figure_select_interpreter:

.. figure:: /_static/esp32_thonny.png
    :alt: ESP32 Interpreter
    :width: 60%
    :align: center

    ESP32 Interpreter

Blink Example
^^^^^^^^^^^^^

Inside the **Examples** folder, you will find a basic example called "blink" that you can use to verify that the setup was applied correctly.

.. code-block:: python

   '''
   Unit Electronics 2023
          (o_
   (o_    //\
   (/)_   V_/_ 

   version: 0.0.1
   revision: 0.0.1
   context: This code is a basic configuration of three RGB LEDs
   '''
   import machine
   import time

   led_pin = machine.Pin(4, machine.Pin.OUT)
   led_pin2 = machine.Pin(26, machine.Pin.OUT)
   led_pin3 = machine.Pin(25, machine.Pin.OUT)

   def loop():
        while True:
           led_pin.on()    
           led_pin2.on()   
           led_pin3.on()  
           time.sleep(1)  
           led_pin.off()   
           led_pin2.off()  
           led_pin3.off()  
           time.sleep(1)   

   loop()




Arduino IDE Installation environment 
------------------------------------
.. tabs::

    .. tab:: Uelectronics-RP2040-Arduino-Package

        Uelectronics Arduino core is a ported version of the `Raspberry Pi Pico Arduino Core <https://github.com/earlephilhower/arduino-pico>`_ based on the great work of earlephilhower Earle F. Philhower, III. This port of the RP2040 uses the Raspberry Pi Pico SDK and a custom GCC 10.3/Newlib 4.0 toolchain, the same as earlephilhower `version 2.6.4 <https://github.com/earlephilhower/arduino-pico/releases/tag/2.6.4>`_.

        Documentation
        -------------

        See `https://github.com/UNIT-Electronics/DualMCU <https://github.com/UNIT-Electronics/DualMCU>`_ along with the examples for more detailed usage information.

        Supported Boards
        ----------------

        * DualMCU RP2040
        * Raspberry Pi Pico
        * Raspberry Pi Pico W
        * Generic (configurable flash, I/O pins)

        Installing via Arduino Boards Manager
        -------------------------------------

        Open up the Arduino IDE and go to File->Preferences.

        In the dialog that pops up, enter the following URL in the "Additional Boards Manager URLs" field:

        https://github.com/UNIT-Electronics/Uelectronics-RP2040-Arduino-Package/releases/download/v1.0.0/package_Uelectronics_rp2040_index.json
        
        .. _figure_AditionalBoardsManagerURL:

        .. figure:: /_static/AditionalBoardsManagerURL.png
            :alt: AditionalBoardsManagerURL
            :width: 60%
            :align: center

            Preferences-AditionalBoardsManagerURL
 
        Hit OK to close the dialog.

        Go to Tools->Boards->Board Manager in the IDE

        Type "DualMCU" in the search box and select "Add":

        .. _figure_BoardsManager:

        .. figure:: /_static/BoardsManager.png
            :alt: BoardsManager
            :width: 60%
            :align: center

            BoardsManager

    .. tab:: Uelectronics-RP2040-Arduino-Package

        The Uelectronics-ESP32-Arduino package is a collection of software tools that enable users to program and control devices using the ESP32 MCU on the DualMCU and the Arduino platform. The package includes a set of libraries and tools for programming the ESP32 using the Arduino (IDE).

        The package includes a range of sample code and examples to help users get started with programming the ESP32 and creating connected devices.
            

        Supported Boards
        ----------------

        * UNIT DualMCU ESP32
        * ESP32 Dev Module
        * ESP32S3 Dev Module
        * ESP32C3 Dev Module
        * ESP32S2 Dev Module

        Installing via Arduino Boards Manager
        -------------------------------------

        Open up the Arduino IDE and go to File->Preferences.

        - Stable release link: `https://github.com/UNIT-Electronics/Uelectronics-ESP32-Arduino-Package/releases/download/v1.0.0/package_Uelectronics_ESP32_index.json`

        
        Arduino allows installation of third-party platform packages using Boards Manager. 

        - Install the current upstream Arduino IDE at the 1.8 level or later. The current version is at the `Arduino website <http://www.arduino.cc/en/main/software>`_.
        - Start Arduino and open Preferences window.
        - Enter one of the release links above into *Additional Board Manager URLs* field. You can add multiple URLs, separating them with commas.
        - Open Boards Manager from Tools > Board menu and install *esp32* platform (and don't forget to select your ESP32 board from Tools > Board menu after installation).


Support
~~~~~~~

The DualMCU development board is compatible with both the MicroPython Integrated Development Environment (IDE), such as Thonny, and the Arduino development environment. This compatibility allows you to program the DualMCU using MicroPython, CircuitPython, or the Arduino programming language.

MicroPython IDE support includes an interactive console (REPL) for executing commands immediately in MicroPython and CircuitPython, enabling quick and easy code testing and debugging.

Furthermore, support for the Arduino development environment allows you to leverage the extensive tools and community resources available through Arduino. This can be particularly beneficial if you are already familiar with Arduino and wish to utilize its user-friendly features and abundant resources for developing projects with the DualMCU development board.

+-----------------------------+------------------------------------------------------------------------------+
| **Arduino Package RP2040**  | **https://github.com/UNIT-Electronics/Uelectronics-RP2040-Arduino-Package**  |
+-----------------------------+------------------------------------------------------------------------------+
| **Arduino Package ESP32**   | **https://github.com/UNIT-Electronics/Uelectronics-ESP32-Arduino-Package**   |
+-----------------------------+------------------------------------------------------------------------------+
