/****************************************************************************
* Title                 :   Accel 3 Application Layer
* Filename              :   accel3.h
* Author                :   CAL
* Origin Date           :   04/04/2016
* Notes                 :   None
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*    Date    Software Version    Initials       Description
*  04/04/2016  XXXXXXXXXXX         CAL       Interface Created.
*
*****************************************************************************/
/** @file accel3.h
 *  @brief Application layer for Accel 3 Click.
 *
 *  @date 04 Apr 2016
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
#ifndef ACCEL3_H_
#define ACCEL3_H_

/******************************************************************************
* Includes
*******************************************************************************/
//#include "accel3_hw.h"
#include <stdint.h>
#include "accel3_hw.h"

/******************************************************************************
* Preprocessor Constants
*******************************************************************************/


/******************************************************************************
* Configuration Constants
*******************************************************************************/


/******************************************************************************
* Macros
*******************************************************************************/


/******************************************************************************
* Typedefs
*******************************************************************************/

typedef struct
{
	int16_t x_pos;
	int16_t y_pos;
	int16_t z_pos;
} xyz_t;

/******************************************************************************
* Variables
*******************************************************************************/


/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C" {
#endif

/**
* @brief <h3> Accel 3 Initialize </h3>
*
* @par
*  Initializes the Accel 3 Click for usage.
*
* @param[in] address    - Address of Accel 3 for I2C bus. ( null for SPI )
* @param[in] accel_mode - Power mode for Accel 3 to be intialized in.
* @param[in] d_rate     - Data rate for Accel 3 to be initialized in.
* @param[in] mode       - Bus mode to use for Accel 3. ( SPI, I2C )
*
*/
uint8_t accel3_init(uint8_t address, accel_mode_t accel_mode,
                    data_rate_t d_rate, bus_mode_t mode );

/**
* @brief <h3> Get XYZ </h3>
*
* @par
*  Gets current X, Y, and Z values from accelerometer.
*
* @param[out] - Struct containing xyz values for accelerometer.
*
*/
xyz_t* accel3_get_xyz( void );

xyz_t* accel3_get_xyz_raw( void );
/**
* @brief <h3> Set Interrupt 1 </h3>
*
* @par
*  Sets up Interrupt 1 for usage on Accel 3 Click
*
* @param[in] threshhold - Value to send interrupt signal at.
* @param[in] duration   - Set the minimum duration of the interrupt 1
*   event to be recognized.
* @param[out] -1 - Successful
* @param[out] 0  - Unsuccessful
*
*/
uint8_t accel3_set_interrupt1( uint8_t threshhold, uint8_t duration );

/**
* @brief <h3> Set Interrupt 2 </h3>
*
* @par
*  Sets up Interrupt 2 for usage on Accel 3 Click
*
* @param[in] threshhold - Value to send interrupt signal at.
* @param[in] duration   - Set the minimum duration of the interrupt 2
*   event to be recognized.
* @param[out] -1 - Successful
* @param[out] 0  - Unsuccessful
*
*/
uint8_t accel3_set_interrupt2( uint8_t threshhold, uint8_t duration );

/**
* @brief <h3> Calibrate X </h3>
*
* @par
*  Calibrates X sensitivity. The positive value is acheived by facing the click
* to the right , and the negative value is found by facing the click to your
* left.
*
* @param[in] pos   - Value when click is turned to your right.
* @param[in] neg   - Value when click is turned to your left.
*
*/
void accel3_calibrate_x( int16_t pos, int16_t neg );

/**
* @brief <h3> Calibrate Y </h3>
*
* @par
*  Calibrates Y sensitivity.The positive value is acheived by turning the click
* to face in front of you, and the negative value is found by turning the click
* towards you.
*
* @param[in] pos   - Value when click is turned away from you.
* @param[in] neg   - Value when click is turned towards you.
*
*/
void accel3_calibrate_y( int16_t pos, int16_t neg );

/**
* @brief <h3> Calibrate Z </h3>
*
* @par
*  Calibrates Z sensitivity. This is done by turning the click towards the sky
* and recording the positive value and then turning the click towards the center
* of the earth and recording that value and sending those to Calibrate Z.
*
* @param[in] pos   - Value when click is turned towards the sky.
* @param[in] neg   - Value when click is turned towards center of earth.
*
*/
void accel3_calibrate_z( int16_t pos, int16_t neg );



#ifdef __cplusplus
} // extern "C"
#endif

#endif /*ACCEL3_H_*/

/*** End of File **************************************************************/