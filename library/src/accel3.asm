_accel3_init:
;accel3.c,47 :: 		uint8_t accel3_init( uint8_t address, accel_mode_t accel_mode, data_rate_t d_rate, bus_mode_t mode )
; mode start address is: 12 (R3)
; address start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R1, [SP, #4]
STRB	R2, [SP, #8]
; mode end address is: 12 (R3)
; address end address is: 0 (R0)
; address start address is: 0 (R0)
; mode start address is: 12 (R3)
;accel3.c,49 :: 		if( !accel3_hw_init( address, mode ) )
UXTB	R1, R3
; mode end address is: 12 (R3)
; address end address is: 0 (R0)
BL	_accel3_hw_init+0
CMP	R0, #0
IT	NE
BNE	L_accel3_init0
;accel3.c,51 :: 		accel3_set_data_rate( d_rate );
LDRB	R0, [SP, #8]
BL	_accel3_set_data_rate+0
;accel3.c,52 :: 		accel3_set_mode( accel_mode );
LDRB	R0, [SP, #4]
BL	_accel3_set_mode+0
;accel3.c,53 :: 		accel3_set_full_scale( SCALE_100_G );
MOVS	R0, #0
BL	_accel3_set_full_scale+0
;accel3.c,54 :: 		accel3_x_enable( true );
MOVS	R0, #1
BL	_accel3_x_enable+0
;accel3.c,55 :: 		accel3_y_enable( true );
MOVS	R0, #1
BL	_accel3_y_enable+0
;accel3.c,56 :: 		accel3_z_enable( true );
MOVS	R0, #1
BL	_accel3_z_enable+0
;accel3.c,58 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_accel3_init
;accel3.c,59 :: 		}
L_accel3_init0:
;accel3.c,61 :: 		return -1;
MOVS	R0, #-1
;accel3.c,62 :: 		}
L_end_accel3_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_init
_accel3_get_xyz:
;accel3.c,64 :: 		xyz_t* accel3_get_xyz( void )
SUB	SP, SP, #12
STR	LR, [SP, #0]
;accel3.c,69 :: 		acc_values.y_pos = accel3_read_acc_y();
BL	_accel3_read_acc_y+0
STRH	R0, [SP, #6]
;accel3.c,70 :: 		acc_values.z_pos = accel3_read_acc_z();
BL	_accel3_read_acc_z+0
STRH	R0, [SP, #8]
;accel3.c,71 :: 		acc_values.x_pos = accel3_read_acc_x();
BL	_accel3_read_acc_x+0
STRH	R0, [SP, #4]
;accel3.c,73 :: 		sensitivity = accel3_get_xyz_sensitivity();
BL	_accel3_get_xyz_sensitivity+0
;accel3.c,74 :: 		acc_values.x_pos /= sensitivity->x;
LDRSH	R2, [R0, #0]
LDRSH	R1, [SP, #4]
SDIV	R1, R1, R2
STRH	R1, [SP, #4]
;accel3.c,75 :: 		acc_values.y_pos /= sensitivity->y;
ADDS	R1, R0, #2
LDRSH	R2, [R1, #0]
LDRSH	R1, [SP, #6]
SDIV	R1, R1, R2
STRH	R1, [SP, #6]
;accel3.c,76 :: 		acc_values.z_pos /= sensitivity->z;
ADDS	R0, R0, #4
LDRSH	R1, [R0, #0]
LDRSH	R0, [SP, #8]
SDIV	R0, R0, R1
STRH	R0, [SP, #8]
;accel3.c,78 :: 		return &acc_values;
ADD	R0, SP, #4
;accel3.c,79 :: 		}
L_end_accel3_get_xyz:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_get_xyz
_accel3_get_xyz_raw:
;accel3.c,81 :: 		xyz_t* accel3_get_xyz_raw( void )
SUB	SP, SP, #12
STR	LR, [SP, #0]
;accel3.c,86 :: 		acc_values.y_pos = accel3_read_acc_y();
BL	_accel3_read_acc_y+0
STRH	R0, [SP, #6]
;accel3.c,87 :: 		acc_values.z_pos = accel3_read_acc_z();
BL	_accel3_read_acc_z+0
STRH	R0, [SP, #8]
;accel3.c,88 :: 		acc_values.x_pos = accel3_read_acc_x();
BL	_accel3_read_acc_x+0
STRH	R0, [SP, #4]
;accel3.c,90 :: 		return &acc_values;
ADD	R0, SP, #4
;accel3.c,91 :: 		}
L_end_accel3_get_xyz_raw:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_get_xyz_raw
_accel3_set_interrupt1:
;accel3.c,93 :: 		uint8_t accel3_set_interrupt1( uint8_t threshhold, uint8_t duration )
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
STRB	R1, [SP, #8]
;accel3.c,95 :: 		accel3_int1_signal_config( INT_SOURCE );
MOVS	R0, #0
BL	_accel3_int1_signal_config+0
;accel3.c,96 :: 		accel3_interrupt_active_level( LOW );
MOVS	R0, #1
BL	_accel3_interrupt_active_level+0
;accel3.c,97 :: 		accel3_int1_set_duration( duration );
LDRB	R0, [SP, #8]
BL	_accel3_int1_set_duration+0
;accel3.c,98 :: 		accel3_int1_set_threshold( threshhold );
LDRB	R0, [SP, #4]
BL	_accel3_int1_set_threshold+0
;accel3.c,99 :: 		accel3_interrupt_pad_selection( PUSH_PULL );
MOVS	R0, #0
BL	_accel3_interrupt_pad_selection+0
;accel3.c,100 :: 		accel3_interrupt1_set_combination( OR );
MOVS	R0, #0
BL	_accel3_interrupt1_set_combination+0
;accel3.c,101 :: 		accel3_interrupt1_x_high_enable( false );
MOVS	R0, #0
BL	_accel3_interrupt1_x_high_enable+0
;accel3.c,102 :: 		accel3_interrupt1_x_low_enable( false );
MOVS	R0, #0
BL	_accel3_interrupt1_x_low_enable+0
;accel3.c,103 :: 		accel3_interrupt1_y_high_enable( false );
MOVS	R0, #0
BL	_accel3_interrupt1_y_high_enable+0
;accel3.c,104 :: 		accel3_interrupt1_y_low_enable( false );
MOVS	R0, #0
BL	_accel3_interrupt1_y_low_enable+0
;accel3.c,105 :: 		accel3_interrupt1_z_low_enable( true );
MOVS	R0, #1
BL	_accel3_interrupt1_z_low_enable+0
;accel3.c,106 :: 		accel3_interrupt1_z_high_enable( false );
MOVS	R0, #0
BL	_accel3_interrupt1_z_high_enable+0
;accel3.c,107 :: 		accel3_latched_interrupt1_enable( true );
MOVS	R0, #1
BL	_accel3_latched_interrupt1_enable+0
;accel3.c,110 :: 		}
L_end_accel3_set_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_set_interrupt1
_accel3_set_interrupt2:
;accel3.c,112 :: 		uint8_t accel3_set_interrupt2( uint8_t threshhold, uint8_t duration )
; threshhold start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R1, [SP, #4]
; threshhold end address is: 0 (R0)
; threshhold start address is: 0 (R0)
;accel3.c,114 :: 		if( accel3_int2_set_threshold( threshhold ) &&
; threshhold end address is: 0 (R0)
BL	_accel3_int2_set_threshold+0
;accel3.c,115 :: 		accel3_int2_set_duration( duration ) )
CMP	R0, #0
IT	EQ
BEQ	L__accel3_set_interrupt28
LDRB	R0, [SP, #4]
BL	_accel3_int2_set_duration+0
CMP	R0, #0
IT	EQ
BEQ	L__accel3_set_interrupt27
L__accel3_set_interrupt26:
;accel3.c,116 :: 		return -1;
MOVS	R0, #-1
IT	AL
BAL	L_end_accel3_set_interrupt2
;accel3.c,115 :: 		accel3_int2_set_duration( duration ) )
L__accel3_set_interrupt28:
L__accel3_set_interrupt27:
;accel3.c,118 :: 		return 0;
MOVS	R0, #0
;accel3.c,120 :: 		}
L_end_accel3_set_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_set_interrupt2
_accel3_calibrate_x:
;accel3.c,122 :: 		void accel3_calibrate_x( int16_t pos, int16_t neg )
; neg start address is: 4 (R1)
; pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; neg end address is: 4 (R1)
; pos end address is: 0 (R0)
; pos start address is: 0 (R0)
; neg start address is: 4 (R1)
;accel3.c,125 :: 		x_sens = ( pos - neg ) / 2;
SUB	R2, R0, R1
SXTH	R2, R2
; pos end address is: 0 (R0)
; neg end address is: 4 (R1)
ASRS	R2, R2, #1
;accel3.c,126 :: 		set_x( x_sens );
SXTH	R0, R2
BL	_set_x+0
;accel3.c,127 :: 		}
L_end_accel3_calibrate_x:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _accel3_calibrate_x
_accel3_calibrate_y:
;accel3.c,129 :: 		void accel3_calibrate_y( int16_t pos, int16_t neg )
; neg start address is: 4 (R1)
; pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; neg end address is: 4 (R1)
; pos end address is: 0 (R0)
; pos start address is: 0 (R0)
; neg start address is: 4 (R1)
;accel3.c,132 :: 		y_sens = ( pos - neg ) / 2;
SUB	R2, R0, R1
SXTH	R2, R2
; pos end address is: 0 (R0)
; neg end address is: 4 (R1)
ASRS	R2, R2, #1
;accel3.c,133 :: 		set_y( y_sens );
SXTH	R0, R2
BL	_set_y+0
;accel3.c,134 :: 		}
L_end_accel3_calibrate_y:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _accel3_calibrate_y
_accel3_calibrate_z:
;accel3.c,136 :: 		void accel3_calibrate_z( int16_t pos, int16_t neg )
; neg start address is: 4 (R1)
; pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; neg end address is: 4 (R1)
; pos end address is: 0 (R0)
; pos start address is: 0 (R0)
; neg start address is: 4 (R1)
;accel3.c,139 :: 		z_sens = ( pos - neg ) / 2;
SUB	R2, R0, R1
SXTH	R2, R2
; pos end address is: 0 (R0)
; neg end address is: 4 (R1)
ASRS	R2, R2, #1
;accel3.c,140 :: 		set_z( z_sens );
SXTH	R0, R2
BL	_set_z+0
;accel3.c,141 :: 		}
L_end_accel3_calibrate_z:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _accel3_calibrate_z
