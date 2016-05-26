_accel3_hal_init:
;accel3_hal.c,170 :: 		void accel3_hal_init(uint8_t address_id, uint8_t mode )
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;accel3_hal.c,172 :: 		if( mode == 0 )
ANDI	R2, R26, 255
BEQ	R2, R0, L__accel3_hal_init27
NOP	
J	L_accel3_hal_init0
NOP	
L__accel3_hal_init27:
;accel3_hal.c,217 :: 		is_idle_i2c_p = I2C_Is_Idle_Ptr;
LW	R2, Offset(_I2C_Is_Idle_Ptr+0)(GP)
SW	R2, Offset(accel3_hal_is_idle_i2c_p+0)(GP)
;accel3_hal.c,218 :: 		start_i2c_p = I2C_Start_Ptr;
LW	R2, Offset(_I2C_Start_Ptr+0)(GP)
SW	R2, Offset(accel3_hal_start_i2c_p+0)(GP)
;accel3_hal.c,219 :: 		stop_i2c_p = I2C_Stop_Ptr;
LW	R2, Offset(_I2C_Stop_Ptr+0)(GP)
SW	R2, Offset(accel3_hal_stop_i2c_p+0)(GP)
;accel3_hal.c,220 :: 		restart_i2c_p = I2C_Restart_Ptr;
LW	R2, Offset(_I2C_Restart_Ptr+0)(GP)
SW	R2, Offset(accel3_hal_restart_i2c_p+0)(GP)
;accel3_hal.c,221 :: 		write_i2c_p = I2C_Write_Ptr;
LW	R2, Offset(_I2C_Write_Ptr+0)(GP)
SW	R2, Offset(accel3_hal_write_i2c_p+0)(GP)
;accel3_hal.c,222 :: 		read_i2c_p = I2C_Read_Ptr;
LW	R2, Offset(_I2C_Read_Ptr+0)(GP)
SW	R2, Offset(accel3_hal_read_i2c_p+0)(GP)
;accel3_hal.c,257 :: 		_i2c_hw_address = ( address_id << 1 );
ANDI	R2, R25, 255
SLL	R2, R2, 1
SB	R2, Offset(accel3_hal__i2c_hw_address+0)(GP)
;accel3_hal.c,258 :: 		accel_3_hal_cs_high();
JAL	_accel_3_hal_cs_high+0
NOP	
;accel3_hal.c,260 :: 		}
J	L_accel3_hal_init1
NOP	
L_accel3_hal_init0:
;accel3_hal.c,261 :: 		else if( mode == 1 )
ANDI	R3, R26, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_hal_init28
NOP	
J	L_accel3_hal_init2
NOP	
L__accel3_hal_init28:
;accel3_hal.c,270 :: 		write_spi_p             = SPI_Wr_Ptr;
LW	R2, Offset(_SPI_Wr_Ptr+0)(GP)
SW	R2, Offset(accel3_hal_write_spi_p+0)(GP)
;accel3_hal.c,271 :: 		read_spi_p              = SPI_Rd_Ptr;
LW	R2, Offset(_SPI_Rd_Ptr+0)(GP)
SW	R2, Offset(accel3_hal_read_spi_p+0)(GP)
;accel3_hal.c,283 :: 		accel_3_hal_cs_high();
JAL	_accel_3_hal_cs_high+0
NOP	
;accel3_hal.c,284 :: 		}
L_accel3_hal_init2:
L_accel3_hal_init1:
;accel3_hal.c,286 :: 		hal_mode = mode;
SB	R26, Offset(accel3_hal_hal_mode+0)(GP)
;accel3_hal.c,288 :: 		}
L_end_accel3_hal_init:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _accel3_hal_init
_accel3_hal_write:
;accel3_hal.c,291 :: 		uint8_t count )
ADDIU	SP, SP, -272
SW	RA, 0(SP)
;accel3_hal.c,293 :: 		if( hal_mode == 0 )
LBU	R2, Offset(accel3_hal_hal_mode+0)(GP)
BEQ	R2, R0, L__accel3_hal_write30
NOP	
J	L_accel3_hal_write3
NOP	
L__accel3_hal_write30:
;accel3_hal.c,296 :: 		uint8_t cmd_size = COMMAND_SIZE;
; cmd_size start address is: 20 (R5)
ORI	R5, R0, 1
;accel3_hal.c,297 :: 		uint8_t ptr = count;
; ptr start address is: 16 (R4)
ANDI	R4, R27, 255
;accel3_hal.c,298 :: 		uint16_t i = 0;
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
; ptr end address is: 16 (R4)
;accel3_hal.c,300 :: 		while( cmd_size-- )
L_accel3_hal_write4:
; i start address is: 24 (R6)
; ptr start address is: 16 (R4)
; cmd_size start address is: 20 (R5)
ANDI	R3, R5, 255
ADDIU	R2, R5, -1
ANDI	R5, R2, 255
; cmd_size end address is: 20 (R5)
BNE	R3, R0, L__accel3_hal_write32
NOP	
J	L_accel3_hal_write5
NOP	
L__accel3_hal_write32:
; cmd_size end address is: 20 (R5)
;accel3_hal.c,301 :: 		temp[ i++ ] = *( command++ );
; cmd_size start address is: 20 (R5)
ADDIU	R3, SP, 16
ANDI	R2, R6, 65535
ADDU	R3, R3, R2
LBU	R2, 0(R25)
SB	R2, 0(R3)
ADDIU	R2, R6, 1
ANDI	R6, R2, 65535
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
; cmd_size end address is: 20 (R5)
J	L_accel3_hal_write4
NOP	
L_accel3_hal_write5:
;accel3_hal.c,303 :: 		while ( ptr-- )
ANDI	R5, R6, 65535
L_accel3_hal_write6:
; i end address is: 24 (R6)
; ptr start address is: 16 (R4)
; i start address is: 20 (R5)
ANDI	R3, R4, 255
ADDIU	R2, R4, -1
ANDI	R4, R2, 255
; ptr end address is: 16 (R4)
BNE	R3, R0, L__accel3_hal_write34
NOP	
J	L_accel3_hal_write7
NOP	
L__accel3_hal_write34:
; ptr end address is: 16 (R4)
;accel3_hal.c,304 :: 		temp[ i++ ] = *( buffer++ );
; ptr start address is: 16 (R4)
ADDIU	R3, SP, 16
ANDI	R2, R5, 65535
ADDU	R3, R3, R2
LBU	R2, 0(R26)
SB	R2, 0(R3)
ADDIU	R2, R5, 1
ANDI	R5, R2, 65535
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
; ptr end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_accel3_hal_write6
NOP	
L_accel3_hal_write7:
;accel3_hal.c,341 :: 		start_i2c_p();
LW	R30, Offset(accel3_hal_start_i2c_p+0)(GP)
SB	R27, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
JALR	RA, R30
NOP	
;accel3_hal.c,342 :: 		write_i2c_p( _i2c_hw_address + WRITE );
LBU	R25, Offset(accel3_hal__i2c_hw_address+0)(GP)
LW	R30, Offset(accel3_hal_write_i2c_p+0)(GP)
JALR	RA, R30
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
LBU	R27, 4(SP)
;accel3_hal.c,344 :: 		for( i = 0; i <= count; i++ )
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_accel3_hal_write8:
; i start address is: 16 (R4)
ANDI	R3, R4, 65535
ANDI	R2, R27, 255
SLTU	R2, R2, R3
BEQ	R2, R0, L__accel3_hal_write35
NOP	
J	L_accel3_hal_write9
NOP	
L__accel3_hal_write35:
;accel3_hal.c,345 :: 		write_i2c_p(temp[i]);
ADDIU	R3, SP, 16
ANDI	R2, R4, 65535
ADDU	R2, R3, R2
SH	R4, 4(SP)
SB	R27, 6(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, 0(R2)
LW	R30, Offset(accel3_hal_write_i2c_p+0)(GP)
JALR	RA, R30
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
LBU	R27, 6(SP)
LHU	R4, 4(SP)
;accel3_hal.c,344 :: 		for( i = 0; i <= count; i++ )
ADDIU	R2, R4, 1
ANDI	R4, R2, 65535
;accel3_hal.c,345 :: 		write_i2c_p(temp[i]);
; i end address is: 16 (R4)
J	L_accel3_hal_write8
NOP	
L_accel3_hal_write9:
;accel3_hal.c,347 :: 		stop_i2c_p();
LW	R30, Offset(accel3_hal_stop_i2c_p+0)(GP)
SB	R27, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
JALR	RA, R30
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
LBU	R27, 4(SP)
;accel3_hal.c,351 :: 		}
J	L_accel3_hal_write11
NOP	
L_accel3_hal_write3:
;accel3_hal.c,352 :: 		else if( hal_mode == 1 )
LBU	R3, Offset(accel3_hal_hal_mode+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_hal_write36
NOP	
J	L_accel3_hal_write12
NOP	
L__accel3_hal_write36:
;accel3_hal.c,355 :: 		accel_3_hal_cs_low();
JAL	_accel_3_hal_cs_low+0
NOP	
;accel3_hal.c,356 :: 		while( count-- )
L_accel3_hal_write13:
ANDI	R3, R27, 255
ADDIU	R2, R27, -1
ANDI	R27, R2, 255
BNE	R3, R0, L__accel3_hal_write38
NOP	
J	L_accel3_hal_write14
NOP	
L__accel3_hal_write38:
;accel3_hal.c,358 :: 		write_spi_p( *( buffer++ ) );
SB	R27, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
LBU	R25, 0(R26)
LW	R30, Offset(accel3_hal_write_spi_p+0)(GP)
JALR	RA, R30
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
LBU	R27, 4(SP)
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
;accel3_hal.c,359 :: 		}
J	L_accel3_hal_write13
NOP	
L_accel3_hal_write14:
;accel3_hal.c,360 :: 		accel_3_hal_cs_high();
JAL	_accel_3_hal_cs_high+0
NOP	
;accel3_hal.c,361 :: 		}
L_accel3_hal_write12:
L_accel3_hal_write11:
;accel3_hal.c,363 :: 		}
L_end_accel3_hal_write:
LW	RA, 0(SP)
ADDIU	SP, SP, 272
JR	RA
NOP	
; end of _accel3_hal_write
_accel3_hal_read:
;accel3_hal.c,366 :: 		uint8_t count )
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hal.c,368 :: 		if( hal_mode == 0 )
SW	R25, 4(SP)
LBU	R2, Offset(accel3_hal_hal_mode+0)(GP)
BEQ	R2, R0, L__accel3_hal_read40
NOP	
J	L_accel3_hal_read15
NOP	
L__accel3_hal_read40:
;accel3_hal.c,370 :: 		uint8_t cmd_size = COMMAND_SIZE;
;accel3_hal.c,433 :: 		start_i2c_p();
LW	R30, Offset(accel3_hal_start_i2c_p+0)(GP)
SB	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
JALR	RA, R30
NOP	
;accel3_hal.c,434 :: 		write_i2c_p( _i2c_hw_address | WRITE );
LBU	R25, Offset(accel3_hal__i2c_hw_address+0)(GP)
LW	R30, Offset(accel3_hal_write_i2c_p+0)(GP)
JALR	RA, R30
NOP	
LW	R25, 16(SP)
;accel3_hal.c,435 :: 		write_i2c_p( *command );
LBU	R25, 0(R25)
LW	R30, Offset(accel3_hal_write_i2c_p+0)(GP)
JALR	RA, R30
NOP	
;accel3_hal.c,436 :: 		start_i2c_p();
LW	R30, Offset(accel3_hal_start_i2c_p+0)(GP)
JALR	RA, R30
NOP	
;accel3_hal.c,437 :: 		write_i2c_p( _i2c_hw_address | READ );
LBU	R2, Offset(accel3_hal__i2c_hw_address+0)(GP)
ORI	R2, R2, 1
ANDI	R25, R2, 255
LW	R30, Offset(accel3_hal_write_i2c_p+0)(GP)
JALR	RA, R30
NOP	
LW	R26, 12(SP)
LBU	R27, 8(SP)
;accel3_hal.c,438 :: 		if( count == 1 )
ANDI	R3, R27, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_hal_read41
NOP	
J	L_accel3_hal_read16
NOP	
L__accel3_hal_read41:
;accel3_hal.c,440 :: 		*buffer = read_i2c_p( 0u );
SW	R26, 8(SP)
MOVZ	R25, R0, R0
LW	R30, Offset(accel3_hal_read_i2c_p+0)(GP)
JALR	RA, R30
NOP	
LW	R26, 8(SP)
SB	R2, 0(R26)
;accel3_hal.c,442 :: 		} else {
J	L_accel3_hal_read17
NOP	
L_accel3_hal_read16:
;accel3_hal.c,444 :: 		while( count-- > 1 )
L_accel3_hal_read18:
ANDI	R3, R27, 255
ADDIU	R2, R27, -1
ANDI	R27, R2, 255
ANDI	R2, R3, 255
SLTIU	R2, R2, 2
BEQ	R2, R0, L__accel3_hal_read42
NOP	
J	L_accel3_hal_read19
NOP	
L__accel3_hal_read42:
;accel3_hal.c,445 :: 		*( buffer++ ) = read_i2c_p( 1 );
SB	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R25, R0, 1
LW	R30, Offset(accel3_hal_read_i2c_p+0)(GP)
JALR	RA, R30
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LBU	R27, 8(SP)
SB	R2, 0(R26)
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
J	L_accel3_hal_read18
NOP	
L_accel3_hal_read19:
;accel3_hal.c,447 :: 		*buffer = read_i2c_p( 0u );
SB	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R0, R0
LW	R30, Offset(accel3_hal_read_i2c_p+0)(GP)
JALR	RA, R30
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LBU	R27, 8(SP)
SB	R2, 0(R26)
;accel3_hal.c,449 :: 		}
L_accel3_hal_read17:
;accel3_hal.c,450 :: 		stop_i2c_p();
LW	R30, Offset(accel3_hal_stop_i2c_p+0)(GP)
JALR	RA, R30
NOP	
;accel3_hal.c,479 :: 		}
J	L_accel3_hal_read20
NOP	
L_accel3_hal_read15:
;accel3_hal.c,480 :: 		else if( hal_mode == 1 )
LBU	R3, Offset(accel3_hal_hal_mode+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_hal_read43
NOP	
J	L_accel3_hal_read21
NOP	
L__accel3_hal_read43:
;accel3_hal.c,483 :: 		accel_3_hal_cs_low();
JAL	_accel_3_hal_cs_low+0
NOP	
;accel3_hal.c,484 :: 		while( count-- )
L_accel3_hal_read22:
ANDI	R3, R27, 255
ADDIU	R2, R27, -1
ANDI	R27, R2, 255
BNE	R3, R0, L__accel3_hal_read45
NOP	
J	L_accel3_hal_read23
NOP	
L__accel3_hal_read45:
;accel3_hal.c,485 :: 		*( buffer++ ) = read_spi_p( DUMMY_BYTE );
SB	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R0, R0
LW	R30, Offset(accel3_hal_read_spi_p+0)(GP)
JALR	RA, R30
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LBU	R27, 8(SP)
SB	R2, 0(R26)
ADDIU	R2, R26, 1
MOVZ	R26, R2, R0
J	L_accel3_hal_read22
NOP	
L_accel3_hal_read23:
;accel3_hal.c,486 :: 		accel_3_hal_cs_high();
JAL	_accel_3_hal_cs_high+0
NOP	
;accel3_hal.c,487 :: 		}
L_accel3_hal_read21:
L_accel3_hal_read20:
;accel3_hal.c,489 :: 		}
L_end_accel3_hal_read:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_hal_read
_accel_3_hal_cs_high:
;accel3_hal.c,491 :: 		void accel_3_hal_cs_high()
ADDIU	SP, SP, -4
;accel3_hal.c,493 :: 		ACCEL_3_CS = 1;
_LX	
ORI	R2, R2, BitMask(ACCEL_3_CS+0)
_SX	
;accel3_hal.c,494 :: 		}
L_end_accel_3_hal_cs_high:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _accel_3_hal_cs_high
_accel_3_hal_cs_low:
;accel3_hal.c,496 :: 		void accel_3_hal_cs_low()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;accel3_hal.c,498 :: 		ACCEL_3_CS = 0;
_LX	
INS	R2, R0, BitPos(ACCEL_3_CS+0), 1
_SX	
;accel3_hal.c,499 :: 		Delay_1us();
JAL	_Delay_1us+0
NOP	
;accel3_hal.c,500 :: 		}
L_end_accel_3_hal_cs_low:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _accel_3_hal_cs_low
_accel_3_hal_reset:
;accel3_hal.c,502 :: 		void accel_3_hal_reset( void )
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;accel3_hal.c,504 :: 		ACCEL_3_RST = 0;
_LX	
INS	R2, R0, BitPos(ACCEL_3_RST+0), 1
_SX	
;accel3_hal.c,505 :: 		Delay_10ms();
JAL	_Delay_10ms+0
NOP	
;accel3_hal.c,506 :: 		ACCEL_3_RST = 1;
_LX	
ORI	R2, R2, BitMask(ACCEL_3_RST+0)
_SX	
;accel3_hal.c,507 :: 		}
L_end_accel_3_hal_reset:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _accel_3_hal_reset
_accel_3_hal_delay:
;accel3_hal.c,509 :: 		void accel_3_hal_delay( uint32_t ms )
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;accel3_hal.c,511 :: 		while( ms--  )
L_accel_3_hal_delay24:
MOVZ	R3, R25, R0
ADDIU	R2, R25, -1
MOVZ	R25, R2, R0
BNE	R3, R0, L__accel_3_hal_delay51
NOP	
J	L_accel_3_hal_delay25
NOP	
L__accel_3_hal_delay51:
;accel3_hal.c,512 :: 		Delay_1ms( );
JAL	_Delay_1ms+0
NOP	
J	L_accel_3_hal_delay24
NOP	
L_accel_3_hal_delay25:
;accel3_hal.c,513 :: 		}
L_end_accel_3_hal_delay:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _accel_3_hal_delay
