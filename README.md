![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# Accel_3 Click

- **CIC Prefix**  : ACCEL3
- **Author**      : Nenad Filipovic
- **Verison**     : 1.0.0
- **Date**        : Aug 2018.

---

### Software Support

We provide a library for the Accel_3 Click on our [LibStock](https://libstock.mikroe.com/projects/view/1795/accel-3-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

The library covers all the necessary functions to control and read X, Y & Z axis value from Accel 3 click.

Key functions :

- ``` void accel3_Init() ``` - Initializes function
- ``` uint16_t accel3_readXaxis() ``` - Function read X axis value
- ``` uint16_t accel3_readYaxis() ``` - Function read Y axis value
- ``` uint16_t accel3_readZaxis() ``` - Function read Z axis value

**Examples Description**

Description :

The application is composed of three sections :

- System Initialization - Initializes I2C.
- Application Initialization - Initialization driver enable's - I2C. Check sensor ID and initialize Accel 3 click.
- Application Task - (code snippet) This is a example which demonstrates the use of Accel 3 click board.
     Measured coordinates (X,Y,Z) are being sent to the UART where you can track their changes.


```.c

void applicationTask()
{
    int16_t valueX;
    int16_t valueY;
    int16_t valueZ;
    uint8_t txtX[ 15 ];
    uint8_t txtY[ 15 ];
    uint8_t txtZ[ 15 ];

    valueX = accel3_readXaxis();
    valueY = accel3_readYaxis();
    valueZ = accel3_readZaxis();

    IntToStr( valueX, txtX );
    IntToStr( valueY, txtY );
    IntToStr( valueZ, txtZ );

    mikrobus_logWrite( "X:", _LOG_TEXT );
    mikrobus_logWrite( txtX, _LOG_TEXT );

    mikrobus_logWrite( "    Y:", _LOG_TEXT );
    mikrobus_logWrite( txtY, _LOG_TEXT );

    mikrobus_logWrite( "    Z:", _LOG_TEXT );
    mikrobus_logWrite( txtZ, _LOG_LINE );

    Delay_1sec();
}

```



The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/1795/accel-3-click page.

Other mikroE Libraries used in the example:

- UART
- Conversions

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
---
