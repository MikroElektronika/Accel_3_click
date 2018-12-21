/*
    __accel3_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.
  
  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __accel3_driver.h
@brief    Accel_3 Driver
@mainpage Accel_3 Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   ACCEL3
@brief      Accel_3 Click Driver
@{

| Global Library Prefix | **ACCEL3** |
|:---------------------:|:-----------------:|
| Version               | **1.0.0**    |
| Date                  | **Aug 2018.**      |
| Developer             | **Nenad Filipovic**     |

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"

#ifndef _ACCEL3_H_
#define _ACCEL3_H_

/** 
 * @macro T_ACCEL3_P
 * @brief Driver Abstract type 
 */
#define T_ACCEL3_P    const uint8_t*

/** @defgroup ACCEL3_COMPILE Compilation Config */              /** @{ */

//  #define   __ACCEL3_DRV_SPI__                            /**<     @macro __ACCEL3_DRV_SPI__  @brief SPI driver selector */
   #define   __ACCEL3_DRV_I2C__                            /**<     @macro __ACCEL3_DRV_I2C__  @brief I2C driver selector */                                          
// #define   __ACCEL3_DRV_UART__                           /**<     @macro __ACCEL3_DRV_UART__ @brief UART driver selector */ 

                                                                       /** @} */
/** @defgroup ACCEL3_VAR Variables */                           /** @{ */

extern const uint8_t _ACCEL3_WHO_AM_I;
extern const uint8_t _ACCEL3_CTRL_REG1;
extern const uint8_t _ACCEL3_CTRL_REG2;
extern const uint8_t _ACCEL3_CTRL_REG3;
extern const uint8_t _ACCEL3_CTRL_REG4;
extern const uint8_t _ACCEL3_CTRL_REG5;
extern const uint8_t _ACCEL3_HP_FILTER_RESET;
extern const uint8_t _ACCEL3_REFERENCE_REG;
extern const uint8_t _ACCEL3_STATUS_REG;
extern const uint8_t _ACCEL3_OUT_X_L;
extern const uint8_t _ACCEL3_OUT_X_H;
extern const uint8_t _ACCEL3_OUT_Y_L;
extern const uint8_t _ACCEL3_OUT_Y_H;
extern const uint8_t _ACCEL3_OUT_Z_L;
extern const uint8_t _ACCEL3_OUT_Z_H;
extern const uint8_t _ACCEL3_I2C_ADDRESS;

                                                                       /** @} */
/** @defgroup ACCEL3_TYPES Types */                             /** @{ */



                                                                       /** @} */
#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup ACCEL3_INIT Driver Initialization */              /** @{ */

#ifdef   __ACCEL3_DRV_SPI__
void accel3_spiDriverInit(T_ACCEL3_P gpioObj, T_ACCEL3_P spiObj);
#endif
#ifdef   __ACCEL3_DRV_I2C__
void accel3_i2cDriverInit(T_ACCEL3_P gpioObj, T_ACCEL3_P i2cObj, uint8_t slave);
#endif
#ifdef   __ACCEL3_DRV_UART__
void accel3_uartDriverInit(T_ACCEL3_P gpioObj, T_ACCEL3_P uartObj);
#endif


/** @defgroup ACCEL3_FUNC Driver Functions */                   /** @{ */

/**
 * @brief Function set command
 *
 * @param[in] address         Register address
 *
 * @param[in] writeCommand    Command to write
 *
 * Function write byte of data to Accel 3
 */
void accel3_writeData( uint8_t address, uint8_t writeCommand );

/**
 * @brief Function read command
 *
 * @param[in] address         Register address
 *
 * @return    Data from addressed register in Accel 3
 *
 * Function read byte of data from register address of Accel 3
 */
uint8_t accel3_readData( uint8_t address );

/**
 * @brief Initializes function
 *
 * Function initializes Accel 3 register
 */
void accel3_Init();

/**
 * @brief Check Accel 3 ID
 *
 * @return      0 for OK; 1 for ERROR
 *
 * Function check Accel 3 ID
 */
uint8_t accel3_checkId();

/**
 * @brief Function read X axis
 *
 * @return         Value X axis
 *
 * Function read X axis from Accel 3
 */
uint16_t accel3_readXaxis();

/**
 * @brief Function read Y axis
 *
 * @return         Value Y axis
 *
 * Function read Y axis from Accel 3
 */
uint16_t accel3_readYaxis();

/**
 * @brief Function read Z axis
 *
 * @return         Value Z axis
 *
 * Function read Z axis from Accel 3
 */
uint16_t accel3_readZaxis();





                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_Accel_3_STM.c
    @example Click_Accel_3_TIVA.c
    @example Click_Accel_3_CEC.c
    @example Click_Accel_3_KINETIS.c
    @example Click_Accel_3_MSP.c
    @example Click_Accel_3_PIC.c
    @example Click_Accel_3_PIC32.c
    @example Click_Accel_3_DSPIC.c
    @example Click_Accel_3_AVR.c
    @example Click_Accel_3_FT90x.c
    @example Click_Accel_3_STM.mbas
    @example Click_Accel_3_TIVA.mbas
    @example Click_Accel_3_CEC.mbas
    @example Click_Accel_3_KINETIS.mbas
    @example Click_Accel_3_MSP.mbas
    @example Click_Accel_3_PIC.mbas
    @example Click_Accel_3_PIC32.mbas
    @example Click_Accel_3_DSPIC.mbas
    @example Click_Accel_3_AVR.mbas
    @example Click_Accel_3_FT90x.mbas
    @example Click_Accel_3_STM.mpas
    @example Click_Accel_3_TIVA.mpas
    @example Click_Accel_3_CEC.mpas
    @example Click_Accel_3_KINETIS.mpas
    @example Click_Accel_3_MSP.mpas
    @example Click_Accel_3_PIC.mpas
    @example Click_Accel_3_PIC32.mpas
    @example Click_Accel_3_DSPIC.mpas
    @example Click_Accel_3_AVR.mpas
    @example Click_Accel_3_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __accel3_driver.h

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