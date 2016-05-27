_accel3_hal_init:
;accel3_hal.c,170 :: 		void accel3_hal_init(uint8_t address_id, uint8_t mode )
; mode start address is: 4 (R1)
; address_id start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R4, R1
; mode end address is: 4 (R1)
; address_id end address is: 0 (R0)
; address_id start address is: 0 (R0)
; mode start address is: 16 (R4)
;accel3_hal.c,172 :: 		if( mode == 0 )
CMP	R4, #0
IT	NE
BNE	L_accel3_hal_init0
;accel3_hal.c,177 :: 		start_i2c_p = I2C_Start_Ptr;
MOVW	R2, #lo_addr(_I2C_Start_Ptr+0)
MOVT	R2, #hi_addr(_I2C_Start_Ptr+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(accel3_hal_start_i2c_p+0)
MOVT	R2, #hi_addr(accel3_hal_start_i2c_p+0)
STR	R3, [R2, #0]
;accel3_hal.c,178 :: 		write_i2c_p = I2C_Write_Ptr;
MOVW	R2, #lo_addr(_I2C_Write_Ptr+0)
MOVT	R2, #hi_addr(_I2C_Write_Ptr+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(accel3_hal_write_i2c_p+0)
MOVT	R2, #hi_addr(accel3_hal_write_i2c_p+0)
STR	R3, [R2, #0]
;accel3_hal.c,179 :: 		read_i2c_p = I2C_Read_Ptr;
MOVW	R2, #lo_addr(_I2C_Read_Ptr+0)
MOVT	R2, #hi_addr(_I2C_Read_Ptr+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(accel3_hal_read_i2c_p+0)
MOVT	R2, #hi_addr(accel3_hal_read_i2c_p+0)
STR	R3, [R2, #0]
;accel3_hal.c,254 :: 		_i2c_hw_address = address_id;
MOVW	R2, #lo_addr(accel3_hal__i2c_hw_address+0)
MOVT	R2, #hi_addr(accel3_hal__i2c_hw_address+0)
STRB	R0, [R2, #0]
; address_id end address is: 0 (R0)
;accel3_hal.c,255 :: 		accel_3_hal_cs_high();
BL	_accel_3_hal_cs_high+0
;accel3_hal.c,260 :: 		}
IT	AL
BAL	L_accel3_hal_init1
L_accel3_hal_init0:
;accel3_hal.c,261 :: 		else if( mode == 1 )
CMP	R4, #1
IT	NE
BNE	L_accel3_hal_init2
;accel3_hal.c,270 :: 		write_spi_p             = SPI_Wr_Ptr;
MOVW	R2, #lo_addr(_SPI_Wr_Ptr+0)
MOVT	R2, #hi_addr(_SPI_Wr_Ptr+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(accel3_hal_write_spi_p+0)
MOVT	R2, #hi_addr(accel3_hal_write_spi_p+0)
STR	R3, [R2, #0]
;accel3_hal.c,271 :: 		read_spi_p              = SPI_Rd_Ptr;
MOVW	R2, #lo_addr(_SPI_Rd_Ptr+0)
MOVT	R2, #hi_addr(_SPI_Rd_Ptr+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(accel3_hal_read_spi_p+0)
MOVT	R2, #hi_addr(accel3_hal_read_spi_p+0)
STR	R3, [R2, #0]
;accel3_hal.c,283 :: 		accel_3_hal_cs_high();
BL	_accel_3_hal_cs_high+0
;accel3_hal.c,284 :: 		}
L_accel3_hal_init2:
L_accel3_hal_init1:
;accel3_hal.c,286 :: 		hal_mode = mode;
MOVW	R2, #lo_addr(accel3_hal_hal_mode+0)
MOVT	R2, #hi_addr(accel3_hal_hal_mode+0)
STRB	R4, [R2, #0]
; mode end address is: 16 (R4)
;accel3_hal.c,288 :: 		}
L_end_accel3_hal_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _accel3_hal_init
_accel3_hal_write:
;accel3_hal.c,291 :: 		uint8_t count )
; count start address is: 8 (R2)
; buffer start address is: 4 (R1)
; command start address is: 0 (R0)
SUB	SP, SP, #268
STR	LR, [SP, #0]
UXTB	R4, R2
MOV	R2, R1
; count end address is: 8 (R2)
; buffer end address is: 4 (R1)
; command end address is: 0 (R0)
; command start address is: 0 (R0)
; buffer start address is: 8 (R2)
; count start address is: 16 (R4)
;accel3_hal.c,293 :: 		if( hal_mode == 0 )
MOVW	R3, #lo_addr(accel3_hal_hal_mode+0)
MOVT	R3, #hi_addr(accel3_hal_hal_mode+0)
LDRB	R3, [R3, #0]
CMP	R3, #0
IT	NE
BNE	L_accel3_hal_write3
;accel3_hal.c,296 :: 		uint8_t cmd_size = COMMAND_SIZE;
; cmd_size start address is: 28 (R7)
MOVS	R7, #1
;accel3_hal.c,297 :: 		uint8_t ptr = count;
; ptr start address is: 4 (R1)
UXTB	R1, R4
; count end address is: 16 (R4)
;accel3_hal.c,298 :: 		uint16_t i = 0;
; i start address is: 20 (R5)
MOVW	R5, #0
; command end address is: 0 (R0)
; buffer end address is: 8 (R2)
; ptr end address is: 4 (R1)
; cmd_size end address is: 28 (R7)
; i end address is: 20 (R5)
MOV	R6, R0
UXTB	R0, R1
MOV	R1, R2
;accel3_hal.c,300 :: 		while( cmd_size-- )
L_accel3_hal_write4:
; i start address is: 20 (R5)
; cmd_size start address is: 8 (R2)
; ptr start address is: 0 (R0)
; cmd_size start address is: 28 (R7)
; buffer start address is: 4 (R1)
; command start address is: 24 (R6)
UXTB	R4, R7
SUBS	R3, R7, #1
; cmd_size end address is: 28 (R7)
; cmd_size start address is: 8 (R2)
UXTB	R2, R3
; cmd_size end address is: 8 (R2)
CMP	R4, #0
IT	EQ
BEQ	L_accel3_hal_write5
; cmd_size end address is: 8 (R2)
;accel3_hal.c,301 :: 		temp[ i++ ] = *( command++ );
; cmd_size start address is: 8 (R2)
ADD	R3, SP, #12
ADDS	R4, R3, R5
LDRB	R3, [R6, #0]
STRB	R3, [R4, #0]
ADDS	R5, R5, #1
UXTH	R5, R5
ADDS	R6, R6, #1
; cmd_size end address is: 8 (R2)
; command end address is: 24 (R6)
UXTB	R7, R2
IT	AL
BAL	L_accel3_hal_write4
L_accel3_hal_write5:
;accel3_hal.c,303 :: 		while ( ptr-- )
UXTH	R7, R5
; buffer end address is: 4 (R1)
MOV	R6, R1
L_accel3_hal_write6:
; i end address is: 20 (R5)
; buffer start address is: 24 (R6)
; ptr start address is: 0 (R0)
; i start address is: 28 (R7)
UXTB	R4, R0
SUBS	R3, R0, #1
UXTB	R0, R3
; ptr end address is: 0 (R0)
CMP	R4, #0
IT	EQ
BEQ	L_accel3_hal_write7
; ptr end address is: 0 (R0)
;accel3_hal.c,304 :: 		temp[ i++ ] = *( buffer++ );
; ptr start address is: 0 (R0)
ADD	R3, SP, #12
ADDS	R5, R3, R7
LDRB	R4, [R6, #0]
STRB	R4, [R5, #0]
ADDS	R7, R7, #1
UXTH	R7, R7
ADDS	R6, R6, #1
; ptr end address is: 0 (R0)
; buffer end address is: 24 (R6)
IT	AL
BAL	L_accel3_hal_write6
L_accel3_hal_write7:
;accel3_hal.c,309 :: 		start_i2c_p();
MOVW	R4, #lo_addr(accel3_hal_start_i2c_p+0)
MOVT	R4, #hi_addr(accel3_hal_start_i2c_p+0)
LDR	R4, [R4, #0]
STRH	R7, [SP, #4]
BLX	R4
LDRH	R7, [SP, #4]
;accel3_hal.c,310 :: 		write_i2c_p( _i2c_hw_address, temp, i, END_MODE_STOP );
ADD	R4, SP, #12
MOVW	R3, #lo_addr(accel3_hal__i2c_hw_address+0)
MOVT	R3, #hi_addr(accel3_hal__i2c_hw_address+0)
LDRB	R3, [R3, #0]
UXTH	R2, R7
MOV	R1, R4
; i end address is: 28 (R7)
UXTB	R0, R3
MOVW	R3, #1
MOVW	R4, #lo_addr(accel3_hal_write_i2c_p+0)
MOVT	R4, #hi_addr(accel3_hal_write_i2c_p+0)
LDR	R4, [R4, #0]
BLX	R4
;accel3_hal.c,351 :: 		}
IT	AL
BAL	L_accel3_hal_write8
L_accel3_hal_write3:
;accel3_hal.c,352 :: 		else if( hal_mode == 1 )
; count start address is: 16 (R4)
; buffer start address is: 8 (R2)
MOVW	R3, #lo_addr(accel3_hal_hal_mode+0)
MOVT	R3, #hi_addr(accel3_hal_hal_mode+0)
LDRB	R3, [R3, #0]
CMP	R3, #1
IT	NE
BNE	L_accel3_hal_write9
;accel3_hal.c,355 :: 		accel_3_hal_cs_low();
BL	_accel_3_hal_cs_low+0
; buffer end address is: 8 (R2)
; count end address is: 16 (R4)
MOV	R1, R2
UXTB	R0, R4
;accel3_hal.c,356 :: 		while( count-- )
L_accel3_hal_write10:
; count start address is: 0 (R0)
; count start address is: 0 (R0)
; buffer start address is: 4 (R1)
UXTB	R4, R0
SUBS	R3, R0, #1
UXTB	R0, R3
; count end address is: 0 (R0)
CMP	R4, #0
IT	EQ
BEQ	L_accel3_hal_write11
; count end address is: 0 (R0)
;accel3_hal.c,358 :: 		write_spi_p( *( buffer++ ) );
; count start address is: 0 (R0)
LDRB	R3, [R1, #0]
UXTB	R4, R3
STRB	R0, [SP, #4]
STR	R1, [SP, #8]
UXTH	R0, R4
MOVW	R4, #lo_addr(accel3_hal_write_spi_p+0)
MOVT	R4, #hi_addr(accel3_hal_write_spi_p+0)
LDR	R4, [R4, #0]
BLX	R4
LDR	R1, [SP, #8]
LDRB	R0, [SP, #4]
ADDS	R1, R1, #1
;accel3_hal.c,359 :: 		}
; count end address is: 0 (R0)
; buffer end address is: 4 (R1)
IT	AL
BAL	L_accel3_hal_write10
L_accel3_hal_write11:
;accel3_hal.c,360 :: 		accel_3_hal_cs_high();
BL	_accel_3_hal_cs_high+0
;accel3_hal.c,361 :: 		}
L_accel3_hal_write9:
L_accel3_hal_write8:
;accel3_hal.c,363 :: 		}
L_end_accel3_hal_write:
LDR	LR, [SP, #0]
ADD	SP, SP, #268
BX	LR
; end of _accel3_hal_write
_accel3_hal_read:
;accel3_hal.c,366 :: 		uint8_t count )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #8]
STR	R1, [SP, #12]
STRB	R2, [SP, #16]
;accel3_hal.c,368 :: 		if( hal_mode == 0 )
MOVW	R4, #lo_addr(accel3_hal_hal_mode+0)
MOVT	R4, #hi_addr(accel3_hal_hal_mode+0)
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	NE
BNE	L_accel3_hal_read12
;accel3_hal.c,370 :: 		uint8_t cmd_size = COMMAND_SIZE;
MOVS	R4, #1
STRB	R4, [SP, #4]
;accel3_hal.c,375 :: 		start_i2c_p();
MOVW	R4, #lo_addr(accel3_hal_start_i2c_p+0)
MOVT	R4, #hi_addr(accel3_hal_start_i2c_p+0)
LDR	R4, [R4, #0]
BLX	R4
;accel3_hal.c,376 :: 		write_i2c_p( _i2c_hw_address, command, cmd_size, END_MODE_RESTART );
MOVW	R3, #lo_addr(accel3_hal__i2c_hw_address+0)
MOVT	R3, #hi_addr(accel3_hal__i2c_hw_address+0)
LDRB	R3, [R3, #0]
LDRB	R2, [SP, #4]
LDR	R1, [SP, #8]
UXTB	R0, R3
MOVW	R3, #0
MOVW	R4, #lo_addr(accel3_hal_write_i2c_p+0)
MOVT	R4, #hi_addr(accel3_hal_write_i2c_p+0)
LDR	R4, [R4, #0]
BLX	R4
;accel3_hal.c,377 :: 		read_i2c_p( _i2c_hw_address, buffer, count, END_MODE_STOP );
MOVW	R3, #lo_addr(accel3_hal__i2c_hw_address+0)
MOVT	R3, #hi_addr(accel3_hal__i2c_hw_address+0)
LDRB	R3, [R3, #0]
LDRB	R2, [SP, #16]
LDR	R1, [SP, #12]
UXTB	R0, R3
MOVW	R3, #1
MOVW	R4, #lo_addr(accel3_hal_read_i2c_p+0)
MOVT	R4, #hi_addr(accel3_hal_read_i2c_p+0)
LDR	R4, [R4, #0]
BLX	R4
;accel3_hal.c,479 :: 		}
IT	AL
BAL	L_accel3_hal_read13
L_accel3_hal_read12:
;accel3_hal.c,480 :: 		else if( hal_mode == 1 )
MOVW	R3, #lo_addr(accel3_hal_hal_mode+0)
MOVT	R3, #hi_addr(accel3_hal_hal_mode+0)
LDRB	R3, [R3, #0]
CMP	R3, #1
IT	NE
BNE	L_accel3_hal_read14
;accel3_hal.c,483 :: 		accel_3_hal_cs_low();
BL	_accel_3_hal_cs_low+0
;accel3_hal.c,484 :: 		while( count-- )
L_accel3_hal_read15:
LDRB	R4, [SP, #16]
LDRB	R3, [SP, #16]
SUBS	R3, R3, #1
STRB	R3, [SP, #16]
CMP	R4, #0
IT	EQ
BEQ	L_accel3_hal_read16
;accel3_hal.c,485 :: 		*( buffer++ ) = read_spi_p( DUMMY_BYTE );
MOVS	R0, #0
MOVW	R4, #lo_addr(accel3_hal_read_spi_p+0)
MOVT	R4, #hi_addr(accel3_hal_read_spi_p+0)
LDR	R4, [R4, #0]
BLX	R4
LDR	R3, [SP, #12]
STRB	R0, [R3, #0]
LDR	R3, [SP, #12]
ADDS	R3, R3, #1
STR	R3, [SP, #12]
IT	AL
BAL	L_accel3_hal_read15
L_accel3_hal_read16:
;accel3_hal.c,486 :: 		accel_3_hal_cs_high();
BL	_accel_3_hal_cs_high+0
;accel3_hal.c,487 :: 		}
L_accel3_hal_read14:
L_accel3_hal_read13:
;accel3_hal.c,489 :: 		}
L_end_accel3_hal_read:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _accel3_hal_read
_accel_3_hal_cs_high:
;accel3_hal.c,491 :: 		void accel_3_hal_cs_high()
;accel3_hal.c,493 :: 		ACCEL_3_CS = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCEL_3_CS+0)
MOVT	R0, #hi_addr(ACCEL_3_CS+0)
STR	R1, [R0, #0]
;accel3_hal.c,494 :: 		}
L_end_accel_3_hal_cs_high:
BX	LR
; end of _accel_3_hal_cs_high
_accel_3_hal_cs_low:
;accel3_hal.c,496 :: 		void accel_3_hal_cs_low()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;accel3_hal.c,498 :: 		ACCEL_3_CS = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCEL_3_CS+0)
MOVT	R0, #hi_addr(ACCEL_3_CS+0)
STR	R1, [R0, #0]
;accel3_hal.c,499 :: 		Delay_1us();
BL	_Delay_1us+0
;accel3_hal.c,500 :: 		}
L_end_accel_3_hal_cs_low:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _accel_3_hal_cs_low
_accel_3_hal_reset:
;accel3_hal.c,502 :: 		void accel_3_hal_reset( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;accel3_hal.c,504 :: 		ACCEL_3_RST = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCEL_3_RST+0)
MOVT	R0, #hi_addr(ACCEL_3_RST+0)
STR	R1, [R0, #0]
;accel3_hal.c,505 :: 		Delay_10ms();
BL	_Delay_10ms+0
;accel3_hal.c,506 :: 		ACCEL_3_RST = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCEL_3_RST+0)
MOVT	R0, #hi_addr(ACCEL_3_RST+0)
STR	R1, [R0, #0]
;accel3_hal.c,507 :: 		}
L_end_accel_3_hal_reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _accel_3_hal_reset
_accel_3_hal_delay:
;accel3_hal.c,509 :: 		void accel_3_hal_delay( uint32_t ms )
; ms start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ms end address is: 0 (R0)
; ms start address is: 0 (R0)
;accel3_hal.c,511 :: 		while( ms--  )
L_accel_3_hal_delay17:
; ms start address is: 0 (R0)
MOV	R2, R0
SUBS	R1, R0, #1
MOV	R0, R1
; ms end address is: 0 (R0)
CMP	R2, #0
IT	EQ
BEQ	L_accel_3_hal_delay18
; ms end address is: 0 (R0)
;accel3_hal.c,512 :: 		Delay_1ms( );
; ms start address is: 0 (R0)
BL	_Delay_1ms+0
; ms end address is: 0 (R0)
IT	AL
BAL	L_accel_3_hal_delay17
L_accel_3_hal_delay18:
;accel3_hal.c,513 :: 		}
L_end_accel_3_hal_delay:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _accel_3_hal_delay
