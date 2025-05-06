Installing packages - Micropython
=================================

This section will guide you through the installation process of the required libraries using 
the `pip <https://pip.pypa.io/en/stable/>`_ package manager.



Installation Guide Using MIP Library
-------------------------------------
.. note::
    The `mip` library is utilized to install other libraries on the NANOC6 board.

Requirements
~~~~~~~~~~~~

- ESP32C6 device
- Thonny IDE
- Wi-Fi credentials (SSID and Password)

Installation Instructions
~~~~~~~~~~~~~~~~~~~~~~~~~

Follow the steps below to install the `max1704x.py` library:

Connect to Wi-Fi
~~~~~~~~~~~~~~~~

Copy and run the code below in Thonny to connect your ESP32 to a Wi-Fi network:


.. code-block:: python

   import mip
   import network
   import time

   def connect_wifi(ssid, password):
      wlan = network.WLAN(network.STA_IF)
      wlan.active(True)
      wlan.connect(ssid, password)

      for _ in range(10):
         if wlan.isconnected():
               print('Connected to the Wi-Fi network')
               return wlan.ifconfig()[0]
         time.sleep(1)

      print('Could not connect to the Wi-Fi network')
      return None


    ssid = "your_ssid"
    password = "your_password"

   ip_address = connect_wifi(ssid, password)
   print(ip_address)
   mip.install('https://raw.githubusercontent.com/UNIT-Electronics/MAX1704X_lib/refs/heads/main/Software/MicroPython/example/max1704x.py')
   mip.install('https://raw.githubusercontent.com/Cesarbautista10/Libraries_compatibles_with_micropython/refs/heads/main/Libs/oled.py')
   mip.install('https://raw.githubusercontent.com/Cesarbautista10/Libraries_compatibles_with_micropython/refs/heads/main/Libs/sdcard.py')



DualMCU Library
-----------------

Firstly, you need install Thonny IDE. You can download it from the `Thonny website <https://thonny.org/>`__.

1. Open `Thonny <https://thonny.org/>`__.
2. Navigate to **Tools** -> **Manage Packages**.
3. Search for ``dualmcu`` and click **Install**.

.. _figure_dualmcu_libary:
.. figure:: /_static/dualmcu_library.png
   :align: center
   :alt: DualMCU Library
   :width: 60%
   
   DualMCU Library

4. Successfully installed the library.

.. _figure_dualmcu_libary_success:
.. figure:: /_static/dualmcu_library_success.png
   :align: center
   :alt: DualMCU Library
   :width: 60%
   
   DualMCU Library Successfully Installed

Alternatively, download the library from `dualmcu.py <https://pypi.org/project/dualmcu/>`__.


Usage
~~~~~

The library provides a set of tools to help developers work with the DualMCU ONE board. The following are the main features of the library:

- **I2C Support**: The library provides support for I2C communication protocol, making it easy to interface with a wide range of sensors and devices.

- **Arduino Shields Compatibility**: The library is compatible with Arduino Shields, making it easy to use a wide range of shields and accessories with the DualMCU ONE board.

- **SDcard Support**: The library provides support for SD cards, allowing developers to easily read and write data to SD cards.


Examples of the library usage:

.. code-block:: python

    import machine
    from dualmcu import *

    i2c = machine.SoftI2C( scl=machine.Pin(22), sda=machine.Pin(21))

    oled = SSD1306_I2C(128, 64, i2c)

    oled.fill(1)
    oled.show()

    oled.fill(0)
    oled.show()
    oled.text('UNIT', 50, 10)
    oled.text('ELECTRONICS', 25, 20)

    oled.show()


Libraries available
-------------------

- `Dualmcu <https://pypi.org/project/dualmcu/>`__ : The library provides a set of tools to help developers work with the DualMCU ONE board. The library is actively maintained and updated to provide the best experience for developers working with the DualMCU ONE board. For more information and updates, visit the `dualmcu GitHub repository``
- `Ocks <https://pypi.org/project/ocks/>`__ : The library provides support for I2C communication protocol.
- `SDcard-lib <https://pypi.org/project/sdcard-lib/>`__ : The library provides support for SD cards, allowing developers to easily read and write data to SD cards; all rights remain with the original author.



The library is actively maintained and updated to provide the best experience for developers working with 
the DualMCU ONE board. 
