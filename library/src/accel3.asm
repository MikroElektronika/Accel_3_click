_accel3_init:
;accel3.c,48 :: 		data_rate_t d_rate, bus_mode_t mode )
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;accel3.c,50 :: 		if( !accel3_hw_init( address, mode ) )
SW	R25, 4(SP)
SB	R27, 8(SP)
SB	R26, 9(SP)
ANDI	R26, R28, 255
JAL	_accel3_hw_init+0
NOP	
LBU	R26, 9(SP)
LBU	R27, 8(SP)
BEQ	R2, R0, L__accel3_init10
NOP	
J	L_accel3_init0
NOP	
L__accel3_init10:
;accel3.c,52 :: 		accel3_set_data_rate( d_rate );
SB	R26, 8(SP)
ANDI	R25, R27, 255
JAL	_accel3_set_data_rate+0
NOP	
LBU	R26, 8(SP)
;accel3.c,53 :: 		accel3_set_mode( accel_mode );
ANDI	R25, R26, 255
JAL	_accel3_set_mode+0
NOP	
;accel3.c,54 :: 		accel3_set_full_scale( SCALE_100_G );
MOVZ	R25, R0, R0
JAL	_accel3_set_full_scale+0
NOP	
;accel3.c,55 :: 		accel3_x_enable( true );
ORI	R25, R0, 1
JAL	_accel3_x_enable+0
NOP	
;accel3.c,56 :: 		accel3_y_enable( true );
ORI	R25, R0, 1
JAL	_accel3_y_enable+0
NOP	
;accel3.c,57 :: 		accel3_z_enable( true );
ORI	R25, R0, 1
JAL	_accel3_z_enable+0
NOP	
;accel3.c,59 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_accel3_init
NOP	
;accel3.c,60 :: 		}
L_accel3_init0:
;accel3.c,62 :: 		return -1;
ORI	R2, R0, 255
;accel3.c,63 :: 		}
;accel3.c,62 :: 		return -1;
;accel3.c,63 :: 		}
L_end_accel3_init:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _accel3_init
_accel3_get_xyz:
;accel3.c,65 :: 		xyz_t* accel3_get_xyz( void )
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;accel3.c,70 :: 		acc_values.y_pos = accel3_read_acc_y();
JAL	_accel3_read_acc_y+0
NOP	
SH	R2, 6(SP)
;accel3.c,71 :: 		acc_values.z_pos = accel3_read_acc_z();
JAL	_accel3_read_acc_z+0
NOP	
SH	R2, 8(SP)
;accel3.c,72 :: 		acc_values.x_pos = accel3_read_acc_x();
JAL	_accel3_read_acc_x+0
NOP	
SH	R2, 4(SP)
;accel3.c,74 :: 		sensitivity = accel3_get_xyz_sensitivity();
JAL	_accel3_get_xyz_sensitivity+0
NOP	
;accel3.c,75 :: 		acc_values.x_pos /= sensitivity->x;
LH	R4, 0(R2)
LH	R3, 4(SP)
DIV	R3, R4
MFLO	R3
SH	R3, 4(SP)
;accel3.c,76 :: 		acc_values.y_pos /= sensitivity->y;
ADDIU	R3, R2, 2
LH	R4, 0(R3)
LH	R3, 6(SP)
DIV	R3, R4
MFLO	R3
SH	R3, 6(SP)
;accel3.c,77 :: 		acc_values.z_pos /= sensitivity->z;
ADDIU	R2, R2, 4
LH	R3, 0(R2)
LH	R2, 8(SP)
DIV	R2, R3
MFLO	R2
SH	R2, 8(SP)
;accel3.c,79 :: 		return &acc_values;
ADDIU	R2, SP, 4
;accel3.c,80 :: 		}
L_end_accel3_get_xyz:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _accel3_get_xyz
_accel3_get_xyz_raw:
;accel3.c,82 :: 		xyz_t* accel3_get_xyz_raw( void )
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;accel3.c,87 :: 		acc_values.y_pos = accel3_read_acc_y();
JAL	_accel3_read_acc_y+0
NOP	
SH	R2, 6(SP)
;accel3.c,88 :: 		acc_values.z_pos = accel3_read_acc_z();
JAL	_accel3_read_acc_z+0
NOP	
SH	R2, 8(SP)
;accel3.c,89 :: 		acc_values.x_pos = accel3_read_acc_x();
JAL	_accel3_read_acc_x+0
NOP	
SH	R2, 4(SP)
;accel3.c,91 :: 		return &acc_values;
ADDIU	R2, SP, 4
;accel3.c,92 :: 		}
L_end_accel3_get_xyz_raw:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _accel3_get_xyz_raw
_accel3_set_interrupt1:
;accel3.c,94 :: 		uint8_t accel3_set_interrupt1( uint8_t threshhold, uint8_t duration )
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;accel3.c,96 :: 		accel3_int1_signal_config( INT1_OR_INT2 );
SW	R25, 4(SP)
SB	R26, 8(SP)
SB	R25, 9(SP)
ORI	R25, R0, 1
JAL	_accel3_int1_signal_config+0
NOP	
;accel3.c,97 :: 		accel3_interrupt_active_level( LOW );
MOVZ	R25, R0, R0
JAL	_accel3_interrupt_active_level+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;accel3.c,98 :: 		accel3_int1_set_duration( duration );
SB	R25, 8(SP)
ANDI	R25, R26, 255
JAL	_accel3_int1_set_duration+0
NOP	
LBU	R25, 8(SP)
;accel3.c,99 :: 		accel3_int1_set_threshold( threshhold );
JAL	_accel3_int1_set_threshold+0
NOP	
;accel3.c,100 :: 		accel3_interrupt_pad_selection( OPEN_DRAIN );
ORI	R25, R0, 1
JAL	_accel3_interrupt_pad_selection+0
NOP	
;accel3.c,101 :: 		accel3_interrupt1_set_combination( OR );
MOVZ	R25, R0, R0
JAL	_accel3_interrupt1_set_combination+0
NOP	
;accel3.c,102 :: 		accel3_interrupt1_x_high_enable( true );
ORI	R25, R0, 1
JAL	_accel3_interrupt1_x_high_enable+0
NOP	
;accel3.c,103 :: 		accel3_interrupt1_x_low_enable( true );
ORI	R25, R0, 1
JAL	_accel3_interrupt1_x_low_enable+0
NOP	
;accel3.c,106 :: 		accel3_latched_interrupt1_enable( true );
ORI	R25, R0, 1
JAL	_accel3_latched_interrupt1_enable+0
NOP	
;accel3.c,109 :: 		}
L_end_accel3_set_interrupt1:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _accel3_set_interrupt1
_accel3_set_interrupt2:
;accel3.c,111 :: 		uint8_t accel3_set_interrupt2( uint8_t threshhold, uint8_t duration )
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;accel3.c,113 :: 		if( accel3_int2_set_threshold( threshhold ) &&
SW	R25, 4(SP)
SB	R26, 8(SP)
JAL	_accel3_int2_set_threshold+0
NOP	
LBU	R26, 8(SP)
;accel3.c,114 :: 		accel3_int2_set_duration( duration ) )
BNE	R2, R0, L__accel3_set_interrupt216
NOP	
J	L__accel3_set_interrupt28
NOP	
L__accel3_set_interrupt216:
ANDI	R25, R26, 255
JAL	_accel3_int2_set_duration+0
NOP	
BNE	R2, R0, L__accel3_set_interrupt218
NOP	
J	L__accel3_set_interrupt27
NOP	
L__accel3_set_interrupt218:
L__accel3_set_interrupt26:
;accel3.c,115 :: 		return -1;
ORI	R2, R0, 255
J	L_end_accel3_set_interrupt2
NOP	
;accel3.c,114 :: 		accel3_int2_set_duration( duration ) )
L__accel3_set_interrupt28:
L__accel3_set_interrupt27:
;accel3.c,117 :: 		return 0;
MOVZ	R2, R0, R0
;accel3.c,119 :: 		}
;accel3.c,117 :: 		return 0;
;accel3.c,119 :: 		}
L_end_accel3_set_interrupt2:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _accel3_set_interrupt2
_accel3_calibrate_x:
;accel3.c,121 :: 		void accel3_calibrate_x( int16_t pos, int16_t neg )
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;accel3.c,124 :: 		x_sens = ( pos - neg ) / 2;
SW	R25, 4(SP)
SUBU	R2, R25, R26
SEH	R2, R2
SRA	R2, R2, 1
;accel3.c,125 :: 		set_x( x_sens );
SEH	R25, R2
JAL	_set_x+0
NOP	
;accel3.c,126 :: 		}
L_end_accel3_calibrate_x:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _accel3_calibrate_x
_accel3_calibrate_y:
;accel3.c,128 :: 		void accel3_calibrate_y( int16_t pos, int16_t neg )
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;accel3.c,131 :: 		y_sens = ( pos - neg ) / 2;
SW	R25, 4(SP)
SUBU	R2, R25, R26
SEH	R2, R2
SRA	R2, R2, 1
;accel3.c,132 :: 		set_y( y_sens );
SEH	R25, R2
JAL	_set_y+0
NOP	
;accel3.c,133 :: 		}
L_end_accel3_calibrate_y:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _accel3_calibrate_y
_accel3_calibrate_z:
;accel3.c,135 :: 		void accel3_calibrate_z( int16_t pos, int16_t neg )
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;accel3.c,138 :: 		z_sens = ( pos - neg ) / 2;
SW	R25, 4(SP)
SUBU	R2, R25, R26
SEH	R2, R2
SRA	R2, R2, 1
;accel3.c,139 :: 		set_z( z_sens );
SEH	R25, R2
JAL	_set_z+0
NOP	
;accel3.c,140 :: 		}
L_end_accel3_calibrate_z:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _accel3_calibrate_z
