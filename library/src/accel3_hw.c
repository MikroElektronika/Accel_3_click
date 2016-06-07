/*******************************************************************************
* Title                 :   Accel 3 Click HW Layer
* Filename              :   accel3_hw.c
* Author                :   CAL
* Origin Date           :   04/04/2016
* Notes                 :   None
*******************************************************************************/
/*************** MODULE REVISION LOG ******************************************
*
*    Date    Software Version    Initials      Description
*  04/04/2016   XXXXXXXXXXX         CAL       Module Created.
*
*******************************************************************************/
/** @file accel3_hw.c
 *  @brief This module contains the hardware layer for Accel 3 Click.
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stdint.h>
#include "accel3_hw.h"
#include "accel3_hal.h"
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
static int16_t x_sens;
static int16_t y_sens;
static int16_t z_sens;

/******************************************************************************
* Function Prototypes
*******************************************************************************/
static inline void initial_calibrate();

/******************************************************************************
* Function Definitions
*******************************************************************************/
static inline void initial_calibrate( void )
{
    x_sens = 192;
    y_sens = 199;
    z_sens = 344;

}

uint8_t accel3_hw_init(uint8_t address, bus_mode_t mode)
{
    uint8_t temp;
    uint8_t reg = 0x0F;

    accel3_hal_init( address, mode );
    accel3_hal_read( &reg, &temp, 1 );
    initial_calibrate();

    if (temp == 0x32)
        return 0;
    else
        return -1;

}

void set_x( int16_t x )
{
    x_sens = x;
}

void set_y( int16_t y )
{
    y_sens = y;
}

void set_z( int16_t z )
{
    z_sens = z;
}

int8_t accel3_set_mode(accel_mode_t mode)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG1;

    if ( mode > LOW_POWER_10 )
        return -1;

    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~POWER_MODE_BM;
    temp |= mode;
    accel3_hal_write ( &reg, &temp, 1 );
    return 0;
}

int8_t accel3_set_data_rate(data_rate_t data_rate)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG1;

    if ( data_rate > HZ_1000 )
        return -1;
   
    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~DATA_RATE_BM;
    temp |= data_rate 
    accel3_hal_write( &reg, &temp, 1 );
    return 0;
}

void accel3_z_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG1;

    accel3_hal_read( &reg, &temp, 1 );
    if (enable == true)
        temp |= Z_EN_BM;
    else
        temp &= ~Z_EN_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_y_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG1;

    accel3_hal_read( &reg, &temp, 1 );
    if (enable == true)
        temp |= Y_EN_BM;
    else
        temp &= ~Y_EN_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_x_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG1;

    accel3_hal_read( &reg, &temp, 1 );
    if (enable == true)
        temp |= X_EN_BM;
    else
        temp &= ~X_EN_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_reboot()
{
    uint8_t temp;
    uint8_t reg = CTRL_REG2;

    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~BOOT_BM;
    temp |= BOOT_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

int8_t accel3_hp_filter_mode_select(hp_filter_mode_t mode)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG2;

    if ( mode > HP_REF_SIGNAL )
        return -1;
    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~HI_PASS_MODE_BM;
    temp |= mode;
    accel3_hal_write( &reg, &temp, 1 );
    return 0;
}

void accel3_filtered_data_selection_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG2;

    accel3_hal_read( &reg, &temp, 1 );
    if (enable == true)
        temp |= FILT_DATA_BM;
    else
        temp &= ~FILT_DATA_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_hp2_filter_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG2;

    accel3_hal_read( &reg, &temp, 1 );

    if (enable == true)
        temp |= HI_PASS_INT_2_BM;
    else
        temp &= ~HI_PASS_INT_2_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_hp1_filter_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG2;

    accel3_hal_read( &reg, &temp, 1 );

    if (enable == true)
        temp |= HI_PASS_INT_1_BM;
    else
        temp &= ~HI_PASS_INT_1_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

int8_t accel3_hp_cutoff_freq_config(cutoff_freq_t freq)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG2;

    if ( freq > CUTOFF_0_125 )
        return -1;
    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~HI_PASS_CUTOFF_BM;
    temp |= freq;
    accel3_hal_write( &reg, &temp, 1 );
    return 0;
}

int8_t accel3_interrupt_active_level(level_t level)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG3;

    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~ INT_LEVEL_BM;
    temp |= level;
    accel3_hal_write( &reg, &temp, 1 );
    return 0;
}

int8_t accel3_interrupt_pad_selection(interrupt_pad_t select)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG3;

    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~PSH_PULL_OPEN_DR_BM;
    temp |= select;
    accel3_hal_write( &reg, &temp, 1 );
    return 0;
}

void accel3_latched_interrupt1_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG3;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= INT_1_LATCH_BM;
    else
        temp &= ~INT_1_LATCH_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_latched_interrupt2_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG3;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= INT_2_LATCH_BM;
    else
        temp &= ~INT_2_LATCH_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

int8_t accel3_int1_signal_config(int_signal_t config)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG3;

    accel3_hal_read( &reg, &temp, 1);
    temp &= ~AND_OR_INT1_BM;
    temp |= config;
    accel3_hal_write( &reg, &temp, 1 );
    return 1;
}

int8_t accel3_int2_signal_config(int_signal_t config)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG3;

    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~AND_OR_INT2_BM;
    temp |= config;
    accel3_hal_write( &reg, &temp, 1 );
    return 0;
}

void accel3_bdu_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG4;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= BLK_UPDATE_BM;
    else
        temp &= ~BLK_UPDATE_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_ble_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG4;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= BIG_LIL_ENDIAN_BM;
    else
        temp &= ~BIG_LIL_ENDIAN_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

int8_t accel3_set_full_scale(full_scale_t scale)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG4;

    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~FULL_SCALE_BM;
    temp |= scale;
    accel3_hal_write( &reg, &temp, 1 );
    return -1;
}

void accel3_sleep_to_wake_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = CTRL_REG5;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= SLEEP_2_WAKE_BM;
    else
        temp &= ~SLEEP_2_WAKE_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void  accel3_hp_filter_reset()
{
    uint8_t temp;
    uint8_t reg = HP_FILTER_RESET;

    accel3_hal_read( &reg, &temp, 1 );
}

void accel3_hp_filter_set_reference(uint8_t reference)
{
    uint8_t temp = reference;
    uint8_t reg = REFERENCE_REG;

    accel3_hal_write ( &reg, &temp, 1 );
}

int8_t accel3_is_overrun_all()
{
    uint8_t temp;
    uint8_t reg = STATUS_REG;

    accel3_hal_read ( &reg, &temp, 1 );

    return (temp >> 7);
}

int8_t accel3_is_overrun_x()
{
    uint8_t temp;
    uint8_t reg = STATUS_REG;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= ~(1 << 4);
    return ( temp >> 4 );
}

int8_t accel3_is_overrun_y()
{
    uint8_t temp;
    uint8_t reg = STATUS_REG;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= ~(1 << 5);
    return ( temp >> 5 );
}

int8_t accel3_is_overrun_z()
{
    uint8_t temp;
    uint8_t reg = STATUS_REG;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= ~(1 << 6);
    return ( temp >> 6 );
}

int8_t accel3_is_new_data_all()
{
    uint8_t temp;
    uint8_t reg = STATUS_REG;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= (1 << 3);
    return ( temp >> 3 );
}

int8_t accel3_is_new_data_x()
{
    uint8_t temp;
    uint8_t reg = STATUS_REG;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= (1);
    return temp;
}

int8_t accel3_is_new_data_y()
{
    uint8_t temp;
    uint8_t reg = STATUS_REG;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= (1 << 1);
    return ( temp >> 1 );
}


int8_t accel3_is_new_data_z()
{
    uint8_t temp;
    uint8_t reg = STATUS_REG;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= (1 << 2);
    return ( temp >> 2 );
}

int16_t accel3_read_acc_x()
{

    int8_t temp_1;
    int8_t temp_2;
    int16_t retval;
    uint8_t reg_1 = OUT_X_L;
    uint8_t reg_2 = OUT_X_H;

    accel3_hal_read( &reg_1, &temp_1, 1 );
    accel3_hal_read( &reg_2, &temp_2, 1 );


    retval = ((int16_t) temp_2 ) << 8;
    retval |= (int16_t)temp_1;

    return retval;
}

int16_t accel3_read_acc_y()
{
    int8_t temp_1;
    int8_t temp_2;
    int16_t retval;
    uint8_t reg_1 = OUT_Y_L;
    uint8_t reg_2 = OUT_Y_H;

    accel3_hal_read( &reg_1, &temp_1, 1 );
    accel3_hal_read( &reg_2, &temp_2, 1 );

    retval = ((int16_t) temp_2 ) << 8;
    retval |= (int16_t)temp_1;

    return retval;
}

int16_t accel3_read_acc_z()
{
    int8_t temp_1;
    int8_t temp_2;
    int16_t retval;
    uint8_t reg_1 = OUT_Z_L;
    uint8_t reg_2 = OUT_Z_H;

    accel3_hal_read( &reg_1, &temp_1, 1 );
    accel3_hal_read( &reg_2, &temp_2, 1 );

    retval = ((int16_t) temp_2 ) << 8;
    retval |= (int16_t)temp_1;

    return retval;
}

int8_t accel3_interrupt1_set_combination(int_comb_t combination)
{
    uint8_t temp;
    uint8_t reg = INT1_CFG;

    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~AND_OR_INT1_BM;
    temp |= combination;
    accel3_hal_write ( &reg, &temp, 1 );
    return 0;
}

void accel3_interrupt1_z_high_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT1_CFG;

    accel3_hal_read ( &reg, &temp, 1 );
    if( enable )
        temp |= Z_HI_INT1_BM;
    else
        temp &= ~Z_HI_INT1_BM;
    accel3_hal_write ( &reg, &temp, 1 );
}

void accel3_interrupt1_z_low_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT1_CFG;

    accel3_hal_read ( &reg, &temp, 1 );
    if( enable )
        temp |= Z_LO_INT1_BM;
    else
        temp &= ~Z_LO_INT1_BM;
    accel3_hal_write ( &reg, &temp, 1 );
}

void accel3_interrupt1_y_high_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT1_CFG;

    accel3_hal_read ( &reg, &temp, 1 );
    if( enable )
        temp |= Y_HI_INT1_BM;
    else
        temp &= ~Y_HI_INT1_BM;
    accel3_hal_write ( &reg, &temp, 1 );
}

void accel3_interrupt1_y_low_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT1_CFG;

    accel3_hal_read ( &reg, &temp, 1 );
    if( enable )
        temp |= Y_LO_INT1_BM;
    else
        temp &= ~Y_LO_INT1_BM;
    accel3_hal_write ( &reg, &temp, 1 );
}

void accel3_interrupt1_x_high_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT1_CFG;

    accel3_hal_read ( &reg, &temp, 1 );
    if( enable )
        temp |= X_HI_INT1_BM;
    else
        temp &= ~X_HI_INT1_BM;
    accel3_hal_write ( &reg, &temp, 1 );
}

void accel3_interrupt1_x_low_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT1_CFG;

    accel3_hal_read ( &reg, &temp, 1 );
    if( enable )
        temp |= X_LO_INT1_BM;
    else
        temp &= ~X_LO_INT1_BM;
    accel3_hal_write ( &reg, &temp, 1 );
}

int8_t accel3_is_interrupt1()
{
    uint8_t temp;
    uint8_t reg = INT1_SRC;

    accel3_hal_read ( &reg, &temp, 1 );

    return (temp >> 6);
}

int8_t accel3_is_z_high_interrupt1()
{
    uint8_t temp;
    uint8_t reg = INT1_SRC;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= (1 << 5);
    return (temp >> 5);
}

int8_t accel3_is_z_low_interrupt1()
{
    uint8_t temp = 0;
    uint8_t reg = INT1_SRC;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= (1 << 4);
    return (temp >> 4);
}

int8_t accel3_is_y_high_interrupt1()
{
    uint8_t temp;
    uint8_t reg = INT1_SRC;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= ~(1 << 3);
    return (temp >> 3);
}

int8_t accel3_is_y_low_interrupt1()
{
    uint8_t temp;
    uint8_t reg = INT1_SRC;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= ~(1 << 2);
    return (temp >> 2);
}

int8_t accel3_is_x_high_interrupt1()
{
    uint8_t temp;
    uint8_t reg = INT1_SRC;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= (1 << 1);
    return (temp >> 1);
}

int8_t accel3_is_x_low_interrupt1()
{
    uint8_t temp;
    uint8_t reg = INT1_SRC;

    accel3_hal_read ( &reg, &temp, 1 );

    temp &= (1);
    return (temp);
}

int8_t accel3_int1_set_threshold(uint8_t threshold)
{
    uint8_t temp = threshold;
    uint8_t reg = INT1_THS;

    if (threshold > (1 << 7))
        return 0;
    else
        accel3_hal_write( &reg, &temp, 1 );
    return -1;
}

int8_t accel3_int1_set_duration(uint8_t duration)
{
    uint8_t temp = duration;
    uint8_t reg = INT1_DUR;

    accel3_hal_write( &reg, &temp, 1 );
    return -1;
}

int8_t accel3_interrupt2_set_combination(int_comb_t combination)
{
    uint8_t temp;
    uint8_t reg = INT2_CFG;

    accel3_hal_read( &reg, &temp, 1 );
    temp &= ~AND_OR_INT2_BM;
    temp |= comination;
    accel3_hal_write ( &reg, &temp, 1 );
    return 0;
}

void accel3_interrupt2_z_high_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT2_CFG;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= Z_HI_INT2_BM;
    else
        temp &= ~Z_HI_INT2_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_interrupt2_z_low_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT2_CFG;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= Z_LO_INT2_BM;
    else
        temp &= ~Z_LO_INT2_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_interrupt2_y_high_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT2_CFG;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= Y_HI_INT2_BM;
    else
        temp &= ~Y_HI_INT2_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_interrupt2_y_low_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT2_CFG;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= Y_LO_INT2_BM;
    else
        temp &= ~Y_LO_INT2_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_interrupt2_x_high_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT2_CFG;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= X_HI_INT2_BM;
    else
        temp &= ~X_HI_INT2_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

void accel3_interrupt2_x_low_enable(bool enable)
{
    uint8_t temp;
    uint8_t reg = INT2_CFG;

    accel3_hal_read( &reg, &temp, 1 );
    if( enable )
        temp |= X_LO_INT2_BM;
    else
        temp &= ~X_LO_INT2_BM;
    accel3_hal_write( &reg, &temp, 1 );
}

int8_t accel3_is_interrupt2()
{
    uint8_t temp;
    uint8_t reg = INT2_SRC;

    accel3_hal_read( &reg, &temp, 1 );

    temp &= ( 1 << 6 );
    return (temp >> 6); //Returns 1 if interrupt is triggered
}

int8_t accel3_is_z_high_interrupt2()
{
    uint8_t temp;
    uint8_t reg = INT2_SRC;

    accel3_hal_read( &reg, &temp, 1 );

    temp &= (1 << 5);
    return (temp >> 5);
}

int8_t accel3_is_z_low_interrupt2()
{
    uint8_t temp;
    uint8_t reg = INT2_SRC;

    accel3_hal_read( &reg, &temp, 1 );

    temp &= (1 << 4);
    return (temp >> 4);
}

int8_t accel3_is_y_high_interrupt2()
{
    uint8_t temp;
    uint8_t reg = INT2_SRC;

    accel3_hal_read( &reg, &temp, 1 );

    temp &= (1 << 3);
    return (temp >> 3);
}

int8_t accel3_is_y_low_interrupt2()
{
    uint8_t temp;
    uint8_t reg = INT2_SRC;

    accel3_hal_read( &reg, &temp, 1 );

    temp &= (1 << 2);
    return (temp >> 2);
}

int8_t accel3_is_x_high_interrupt2()
{
    uint8_t temp;
    uint8_t reg = INT2_SRC;

    accel3_hal_read( &reg, &temp, 1 );

    temp &= (1 << 1);
    return (temp >> 1);
}

int8_t accel3_is_x_low_interrupt2()
{
    uint8_t temp;
    uint8_t reg = INT2_SRC;

    accel3_hal_read( &reg, &temp, 1 );

    temp &= (1);
    return temp;
}

int8_t accel3_int2_set_threshold(uint8_t threshold)
{
    uint8_t temp = threshold;
    uint8_t reg = INT2_THS;

    if ( temp > ( 1 << 7 ) )
        return 0;
    else
        accel3_hal_write( &reg, &temp, 1 );
    return -1;
}

int8_t accel3_int2_set_duration(uint8_t duration)
{
    uint8_t temp = duration;
    uint8_t reg = INT2_DUR;

    accel3_hal_write( &reg, &temp, 1 );
    return -1;
}

axes_sens_t* accel3_get_xyz_sensitivity( void )
{
    axes_sens_t sensitive_t;
    sensitive_t.x = x_sens;
    sensitive_t.y = y_sens;
    sensitive_t.z = z_sens;

    return &sensitive_t;
}

/*************** END OF FUNCTIONS **********************************************/