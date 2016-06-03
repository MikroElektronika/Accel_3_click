/****************************************************************************
* Title                 :   Accel 3 click
* Filename              :   accel3_hal.h
* Author                :   CAL
* Origin Date           :   04/04/2016
* Notes                 :   None
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*    Date    Software Version    Initials     Description
*  04/04/2016    XXXXXXXXXXX       CAL      Interface Created.
*
*****************************************************************************/
/**
 * @file accel3_hal.h
 *  @brief Hardware Access Layer for Accel 3 Click
 *
 *  @date 04 April 2016
 *  @author Corey Lakey
 *  @copyright GNU Public License
 *
 *  @version .1 - Initial testing and verification
 *
 *  @note Test configuration:
 *   MCU:             STM32F107VC
 *   Dev.Board:       EasyMx Pro v7
 *   Oscillator:      72 Mhz internal
 *   Ext. Modules:    Accel 3 Click
 *   SW:              ARM 4.5.2
 *
 */
#ifndef ACCEL_3_HAL_H_
#define ACCEL_3_HAL_H_
/******************************************************************************
* Includes
*******************************************************************************/
#include <stdint.h>

/******************************************************************************
* Preprocessor Constants
*******************************************************************************/
#define READ                    1                // READ BIT
#define WRITE                   0                // WRITE BIT
#define COMMAND_SIZE            1                // COMMAND OR REGISTER SIZE ( Bytes )
#define MAX_BUFF_SIZE           256                // BUFFER SIZE ( Bytes )
/******************************************************************************
* Configuration Constants
*******************************************************************************/

/******************************************************************************
* Macros
*******************************************************************************/

/******************************************************************************
* Typedefs
*******************************************************************************/

/******************************************************************************
* Variables
*******************************************************************************/

/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C" {
#endif

void accel3_hal_init( uint8_t address_id, uint8_t mode );

void accel3_hal_write(uint8_t *command, uint8_t *buffer,
                      uint8_t count);

void accel3_hal_read( uint8_t *command, uint8_t *buffer,
                      uint8_t count );


#ifdef __cplusplus
} // extern "C"
#endif

#endif /* CLICKNAME_HAL_H_ */

/*** End of File **************************************************************/