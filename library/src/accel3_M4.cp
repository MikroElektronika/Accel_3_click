#line 1 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_M4.c"
#line 1 "c:/users/corey/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3.h"
#line 1 "c:/users/corey/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
#line 1 "c:/users/corey/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 93 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
typedef enum
{
 POWER_DOWN = 0,
 NORMAL,
 LOW_POWER_0_5,
 LOW_POWER_1,
 LOW_POWER_2,
 LOW_POWER_5,
 LOW_POWER_10,
}accel_mode_t;

typedef enum
{
 HZ_50 = 0,
 HZ_100,
 HZ_400,
 HZ_1000
}data_rate_t;

typedef enum
{
 HP_NORMAL_MODE = 1,
 HP_REF_SIGNAL,
}hp_filter_mode_t;

typedef enum
{
 CUTOFF_8 = 0,
 CUTOFF_16,
 CUTOFF_32,
 CUTOFF_64,
}cutoff_freq_t;

typedef enum
{
 LOW = 0,
 HIGH,
}level_t;


typedef enum
{
 PUSH_PULL = 0,
 OPEN_DRAIN,
}interrupt_pad_t;

typedef enum
{
 SCALE_100_G = 0,
 SCALE_200_G,
 SCALE_400_G = 3
}full_scale_t;

typedef enum
{
 OR = 0,
 AND,
}int_comb_t;

typedef enum
{
 INT_SOURCE = 0,
 INT1_OR_INT2,
 DATA_READY,
 BOOT_RUNNING,
}int_signal_t;

typedef enum
{
 I2C = 0,
 SPI
}bus_mode_t;

typedef struct
{
 int16_t x;
 int16_t y;
 int16_t z;

}axes_sens_t;
#line 198 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_hw_init(uint8_t address, bus_mode_t mode);
#line 212 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_set_mode(accel_mode_t mode);
#line 226 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_set_data_rate(data_rate_t data_rate);
#line 237 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_z_enable (  _Bool  enable );
#line 248 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_y_enable (  _Bool  enable );
#line 259 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_x_enable (  _Bool  enable );
#line 269 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_reboot();
#line 283 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_hp_filter_mode_select(hp_filter_mode_t mode);
#line 294 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_filtered_data_selection_enable( _Bool  enable);
#line 305 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_hp2_filter_enable( _Bool  enable);
#line 316 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_hp1_filter_enable( _Bool  enable);
#line 330 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_hp_cutoff_freq_config(cutoff_freq_t freq);
#line 344 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_interrupt_active_level(level_t level);
#line 358 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_interrupt_pad_selection(interrupt_pad_t select);
#line 372 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_latched_interrupt1_enable( _Bool  enable);
#line 386 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_latched_interrupt2_enable( _Bool  enable);
#line 400 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int1_signal_config(int_signal_t config);
#line 414 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int2_signal_config(int_signal_t config);
#line 426 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_bdu_enable( _Bool  enable);
#line 438 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_ble_enable( _Bool  enable);
#line 452 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_set_full_scale(full_scale_t scale);
#line 463 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
full_scale_t accel3_get_full_scale( void );
#line 474 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_sleep_to_wake_enable( _Bool  enable);
#line 484 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_hp_filter_reset( void );
#line 496 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_hp_filter_set_reference(uint8_t reference);
#line 508 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_overrun_all( void );
#line 520 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_overrun_x( void );
#line 532 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_overrun_y( void );
#line 544 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_overrun_z( void );
#line 556 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_new_data_all( void );
#line 568 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_new_data_x( void );
#line 580 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_new_data_y( void );
#line 592 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_new_data_z( void );
#line 603 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int16_t accel3_read_acc_x( void );
#line 614 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int16_t accel3_read_acc_y( void );
#line 625 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int16_t accel3_read_acc_z( void );
#line 639 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_interrupt1_set_combination(int_comb_t combination);
#line 650 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_z_high_enable( _Bool  enable);
#line 661 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_z_low_enable( _Bool  enable);
#line 672 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_y_high_enable( _Bool  enable);
#line 683 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_y_low_enable( _Bool  enable);
#line 694 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_x_high_enable( _Bool  enable);
#line 705 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_x_low_enable( _Bool  enable);
#line 717 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_interrupt1( void );
#line 729 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_z_high_interrupt1( void );
#line 741 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_z_low_interrupt1( void );
#line 753 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_y_high_interrupt1( void );
#line 765 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_y_low_interrupt1( void );
#line 777 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_x_high_interrupt1( void );
#line 789 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_x_low_interrupt1( void );
#line 803 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int1_set_threshold(uint8_t threshold);
#line 817 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int1_set_duration(uint8_t duration);
#line 831 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_interrupt2_set_combination(int_comb_t combination);
#line 843 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_z_high_enable( _Bool  enable);
#line 854 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_z_low_enable( _Bool  enable);
#line 865 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_y_high_enable( _Bool  enable);
#line 876 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_y_low_enable( _Bool  enable);
#line 887 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_x_high_enable( _Bool  enable);
#line 898 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_x_low_enable( _Bool  enable);
#line 910 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_interrupt2( void );
#line 922 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_z_high_interrupt2( void );
#line 934 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_z_low_interrupt2( void );
#line 946 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_y_high_interrupt2( void );
#line 958 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_y_low_interrupt2( void );
#line 970 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_x_high_interrupt2( void );
#line 982 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_x_low_interrupt2( void );
#line 996 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int2_set_threshold(uint8_t threshold);
#line 1010 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int2_set_duration(uint8_t duration);
#line 1021 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
axes_sens_t* accel3_get_xyz_sensitivity( void );
#line 1033 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void set_x( int16_t x );
#line 1045 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void set_y( int16_t y );
#line 1057 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void set_z( int16_t z );
#line 60 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3.h"
typedef struct
{
 int16_t x_pos;
 int16_t y_pos;
 int16_t z_pos;
}xyz_t;
#line 91 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3.h"
uint8_t accel3_init(uint8_t address, accel_mode_t accel_mode,
 data_rate_t d_rate, bus_mode_t mode );
#line 103 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3.h"
xyz_t* accel3_get_xyz( void );
#line 118 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3.h"
uint8_t accel3_set_interrupt1( uint8_t threshhold, uint8_t duration );
#line 133 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3.h"
uint8_t accel3_set_interrupt2( uint8_t threshhold, uint8_t duration );
#line 147 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3.h"
void accel3_calibrate_x( int16_t pos, int16_t neg );
#line 161 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3.h"
void accel3_calibrate_y( int16_t pos, int16_t neg );
#line 175 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3.h"
void accel3_calibrate_z( int16_t pos, int16_t neg );
#line 47 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_M4.c"
uint8_t accel3_init(uint8_t address, accel_mode_t accel_mode,
 data_rate_t d_rate, bus_mode_t mode )
{
 if( !accel3_hw_init( address, mode ) )
 {
 accel3_set_mode( accel_mode );
 accel3_set_data_rate( d_rate );
 accel3_set_full_scale( SCALE_100_G );

 return 0;
 }
 else
 return -1;
}

xyz_t* accel3_get_xyz( void )
{
 static xyz_t acc_values;
 static axes_sens_t* sensitivity;

 acc_values.x_pos = accel3_read_acc_x();
 acc_values.y_pos = accel3_read_acc_y();
 acc_values.z_pos = accel3_read_acc_z();

 sensitivity = accel3_get_xyz_sensitivity();
 acc_values.x_pos /= sensitivity->x;
 acc_values.y_pos /= sensitivity->y;
 acc_values.z_pos /= sensitivity->z;

 return &acc_values;
}

uint8_t accel3_set_interrupt1( uint8_t threshhold, uint8_t duration )
{
 if( accel3_int1_set_threshold( threshhold ) &&
 accel3_int1_set_duration( duration ) )
 return -1;
 else
 return 0;

}

uint8_t accel3_set_interrupt2( uint8_t threshhold, uint8_t duration )
{
 if( accel3_int2_set_threshold( threshhold ) &&
 accel3_int2_set_duration( duration ) )
 return -1;
 else
 return 0;

}

void accel3_calibrate_x( uint16_t pos, uint16_t neg )
{
 uint16_t x_sens;
 x_sens = ( pos - neg ) / 2;
 set_x( x_sens );
}

void accel3_calibrate_y( uint16_t pos, uint16_t neg )
{
 uint16_t y_sens;
 y_sens = ( pos - neg ) / 2;
 set_y( y_sens );
}

void accel3_calibrate_z( uint16_t pos, uint16_t neg )
{
 uint16_t z_sens;
 z_sens = ( pos - neg ) / 2;
 set_z( z_sens );
}
