_accel3_init:
;accel3_M4.c,48 :: 		data_rate_t d_rate, bus_mode_t mode )
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
;accel3_M4.c,50 :: 		if( !accel3_hw_init( address, mode ) )
UXTB	R1, R3
; mode end address is: 12 (R3)
; address end address is: 0 (R0)
BL	_accel3_hw_init+0
CMP	R0, #0
IT	NE
BNE	L_accel3_init0
;accel3_M4.c,52 :: 		accel3_set_mode( accel_mode );
LDRB	R0, [SP, #4]
BL	_accel3_set_mode+0
;accel3_M4.c,53 :: 		accel3_set_data_rate( d_rate );
LDRB	R0, [SP, #8]
BL	_accel3_set_data_rate+0
;accel3_M4.c,54 :: 		accel3_set_full_scale( SCALE_100_G );
MOVS	R0, #0
BL	_accel3_set_full_scale+0
;accel3_M4.c,56 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_accel3_init
;accel3_M4.c,57 :: 		}
L_accel3_init0:
;accel3_M4.c,59 :: 		return -1;
MOVS	R0, #-1
;accel3_M4.c,60 :: 		}
L_end_accel3_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_init
_accel3_get_xyz:
;accel3_M4.c,62 :: 		xyz_t* accel3_get_xyz( void )
SUB	SP, SP, #12
STR	LR, [SP, #0]
;accel3_M4.c,67 :: 		acc_values.x_pos = accel3_read_acc_x();
BL	_accel3_read_acc_x+0
MOVW	R1, #lo_addr(accel3_get_xyz_acc_values_L0+0)
MOVT	R1, #hi_addr(accel3_get_xyz_acc_values_L0+0)
STRH	R0, [R1, #0]
;accel3_M4.c,68 :: 		acc_values.y_pos = accel3_read_acc_y();
BL	_accel3_read_acc_y+0
MOVW	R1, #lo_addr(accel3_get_xyz_acc_values_L0+2)
MOVT	R1, #hi_addr(accel3_get_xyz_acc_values_L0+2)
STR	R1, [SP, #8]
STRH	R0, [R1, #0]
;accel3_M4.c,69 :: 		acc_values.z_pos = accel3_read_acc_z();
BL	_accel3_read_acc_z+0
MOVW	R1, #lo_addr(accel3_get_xyz_acc_values_L0+4)
MOVT	R1, #hi_addr(accel3_get_xyz_acc_values_L0+4)
STR	R1, [SP, #4]
STRH	R0, [R1, #0]
;accel3_M4.c,71 :: 		sensitivity = accel3_get_xyz_sensitivity();
BL	_accel3_get_xyz_sensitivity+0
;accel3_M4.c,72 :: 		acc_values.x_pos /= sensitivity->x;
LDRSH	R3, [R0, #0]
MOVW	R2, #lo_addr(accel3_get_xyz_acc_values_L0+0)
MOVT	R2, #hi_addr(accel3_get_xyz_acc_values_L0+0)
LDRSH	R1, [R2, #0]
SDIV	R1, R1, R3
STRH	R1, [R2, #0]
;accel3_M4.c,73 :: 		acc_values.y_pos /= sensitivity->y;
ADDS	R1, R0, #2
LDRSH	R3, [R1, #0]
LDR	R2, [SP, #8]
MOV	R1, R2
LDRSH	R1, [R1, #0]
SDIV	R1, R1, R3
STRH	R1, [R2, #0]
;accel3_M4.c,74 :: 		acc_values.z_pos /= sensitivity->z;
ADDS	R0, R0, #4
LDRSH	R2, [R0, #0]
LDR	R1, [SP, #4]
MOV	R0, R1
LDRSH	R0, [R0, #0]
SDIV	R0, R0, R2
STRH	R0, [R1, #0]
;accel3_M4.c,76 :: 		return &acc_values;
MOVW	R0, #lo_addr(accel3_get_xyz_acc_values_L0+0)
MOVT	R0, #hi_addr(accel3_get_xyz_acc_values_L0+0)
;accel3_M4.c,77 :: 		}
L_end_accel3_get_xyz:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_get_xyz
_accel3_set_interrupt1:
;accel3_M4.c,79 :: 		uint8_t accel3_set_interrupt1( uint8_t threshhold, uint8_t duration )
; threshhold start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R1, [SP, #4]
; threshhold end address is: 0 (R0)
; threshhold start address is: 0 (R0)
;accel3_M4.c,81 :: 		if( accel3_int1_set_threshold( threshhold ) &&
; threshhold end address is: 0 (R0)
BL	_accel3_int1_set_threshold+0
;accel3_M4.c,82 :: 		accel3_int1_set_duration( duration ) )
CMP	R0, #0
IT	EQ
BEQ	L__accel3_set_interrupt112
LDRB	R0, [SP, #4]
BL	_accel3_int1_set_duration+0
CMP	R0, #0
IT	EQ
BEQ	L__accel3_set_interrupt111
L__accel3_set_interrupt110:
;accel3_M4.c,83 :: 		return -1;
MOVS	R0, #-1
IT	AL
BAL	L_end_accel3_set_interrupt1
;accel3_M4.c,82 :: 		accel3_int1_set_duration( duration ) )
L__accel3_set_interrupt112:
L__accel3_set_interrupt111:
;accel3_M4.c,85 :: 		return 0;
MOVS	R0, #0
;accel3_M4.c,87 :: 		}
L_end_accel3_set_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_set_interrupt1
_accel3_set_interrupt2:
;accel3_M4.c,89 :: 		uint8_t accel3_set_interrupt2( uint8_t threshhold, uint8_t duration )
; threshhold start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R1, [SP, #4]
; threshhold end address is: 0 (R0)
; threshhold start address is: 0 (R0)
;accel3_M4.c,91 :: 		if( accel3_int2_set_threshold( threshhold ) &&
; threshhold end address is: 0 (R0)
BL	_accel3_int2_set_threshold+0
;accel3_M4.c,92 :: 		accel3_int2_set_duration( duration ) )
CMP	R0, #0
IT	EQ
BEQ	L__accel3_set_interrupt215
LDRB	R0, [SP, #4]
BL	_accel3_int2_set_duration+0
CMP	R0, #0
IT	EQ
BEQ	L__accel3_set_interrupt214
L__accel3_set_interrupt213:
;accel3_M4.c,93 :: 		return -1;
MOVS	R0, #-1
IT	AL
BAL	L_end_accel3_set_interrupt2
;accel3_M4.c,92 :: 		accel3_int2_set_duration( duration ) )
L__accel3_set_interrupt215:
L__accel3_set_interrupt214:
;accel3_M4.c,95 :: 		return 0;
MOVS	R0, #0
;accel3_M4.c,97 :: 		}
L_end_accel3_set_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_set_interrupt2
_accel3_calibrate_x:
;accel3_M4.c,99 :: 		void accel3_calibrate_x( uint16_t pos, uint16_t neg )
; neg start address is: 4 (R1)
; pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; neg end address is: 4 (R1)
; pos end address is: 0 (R0)
; pos start address is: 0 (R0)
; neg start address is: 4 (R1)
;accel3_M4.c,102 :: 		x_sens = ( pos - neg ) / 2;
SUB	R2, R0, R1
UXTH	R2, R2
; pos end address is: 0 (R0)
; neg end address is: 4 (R1)
LSRS	R2, R2, #1
;accel3_M4.c,103 :: 		set_x( x_sens );
SXTH	R0, R2
BL	_set_x+0
;accel3_M4.c,104 :: 		}
L_end_accel3_calibrate_x:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _accel3_calibrate_x
_accel3_calibrate_y:
;accel3_M4.c,106 :: 		void accel3_calibrate_y( uint16_t pos, uint16_t neg )
; neg start address is: 4 (R1)
; pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; neg end address is: 4 (R1)
; pos end address is: 0 (R0)
; pos start address is: 0 (R0)
; neg start address is: 4 (R1)
;accel3_M4.c,109 :: 		y_sens = ( pos - neg ) / 2;
SUB	R2, R0, R1
UXTH	R2, R2
; pos end address is: 0 (R0)
; neg end address is: 4 (R1)
LSRS	R2, R2, #1
;accel3_M4.c,110 :: 		set_y( y_sens );
SXTH	R0, R2
BL	_set_y+0
;accel3_M4.c,111 :: 		}
L_end_accel3_calibrate_y:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _accel3_calibrate_y
_accel3_calibrate_z:
;accel3_M4.c,113 :: 		void accel3_calibrate_z( uint16_t pos, uint16_t neg )
; neg start address is: 4 (R1)
; pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; neg end address is: 4 (R1)
; pos end address is: 0 (R0)
; pos start address is: 0 (R0)
; neg start address is: 4 (R1)
;accel3_M4.c,116 :: 		z_sens = ( pos - neg ) / 2;
SUB	R2, R0, R1
UXTH	R2, R2
; pos end address is: 0 (R0)
; neg end address is: 4 (R1)
LSRS	R2, R2, #1
;accel3_M4.c,117 :: 		set_z( z_sens );
SXTH	R0, R2
BL	_set_z+0
;accel3_M4.c,118 :: 		}
L_end_accel3_calibrate_z:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _accel3_calibrate_z
