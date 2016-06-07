/****************************************************************************
* Title                 :   Accel 3 Click HW layer
* Filename              :   accel3_hw.h
* Author                :   CAL
* Origin Date           :   04/04/2016
* Notes                 :   None
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*    Date      Software Version    Initials       Description
*  04/04/2016    XXXXXXXXXXX         CAL       Interface Created.
*
*****************************************************************************/
/** @file accel3_hw.h
 *  @brief Hardware Layer for Accel 3 Click
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

/**
 * @mainpage
 * @section Main General Description
 * @par
 *  Accel 3 Click is a click board with a H3LIS331DL accelerometer for
 * acceleration readings on X, Y, and Z axis.
 *
 *
 *
 *
 * @section Schematic
 * @image doc Sch.PDF
 *
 */

#ifndef ACCEL3_HW_H_
#define ACCEL3_HW_H_
/******************************************************************************
* Includes
*******************************************************************************/
#include <stdbool.h>
#include <stdint.h>

/******************************************************************************
* Preprocessor Constants
*******************************************************************************/

/******************************************************************************
* Configuration Constants
*******************************************************************************/
#define WHO_AM_I        0x0F
#define CTRL_REG1       0x20
#define CTRL_REG2       0x21
#define CTRL_REG3       0x22
#define CTRL_REG4       0x23
#define CTRL_REG5       0x24
#define HP_FILTER_RESET 0x25
#define REFERENCE_REG   0x26
#define STATUS_REG      0x27
#define OUT_X_L         0x28
#define OUT_X_H         0x29
#define OUT_Y_L         0x2A
#define OUT_Y_H         0x2B
#define OUT_Z_L         0x2C
#define OUT_Z_H         0x2D
#define INT1_CFG        0x30
#define INT1_SRC        0x31
#define INT1_THS        0x32
#define INT1_DUR        0x33
#define INT2_CFG        0x34
#define INT2_SRC        0x35
#define INT2_THS        0x36
#define INT2_DUR        0x37

/**< Bit Masks */
#define POWER_MODE_BM       0xD0        /**< CTRL_REG1 */
#define DATA_RATE_BM        0x18
#define X_EN_BM             0x01
#define Y_EN_BM             0x02
#define Z_EN_BM             0x04
#define BOOT_BM             0x80        /**< CTRL_REG2 */
#define HI_PASS_MODE_BM     0x60
#define FILT_DATA_BM        0x10
#define HI_PASS_INT_2_BM    0x08
#define HI_PASS_INT_1_BM    0x04
#define HI_PASS_CUTOFF_BM   0x03
#define INT_LEVEL_BM        0x80        /**< CTRL_REG3 */
#define PSH_PULL_OPEN_DR_BM 0x40
#define INT_2_LATCH_BM      0x20
#define INT_2_PAD_BM        0x18
#define INT_1_LATCH_BM      0x04
#define INT_1_PAD_BM        0x03
#define BLK_UPDATE_BM       0x80        /**< CTRL_REG4 */
#define BIG_LIL_ENDIAN_BM   0x40
#define FULL_SCALE_BM       0x30
#define SPI_MODE_BM         0x01
#define SLEEP_2_WAKE_BM     0x03        /**< CTRL_REG5 */
#define AND_OR_INT1_BM      0x80        /**< INT1_CFG */
#define Z_HI_INT1_BM        0x20
#define Z_LO_INT1_BM        0x10
#define Y_HI_INT1_BM        0x08
#define Y_LO_INT1_BM        0x04
#define X_HI_INT1_BM        0x02
#define X_LO_INT1_BM        0x01
#define AND_OR_INT2_BM      0x80        /**< INT2_CFG */
#define Z_HI_INT2_BM        0x20
#define Z_LO_INT2_BM        0x10
#define Y_HI_INT2_BM        0x08
#define Y_LO_INT2_BM        0x04
#define X_HI_INT2_BM        0x02
#define X_LO_INT2_BM        0x01



/******************************************************************************
* Macros
*******************************************************************************/

/******************************************************************************
* Typedefs
*******************************************************************************/
typedef enum
{
    POWER_DOWN      = 0x00,
    NORMAL          = 0x20,
    LOW_POWER_0_5   = 0x40,
    LOW_POWER_1     = 0x60,
    LOW_POWER_2     = 0x80,
    LOW_POWER_5     = 0xA0,
    LOW_POWER_10    = 0xC0
} accel_mode_t;

typedef enum
{
    HZ_50   = 0x00,
    HZ_100  = 0x08,
    HZ_400  = 0x10,
    HZ_1000 = 0x18
} data_rate_t;

typedef enum
{
    HP_NORMAL_MODE = 0x00,
    HP_REF_SIGNAL  = 0x20
} hp_filter_mode_t;

typedef enum
{
    CUTOFF_1        = 0x00,
    CUTOFF_0_5      = 0x01,
    CUTOFF_0_25     = 0x02,
    CUTOFF_0_125    = 0x03
} cutoff_freq_t;

typedef enum
{
    HIGH    = 0x00,
    LOW     = 0x80,
} level_t;


typedef enum
{
    PUSH_PULL = 0,
    OPEN_DRAIN,
} interrupt_pad_t;

typedef enum
{
    SCALE_100_G = 0,
    SCALE_200_G,
    SCALE_400_G = 3
} full_scale_t;

typedef enum
{
    OR   = 0x00,
    AND  = 0x80
} int_comb_t;

typedef enum
{
    INT1_SOURCE     = 0x00,
    INT1_OR_INT2_1  = 0x01,
    DATA1_READY     = 0x02,
    BOOT1_RUNNING   = 0x03
} int1_signal_t;

typedef enum
{
    INT2_SOURCE     = 0x00,
    INT1_OR_INT2_2  = 0x08,
    DATA2_READY     = 0x10,
    BOOT2_RUNNING   = 0x18
} int2_signal_t;

typedef enum
{
    I2C = 0,
    SPI_bus
} bus_mode_t;

typedef struct
{
    int16_t x;
    int16_t y;
    int16_t z;

} axes_sens_t;
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
* @brief <h3> Accel 3 HW Initialize </h3>
*
* @par
*  Initializes the Accel 3 Click for usage at the hardware level.
*
* @param[in] address    - Address of Accel 3 for I2C bus.
* @param[in] mode       - Bus mode to use for Accel 3. ( SPI, I2C )
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful. (Wrong address)
*
*/
uint8_t accel3_hw_init(uint8_t address, bus_mode_t mode);

/**
* @brief <h3> Accel 3 Set Mode </h3>
*
* @par
*  Sets the power mode for Accel 3.
*
* @param[in] mode - Power mode for Accel 3 to be intialized in.
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
int8_t accel3_set_mode(accel_mode_t mode);

/**
* @brief <h3> Accel 3 Set Data Rate </h3>
*
* @par
*  Sets the data rate for the Accel 3.
*
* @param[in] data_rate - Data Rate for Accel 3 to run at.
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
int8_t accel3_set_data_rate(data_rate_t data_rate);

/**
* @brief <h3> Accel 3 Z Enable </h3>
*
* @par
*  Enables values on the Z axis.
*
* @param[in] enable - Boolean value.
*
*/
void accel3_z_enable ( bool enable );

/**
* @brief <h3> Accel 3 Y Enable </h3>
*
* @par
*  Enables values on the Y axis.
*
* @param[in] enable - Boolean value.
*
*/
void accel3_y_enable ( bool enable );

/**
* @brief <h3> Accel 3 X Enable </h3>
*
* @par
*  Enables values on the X axis.
*
* @param[in] enable - Boolean value.
*
*/
void accel3_x_enable ( bool enable );

/**
* @brief <h3> Accel 3 Reboot </h3>
*
* @par
*  Reboots the Accel 3, ( Resets the saved Trim Values for all the axis.
*
*
*/
void accel3_reboot();

/**
* @brief <h3> Accel 3 High-Pass Filter Mode Select </h3>
*
* @par
*  Sets the High-Pass Filter Mode
*
* @param[in] mode - High-Pass Filter Mode.
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
int8_t accel3_hp_filter_mode_select(hp_filter_mode_t mode);

/**
* @brief <h3> Accel 3 Filtered Data Selection Enable </h3>
*
* @par
*  Enables or Disables the data to be filtered.
*
* @param[in] enable -   Boolean value.
*
*/
void accel3_filtered_data_selection_enable(bool enable);

/**
* @brief <h3> Accel 3 High-Pass filter for Interrupt 2 </h3>
*
* @par
*  Sets the High-Pass Filter for Interrupt 2 source.
*
* @param[in] enable - Boolean Value.
*
*/
void accel3_hp2_filter_enable(bool enable);

/**
* @brief <h3> Accel 3 High-Pass filter for Interrupt 1 </h3>
*
* @par
*  Sets the High-Pass Filter for Interrupt 1 source.
*
* @param[in] enable - Boolean Value.
*
*/
void accel3_hp1_filter_enable(bool enable);

/**
* @brief <h3> Accel 3 High-Pass Filter Cutoff Frequency Config </h3>
*
* @par
*  Sets the Cutoff frequency for the High-Pass Filter.
*
* @param[in] freq - Frequency for High-Pass Filter to cutoff at.
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
int8_t accel3_hp_cutoff_freq_config(cutoff_freq_t freq);

/**
* @brief <h3> Accel 3 Interrupt Active Level </h3>
*
* @par
*  Sets the level at which interrupts are active.
*
* @param[in] level  - When the interrupts are active ( HIGH or LOW )
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
int8_t accel3_interrupt_active_level(level_t level);

/**
* @brief <h3> Accel 3 Interrupt Pad Selection </h3>
*
* @par
*  Sets the Push-pull/open drain selection on interrupt pad.
*
* @param[in] select -   Push-Pull or Open Drain for Interrupt pad.
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
int8_t accel3_interrupt_pad_selection(interrupt_pad_t select);

/**
* @brief <h3> Accel 3 Interrupt 1 Enable </h3>
*
* @par
*  Enables Interrupts on Interrupt 1 pin
*
* @param[in] enable -   Boolean Value.
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
void accel3_latched_interrupt1_enable(bool enable);

/**
* @brief <h3> Accel 3 Interrupt 2 Enable </h3>
*
* @par
*  Enables Interrupts on Interrupt 2 pin
*
* @param[in] enable -   Boolean Value.
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
void accel3_latched_interrupt2_enable(bool enable);

/**
* @brief <h3> Accel 3 Interrupt 1 Signal Config </h3>
*
* @par
*  Selects when interrupts signal is triggered.
*
* @param[in] config -   Signal configuration.
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
int8_t accel3_int1_signal_config(int_signal_t config);

/**
* @brief <h3> Accel 3 Interrupt 2 Signal Config </h3>
*
* @par
*  Selects when interrupts signal is triggered.
*
* @param[in] config -   Signal configuration.
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
int8_t accel3_int2_signal_config(int_signal_t config);

/**
* @brief <h3> Accel 3 Block Data Update Enable </h3>
*
* @par
*  Enables or Disables Block Data updates.
*
* @param[in] enable -   0 for Continuous Update, 1 for Output Registers not
*   updated between MSB and LSB reading.
*
*/
void accel3_bdu_enable(bool enable);

/**
* @brief <h3> Accel 3 Big/little Endian Data Selection. </h3>
*
* @par
*  Decides whether MSB or LSB data is at lower address.
*
* @param[in] enable -   0 for data LSB @ lower address , 1 for data MSB @ lower
*   address.
*
*/
void accel3_ble_enable(bool enable);

/**
* @brief <h3> Accel 3 Set Full Scale </h3>
*
* @par
*  Sets the full scale selection.
*
* @param[in] scale  -   Full-Scale Setting.
*
* @param[out] 0     -   Success
* @param[out] -1    -   Unsuccessful
*
*/
int8_t accel3_set_full_scale(full_scale_t scale);

/**
* @brief <h3> Accel 3 Sleep to Wake Enable </h3>
*
* @par
*  Enables or disables the accelerometers sleep-to-wake feature.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_sleep_to_wake_enable(bool enable);

/**
* @brief <h3> Accel 3 High-Pass Filter Reset </h3>
*
* @par
*  Resets the High Pass Filter
*
*
*/
void accel3_hp_filter_reset( void );

/**
* @brief <h3> Accel 3 High-Pass Filter Set Reference </h3>
*
* @par
*  Sets the Reference value for high-pass filter
*
* @param[in] reference  -   Reference Value.
*
*
*/
void accel3_hp_filter_set_reference(uint8_t reference);

/**
* @brief <h3> Accel 3 Is Overrun All </h3>
*
* @par
*  Checks if any ( x, y, or z ) data are overrun.
*
* @param[out] 1     -   Data has been overrun.
* @param[out] 0     -   Data hasn't been overrun.
*
*/
int8_t accel3_is_overrun_all( void );

/**
* @brief <h3> Accel 3 Is X Overrun </h3>
*
* @par
*  Checks if X data has been overrun.
*
* @param[out] 1     -   Data has been overrun.
* @param[out] 0     -   Data hasn't been overrun.
*
*/
int8_t accel3_is_overrun_x( void );

/**
* @brief <h3> Accel 3 Is Y Overrun </h3>
*
* @par
*  Checks if Y data has been overrun.
*
* @param[out] 1     -   Data has been overrun.
* @param[out] 0     -   Data hasn't been overrun.
*
*/
int8_t accel3_is_overrun_y( void );

/**
* @brief <h3> Accel 3 Is Z Overrun </h3>
*
* @par
*  Checks if Z data has been overrun.
*
* @param[out] 1     -   Data has been overrun.
* @param[out] 0     -   Data hasn't been overrun.
*
*/
int8_t accel3_is_overrun_z( void );

/**
* @brief <h3> Accel 3 Is New Data All </h3>
*
* @par
*  Checks if any ( X, Y, or Z ) has new data.
*
* @param[out] 1     -   New Data.
* @param[out] 0     -   No New Data.
*
*/
int8_t accel3_is_new_data_all( void );

/**
* @brief <h3> Accel 3 Is New Data X </h3>
*
* @par
*  Checks if X has new data.
*
* @param[out] 1     -   New Data.
* @param[out] 0     -   No New Data.
*
*/
int8_t accel3_is_new_data_x( void );

/**
* @brief <h3> Accel 3 Is New Data Y </h3>
*
* @par
*  Checks if Y has new data.
*
* @param[out] 1     -   New Data.
* @param[out] 0     -   No New Data.
*
*/
int8_t accel3_is_new_data_y( void );

/**
* @brief <h3> Accel 3 Is New Data Z </h3>
*
* @par
*  Checks if Z has new data.
*
* @param[out] 1     -   New Data.
* @param[out] 0     -   No New Data.
*
*/
int8_t accel3_is_new_data_z( void );

/**
* @brief <h3> Accel 3 Read Axis Acceleration X </h3>
*
* @par
*  Reads the Axis Acceleration Data for X.
*
* @param[out] data  -   Axis Acceleration data.
*
*/
int16_t accel3_read_acc_x( void );

/**
* @brief <h3> Accel 3 Read Axis Acceleration Y </h3>
*
* @par
*  Reads the Axis Acceleration Data for Y.
*
* @param[out] data  -   Axis Acceleration data.
*
*/
int16_t accel3_read_acc_y( void );

/**
* @brief <h3> Accel 3 Read Axis Acceleration Z </h3>
*
* @par
*  Reads the Axis Acceleration Data for Z.
*
* @param[out] data  -   Axis Acceleration data.
*
*/
int16_t accel3_read_acc_z( void );

/**
* @brief <h3> Accel 3 Interrupt 1 Set Combination </h3>
*
* @par
*  Sets the combination for interrupts on interrupt 1 pin.
*
* @param[in] comination -   Combination of interrupt events. ( AND / OR )
*
* @param[out] -1    -   Unsuccessful
* @param[out] 0     -   Successful
*
*/
int8_t accel3_interrupt1_set_combination(int_comb_t combination);

/**
* @brief <h3> Accel 3 Z High Enable </h3>
*
* @par
*  Enables the Interrupt event for Z high on Interrupt 1 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt1_z_high_enable(bool enable);

/**
* @brief <h3> Accel 3 Z Low Enable </h3>
*
* @par
*  Enables the Interrupt event for Z Low on Interrupt 1 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt1_z_low_enable(bool enable);

/**
* @brief <h3> Accel 3 Y High Enable </h3>
*
* @par
*  Enables the Interrupt event for Y high on Interrupt 1 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt1_y_high_enable(bool enable);

/**
* @brief <h3> Accel 3 Y Low Enable </h3>
*
* @par
*  Enables the Interrupt event for Y Low on Interrupt 1 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt1_y_low_enable(bool enable);

/**
* @brief <h3> Accel 3 X High Enable </h3>
*
* @par
*  Enables the Interrupt event for X high on Interrupt 1 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt1_x_high_enable(bool enable);

/**
* @brief <h3> Accel 3 X Low Enable </h3>
*
* @par
*  Enables the Interrupt event for X Low on Interrupt 1 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt1_x_low_enable(bool enable);

/**
* @brief <h3> Accel 3 is Interrupt 1 </h3>
*
* @par
*  Checks to see if an interrupt has been triggered on interrupt 1 pin.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_interrupt1( void );

/**
* @brief <h3> Accel 3 is Z High Interrupt 1 </h3>
*
* @par
*  Checks to see if Z high Interrupt has been triggered on Interrupt pin 1.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_z_high_interrupt1( void );

/**
* @brief <h3> Accel 3 is Z Low Interrupt 1 </h3>
*
* @par
*  Checks to see if Z Low Interrupt has been triggered on Interrupt pin 1.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_z_low_interrupt1( void );

/**
* @brief <h3> Accel 3 is Y High Interrupt 1 </h3>
*
* @par
*  Checks to see if Y high Interrupt has been triggered on Interrupt pin 1.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_y_high_interrupt1( void );

/**
* @brief <h3> Accel 3 is Y Low Interrupt 1 </h3>
*
* @par
*  Checks to see if Y Low Interrupt has been triggered on Interrupt pin 1.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_y_low_interrupt1( void );

/**
* @brief <h3> Accel 3 is X High Interrupt 1 </h3>
*
* @par
*  Checks to see if X high Interrupt has been triggered on Interrupt pin 1.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_x_high_interrupt1( void );

/**
* @brief <h3> Accel 3 is X Low Interrupt 1 </h3>
*
* @par
*  Checks to see if X Low Interrupt has been triggered on Interrupt pin 1.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_x_low_interrupt1( void );

/**
* @brief <h3> Accel 3 Interrupt 1 Set Threshold </h3>
*
* @par
*  Sets the Threshold for Interrupt 1.
*
* @param[in] threshold  -   Threshold for interrupt 1 to use.
*
* @param[out]   0    -   Unsuccessful
* @param[out]   -1   -   Successful
*
*/
int8_t accel3_int1_set_threshold(uint8_t threshold);

/**
* @brief <h3> Accel 3 Interrupt 1 Set Duration </h3>
*
* @par
*  Sets the Duration for Interrupt 1.
*
* @param[in] duration  -   Duration for interrupt 1 to use.
*
* @param[out]   0    -   Unsuccessful
* @param[out]   -1   -   Successful
*
*/
int8_t accel3_int1_set_duration(uint8_t duration);

/**
* @brief <h3> Accel 3 Interrupt 2 Set Combination </h3>
*
* @par
*  Sets the combination for interrupts on interrupt 2 pin.
*
* @param[in] comination -   Combination of interrupt events. ( AND / OR )
*
* @param[out] -1    -   Unsuccessful
* @param[out] 0     -   Successful
*
*/
int8_t accel3_interrupt2_set_combination(int_comb_t combination);


/**
* @brief <h3> Accel 3 Z High Enable </h3>
*
* @par
*  Enables the Interrupt event for Z high on Interrupt 2 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt2_z_high_enable(bool enable);

/**
* @brief <h3> Accel 3 Z Low Enable </h3>
*
* @par
*  Enables the Interrupt event for Z Low on Interrupt 2 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt2_z_low_enable(bool enable);

/**
* @brief <h3> Accel 3 Y High Enable </h3>
*
* @par
*  Enables the Interrupt event for Y high on Interrupt 2 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt2_y_high_enable(bool enable);

/**
* @brief <h3> Accel 3 Y Low Enable </h3>
*
* @par
*  Enables the Interrupt event for Y Low on Interrupt 2 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt2_y_low_enable(bool enable);

/**
* @brief <h3> Accel 3 X High Enable </h3>
*
* @par
*  Enables the Interrupt event for X high on Interrupt 2 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt2_x_high_enable(bool enable);

/**
* @brief <h3> Accel 3 X Low Enable </h3>
*
* @par
*  Enables the Interrupt event for X Low on Interrupt 2 pin.
*
* @param[in] enable -   Boolean Value.
*
*/
void accel3_interrupt2_x_low_enable(bool enable);

/**
* @brief <h3> Accel 3 is Interrupt 2 </h3>
*
* @par
*  Checks to see if an interrupt has been triggered on interrupt 2 pin.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_interrupt2( void );

/**
* @brief <h3> Accel 3 is Z High Interrupt 2 </h3>
*
* @par
*  Checks to see if Z high Interrupt has been triggered on Interrupt pin 2.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_z_high_interrupt2( void );

/**
* @brief <h3> Accel 3 is Z Low Interrupt 2 </h3>
*
* @par
*  Checks to see if Z Low Interrupt has been triggered on Interrupt pin 2.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_z_low_interrupt2( void );

/**
* @brief <h3> Accel 3 is Y High Interrupt 2 </h3>
*
* @par
*  Checks to see if Y high Interrupt has been triggered on Interrupt pin 2.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_y_high_interrupt2( void );

/**
* @brief <h3> Accel 3 is Y Low Interrupt 2 </h3>
*
* @par
*  Checks to see if Y Low Interrupt has been triggered on Interrupt pin 2.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_y_low_interrupt2( void );

/**
* @brief <h3> Accel 3 is X High Interrupt 2 </h3>
*
* @par
*  Checks to see if X high Interrupt has been triggered on Interrupt pin 2.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_x_high_interrupt2( void );

/**
* @brief <h3> Accel 3 is X Low Interrupt 2 </h3>
*
* @par
*  Checks to see if X Low Interrupt has been triggered on Interrupt pin 2.
*
* @param[out]   1   -   Interrupt Triggered
* @param[out]   0   -   No Interrupt has been Triggered.
*
*/
int8_t accel3_is_x_low_interrupt2( void );

/**
* @brief <h3> Accel 3 Interrupt 2 Set Threshold </h3>
*
* @par
*  Sets the Threshold for Interrupt 2.
*
* @param[in] threshold  -   Threshold for interrupt 2 to use.
*
* @param[out]   0    -   Unsuccessful
* @param[out]   -1   -   Successful
*
*/
int8_t accel3_int2_set_threshold(uint8_t threshold);

/**
* @brief <h3> Accel 3 Interrupt 2 Set Duration </h3>
*
* @par
*  Sets the Duration for Interrupt 1.
*
* @param[in] duration  -   Duration for interrupt 2 to use.
*
* @param[out]   0    -   Unsuccessful
* @param[out]   -1   -   Successful
*
*/
int8_t accel3_int2_set_duration(uint8_t duration);

/**
* @brief <h3> Accel 3 Get XYZ Sensitivity </h3>
*
* @par
*  Gets the Sensitivity for this specific Accel 3 Click.
*
* @param[out]   axes_sens_t*    -   Struct with xyz values for axis accelartion.
*
*/
axes_sens_t* accel3_get_xyz_sensitivity( void );

/**
* @brief <h3> Accel 3 Set X </h3>
*
* @par
*  Sets the sensitivity for X
*
* @param[in] x  -   Sensitivity value for X axis.
*
*
*/
void set_x( int16_t x );

/**
* @brief <h3> Accel 3 Set Y </h3>
*
* @par
*  Sets the sensitivity for Y
*
* @param[in] y  -   Sensitivity value for Y axis.
*
*
*/
void set_y( int16_t y );

/**
* @brief <h3> Accel 3 Set Z </h3>
*
* @par
*  Sets the sensitivity for Z
*
* @param[in] z  -   Sensitivity value for Z axis.
*
*
*/
void set_z( int16_t z );








#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MODULE_H_ */

/*** End of File **************************************************************/