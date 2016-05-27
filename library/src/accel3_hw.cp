#line 1 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hw.c"
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
#line 1 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
#line 1 "c:/users/corey/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 1 "c:/users/corey/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 94 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
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
 HIGH = 0,
 LOW,
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
 INT_SOURCE = 0x00,
 INT1_OR_INT2 = 0x01,
 DATA_READY = 0x02,
 BOOT_RUNNING = 0x03
}int_signal_t;

typedef enum
{
 I2C = 0,
 SPI_bus
}bus_mode_t;

typedef struct
{
 int16_t x;
 int16_t y;
 int16_t z;

}axes_sens_t;
#line 199 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
uint8_t accel3_hw_init(uint8_t address, bus_mode_t mode);
#line 213 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_set_mode(accel_mode_t mode);
#line 227 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_set_data_rate(data_rate_t data_rate);
#line 238 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_z_enable (  _Bool  enable );
#line 249 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_y_enable (  _Bool  enable );
#line 260 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_x_enable (  _Bool  enable );
#line 270 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_reboot();
#line 284 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_hp_filter_mode_select(hp_filter_mode_t mode);
#line 295 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_filtered_data_selection_enable( _Bool  enable);
#line 306 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_hp2_filter_enable( _Bool  enable);
#line 317 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_hp1_filter_enable( _Bool  enable);
#line 331 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_hp_cutoff_freq_config(cutoff_freq_t freq);
#line 345 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_interrupt_active_level(level_t level);
#line 359 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_interrupt_pad_selection(interrupt_pad_t select);
#line 373 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_latched_interrupt1_enable( _Bool  enable);
#line 387 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_latched_interrupt2_enable( _Bool  enable);
#line 401 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int1_signal_config(int_signal_t config);
#line 415 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int2_signal_config(int_signal_t config);
#line 427 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_bdu_enable( _Bool  enable);
#line 439 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_ble_enable( _Bool  enable);
#line 453 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_set_full_scale(full_scale_t scale);
#line 464 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
full_scale_t accel3_get_full_scale( void );
#line 475 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_sleep_to_wake_enable( _Bool  enable);
#line 485 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_hp_filter_reset( void );
#line 497 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_hp_filter_set_reference(uint8_t reference);
#line 509 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_overrun_all( void );
#line 521 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_overrun_x( void );
#line 533 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_overrun_y( void );
#line 545 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_overrun_z( void );
#line 557 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_new_data_all( void );
#line 569 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_new_data_x( void );
#line 581 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_new_data_y( void );
#line 593 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_new_data_z( void );
#line 604 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int16_t accel3_read_acc_x( void );
#line 615 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int16_t accel3_read_acc_y( void );
#line 626 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int16_t accel3_read_acc_z( void );
#line 640 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_interrupt1_set_combination(int_comb_t combination);
#line 651 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_z_high_enable( _Bool  enable);
#line 662 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_z_low_enable( _Bool  enable);
#line 673 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_y_high_enable( _Bool  enable);
#line 684 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_y_low_enable( _Bool  enable);
#line 695 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_x_high_enable( _Bool  enable);
#line 706 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt1_x_low_enable( _Bool  enable);
#line 718 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_interrupt1( void );
#line 730 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_z_high_interrupt1( void );
#line 742 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_z_low_interrupt1( void );
#line 754 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_y_high_interrupt1( void );
#line 766 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_y_low_interrupt1( void );
#line 778 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_x_high_interrupt1( void );
#line 790 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_x_low_interrupt1( void );
#line 804 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int1_set_threshold(uint8_t threshold);
#line 818 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int1_set_duration(uint8_t duration);
#line 832 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_interrupt2_set_combination(int_comb_t combination);
#line 844 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_z_high_enable( _Bool  enable);
#line 855 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_z_low_enable( _Bool  enable);
#line 866 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_y_high_enable( _Bool  enable);
#line 877 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_y_low_enable( _Bool  enable);
#line 888 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_x_high_enable( _Bool  enable);
#line 899 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void accel3_interrupt2_x_low_enable( _Bool  enable);
#line 911 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_interrupt2( void );
#line 923 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_z_high_interrupt2( void );
#line 935 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_z_low_interrupt2( void );
#line 947 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_y_high_interrupt2( void );
#line 959 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_y_low_interrupt2( void );
#line 971 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_x_high_interrupt2( void );
#line 983 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_is_x_low_interrupt2( void );
#line 997 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int2_set_threshold(uint8_t threshold);
#line 1011 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
int8_t accel3_int2_set_duration(uint8_t duration);
#line 1022 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
axes_sens_t* accel3_get_xyz_sensitivity( void );
#line 1034 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void set_x( int16_t x );
#line 1046 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void set_y( int16_t y );
#line 1058 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hw.h"
void set_z( int16_t z );
#line 1 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hal.h"
#line 1 "c:/users/corey/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 69 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hal.h"
void accel3_hal_init( uint8_t address_id, uint8_t mode );

void accel3_hal_reset( void );

void accel3_hal_write(uint8_t *command, uint8_t *buffer,
 uint8_t count);

void accel3_hal_read( uint8_t *command, uint8_t *buffer,
 uint8_t count );
void accel_3_hal_cs_high();

void accel_3_hal_cs_low();

void accel_3_hal_reset( void );

void accel_3_hal_delay( uint32_t ms );
#line 38 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hw.c"
static int16_t x_sens;
static int16_t y_sens;
static int16_t z_sens;
#line 45 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hw.c"
void static initial_calibrate();
#line 51 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hw.c"
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

void static initial_calibrate( void )
{
 x_sens = 192;
 y_sens = 199;
 z_sens = 344;

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
 uint8_t reg =  0x20 ;

 if (mode > 7)
 return -1;

 accel3_hal_read( &reg, &temp, 1 );
 temp |= ( mode << 5 );
 accel3_hal_write ( &reg, &temp, 1 );
 return 0;
}

int8_t accel3_set_data_rate(data_rate_t data_rate)
{
 uint8_t temp;
 uint8_t reg =  0x20 ;

 if (data_rate > 3)
 return -1;
 accel3_hal_read( &reg, &temp, 1 );

 temp |= ( data_rate << 3 );
 accel3_hal_write( &reg, &temp, 1 );
 return 0;
}

void accel3_z_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x20 ;

 accel3_hal_read( &reg, &temp, 1 );
 if (enable ==  1 )
 temp |= (1 << 2);
 if (enable ==  0 )
 temp &= ~(1 << 2);
 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_y_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x20 ;

 accel3_hal_read( &reg, &temp, 1 );
 if (enable ==  1 )
 temp |= (1 << 1);
 if (enable ==  0 )
 temp &= ~(1 << 1);
 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_x_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x20 ;

 accel3_hal_read( &reg, &temp, 1 );
 if (enable ==  1 )
 temp |= 1;
 else
 temp &= ~1;
 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_reboot()
{
 uint8_t temp;
 uint8_t reg =  0x21 ;

 accel3_hal_read( &reg, &temp, 1 );
 temp |= (1<<7);
 accel3_hal_write( &reg, &temp, 1 );
}

int8_t accel3_hp_filter_mode_select(hp_filter_mode_t mode)
{
 uint8_t temp;
 uint8_t reg =  0x21 ;

 if (mode > 2)
 return -1;

 accel3_hal_read( &reg, &temp, 1 );
 temp |= mode;
 accel3_hal_write( &reg, &temp, 1 );
 return 0;
}

void accel3_filtered_data_selection_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x21 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1<<4);
 else
 temp &= ~(1<<4);
 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_hp2_filter_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x21 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1<<3);
 else
 temp &= ~(1<<3);
 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_hp1_filter_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x21 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1<<2);
 else
 temp &= ~(1<<2);
 accel3_hal_write( &reg, &temp, 1 );
}

int8_t accel3_hp_cutoff_freq_config(cutoff_freq_t freq)
{
 uint8_t temp;
 uint8_t reg =  0x21 ;

 if ( freq > 3)
 return -1;
 accel3_hal_read( &reg, &temp, 1 );
 temp |= freq;
 accel3_hal_write( &reg, &temp, 1 );
 return 0;
}

int8_t accel3_interrupt_active_level(level_t level)
{
 uint8_t temp;
 uint8_t reg =  0x22 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (level == LOW)
 temp |= 0x80;
 else if (level == HIGH)
 temp &= ~0x80;
 else return -1;

 accel3_hal_write( &reg, &temp, 1 );
 return 0;
}

int8_t accel3_interrupt_pad_selection(interrupt_pad_t select)
{
 uint8_t temp;
 uint8_t reg =  0x22 ;

 accel3_hal_read( &reg, &temp, 1 );
 if ( select == PUSH_PULL)
 temp &= ~(1 << 6);
 else if (select == OPEN_DRAIN )
 temp |= ( 1 << 6);
 else
 return -1;

 accel3_hal_write( &reg, &temp, 1 );
 return 0;
}

void accel3_latched_interrupt1_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x22 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= ( 1<<2 );
 else
 temp &= ~(1<<2);

 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_latched_interrupt2_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x22 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1<<3);
 else
 temp &= ~(1<<3);
 accel3_hal_write( &reg, &temp, 1 );
}

int8_t accel3_int1_signal_config(int_signal_t config)
{
 uint8_t temp;
 uint8_t reg =  0x22 ;

 accel3_hal_read( &reg, &temp, 1);
 temp |= config;
 accel3_hal_write( &reg, &temp, 1 );
 return 1;
}

int8_t accel3_int2_signal_config(int_signal_t config)
{
 uint8_t temp;
 uint8_t reg =  0x22 ;

 if ( (config > 3) || (config < 0) )
 return -1;

 accel3_hal_read( &reg, &temp, 1 );
 temp |= ( config << 3 );
 accel3_hal_write( &reg, &temp, 1 );
 return 0;
}

void accel3_bdu_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x23 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1<<7);
 else
 temp &= ~(1<<7);
 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_ble_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x23 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1<<6);
 else
 temp &= ~(1<<6);
 accel3_hal_write( &reg, &temp, 1 );
}

int8_t accel3_set_full_scale(full_scale_t scale)
{
 uint8_t temp;
 uint8_t reg =  0x23 ;

 accel3_hal_read( &reg, &temp, 1 );

 if ((scale > 3) || (scale < 0))
 return 0;

 temp |= ( scale << 4 );
 accel3_hal_write( &reg, &temp, 1 );
 return -1;
}

full_scale_t accel3_get_full_scale( void )
{
 uint8_t temp;
 uint8_t reg =  0x23 ;

 accel3_hal_read( &reg, &temp, 1 );
 temp &= ~(0xC0);
 temp = temp >> 4;
 if( temp == 0x00 )
 return SCALE_100_G;
 else if( temp == 0x01 )
 return SCALE_200_G;
 else if( temp == 0x03 )
 return SCALE_400_G;

}

void accel3_sleep_to_wake_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x24 ;

 accel3_hal_read( &reg, &temp, 1 );
 if (enable ==  1 )
 temp |= (3);
 else
 temp &= ~(3);
 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_hp_filter_reset()
{
 uint8_t temp;
 uint8_t reg =  0x25 ;

 accel3_hal_read( &reg, &temp, 1 );
}

void accel3_hp_filter_set_reference(uint8_t reference)
{
 uint8_t temp = reference;
 uint8_t reg =  0x26 ;

 accel3_hal_write ( &reg, &temp, 1 );
}

int8_t accel3_is_overrun_all()
{
 uint8_t temp;
 uint8_t reg =  0x27 ;

 accel3_hal_read ( &reg, &temp, 1 );

 return (temp >> 7);
}

int8_t accel3_is_overrun_x()
{
 uint8_t temp;
 uint8_t reg =  0x27 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= ~(1 << 4);
 return ( temp >> 4 );
}

int8_t accel3_is_overrun_y()
{
 uint8_t temp;
 uint8_t reg =  0x27 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= ~(1 << 5);
 return ( temp >> 5 );
}

int8_t accel3_is_overrun_z()
{
 uint8_t temp;
 uint8_t reg =  0x27 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= ~(1 << 6);
 return ( temp >> 6 );
}

int8_t accel3_is_new_data_all()
{
 uint8_t temp;
 uint8_t reg =  0x27 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= (1 << 3);
 return ( temp >> 3 );
}

int8_t accel3_is_new_data_x()
{
 uint8_t temp;
 uint8_t reg =  0x27 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= (1);
 return temp;
}

int8_t accel3_is_new_data_y()
{
 uint8_t temp;
 uint8_t reg =  0x27 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= (1 << 1);
 return ( temp >> 1 );
}


int8_t accel3_is_new_data_z()
{
 uint8_t temp;
 uint8_t reg =  0x27 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= (1 << 2);
 return ( temp >> 2 );
}

int16_t accel3_read_acc_x()
{

 int8_t temp_1;
 int8_t temp_2;
 int16_t retval;
 uint8_t reg_1 =  0x28 ;
 uint8_t reg_2 =  0x29 ;

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
 uint8_t reg_1 =  0x2A ;
 uint8_t reg_2 =  0x2B ;

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
 uint8_t reg_1 =  0x2C ;
 uint8_t reg_2 =  0x2D ;

 accel3_hal_read( &reg_1, &temp_1, 1 );
 accel3_hal_read( &reg_2, &temp_2, 1 );

 retval = ((int16_t) temp_2 ) << 8;
 retval |= (int16_t)temp_1;

 return retval;
}

int8_t accel3_interrupt1_set_combination(int_comb_t combination)
{
 uint8_t temp;
 uint8_t reg =  0x30 ;

 accel3_hal_read( &reg, &temp, 1 );

 if ( combination == OR)
 temp &= ~(1 << 7);
 else if ( combination == AND)
 temp |= (1 << 7);
 else
 return -1;
 accel3_hal_write ( &reg, &temp, 1 );
 return 0;
}

void accel3_interrupt1_z_high_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x30 ;

 accel3_hal_read ( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1 << 5);
 else
 temp &= ~(1 << 5);

 accel3_hal_write ( &reg, &temp, 1 );
}

void accel3_interrupt1_z_low_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x30 ;

 accel3_hal_read ( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1 << 4);
 else
 temp &= ~(1 << 4);
 accel3_hal_write ( &reg, &temp, 1 );
}

void accel3_interrupt1_y_high_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x30 ;

 accel3_hal_read ( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1 << 3);
 else
 temp &= ~(1 << 3);
 accel3_hal_write ( &reg, &temp, 1 );
}

void accel3_interrupt1_y_low_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x30 ;

 accel3_hal_read ( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1 << 2);
 else
 temp &= ~(1 << 2);
 accel3_hal_write ( &reg, &temp, 1 );
}

void accel3_interrupt1_x_high_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x30 ;

 accel3_hal_read ( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= (1 << 1);
 else
 temp &= ~(1 << 1);
 accel3_hal_write ( &reg, &temp, 1 );
}

void accel3_interrupt1_x_low_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x30 ;

 accel3_hal_read ( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= 1;
 else
 temp &= ~(1);
 accel3_hal_write ( &reg, &temp, 1 );
}

int8_t accel3_is_interrupt1()
{
 uint8_t temp;
 uint8_t reg =  0x31 ;

 accel3_hal_read ( &reg, &temp, 1 );

 return (temp >> 6);
}

int8_t accel3_is_z_high_interrupt1()
{
 uint8_t temp;
 uint8_t reg =  0x31 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= (1<<5);
 return (temp >> 5);
}

int8_t accel3_is_z_low_interrupt1()
{
 uint8_t temp = 0;
 uint8_t reg =  0x31 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= (1<<4);
 return (temp >> 4);
}

int8_t accel3_is_y_high_interrupt1()
{
 uint8_t temp;
 uint8_t reg =  0x31 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= ~(1<<3);
 return (temp >> 3);
}

int8_t accel3_is_y_low_interrupt1()
{
 uint8_t temp;
 uint8_t reg =  0x31 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= ~(1<<2);
 return (temp >> 2);
}

int8_t accel3_is_x_high_interrupt1()
{
 uint8_t temp;
 uint8_t reg =  0x31 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= (1<<1);
 return (temp >> 1);
}

int8_t accel3_is_x_low_interrupt1()
{
 uint8_t temp;
 uint8_t reg =  0x31 ;

 accel3_hal_read ( &reg, &temp, 1 );

 temp &= (1);
 return (temp);
}

int8_t accel3_int1_set_threshold(uint8_t threshold)
{
 uint8_t temp = threshold;
 uint8_t reg =  0x32 ;

 if (threshold > (1<<7))
 return 0;
 else
 accel3_hal_write( &reg, &temp, 1 );
 return -1;
}

int8_t accel3_int1_set_duration(uint8_t duration)
{
 uint8_t temp = duration;
 uint8_t reg =  0x33 ;

 accel3_hal_write( &reg, &temp, 1 );
 return -1;
}

int8_t accel3_interrupt2_set_combination(int_comb_t combination)
{
 uint8_t temp;
 uint8_t reg =  0x34 ;

 accel3_hal_read( &reg, &temp, 1 );

 if ( combination == OR)
 temp &= ~(1 << 7);
 else if ( combination == AND)
 temp |= (1 << 7);
 else
 return -1;
 accel3_hal_write ( &reg, &temp, 1 );
 return 0;
}

void accel3_interrupt2_z_high_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x34 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= ( 1 << 5 );
 else
 temp &= ~( 1 << 5);

 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_interrupt2_z_low_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x34 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= ( 1 << 4 );
 else
 temp &= ~( 1 << 4);

 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_interrupt2_y_high_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x34 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= ( 1 << 3 );
 else
 temp &= ~( 1 << 3 );

 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_interrupt2_y_low_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x34 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= ( 1 << 2 );
 else
 temp &= ~( 1 << 2 );

 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_interrupt2_x_high_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x34 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= ( 1 << 1 );
 else
 temp &= ~( 1 << 1);

 accel3_hal_write( &reg, &temp, 1 );
}

void accel3_interrupt2_x_low_enable( _Bool  enable)
{
 uint8_t temp;
 uint8_t reg =  0x34 ;

 accel3_hal_read( &reg, &temp, 1 );

 if (enable ==  1 )
 temp |= 1;
 else
 temp &= ~( 1 );

 accel3_hal_write( &reg, &temp, 1 );
}

int8_t accel3_is_interrupt2()
{
 uint8_t temp;
 uint8_t reg =  0x35 ;

 accel3_hal_read( &reg, &temp, 1 );

 temp &= ( 1 << 6 );
 return (temp >> 6);
}

int8_t accel3_is_z_high_interrupt2()
{
 uint8_t temp;
 uint8_t reg =  0x35 ;

 accel3_hal_read( &reg, &temp, 1 );

 temp &= (1 << 5);
 return (temp >> 5);
}

int8_t accel3_is_z_low_interrupt2()
{
 uint8_t temp;
 uint8_t reg =  0x35 ;

 accel3_hal_read( &reg, &temp, 1 );

 temp &= (1 << 4);
 return (temp >> 4);
}

int8_t accel3_is_y_high_interrupt2()
{
 uint8_t temp;
 uint8_t reg =  0x35 ;

 accel3_hal_read( &reg, &temp, 1 );

 temp &= (1 << 3);
 return (temp >> 3);
}

int8_t accel3_is_y_low_interrupt2()
{
 uint8_t temp;
 uint8_t reg =  0x35 ;

 accel3_hal_read( &reg, &temp, 1 );

 temp &= (1 << 2);
 return (temp >> 2);
}

int8_t accel3_is_x_high_interrupt2()
{
 uint8_t temp;
 uint8_t reg =  0x35 ;

 accel3_hal_read( &reg, &temp, 1 );

 temp &= (1 << 1);
 return (temp >> 1);
}

int8_t accel3_is_x_low_interrupt2()
{
 uint8_t temp;
 uint8_t reg =  0x35 ;

 accel3_hal_read( &reg, &temp, 1 );

 temp &= (1);
 return temp;
}

int8_t accel3_int2_set_threshold(uint8_t threshold)
{
 uint8_t temp = threshold;
 uint8_t reg =  0x36 ;

 if ( temp > ( 1<<7 ) )
 return 0;
 else
 accel3_hal_write( &reg, &temp, 1 );
 return -1;
}

int8_t accel3_int2_set_duration(uint8_t duration)
{
 uint8_t temp = duration;
 uint8_t reg =  0x37 ;

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
