Installing packages - Micropython
=================================

This section will guide you through the installation process of the required libraries using 
the |pip_link| package manager.

.. |pip_link| raw:: html

   <a href="https://pip.pypa.io/en/stable/" target="_blank">pip</a>



Installation Guide Using MIP Library
-------------------------------------
.. note::
    The `mip` library is utilized to install other libraries on the **PULSAR** board.

Requirements
~~~~~~~~~~~~

- ESP32C6 device
- Thonny IDE
- Wi-Fi credentials (SSID and Password)

Installation Instructions
~~~~~~~~~~~~~~~~~~~~~~~~~

Follow the steps below to install the `max1704x.py, ssd1306.py, sdcard.py` library:

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
   mip.install('https://raw.githubusercontent.com/UNIT-Electronics-MX/unit_devlab_micropython_libraries/refs/heads/main/software/ssd1306/ssd1306.py')
   mip.install('https://raw.githubusercontent.com/UNIT-Electronics-MX/unit_devlab_micropython_libraries/refs/heads/main/software/sdcard/sdcard.py')



.. figure:: /_static/libraries.png
    :width: 100%
    :align: center
    :alt: MIP Library Installation

    MIP Library Installation

DualMCU Li