#line 1 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
#line 1 "//vboxsvr/corey/projects/clicklibraries/accel3_click/library/include/accel3_hal.h"
#line 1 "c:/users/corey/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"




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
#line 38 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 static uint8_t hal_mode = 0;
 static uint8_t _i2c_hw_address;
#line 84 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 static unsigned int( *is_idle_i2c_p )( void );
 static unsigned int( *start_i2c_p )( void );
 static void( *stop_i2c_p )( void );
 static unsigned int( *restart_i2c_p )( void );
 static unsigned int( *write_i2c_p )( unsigned char data_out );
 static unsigned char( *read_i2c_p )( unsigned int ack );
#line 136 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 static void ( *write_spi_p ) ( unsigned long data_out );
 static unsigned long( *read_spi_p ) ( unsigned long buffer );
#line 155 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 extern sfr sbit ACCEL_3_CS;
 extern sfr sbit ACCEL_3_RST;
#line 170 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
void accel3_hal_init(uint8_t address_id, uint8_t mode )
{
 if( mode == 0 )
 {
#line 217 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 is_idle_i2c_p = I2C_Is_Idle_Ptr;
 start_i2c_p = I2C_Start_Ptr;
 stop_i2c_p = I2C_Stop_Ptr;
 restart_i2c_p = I2C_Restart_Ptr;
 write_i2c_p = I2C_Write_Ptr;
 read_i2c_p = I2C_Read_Ptr;
#line 257 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 _i2c_hw_address = ( address_id << 1 );
 accel_3_hal_cs_high();

 }
 else if( mode == 1 )
 {
#line 270 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 write_spi_p = SPI_Wr_Ptr;
 read_spi_p = SPI_Rd_Ptr;
#line 283 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 accel_3_hal_cs_high();
 }

 hal_mode = mode;

}

void accel3_hal_write(uint8_t *command, uint8_t *buffer,
 uint8_t count )
{
 if( hal_mode == 0 )
 {
 uint8_t temp[  256  ];
 uint8_t cmd_size =  1 ;
 uint8_t ptr = count;
 uint16_t i = 0;

 while( cmd_size-- )
 temp[ i++ ] = *( command++ );

 while ( ptr-- )
 temp[ i++ ] = *( buffer++ );
#line 341 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 start_i2c_p();
 write_i2c_p( _i2c_hw_address +  0  );

 for( i = 0; i <= count; i++ )
 write_i2c_p(temp[i]);

 stop_i2c_p();



 }
 else if( hal_mode == 1 )
 {

 accel_3_hal_cs_low();
 while( count-- )
 {
 write_spi_p( *( buffer++ ) );
 }
 accel_3_hal_cs_high();
 }

}

void accel3_hal_read(uint8_t *command, uint8_t *buffer,
 uint8_t count )
{
 if( hal_mode == 0 )
 {
 uint8_t cmd_size =  1 ;
#line 433 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 start_i2c_p();
 write_i2c_p( _i2c_hw_address |  0  );
 write_i2c_p( *command );
 start_i2c_p();
 write_i2c_p( _i2c_hw_address |  1  );
 if( count == 1 )
 {
 *buffer = read_i2c_p( 0u );

 } else {

 while( count-- > 1 )
 *( buffer++ ) = read_i2c_p( 1 );

 *buffer = read_i2c_p( 0u );

 }
 stop_i2c_p();
#line 479 "//VBOXSVR/corey/Projects/ClickLibraries/Accel3_Click/library/src/accel3_hal.c"
 }
 else if( hal_mode == 1 )
 {

 accel_3_hal_cs_low();
 while( count-- )
 *( buffer++ ) = read_spi_p(  0x00  );
 accel_3_hal_cs_high();
 }

}

void accel_3_hal_cs_high()
{
 ACCEL_3_CS = 1;
}

void accel_3_hal_cs_low()
{
 ACCEL_3_CS = 0;
 Delay_1us();
}

void accel_3_hal_reset( void )
{
 ACCEL_3_RST = 0;
 Delay_10ms();
 ACCEL_3_RST = 1;
}

void accel_3_hal_delay( uint32_t ms )
{
 while( ms-- )
 Delay_1ms( );
}
