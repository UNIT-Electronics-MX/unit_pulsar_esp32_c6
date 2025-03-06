
SPI (Serial Peripheral Interface)
=======================================

SPI Overview
----------------

SPI (Serial Peripheral Interface) is a synchronous, full-duplex, master-slave communication bus. It is commonly used to connect microcontrollers to peripherals such as sensors, displays, and memory devices. The DualMCU ONE development board features SPI communication capabilities, allowing you to interface with a wide range of SPI devices.


.. .. _figura-spi:

.. .. figure:: /_static/dualmcu_one_spi.png
..    :align: center
..    :alt: SPI
..    :width: 90%

..    SPI Pins





SDCard SPI
------------

.. warning::

    Ensure that the Micro SD contain data. We recommend saving multiple files beforehand to facilitate the use.
    Format the Micro SD card to FAT32 before using it with the ESP32-C6.


.. _figura-micro-sd-card:

.. figure:: /_static/Micro-SD-Card-Pinout.png
   :align: center
   :alt: Micro SD Card Pinout
   :width: 40%

   Micro SD Card Pinout



.. _figura-micro-sd-card-reader:

.. figure:: /_static/Lector-Micro-SD.jpg
   :align: center
   :alt: Micro SD Card reader
   :width: 40%

   Micro SD Card external reader

The conections are as follows:

This table illustrates the connections between the SD card and the GPIO pins on the ESP32-C6

.. list-table:: HSPI Connections
   :widths: 10 20 20
   :header-rows: 1
   :align: center


   * - SD Card
     - ESP32C6
     - PIN
   * - D2
     - 
     - 
   * - D3
     - SS (Slave Select)
     - 19
   * - CMD
     - MOSI
     - 7
   * - VSS
     - GND
     -
   * - VDD
     - 3.3V
     - 
   * - CLK
     - SCK (Serial Clock)
     - 6
   * - VSS
     - GND
     - 
   * - D0
     - MISO
     - 2
   * - D1
     - 
     - 

.. code-block:: python
    
  import machine
  import os
  from sdcard import SDCard

  # Definir pines para SPI y SD
  MOSI_PIN = 7
  MISO_PIN = 2
  SCK_PIN = 6
  CS_PIN = 19

  # Inicializar SPI
  spi = machine.SPI(1, baudrate=500000, polarity=0, phase=0,
                    sck=machine.Pin(SCK_PIN),
                    mosi=machine.Pin(MOSI_PIN),
                    miso=machine.Pin(MISO_PIN))

  # Inicializar tarjeta SD
  sd = SDCard(spi, machine.Pin(CS_PIN))

  # Montar la SD en el sistema de archivos
  os.mount(sd, "/sd")

  # Listar archivos y directorios en la SD
  print("Archivos en la SD:")
  print(os.listdir("/sd"))

  # Crear y escribir en un archivo
  file_path = "/sd/test.txt"
  with open(file_path, "w") as file:
      file.write("Hola, MicroPython en SD!\n")
      file.write("Esto es una prueba de escritura.\n")

  # Leer el archivo
  with open(file_path, "r") as file:
      print("\nContenido del archivo:")
      print(file.read())

  # Confirmar que el archivo se ha creado correctamente
  print("\nArchivos en la SD después de la escritura:")
  print(os.listdir("/sd"))


