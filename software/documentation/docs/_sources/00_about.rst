PULSARC6 Development Board 
==================================

Introduction
------------

This guide will help you get started with the **PULSAR C6** development board. The **PULSAR C6** is a development board based on the ESP32C6 microcontroller. It is designed for prototyping and developing IoT applications. The board features a variety of interfaces, including GPIO, I2C, SPI, UART, and more. It also has built-in support for Wi-Fi and Bluetooth connectivity.


.. _figure_dualmcu_one:
.. figure:: /_static/nanoc6/top.png
   :align: center
   :alt: **PULSAR C6** Development Board
   :width: 60%
   
   **PULSAR C6** Development Board

 


ESP32C6 Microcontroller
------------------------
The ESP32-C6 is a versatile ultra-low-power microcontroller with advanced connectivity and peripheral features, making it suitable for a wide range of IoT and embedded applications.

.. raw:: html

   <div style="text-align: center;">
      <button style="background-color: #87cefa; color: white; border: none; padding: 10px 20px;" onclick="window.open('https://www.espressif.com/sites/default/files/documentation/esp32-c6_datasheet_en.pdf', '_blank')">ESP32C6 Datasheet</button>
   </div>


Architecture
~~~~~~~~~~~~

- **CPU Architecture**:

  - Based on **RISC-V 32-bit ISA**.
  - Includes:

    - A **High-Performance (HP) CPU** running up to **160 MHz** with a 4-stage pipeline.
    - A **Low-Power (LP) CPU** running up to **20 MHz** for energy-efficient tasks.

- **Memory**:

  - **320 KB ROM** for booting and essential functions.
  - **512 KB High-Performance SRAM** (HP SRAM) for data and instructions.
  - **16 KB Low-Power SRAM** (LP SRAM), retaining data during sleep modes.
  - Optional external flash and SRAM support through SPI, Dual SPI, Quad SPI, and QPI.

- **Security Features**:

  - Secure boot and memory encryption.
  - Cryptographic hardware accelerators for AES, RSA, SHA, ECC, and HMAC.
  - Support for Trusted Execution Environment (TEE).

- **Wireless Capabilities**:

  - **Wi-Fi 6 (2.4 GHz)**, Bluetooth 5.3, Zigbee, and Thread (802.15.4) for versatile connectivity options.
  - Integrated coexistence for simultaneous operation of Wi-Fi, Bluetooth, and 802.15.4.

General Features
~~~~~~~~~~~~~~~~~

- **GPIOs and I/O Functionality**:

  - Up to **30 GPIOs** (QFN40) or **22 GPIOs** (QFN32).
  - Multiple I/O functions through pin multiplexing.
  - Support for digital and analog configurations:

    - **12-bit SAR ADC** with up to 7 channels.
    - Integrated **Temperature Sensor**.

- **Peripheral Interfaces**:

  - Digital interfaces:

    - Two **UARTs**.
    - **I2C** and **I2S** for communication and audio processing.
    - **SPI** with multiple modes for fast data transfer.

  - PWM controllers:

    - **LED PWM** with up to 6 channels.
    - **Motor Control PWM (MCPWM)** for precision control.

  - **Pulse Counter** for frequency and signal measurement.
  - **USB Serial/JTAG Controller** for debugging and serial communication.

- **Timers**:

  - **52-bit System Timer** for accurate timekeeping.
  - Two **54-bit General-Purpose Timers**.
  - Multiple **Digital Watchdog Timers** for reliability.

Power Management
~~~~~~~~~~~~~~~~~

- Supports four power modes for optimal energy usage:

  - **Active**, **Modem-sleep**, **Light-sleep**, and **Deep-sleep**.

- Ultra-low power consumption in **Deep-sleep mode** (7 µA).
- Retains memory and critical functions in low-power modes.

Security and Hardware Acceleration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **General DMA Controller** for efficient data transfers.
- Built-in hardware accelerators for cryptography:

  - **AES**, **RSA**, **SHA**, and **ECC**.

- Secure boot and flash encryption for system integrity.

Applications
~~~~~~~~~~~~

The ESP32-C6 is ideal for various applications, including:

- Smart Home devices.
- Industrial Automation.
- IoT sensor hubs and data loggers.
- Consumer Electronics and more.

Development Support
~~~~~~~~~~~~~~~~~~~~

- Fully compatible with Espressif's **ESP-IDF** (IoT Development Framework) for professional-grade development.
- **Arduino IDE** support for hobbyists and simpler programming tasks.
- Compatibility with third-party SDKs for integration into various workflows.

Physical Dimensions
~~~~~~~~~~~~~~~~~~~~

- **Compact form factor** suitable for embedded applications.
- Available in QFN40 (5×5 mm) and QFN32 (5×5 mm) packages, ensuring versatility for different designs.

.. caution::

   These are the general specifications; depending on the manufacturer and the specific ESP32-C6 module, there may be differences in features or additional capabilities.
