/*******************************************************************************
* Title                 :   Accel 3 Application Layer
* Filename              :   accel3.c
* Author                :   CAL
* Origin Date           :   04/04/2016
* Notes                 :   None
*******************************************************************************/
/*************** MODULE REVISION LOG ******************************************
*
*    Date    Software Version    Initials      Description
*  04/04/2016  XXXXXXXXXXX         CAL       Module Created.
*
*******************************************************************************/
/** @file accel3.c
 *  @brief This module contains the application layer for Accel 3 Click.
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stdint.h>
#include "accel3.h"

/******************************************************************************
* Module Preprocessor Constants
*******************************************************************************/


/******************************************************************************
* Module Preprocessor Macros
*******************************************************************************/

/******************************************************************************
* Module Typedefs
*******************************************************************************/

/******************************************************************************
* Module Variable Definitions
*******************************************************************************/

/******************************************************************************
* Function Prototypes
*******************************************************************************/

/******************************************************************************
* Function Definitions
*******************************************************************************/
uint8_t accel3_init( uint8_t address, accel_mode_t accel_mode, data_rate_t d_rate, bus_mode_t mode )
{
    if ( !accel3_hw_init( address, mode ) )
    {
        accel3_set_data_rate( d_rate );
        accel3_set_mode( accel_mode );
        accel3_set_full_scale( SCALE_100_G );
        accel3_x_enable( true );
        accel3_y_enable( true );
        accel3_z_enable( true );

        return 0;
    }
    else
        return -1;
}

xyz_t* accel3_get_xyz( void )
{
    xyz_t acc_values;
    axes_sens_t* sensitivity;

    acc_values.y_pos = accel3_read_acc_y();
    acc_values.z_pos = accel3_read_acc_z();
    acc_values.x_pos = accel3_read_acc_x();

    sensitivity = accel3_get_xyz_sensitivity();
    acc_values.x_pos /= sensitivity->x;
    acc_values.y_pos /= sensitivity->y;
    acc_values.z_pos /= sensitivity->z;

    return &acc_values;
}

xyz_t* accel3_get_xyz_raw( void )
{
    xyz_t acc_values;
    axes_sens_t* sensitivity;

    acc_values.y_pos = accel3_read_acc_y();
    acc_values.z_pos = accel3_read_acc_z();
    acc_values.x_pos = accel3_read_acc_x();

    return &acc_values;
}

uint8_t accel3_set_interrupt1( uint8_t threshhold, uint8_t duration )
{
    accel3_int1_signal_config( INT_SOURCE );
    accel3_interrupt_active_level( LOW );
    accel3_int1_set_duration( duration );
    accel3_int1_set_threshold( threshhold );
    accel3_interrupt_pad_selection( PUSH_PULL );
    accel3_interrupt1_set_combination( OR );
    accel3_interrupt1_x_high_enable( false );
    accel3_interrupt1_x_low_enable( false );
    accel3_interrupt1_y_high_enable( false );
    accel3_interrupt1_y_low_enable( false );
    accel3_interrupt1_z_low_enable( true );
    accel3_interrupt1_z_high_enable( false );
    accel3_latched_interrupt1_enable( true );


}

uint8_t accel3_set_interrupt2( uint8_t threshhold, uint8_t duration )
{
    if ( accel3_int2_set_threshold( threshhold ) &&
            accel3_int2_set_duration( duration ) )
        return -1;
    else
        return 0;

}

void accel3_calibrate_x( int16_t pos, int16_t neg )
{
    int16_t x_sens;
    x_sens = ( pos - neg ) / 2;
    set_x( x_sens );
}

void accel3_calibrate_y( int16_t pos, int16_t neg )
{
    int16_t y_sens;
    y_sens = ( pos - neg ) / 2;
    set_y( y_sens );
}

void accel3_calibrate_z( int16_t pos, int16_t neg )
{
    int16_t z_sens;
    z_sens = ( pos - neg ) / 2;
    set_z( z_sens );
}

/*************** END OF FUNCTIONS ***************************************************************************/
