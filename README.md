![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

![Accel 3 Click](http://cdn.mikroe.com/img/click/accel-3/preview/accel-3-click-thumb-02.png)

---
[Product Page](http://www.mikroe.com/click/accel3/)

[Manual Page](http://docs.mikroe.com/Accel_3_click)

[Learn Page](http://learn.mikroe.com/mems-sensors-conversion-physical-world-digital-world/)

---

### General Description

Accel 3 click™ is a mikroBUS™ add-on board with ST’s H3LIS331DL low-power high-g 3-axis digital accelerometer. The IC has ±100g/±200g/±400g dynamically selectable full scales and outputs 16-bit data at rates from 0.5 Hz to 1 kHz. On the upper end, the chip can survive a 1000g high-shock. H3LIS331DL has extremely low power consumption (down to 1µA in low-power mode). Advanced sleep-to-wakeup functions are also available.  Accel 3 click can communicate with the target MCU either through the mikroBUS™ SPI or UART interface, with additional functionality provided by an interrupt pin (INT). The board is designed to use a 3.3 power supply only.

Applications

Shock detection, impact recognition, concussion detector


Key features
- ±100g/±200g/±400g dynamically selectable full scales
- 16-bit data output; 0.5Hz to 1kHz data rates
- I2C or SPI interface
- 3.3V power supply

Key benefits
- Selectable interface
- Configurable I2C address
- Low-power consumption
- mikroBUS™ form factor enables easy integration

---

### Example

#### Configuration
* MCU:             STM32F107VC
* Dev.Board:       EasyMx Pro v7
* Oscillator:      72 Mhz internal
* Ext. Modules:    Accel 3 click
* SW:              MikroC PRO for ARM 4.7.4

```
#include <stdint.h>

/*      Functions
 ****************************/

#include <stdint.h>
#include "accel3.h"
#include "ball_bitmap.h"
#include "resources.h"

sbit ACCEL_3_CS  at GPIOD_ODR.B13;
sbit ACCEL_3_INT at GPIOD_IDR.B10;


void display_init( void );
void system_setup( uint8_t address,accel_mode_t accel_mode,
                     data_rate_t d_rate, bus_mode_t mode )
{
  //GPIO Outputs
  GPIO_Digital_Output( &GPIOD_BASE, _GPIO_PINMASK_13 );
  GPIO_Digital_Input( &GPIOD_BASE, _GPIO_PINMASK_10 );
  Delay_ms(200);

  //I2C
  I2C1_Init_Advanced( 100000, &_GPIO_MODULE_I2C1_PB67 );
  Delay_ms(200);

  //Accel 3 Initialization
  accel3_init( address, accel_mode, d_rate, mode );

  //UART Initialization
  UART1_Init(9600);
  Delay_ms(200);
  UART1_Write_Text( "UART Initialized" );
  UART1_Write_Text( "\r\n" );

  //TFT Display
  display_init();

}

void main() 
{
  uint8_t address = 0x18;
  xyz_t* my_coords;
  uint8_t thresh = 10;
  uint8_t duration = 5;
  char text[50];

  system_setup( address, NORMAL, HZ_100, I2C );

  while(1)
  {
     my_coords = accel3_get_xyz();
     
     sprintf( text, " x: %d y: %d z: %d ", my_coords->x_pos, my_coords->y_pos, my_coords->z_pos );
     UART1_Write_Text( text );
     UART1_Write_Text( "\r\n" );
     Delay_ms(30);
  }

}
```
