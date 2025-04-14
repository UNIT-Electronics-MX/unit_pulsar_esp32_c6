General Purpose Input/Output (GPIO) Pins 
========================================

The General Purpose Input/Output (GPIO) pins on the **PULSAR NANO ESP32 C6** development board are used to connect external devices to the microcontroller. These pins can be configured as either input or output. In this section, we will explore how to work with GPIO pins on the **PULSAR NANO ESP32 C6** development board using both MicroPython and C++.

.. _figura2-dualmcu-one:

.. figure::  /_static/nanoc6/top.png
   :align: center
   :width: 60%

   **PULSAR NANO ESP32 C6** Development Board

Let’s begin with a simple example: blinking an LED. This example demonstrates how to control GPIO pins on the **PULSAR NANO ESP32 C6** development board using both MicroPython and C++.

Working with LEDs on ESP32-C6
-----------------------------

In this section, we will learn how to control a single LED using a microcontroller. The LED will be connected to a GPIO pin, and we will control its on/off states using a simple program.

LED Blinking Example
~~~~~~~~~~~~~~~~~~~~

.. tip::

   The following example demonstrates how to blink an LED connected to GPIO pin 6 on the **PULSAR NANO ESP32 C6** development board. The LED will turn on for 1 second and then turn off for 1 second, repeating this pattern indefinitely.

.. tabs::

    .. tab:: MicroPython

        .. code-block:: python

            import machine
            import time

            led = machine.Pin(6, machine.Pin.OUT)

            def loop():
                while True:
                    led.on()  # Turn the LED on
                    time.sleep(1)  # Wait for 1 second
                    led.off()  # Turn the LED off
                    time.sleep(1)  # Wait for 1 second

            loop()

    .. tab:: C++

        .. code-block:: c++
           
            #define LED 6

            // The setup function runs once when you press reset or power the board
            void setup() {
                // Initialize digital pin LED as an output.
                pinMode(LED, OUTPUT);
            }

            // The loop function runs continuously
            void loop() {
                digitalWrite(LED, HIGH);   // Turn the LED on (HIGH is the voltage level)
                delay(1000);              // Wait for 1 second
                digitalWrite(LED, LOW);   // Turn the LED off (LOW is the voltage level)
                delay(1000);              // Wait for 1 second
            }

    .. tab:: esp-idf

        .. code-block:: c
           
            #include <stdio.h>
            #include "freertos/FreeRTOS.h"
            #include "freertos/task.h"
            #include "driver/gpio.h"

            #define BLINK_GPIO GPIO_NUM_6  // Puedes cambiarlo según tu hardware

            void app_main(void)
            {
                // Configura el GPIO como salida
                gpio_reset_pin(BLINK_GPIO);
                gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);

                while (1) {
                    // Enciende el LED
                    gpio_set_level(BLINK_GPIO, 1);
                    vTaskDelay(pdMS_TO_TICKS(500)); // 500 ms

                    // Apaga el LED
                    gpio_set_level(BLINK_GPIO, 0);
                    vTaskDelay(pdMS_TO_TICKS(500)); // 500 ms
                }
            }

