/****************************************************************************
* Title                 :   ADC Application   
* Filename              :   adc_app.h
* Author                :   JWB
* Origin Date           :   06/07/2012
* Notes                 :   None
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*    Date    Software Version    Initials   Description 
*  08/17/13    XXXXXXXXXXX         JWB      Interface Created.
*
*****************************************************************************/
/** @file file_here.h
 *  @brief What is does
 *
 *  @date 25 Aug 2015
 *  @author Richard Lowe
 *  @copyright GNU Public License
 *
 *  @version .1 - Initial testing and verification
 *
 *  @note Test configuration:
 *   MCU:             STM32F107VC
 *   Dev.Board:       EasyMx Pro v7
 *   Oscillator:      72 Mhz internal
 *   Ext. Modules:    GPS Click
 *   SW:              ARM 4.5.2
 *
 */

/**
 * @mainpage
 * @section Main General Description
 * @par
 * 
 * 
 * @section Features
 * @par
 * <ul>
 * <li> </li>
 * </ul>
 *
 * 
 * @section Schematic
 * @image html schematic.jpg
 * 
 */

#ifndef MODULE_H_
#define MODULE_H_
/******************************************************************************
* Includes
*******************************************************************************/
#include "accel3_hal.h"

/******************************************************************************
* Preprocessor Constants
*******************************************************************************/
#define  CONST		0x00		/**< This is ... */

/**
 * @defgroup GROUP Group Name
 *
 * @{
 */
#define GROUP_MEM_1   	0x0A		/**< This member ... */
#define GROPU_MEM_2 	0x0B		/**< This member ... */
/** @} */

/******************************************************************************
* Configuration Constants
*******************************************************************************/


/******************************************************************************
* Macros
*******************************************************************************/

/******************************************************************************
* Typedefs
*******************************************************************************/
/**
 * \enum ENUM_t
 * \brief This is ...
 */
typedef enum
{
    ENUM_1,               	/**< This member ... */
    ENUM_2,             	/**< This member ... */
    ENUM_3                 	/**< This member ... */

}ENUM_t;

/**
 * \struct STRUCT_t
 * \brief This is ...
 */
typedef struct
{
    int var;			/**< This member ... */

}STRUCT_t;
/******************************************************************************
* Variables
*******************************************************************************/


/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C"{
#endif

/**
 * @brief
 * 
 * @code 
 * Function( 3 );
 * @endcode
 *
 * @note
 *
 * @warning
 * 
 * @param[in] - var 
 *
 * @retval
 */
int Function( int var );

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MODULE_H_ */

/*** End of File **************************************************************/
