/*
    __accel3_driver.c

-----------------------------------------------------------------------------

  This file is part of mikroSDK.

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

#include "__accel3_driver.h"
#include "__accel3_hal.c"

/* ------------------------------------------------------------------- MACROS */



/* ---------------------------------------------------------------- VARIABLES */

#ifdef   __ACCEL3_DRV_I2C__
static uint8_t _slaveAddress;
#endif

//Register and define
const uint8_t _ACCEL3_WHO_AM_I            = 0x0F;   // device identification register  return 0x32

// CONTROL REGISTER 1
const uint8_t _ACCEL3_CTRL_REG1           = 0x20;
// _PM                   BIT(5) //PowerMode selection: 000 - power down / 001 - normal mode / other - low power
// _DR                   BIT(3) //output data rate: 00 - 50hz / 01 - 100hz / 10 - 400hz / 11 - 1000hz
// _ZEN                  BIT(2) //Z-axis enable: 0 - disable / 1 - enable
// _YEN                  BIT(1) //Y-axis enable: 0 - disable / 1 - enable
// _XEN                  BIT(0) //Y-axis enable: 0 - disable / 1 - enable

//CONTROL REGISTER 2
const uint8_t _ACCEL3_CTRL_REG2           = 0x21;
// _BOOT                 BIT(7) //reboot memory content, default is 0
// _HPM                  BIT(5) //High-pass-filter mode selection, default is 00
// _FDS                  BIT(4) //Filter data selection, default is 0
// _HPEN2                BIT(3) //High-pass filter enabled for interrupt 2 source, default is 0
// _HPEN1                BIT(2) //High-pass filter enabled for interrupt 1 source, default is 0
// _HPCF                 BIT(0) //High-pass filter cutoff frequency configuration, default is 00

//CONTROL REGISTER 3
const uint8_t _ACCEL3_CTRL_REG3           = 0x22;
// _IHL                  BIT(7) //Interrupt active high,low. default is 0
// _PP_OD                BIT(6) //Push-pull/open drain selection on interrupt pad. default is 0
// _LIR2                 BIT(5) //Latch interrupt request on INT2_SRC register, with INT2_SRC register cleared by read INT2_SRC itself. default is 0
// _I2_CFG               BIT(3) //Data signal on INT2 pad control bits, default is 00
// _LIR1                 BIT(2) //Latch interrupt request on the INT1_SRC register, with the INT1_SRC register cleared by reading the INT1_SRC register.
// _I1_CFG               BIT(0) //Data signal on INT1 pad control bits, default is 00

//CONTROL REGISTER 4
const uint8_t _ACCEL3_CTRL_REG4           = 0x23;
// _BDU                  BIT(7) //Block data update, default is 0
// _BLE                  BIT(6) //Big/little endian data selection, default is 0
// _FS                   BIT(4) //Full scale selection, default is 00(00:100g;01:200g;11:400g)
// _ST_SIGN              BIT(3) //
// _ST                   BIT(1) //
// _SIM                  BIT(0) // SPI serial interface mode selection, default is 0

//CONTROL REGISTER 5
const uint8_t _ACCEL3_CTRL_REG5           = 0x24;
// _TURN_ON              BIT(0) // Turn-on mode selection selection for sleep to wake function. default is 00

const uint8_t _ACCEL3_HP_FILTER_RESET     = 0x25;   //

//REFERENCE/DATA_CAPTURE
const uint8_t _ACCEL3_REFERENCE_REG       = 0x26;   //
// _REF                  BIT(0) //

//STATUS_REG_AXIES
const uint8_t _ACCEL3_STATUS_REG          = 0x27;   //

//OUTPUT REGISTER
const uint8_t _ACCEL3_OUT_X_L             = 0x28;   //x-axis acceleration data
const uint8_t _ACCEL3_OUT_X_H             = 0x29;
const uint8_t _ACCEL3_OUT_Y_L             = 0x2A;   //y-axis acceleration data
const uint8_t _ACCEL3_OUT_Y_H             = 0x2B;
const uint8_t _ACCEL3_OUT_Z_L             = 0x2C;   //z-axis acceleration data
const uint8_t _ACCEL3_OUT_Z_H             = 0x2D;

const uint8_t _ACCEL3_I2C_ADDRESS         = 0x18;


/* -------------------------------------------- PRIVATE FUNCTION DECLARATIONS */



/* --------------------------------------------- PRIVATE FUNCTION DEFINITIONS */



/* --------------------------------------------------------- PUBLIC FUNCTIONS */

#ifdef   __ACCEL3_DRV_SPI__

void accel3_spiDriverInit(T_ACCEL3_P gpioObj, T_ACCEL3_P spiObj)
{
    hal_spiMap( (T_HAL_P)spiObj );
    hal_gpioMap( (T_HAL_P)gpioObj );

    // ... power ON
    // ... configure CHIP
}

#endif
#ifdef   __ACCEL3_DRV_I2C__

void accel3_i2cDriverInit(T_ACCEL3_P gpioObj, T_ACCEL3_P i2cObj, uint8_t slave)
{
    _slaveAddress = slave;
    hal_i2cMap( (T_HAL_P)i2cObj );
    hal_gpioMap( (T_HAL_P)gpioObj );

    // ... power ON
    // ... configure CHIP
}

#endif
#ifdef   __ACCEL3_DRV_UART__

void accel3_uartDriverInit(T_ACCEL3_P gpioObj, T_ACCEL3_P uartObj)
{
    hal_uartMap( (T_HAL_P)uartObj );
    hal_gpioMap( (T_HAL_P)gpioObj );

    // ... power ON
    // ... configure CHIP
}

#endif



/* ----------------------------------------------------------- IMPLEMENTATION */

/* Generic write data function */
void accel3_writeData( uint8_t address, uint8_t writeCommand )
{
    uint8_t buffer[2];
    buffer[0]= address;
    buffer[1]= writeCommand;

    hal_i2cStart();
    hal_i2cWrite( _slaveAddress, buffer, 2, END_MODE_STOP );
}

/* Generic read data function */
uint8_t accel3_readData( uint8_t address )
{
    uint8_t tempData;
    tempData = address;

    hal_i2cStart();
    hal_i2cWrite( _slaveAddress, &tempData, 1, END_MODE_RESTART );
    hal_i2cRead( _slaveAddress, &tempData, 1, END_MODE_STOP );

    return tempData;
}

/* Function check Accel 3 ID */
uint8_t accel3_checkId()
{
    uint8_t id = 0x00;
    id = accel3_readData( _ACCEL3_WHO_AM_I );

    if (id != 0x32)
    {
        return 0x01;
    }
    else
    {
        return 0x00;
    }
}

/* Initializes function */
void accel3_Init()
{
    accel3_writeData( _ACCEL3_CTRL_REG1, 0x27 );  // Enable X, Y, Z axis, power on mode, data output rate 50Hz
    accel3_writeData( _ACCEL3_CTRL_REG4, 0x00 );  // Set full scale, +/- 100g, continuous update
}

/* Function read X axis */
uint16_t accel3_readXaxis()
{
    uint16_t Out_x;
    uint8_t buffer[2];

    buffer[0] = accel3_readData( _ACCEL3_OUT_X_H );
    buffer[1] = accel3_readData( _ACCEL3_OUT_X_L );

    Out_x = buffer[0];
    Out_x <<= 8;
    Out_x |= buffer[1];

    return Out_x;
}

/* Function read Y axis */
uint16_t accel3_readYaxis()
{
    uint16_t Out_y;
    uint8_t buffer[2];

    buffer[0] = accel3_readData( _ACCEL3_OUT_Y_H );
    buffer[1] = accel3_readData( _ACCEL3_OUT_Y_L );

    Out_y = buffer[0];
    Out_y <<= 8;
    Out_y |= buffer[1];

    return Out_y;
}

/* Function read Z axis */
uint16_t accel3_readZaxis()
{
    uint16_t Out_z;
    uint8_t buffer[2];

    buffer[0] = accel3_readData( _ACCEL3_OUT_Z_H );
    buffer[1] = accel3_readData( _ACCEL3_OUT_Z_L );

    Out_z = buffer[0];
    Out_z <<= 8;
    Out_z |= buffer[1];

    return Out_z;
}



/* -------------------------------------------------------------------------- */
/*
  __accel3_driver.c

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */