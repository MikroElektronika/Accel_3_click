/*
Example for Accel_3 Click

    Date          : Aug 2018.
    Author        : Nenad Filipovic

Test configuration PIC32 :

    MCU                : P32MX795F512L
    Dev. Board         : EasyPIC Fusion v7
    PIC32 Compiler ver : v4.0.0.0

---

Description :

The application is composed of three sections :

- System Initialization - Initializes I2C.
- Application Initialization - Initialization driver enable's - I2C. Check sensor ID and initialize Accel 3 click.
- Application Task - (code snippet) This is a example which demonstrates the use of Accel 3 click board.
     Measured coordinates (X,Y,Z) are being sent to the UART where you can track their changes.

Additional Functions :

- UART
- Conversions

*/

#include "Click_Accel_3_types.h"
#include "Click_Accel_3_config.h"


void systemInit()
{
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_OUTPUT );

    mikrobus_i2cInit( _MIKROBUS1, &_ACCEL3_I2C_CFG[0] );
    mikrobus_logInit( _MIKROBUS2, 9600 );

    Delay_100ms();
}

void applicationInit()
{
    accel3_i2cDriverInit( (T_ACCEL3_P)&_MIKROBUS1_GPIO, (T_ACCEL3_P)&_MIKROBUS1_I2C, _ACCEL3_I2C_ADDRESS );
    Delay_100ms();
    accel3_Init();

    if ( accel3_checkId() == 0 )
    {
        mikrobus_logWrite("--------------------------------", _LOG_LINE);
        mikrobus_logWrite("        Initialisation",_LOG_LINE);
        mikrobus_logWrite("--------------------------------", _LOG_LINE);
    }
    else
    {
        mikrobus_logWrite("             ERROR",_LOG_LINE);
        mikrobus_logWrite("--------------------------------", _LOG_LINE);
    }

}

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

void main()
{
    systemInit();
    applicationInit();

    while (1)
    {
            applicationTask();
    }
}