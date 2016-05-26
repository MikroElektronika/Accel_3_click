_accel3_hw_init:
;accel3_hw_M4.c,51 :: 		int8_t accel3_hw_init(uint8_t address, bus_mode_t mode)
; mode start address is: 4 (R1)
; address start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; mode end address is: 4 (R1)
; address end address is: 0 (R0)
; address start address is: 0 (R0)
; mode start address is: 4 (R1)
;accel3_hw_M4.c,55 :: 		uint8_t reg = WHO_AM_I;  //00110000
MOVS	R2, #15
STRB	R2, [SP, #6]
;accel3_hw_M4.c,57 :: 		accel3_hal_init( address, mode );
; mode end address is: 4 (R1)
; address end address is: 0 (R0)
BL	_accel3_hal_init+0
;accel3_hw_M4.c,58 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R3, SP, #4
ADD	R2, SP, #6
MOV	R1, R3
MOV	R0, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,59 :: 		initial_calibrate();
BL	accel3_hw_M4_initial_calibrate+0
;accel3_hw_M4.c,61 :: 		reg = 0x35;
MOVS	R2, #53
STRB	R2, [SP, #6]
;accel3_hw_M4.c,62 :: 		accel3_hal_read( &reg, &dummy, 1 );
ADD	R3, SP, #5
ADD	R2, SP, #6
MOV	R1, R3
MOV	R0, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,64 :: 		if (temp == 0x32)
LDRB	R2, [SP, #4]
CMP	R2, #50
IT	NE
BNE	L_accel3_hw_init0
;accel3_hw_M4.c,65 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_hw_init
L_accel3_hw_init0:
;accel3_hw_M4.c,67 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw_M4.c,68 :: 		}
L_end_accel3_hw_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_hw_init
accel3_hw_M4_initial_calibrate:
;accel3_hw_M4.c,70 :: 		void static initial_calibrate( void )
SUB	SP, SP, #4
;accel3_hw_M4.c,72 :: 		x_sens = 192;
MOVS	R1, #192
SXTH	R1, R1
MOVW	R0, #lo_addr(accel3_hw_M4_x_sens+0)
MOVT	R0, #hi_addr(accel3_hw_M4_x_sens+0)
STRH	R1, [R0, #0]
;accel3_hw_M4.c,73 :: 		y_sens = 199;
MOVS	R1, #199
SXTH	R1, R1
MOVW	R0, #lo_addr(accel3_hw_M4_y_sens+0)
MOVT	R0, #hi_addr(accel3_hw_M4_y_sens+0)
STRH	R1, [R0, #0]
;accel3_hw_M4.c,74 :: 		z_sens = 344;
MOVW	R1, #344
SXTH	R1, R1
MOVW	R0, #lo_addr(accel3_hw_M4_z_sens+0)
MOVT	R0, #hi_addr(accel3_hw_M4_z_sens+0)
STRH	R1, [R0, #0]
;accel3_hw_M4.c,76 :: 		}
L_end_initial_calibrate:
ADD	SP, SP, #4
BX	LR
; end of accel3_hw_M4_initial_calibrate
accel3_hw_M4_set_x:
;accel3_hw_M4.c,78 :: 		void static set_x( int16_t x )
; x start address is: 0 (R0)
SUB	SP, SP, #4
; x end address is: 0 (R0)
; x start address is: 0 (R0)
;accel3_hw_M4.c,80 :: 		x_sens = x;
MOVW	R1, #lo_addr(accel3_hw_M4_x_sens+0)
MOVT	R1, #hi_addr(accel3_hw_M4_x_sens+0)
STRH	R0, [R1, #0]
; x end address is: 0 (R0)
;accel3_hw_M4.c,81 :: 		}
L_end_set_x:
ADD	SP, SP, #4
BX	LR
; end of accel3_hw_M4_set_x
accel3_hw_M4_set_y:
;accel3_hw_M4.c,83 :: 		void static set_y( int16_t y )
; y start address is: 0 (R0)
SUB	SP, SP, #4
; y end address is: 0 (R0)
; y start address is: 0 (R0)
;accel3_hw_M4.c,85 :: 		y_sens = y;
MOVW	R1, #lo_addr(accel3_hw_M4_y_sens+0)
MOVT	R1, #hi_addr(accel3_hw_M4_y_sens+0)
STRH	R0, [R1, #0]
; y end address is: 0 (R0)
;accel3_hw_M4.c,86 :: 		}
L_end_set_y:
ADD	SP, SP, #4
BX	LR
; end of accel3_hw_M4_set_y
accel3_hw_M4_set_z:
;accel3_hw_M4.c,88 :: 		void static set_z( int16_t z )
; z start address is: 0 (R0)
SUB	SP, SP, #4
; z end address is: 0 (R0)
; z start address is: 0 (R0)
;accel3_hw_M4.c,90 :: 		z_sens = z;
MOVW	R1, #lo_addr(accel3_hw_M4_z_sens+0)
MOVT	R1, #hi_addr(accel3_hw_M4_z_sens+0)
STRH	R0, [R1, #0]
; z end address is: 0 (R0)
;accel3_hw_M4.c,91 :: 		}
L_end_set_z:
ADD	SP, SP, #4
BX	LR
; end of accel3_hw_M4_set_z
_accel3_set_mode:
;accel3_hw_M4.c,93 :: 		int8_t accel3_set_mode(accel_mode_t mode)
; mode start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; mode end address is: 0 (R0)
; mode start address is: 0 (R0)
;accel3_hw_M4.c,96 :: 		uint8_t reg = CTRL_REG1;
MOVS	R1, #32
STRB	R1, [SP, #9]
;accel3_hw_M4.c,98 :: 		if (mode > 7)
CMP	R0, #7
IT	LS
BLS	L_accel3_set_mode2
; mode end address is: 0 (R0)
;accel3_hw_M4.c,99 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_set_mode
L_accel3_set_mode2:
;accel3_hw_M4.c,101 :: 		accel3_hal_read( &reg, &temp, 1 );
; mode start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,102 :: 		temp |= ( mode << 5 );
LSLS	R2, R0, #5
UXTH	R2, R2
; mode end address is: 0 (R0)
LDRB	R1, [SP, #8]
ORRS	R1, R2
STRB	R1, [SP, #8]
;accel3_hw_M4.c,103 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,104 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw_M4.c,105 :: 		}
L_end_accel3_set_mode:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_set_mode
_accel3_set_data_rate:
;accel3_hw_M4.c,107 :: 		int8_t accel3_set_data_rate(data_rate_t data_rate)
; data_rate start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; data_rate end address is: 0 (R0)
; data_rate start address is: 0 (R0)
;accel3_hw_M4.c,110 :: 		uint8_t reg = CTRL_REG1;
MOVS	R1, #32
STRB	R1, [SP, #9]
;accel3_hw_M4.c,112 :: 		if (data_rate > 3)
CMP	R0, #3
IT	LS
BLS	L_accel3_set_data_rate3
; data_rate end address is: 0 (R0)
;accel3_hw_M4.c,113 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_set_data_rate
L_accel3_set_data_rate3:
;accel3_hw_M4.c,114 :: 		accel3_hal_read( &reg, &temp, 1 );
; data_rate start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,116 :: 		temp |= (data_rate << 3);
LSLS	R2, R0, #3
UXTH	R2, R2
; data_rate end address is: 0 (R0)
LDRB	R1, [SP, #8]
ORRS	R1, R2
STRB	R1, [SP, #8]
;accel3_hw_M4.c,117 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,118 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw_M4.c,119 :: 		}
L_end_accel3_set_data_rate:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_set_data_rate
_accel3_z_enable:
;accel3_hw_M4.c,121 :: 		void accel3_z_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,124 :: 		uint8_t reg = CTRL_REG1;
MOVS	R1, #32
STRB	R1, [SP, #9]
;accel3_hw_M4.c,126 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,127 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_z_enable4
;accel3_hw_M4.c,128 :: 		temp |= (1 << 2);
LDRB	R1, [SP, #8]
ORR	R1, R1, #4
STRB	R1, [SP, #8]
L_accel3_z_enable4:
;accel3_hw_M4.c,129 :: 		if (enable == false)
CMP	R0, #0
IT	NE
BNE	L_accel3_z_enable5
; enable end address is: 0 (R0)
;accel3_hw_M4.c,130 :: 		temp &= ~(1 << 2);
LDRB	R2, [SP, #8]
MOVW	R1, #65531
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_z_enable5:
;accel3_hw_M4.c,131 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,132 :: 		}
L_end_accel3_z_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_z_enable
_accel3_y_enable:
;accel3_hw_M4.c,134 :: 		void accel3_y_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,137 :: 		uint8_t reg = CTRL_REG1;
MOVS	R1, #32
STRB	R1, [SP, #9]
;accel3_hw_M4.c,139 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,140 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_y_enable6
;accel3_hw_M4.c,141 :: 		temp |= (1 << 1);
LDRB	R1, [SP, #8]
ORR	R1, R1, #2
STRB	R1, [SP, #8]
L_accel3_y_enable6:
;accel3_hw_M4.c,142 :: 		if (enable == false)
CMP	R0, #0
IT	NE
BNE	L_accel3_y_enable7
; enable end address is: 0 (R0)
;accel3_hw_M4.c,143 :: 		temp &= ~(1 << 1);
LDRB	R2, [SP, #8]
MOVW	R1, #65533
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_y_enable7:
;accel3_hw_M4.c,144 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,145 :: 		}
L_end_accel3_y_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_y_enable
_accel3_x_enable:
;accel3_hw_M4.c,147 :: 		void accel3_x_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,150 :: 		uint8_t reg = CTRL_REG1;
MOVS	R1, #32
STRB	R1, [SP, #9]
;accel3_hw_M4.c,152 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,153 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_x_enable8
; enable end address is: 0 (R0)
;accel3_hw_M4.c,154 :: 		temp |= 1;
LDRB	R1, [SP, #8]
ORR	R1, R1, #1
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_x_enable9
L_accel3_x_enable8:
;accel3_hw_M4.c,156 :: 		temp &= ~1;
LDRB	R2, [SP, #8]
MOVW	R1, #65534
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_x_enable9:
;accel3_hw_M4.c,157 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,158 :: 		}
L_end_accel3_x_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_x_enable
_accel3_reboot:
;accel3_hw_M4.c,160 :: 		void accel3_reboot()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,163 :: 		uint8_t reg = CTRL_REG2;
MOVS	R0, #33
STRB	R0, [SP, #5]
;accel3_hw_M4.c,165 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,166 :: 		temp |= (1<<7);
LDRB	R0, [SP, #4]
ORR	R0, R0, #128
STRB	R0, [SP, #4]
;accel3_hw_M4.c,167 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,168 :: 		}
L_end_accel3_reboot:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_reboot
_accel3_hp_filter_mode_select:
;accel3_hw_M4.c,170 :: 		int8_t accel3_hp_filter_mode_select(hp_filter_mode_t mode)
; mode start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; mode end address is: 0 (R0)
; mode start address is: 0 (R0)
;accel3_hw_M4.c,173 :: 		uint8_t reg = CTRL_REG2;
MOVS	R1, #33
STRB	R1, [SP, #9]
;accel3_hw_M4.c,175 :: 		if (mode > 2)
CMP	R0, #2
IT	LS
BLS	L_accel3_hp_filter_mode_select10
; mode end address is: 0 (R0)
;accel3_hw_M4.c,176 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_hp_filter_mode_select
L_accel3_hp_filter_mode_select10:
;accel3_hw_M4.c,178 :: 		accel3_hal_read( &reg, &temp, 1 );
; mode start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,179 :: 		temp |= mode;
LDRB	R1, [SP, #8]
ORRS	R1, R0
; mode end address is: 0 (R0)
STRB	R1, [SP, #8]
;accel3_hw_M4.c,180 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,181 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw_M4.c,182 :: 		}
L_end_accel3_hp_filter_mode_select:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_hp_filter_mode_select
_accel3_filtered_data_selection_enable:
;accel3_hw_M4.c,184 :: 		void accel3_filtered_data_selection_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,187 :: 		uint8_t reg = CTRL_REG2;
MOVS	R1, #33
STRB	R1, [SP, #9]
;accel3_hw_M4.c,189 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,191 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_filtered_data_selection_enable11
; enable end address is: 0 (R0)
;accel3_hw_M4.c,192 :: 		temp |= (1<<4);
LDRB	R1, [SP, #8]
ORR	R1, R1, #16
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_filtered_data_selection_enable12
L_accel3_filtered_data_selection_enable11:
;accel3_hw_M4.c,194 :: 		temp &= ~(1<<4);
LDRB	R2, [SP, #8]
MOVW	R1, #65519
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_filtered_data_selection_enable12:
;accel3_hw_M4.c,195 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,196 :: 		}
L_end_accel3_filtered_data_selection_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_filtered_data_selection_enable
_accel3_hp2_filter_enable:
;accel3_hw_M4.c,198 :: 		void accel3_hp2_filter_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,201 :: 		uint8_t reg = CTRL_REG2;
MOVS	R1, #33
STRB	R1, [SP, #9]
;accel3_hw_M4.c,203 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,205 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_hp2_filter_enable13
; enable end address is: 0 (R0)
;accel3_hw_M4.c,206 :: 		temp |= (1<<3);
LDRB	R1, [SP, #8]
ORR	R1, R1, #8
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_hp2_filter_enable14
L_accel3_hp2_filter_enable13:
;accel3_hw_M4.c,208 :: 		temp &= ~(1<<3);
LDRB	R2, [SP, #8]
MOVW	R1, #65527
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_hp2_filter_enable14:
;accel3_hw_M4.c,209 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,210 :: 		}
L_end_accel3_hp2_filter_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_hp2_filter_enable
_accel3_hp1_filter_enable:
;accel3_hw_M4.c,212 :: 		void accel3_hp1_filter_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,215 :: 		uint8_t reg = CTRL_REG2;
MOVS	R1, #33
STRB	R1, [SP, #9]
;accel3_hw_M4.c,217 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,219 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_hp1_filter_enable15
; enable end address is: 0 (R0)
;accel3_hw_M4.c,220 :: 		temp |= (1<<2);
LDRB	R1, [SP, #8]
ORR	R1, R1, #4
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_hp1_filter_enable16
L_accel3_hp1_filter_enable15:
;accel3_hw_M4.c,222 :: 		temp &= ~(1<<2);
LDRB	R2, [SP, #8]
MOVW	R1, #65531
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_hp1_filter_enable16:
;accel3_hw_M4.c,223 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,224 :: 		}
L_end_accel3_hp1_filter_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_hp1_filter_enable
_accel3_hp_cutoff_freq_config:
;accel3_hw_M4.c,226 :: 		int8_t accel3_hp_cutoff_freq_config(cutoff_freq_t freq)
; freq start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; freq end address is: 0 (R0)
; freq start address is: 0 (R0)
;accel3_hw_M4.c,229 :: 		uint8_t reg = CTRL_REG2;
MOVS	R1, #33
STRB	R1, [SP, #9]
;accel3_hw_M4.c,231 :: 		if ( freq > 3)
CMP	R0, #3
IT	LS
BLS	L_accel3_hp_cutoff_freq_config17
; freq end address is: 0 (R0)
;accel3_hw_M4.c,232 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_hp_cutoff_freq_config
L_accel3_hp_cutoff_freq_config17:
;accel3_hw_M4.c,233 :: 		accel3_hal_read( &reg, &temp, 1 );
; freq start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,234 :: 		temp |= freq;
LDRB	R1, [SP, #8]
ORRS	R1, R0
; freq end address is: 0 (R0)
STRB	R1, [SP, #8]
;accel3_hw_M4.c,235 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,236 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw_M4.c,237 :: 		}
L_end_accel3_hp_cutoff_freq_config:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_hp_cutoff_freq_config
_accel3_interrupt_active_level:
;accel3_hw_M4.c,239 :: 		int8_t accel3_interrupt_active_level(level_t level)
; level start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; level end address is: 0 (R0)
; level start address is: 0 (R0)
;accel3_hw_M4.c,242 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw_M4.c,244 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,246 :: 		if (level == HIGH)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt_active_level18
;accel3_hw_M4.c,247 :: 		temp |= (level << 7);
LSLS	R2, R0, #7
UXTH	R2, R2
; level end address is: 0 (R0)
LDRB	R1, [SP, #8]
ORRS	R1, R2
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt_active_level19
L_accel3_interrupt_active_level18:
;accel3_hw_M4.c,248 :: 		else if (level == LOW)
; level start address is: 0 (R0)
CMP	R0, #0
IT	NE
BNE	L_accel3_interrupt_active_level20
;accel3_hw_M4.c,249 :: 		temp &= ~(level << 7);
LSLS	R1, R0, #7
UXTH	R1, R1
; level end address is: 0 (R0)
MVN	R2, R1
UXTH	R2, R2
LDRB	R1, [SP, #8]
ANDS	R1, R2
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt_active_level21
L_accel3_interrupt_active_level20:
;accel3_hw_M4.c,250 :: 		else return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_interrupt_active_level
L_accel3_interrupt_active_level21:
L_accel3_interrupt_active_level19:
;accel3_hw_M4.c,252 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,253 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw_M4.c,254 :: 		}
L_end_accel3_interrupt_active_level:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt_active_level
_accel3_interrupt_pad_selection:
;accel3_hw_M4.c,256 :: 		int8_t accel3_interrupt_pad_selection(interrupt_pad_t select)
; select start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; select end address is: 0 (R0)
; select start address is: 0 (R0)
;accel3_hw_M4.c,259 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw_M4.c,261 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,262 :: 		if ( select == PUSH_PULL)
CMP	R0, #0
IT	NE
BNE	L_accel3_interrupt_pad_selection22
; select end address is: 0 (R0)
;accel3_hw_M4.c,263 :: 		temp &= ~(1 << 6);
LDRB	R2, [SP, #8]
MOVW	R1, #65471
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt_pad_selection23
L_accel3_interrupt_pad_selection22:
;accel3_hw_M4.c,264 :: 		else if (select == OPEN_DRAIN )
; select start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt_pad_selection24
; select end address is: 0 (R0)
;accel3_hw_M4.c,265 :: 		temp |= ( 1 << 6);
LDRB	R1, [SP, #8]
ORR	R1, R1, #64
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt_pad_selection25
L_accel3_interrupt_pad_selection24:
;accel3_hw_M4.c,267 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_interrupt_pad_selection
L_accel3_interrupt_pad_selection25:
L_accel3_interrupt_pad_selection23:
;accel3_hw_M4.c,269 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,270 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw_M4.c,271 :: 		}
L_end_accel3_interrupt_pad_selection:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt_pad_selection
_accel3_latched_interrupt1_enable:
;accel3_hw_M4.c,273 :: 		void accel3_latched_interrupt1_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,276 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw_M4.c,278 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,280 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_latched_interrupt1_enable26
; enable end address is: 0 (R0)
;accel3_hw_M4.c,281 :: 		temp |= (1<<2);
LDRB	R1, [SP, #8]
ORR	R1, R1, #4
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_latched_interrupt1_enable27
L_accel3_latched_interrupt1_enable26:
;accel3_hw_M4.c,283 :: 		temp &= ~(1<<2);
LDRB	R2, [SP, #8]
MOVW	R1, #65531
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_latched_interrupt1_enable27:
;accel3_hw_M4.c,284 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,285 :: 		}
L_end_accel3_latched_interrupt1_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_latched_interrupt1_enable
_accel3_latched_interrupt2_enable:
;accel3_hw_M4.c,287 :: 		void accel3_latched_interrupt2_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,290 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw_M4.c,292 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,294 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_latched_interrupt2_enable28
; enable end address is: 0 (R0)
;accel3_hw_M4.c,295 :: 		temp |= (1<<3);
LDRB	R1, [SP, #8]
ORR	R1, R1, #8
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_latched_interrupt2_enable29
L_accel3_latched_interrupt2_enable28:
;accel3_hw_M4.c,297 :: 		temp &= ~(1<<3);
LDRB	R2, [SP, #8]
MOVW	R1, #65527
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_latched_interrupt2_enable29:
;accel3_hw_M4.c,298 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,299 :: 		}
L_end_accel3_latched_interrupt2_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_latched_interrupt2_enable
_accel3_int1_signal_config:
;accel3_hw_M4.c,301 :: 		int8_t accel3_int1_signal_config(int_signal_t config)
; config start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; config end address is: 0 (R0)
; config start address is: 0 (R0)
;accel3_hw_M4.c,304 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw_M4.c,306 :: 		if ( (config > 3) || (config < 0) )
CMP	R0, #3
IT	HI
BHI	L__accel3_int1_signal_config88
CMP	R0, #0
IT	CC
BCC	L__accel3_int1_signal_config87
IT	AL
BAL	L_accel3_int1_signal_config32
; config end address is: 0 (R0)
L__accel3_int1_signal_config88:
L__accel3_int1_signal_config87:
;accel3_hw_M4.c,307 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_int1_signal_config
L_accel3_int1_signal_config32:
;accel3_hw_M4.c,309 :: 		accel3_hal_read( &reg, &temp, 1) ;
; config start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,310 :: 		temp |= config;
LDRB	R1, [SP, #8]
ORRS	R1, R0
; config end address is: 0 (R0)
STRB	R1, [SP, #8]
;accel3_hw_M4.c,311 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,312 :: 		return 1;
MOVS	R0, #1
SXTB	R0, R0
;accel3_hw_M4.c,313 :: 		}
L_end_accel3_int1_signal_config:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_int1_signal_config
_accel3_int2_signal_config:
;accel3_hw_M4.c,315 :: 		int8_t accel3_int2_signal_config(int_signal_t config)
; config start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; config end address is: 0 (R0)
; config start address is: 0 (R0)
;accel3_hw_M4.c,318 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw_M4.c,320 :: 		if ( (config > 3) || (config < 0) )
CMP	R0, #3
IT	HI
BHI	L__accel3_int2_signal_config91
CMP	R0, #0
IT	CC
BCC	L__accel3_int2_signal_config90
IT	AL
BAL	L_accel3_int2_signal_config35
; config end address is: 0 (R0)
L__accel3_int2_signal_config91:
L__accel3_int2_signal_config90:
;accel3_hw_M4.c,321 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_int2_signal_config
L_accel3_int2_signal_config35:
;accel3_hw_M4.c,323 :: 		accel3_hal_read( &reg, &temp, 1 );
; config start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,324 :: 		temp |= ( config << 3 );
LSLS	R2, R0, #3
UXTH	R2, R2
; config end address is: 0 (R0)
LDRB	R1, [SP, #8]
ORRS	R1, R2
STRB	R1, [SP, #8]
;accel3_hw_M4.c,325 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,326 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw_M4.c,327 :: 		}
L_end_accel3_int2_signal_config:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_int2_signal_config
_accel3_bdu_enable:
;accel3_hw_M4.c,329 :: 		void accel3_bdu_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,332 :: 		uint8_t reg = CTRL_REG4;
MOVS	R1, #35
STRB	R1, [SP, #9]
;accel3_hw_M4.c,334 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,336 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_bdu_enable36
; enable end address is: 0 (R0)
;accel3_hw_M4.c,337 :: 		temp |= (1<<7);
LDRB	R1, [SP, #8]
ORR	R1, R1, #128
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_bdu_enable37
L_accel3_bdu_enable36:
;accel3_hw_M4.c,339 :: 		temp &= ~(1<<7);
LDRB	R1, [SP, #8]
AND	R1, R1, #127
STRB	R1, [SP, #8]
L_accel3_bdu_enable37:
;accel3_hw_M4.c,340 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,341 :: 		}
L_end_accel3_bdu_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_bdu_enable
_accel3_ble_enable:
;accel3_hw_M4.c,343 :: 		void accel3_ble_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,346 :: 		uint8_t reg = CTRL_REG4;
MOVS	R1, #35
STRB	R1, [SP, #9]
;accel3_hw_M4.c,348 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,350 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_ble_enable38
; enable end address is: 0 (R0)
;accel3_hw_M4.c,351 :: 		temp |= (1<<6);
LDRB	R1, [SP, #8]
ORR	R1, R1, #64
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_ble_enable39
L_accel3_ble_enable38:
;accel3_hw_M4.c,353 :: 		temp &= ~(1<<6);
LDRB	R2, [SP, #8]
MOVW	R1, #65471
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_ble_enable39:
;accel3_hw_M4.c,354 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,355 :: 		}
L_end_accel3_ble_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_ble_enable
_accel3_set_full_scale:
;accel3_hw_M4.c,357 :: 		int8_t accel3_set_full_scale(full_scale_t scale)
; scale start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; scale end address is: 0 (R0)
; scale start address is: 0 (R0)
;accel3_hw_M4.c,360 :: 		uint8_t reg = CTRL_REG4;
MOVS	R1, #35
STRB	R1, [SP, #9]
;accel3_hw_M4.c,362 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,364 :: 		if ((scale > 3) || (scale < 0))
CMP	R0, #3
IT	HI
BHI	L__accel3_set_full_scale94
CMP	R0, #0
IT	CC
BCC	L__accel3_set_full_scale93
IT	AL
BAL	L_accel3_set_full_scale42
; scale end address is: 0 (R0)
L__accel3_set_full_scale94:
L__accel3_set_full_scale93:
;accel3_hw_M4.c,365 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_set_full_scale
L_accel3_set_full_scale42:
;accel3_hw_M4.c,367 :: 		temp |= (scale << 4);
; scale start address is: 0 (R0)
LSLS	R2, R0, #4
UXTH	R2, R2
; scale end address is: 0 (R0)
LDRB	R1, [SP, #8]
ORRS	R1, R2
STRB	R1, [SP, #8]
;accel3_hw_M4.c,368 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,369 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw_M4.c,370 :: 		}
L_end_accel3_set_full_scale:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_set_full_scale
_accel3_get_full_scale:
;accel3_hw_M4.c,372 :: 		full_scale_t accel3_get_full_scale( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,375 :: 		uint8_t reg = CTRL_REG4;
MOVS	R0, #35
STRB	R0, [SP, #5]
;accel3_hw_M4.c,377 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,378 :: 		temp &= ~(0xC0);
LDRB	R0, [SP, #4]
AND	R0, R0, #63
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,379 :: 		temp = temp >> 4;
LSRS	R0, R0, #4
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,380 :: 		if( temp == 0x00 )
CMP	R0, #0
IT	NE
BNE	L_accel3_get_full_scale43
;accel3_hw_M4.c,381 :: 		return SCALE_100_G;
MOVS	R0, #0
IT	AL
BAL	L_end_accel3_get_full_scale
L_accel3_get_full_scale43:
;accel3_hw_M4.c,382 :: 		else if( temp == 0x01 )
LDRB	R0, [SP, #4]
CMP	R0, #1
IT	NE
BNE	L_accel3_get_full_scale45
;accel3_hw_M4.c,383 :: 		return SCALE_200_G;
MOVS	R0, #1
IT	AL
BAL	L_end_accel3_get_full_scale
L_accel3_get_full_scale45:
;accel3_hw_M4.c,384 :: 		else if( temp == 0x03 )
LDRB	R0, [SP, #4]
CMP	R0, #3
IT	NE
BNE	L_accel3_get_full_scale47
;accel3_hw_M4.c,385 :: 		return SCALE_400_G;
MOVS	R0, #3
IT	AL
BAL	L_end_accel3_get_full_scale
L_accel3_get_full_scale47:
;accel3_hw_M4.c,387 :: 		}
L_end_accel3_get_full_scale:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_get_full_scale
_accel3_sleep_to_wake_enable:
;accel3_hw_M4.c,389 :: 		void accel3_sleep_to_wake_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,392 :: 		uint8_t reg = CTRL_REG5;
MOVS	R1, #36
STRB	R1, [SP, #9]
;accel3_hw_M4.c,394 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,395 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_sleep_to_wake_enable48
; enable end address is: 0 (R0)
;accel3_hw_M4.c,396 :: 		temp |= (3);
LDRB	R1, [SP, #8]
ORR	R1, R1, #3
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_sleep_to_wake_enable49
L_accel3_sleep_to_wake_enable48:
;accel3_hw_M4.c,398 :: 		temp &= ~(3);
LDRB	R2, [SP, #8]
MOVW	R1, #65532
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_sleep_to_wake_enable49:
;accel3_hw_M4.c,399 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,400 :: 		}
L_end_accel3_sleep_to_wake_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_sleep_to_wake_enable
_accel3_hp_filter_reset:
;accel3_hw_M4.c,402 :: 		void  accel3_hp_filter_reset()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,405 :: 		uint8_t reg = HP_FILTER_RESET;
MOVS	R0, #37
STRB	R0, [SP, #5]
;accel3_hw_M4.c,407 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,408 :: 		}
L_end_accel3_hp_filter_reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_hp_filter_reset
_accel3_hp_filter_set_reference:
;accel3_hw_M4.c,410 :: 		void accel3_hp_filter_set_reference(uint8_t reference)
; reference start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; reference end address is: 0 (R0)
; reference start address is: 0 (R0)
;accel3_hw_M4.c,412 :: 		uint8_t temp = reference;
STRB	R0, [SP, #4]
; reference end address is: 0 (R0)
;accel3_hw_M4.c,413 :: 		uint8_t reg = REFERENCE_REG;
MOVS	R1, #38
STRB	R1, [SP, #5]
;accel3_hw_M4.c,415 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #4
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,416 :: 		}
L_end_accel3_hp_filter_set_reference:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_hp_filter_set_reference
_accel3_is_overrun_all:
;accel3_hw_M4.c,418 :: 		int8_t accel3_is_overrun_all()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,421 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw_M4.c,423 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,425 :: 		return (temp >> 7);
LDRB	R0, [SP, #4]
LSRS	R0, R0, #7
SXTB	R0, R0
;accel3_hw_M4.c,426 :: 		}
L_end_accel3_is_overrun_all:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_overrun_all
_accel3_is_overrun_x:
;accel3_hw_M4.c,428 :: 		int8_t accel3_is_overrun_x()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,431 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw_M4.c,433 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,435 :: 		temp &= ~(1 << 4);
LDRB	R1, [SP, #4]
MOVW	R0, #65519
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,436 :: 		return ( temp >> 4 );
UXTB	R0, R0
LSRS	R0, R0, #4
SXTB	R0, R0
;accel3_hw_M4.c,437 :: 		}
L_end_accel3_is_overrun_x:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_overrun_x
_accel3_is_overrun_y:
;accel3_hw_M4.c,439 :: 		int8_t accel3_is_overrun_y()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,442 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw_M4.c,444 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,446 :: 		temp &= ~(1 << 5);
LDRB	R1, [SP, #4]
MOVW	R0, #65503
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,447 :: 		return ( temp >> 5 );
UXTB	R0, R0
LSRS	R0, R0, #5
SXTB	R0, R0
;accel3_hw_M4.c,448 :: 		}
L_end_accel3_is_overrun_y:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_overrun_y
_accel3_is_overrun_z:
;accel3_hw_M4.c,450 :: 		int8_t accel3_is_overrun_z()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,453 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw_M4.c,455 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,457 :: 		temp &= ~(1 << 6);
LDRB	R1, [SP, #4]
MOVW	R0, #65471
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,458 :: 		return ( temp >> 6 );
UXTB	R0, R0
LSRS	R0, R0, #6
SXTB	R0, R0
;accel3_hw_M4.c,459 :: 		}
L_end_accel3_is_overrun_z:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_overrun_z
_accel3_is_new_data_all:
;accel3_hw_M4.c,461 :: 		int8_t accel3_is_new_data_all()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,464 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw_M4.c,466 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,468 :: 		temp &= ~(1 << 3);
LDRB	R1, [SP, #4]
MOVW	R0, #65527
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,469 :: 		return ( temp >> 3 );
UXTB	R0, R0
LSRS	R0, R0, #3
SXTB	R0, R0
;accel3_hw_M4.c,470 :: 		}
L_end_accel3_is_new_data_all:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_new_data_all
_accel3_is_new_data_x:
;accel3_hw_M4.c,472 :: 		int8_t accel3_is_new_data_x()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,475 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw_M4.c,477 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,479 :: 		temp &= ~(1);
LDRB	R1, [SP, #4]
MOVW	R0, #65534
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,480 :: 		return temp;
SXTB	R0, R0
;accel3_hw_M4.c,481 :: 		}
L_end_accel3_is_new_data_x:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_new_data_x
_accel3_is_new_data_y:
;accel3_hw_M4.c,483 :: 		int8_t accel3_is_new_data_y()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,486 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw_M4.c,488 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,490 :: 		temp &= ~(1 << 1);
LDRB	R1, [SP, #4]
MOVW	R0, #65533
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,491 :: 		return ( temp >> 1 );
UXTB	R0, R0
LSRS	R0, R0, #1
SXTB	R0, R0
;accel3_hw_M4.c,492 :: 		}
L_end_accel3_is_new_data_y:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_new_data_y
_accel3_is_new_data_z:
;accel3_hw_M4.c,495 :: 		int8_t accel3_is_new_data_z()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,498 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw_M4.c,500 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,502 :: 		temp &= ~(1 << 2);
LDRB	R1, [SP, #4]
MOVW	R0, #65531
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,503 :: 		return ( temp >> 2 );
UXTB	R0, R0
LSRS	R0, R0, #2
SXTB	R0, R0
;accel3_hw_M4.c,504 :: 		}
L_end_accel3_is_new_data_z:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_new_data_z
_accel3_read_acc_x:
;accel3_hw_M4.c,506 :: 		int16_t accel3_read_acc_x()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,512 :: 		uint8_t reg_1 = OUT_X_L;
MOVS	R0, #40
STRB	R0, [SP, #6]
MOVS	R0, #41
STRB	R0, [SP, #7]
;accel3_hw_M4.c,513 :: 		uint8_t reg_2 = OUT_X_H;
;accel3_hw_M4.c,515 :: 		accel3_hal_read( &reg_1, &temp_1, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #6
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,516 :: 		accel3_hal_read( &reg_2, &temp_2, 1 );
ADD	R1, SP, #5
ADD	R0, SP, #7
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,519 :: 		retval = ((int16_t) temp_2 ) << 8;
LDRSB	R0, [SP, #5]
LSLS	R1, R0, #8
SXTH	R1, R1
;accel3_hw_M4.c,520 :: 		retval |= (int16_t)temp_1;
LDRSB	R0, [SP, #4]
ORR	R0, R1, R0, LSL #0
;accel3_hw_M4.c,522 :: 		return retval;
;accel3_hw_M4.c,523 :: 		}
L_end_accel3_read_acc_x:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_read_acc_x
_accel3_read_acc_y:
;accel3_hw_M4.c,525 :: 		int16_t accel3_read_acc_y()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,530 :: 		uint8_t reg_1 = OUT_Y_L;
MOVS	R0, #42
STRB	R0, [SP, #6]
MOVS	R0, #43
STRB	R0, [SP, #7]
;accel3_hw_M4.c,531 :: 		uint8_t reg_2 = OUT_Y_H;
;accel3_hw_M4.c,533 :: 		accel3_hal_read( &reg_1, &temp_1, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #6
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,534 :: 		accel3_hal_read( &reg_2, &temp_2, 1 );
ADD	R1, SP, #5
ADD	R0, SP, #7
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,537 :: 		retval = ((int16_t) temp_2 ) << 8;
LDRSB	R0, [SP, #5]
LSLS	R1, R0, #8
SXTH	R1, R1
;accel3_hw_M4.c,538 :: 		retval |= (int16_t)temp_1;
LDRSB	R0, [SP, #4]
ORR	R0, R1, R0, LSL #0
;accel3_hw_M4.c,540 :: 		return retval;
;accel3_hw_M4.c,541 :: 		}
L_end_accel3_read_acc_y:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_read_acc_y
_accel3_read_acc_z:
;accel3_hw_M4.c,543 :: 		int16_t accel3_read_acc_z()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,548 :: 		uint8_t reg_1 = OUT_Z_L;
MOVS	R0, #44
STRB	R0, [SP, #6]
MOVS	R0, #45
STRB	R0, [SP, #7]
;accel3_hw_M4.c,549 :: 		uint8_t reg_2 = OUT_Z_H;
;accel3_hw_M4.c,551 :: 		accel3_hal_read( &reg_1, &temp_1, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #6
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,552 :: 		accel3_hal_read( &reg_2, &temp_2, 1 );
ADD	R1, SP, #5
ADD	R0, SP, #7
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,555 :: 		retval = ((int16_t) temp_2 ) << 8;
LDRSB	R0, [SP, #5]
LSLS	R1, R0, #8
SXTH	R1, R1
;accel3_hw_M4.c,556 :: 		retval |= (int16_t)temp_1;
LDRSB	R0, [SP, #4]
ORR	R0, R1, R0, LSL #0
;accel3_hw_M4.c,558 :: 		return retval;
;accel3_hw_M4.c,559 :: 		}
L_end_accel3_read_acc_z:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_read_acc_z
_accel3_interrupt1_set_combination:
;accel3_hw_M4.c,561 :: 		int8_t accel3_interrupt1_set_combination(int_comb_t combination)
; combination start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; combination end address is: 0 (R0)
; combination start address is: 0 (R0)
;accel3_hw_M4.c,564 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw_M4.c,566 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,568 :: 		if ( combination == OR)
CMP	R0, #0
IT	NE
BNE	L_accel3_interrupt1_set_combination50
; combination end address is: 0 (R0)
;accel3_hw_M4.c,569 :: 		temp &= ~(1 << 7);
LDRB	R1, [SP, #8]
AND	R1, R1, #127
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_set_combination51
L_accel3_interrupt1_set_combination50:
;accel3_hw_M4.c,570 :: 		else if ( combination == AND)
; combination start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_set_combination52
; combination end address is: 0 (R0)
;accel3_hw_M4.c,571 :: 		temp |= (1 << 7);
LDRB	R1, [SP, #8]
ORR	R1, R1, #128
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_set_combination53
L_accel3_interrupt1_set_combination52:
;accel3_hw_M4.c,573 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_interrupt1_set_combination
L_accel3_interrupt1_set_combination53:
L_accel3_interrupt1_set_combination51:
;accel3_hw_M4.c,574 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,575 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw_M4.c,576 :: 		}
L_end_accel3_interrupt1_set_combination:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_set_combination
_accel3_interrupt1_z_high_enable:
;accel3_hw_M4.c,578 :: 		void accel3_interrupt1_z_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,581 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw_M4.c,583 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,585 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_z_high_enable54
; enable end address is: 0 (R0)
;accel3_hw_M4.c,586 :: 		temp |= (1 << 5);
LDRB	R1, [SP, #8]
ORR	R1, R1, #32
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_z_high_enable55
L_accel3_interrupt1_z_high_enable54:
;accel3_hw_M4.c,588 :: 		temp &= ~(1 << 5);
LDRB	R2, [SP, #8]
MOVW	R1, #65503
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_z_high_enable55:
;accel3_hw_M4.c,590 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,591 :: 		}
L_end_accel3_interrupt1_z_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_z_high_enable
_accel3_interrupt1_z_low_enable:
;accel3_hw_M4.c,593 :: 		void accel3_interrupt1_z_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,596 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw_M4.c,598 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,600 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_z_low_enable56
; enable end address is: 0 (R0)
;accel3_hw_M4.c,601 :: 		temp |= (1 << 4);
LDRB	R1, [SP, #8]
ORR	R1, R1, #16
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_z_low_enable57
L_accel3_interrupt1_z_low_enable56:
;accel3_hw_M4.c,603 :: 		temp &= ~(1 << 4);
LDRB	R2, [SP, #8]
MOVW	R1, #65519
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_z_low_enable57:
;accel3_hw_M4.c,604 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,605 :: 		}
L_end_accel3_interrupt1_z_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_z_low_enable
_accel3_interrupt1_y_high_enable:
;accel3_hw_M4.c,607 :: 		void accel3_interrupt1_y_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,610 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw_M4.c,612 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,614 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_y_high_enable58
; enable end address is: 0 (R0)
;accel3_hw_M4.c,615 :: 		temp |= (1 << 3);
LDRB	R1, [SP, #8]
ORR	R1, R1, #8
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_y_high_enable59
L_accel3_interrupt1_y_high_enable58:
;accel3_hw_M4.c,617 :: 		temp &= ~(1 << 3);
LDRB	R2, [SP, #8]
MOVW	R1, #65527
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_y_high_enable59:
;accel3_hw_M4.c,618 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,619 :: 		}
L_end_accel3_interrupt1_y_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_y_high_enable
_accel3_interrupt1_y_low_enable:
;accel3_hw_M4.c,621 :: 		void accel3_interrupt1_y_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,624 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw_M4.c,626 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,628 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_y_low_enable60
; enable end address is: 0 (R0)
;accel3_hw_M4.c,629 :: 		temp |= (1 << 2);
LDRB	R1, [SP, #8]
ORR	R1, R1, #4
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_y_low_enable61
L_accel3_interrupt1_y_low_enable60:
;accel3_hw_M4.c,631 :: 		temp &= ~(1 << 2);
LDRB	R2, [SP, #8]
MOVW	R1, #65531
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_y_low_enable61:
;accel3_hw_M4.c,632 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,633 :: 		}
L_end_accel3_interrupt1_y_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_y_low_enable
_accel3_interrupt1_x_high_enable:
;accel3_hw_M4.c,635 :: 		void accel3_interrupt1_x_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,638 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw_M4.c,640 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,642 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_x_high_enable62
; enable end address is: 0 (R0)
;accel3_hw_M4.c,643 :: 		temp |= (1 << 1);
LDRB	R1, [SP, #8]
ORR	R1, R1, #2
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_x_high_enable63
L_accel3_interrupt1_x_high_enable62:
;accel3_hw_M4.c,645 :: 		temp &= ~(1 << 1);
LDRB	R2, [SP, #8]
MOVW	R1, #65533
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_x_high_enable63:
;accel3_hw_M4.c,646 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,647 :: 		}
L_end_accel3_interrupt1_x_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_x_high_enable
_accel3_interrupt1_x_low_enable:
;accel3_hw_M4.c,649 :: 		void accel3_interrupt1_x_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,652 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw_M4.c,654 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,656 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_x_low_enable64
; enable end address is: 0 (R0)
;accel3_hw_M4.c,657 :: 		temp |= 1;
LDRB	R1, [SP, #8]
ORR	R1, R1, #1
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_x_low_enable65
L_accel3_interrupt1_x_low_enable64:
;accel3_hw_M4.c,659 :: 		temp &= ~(1);
LDRB	R2, [SP, #8]
MOVW	R1, #65534
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_x_low_enable65:
;accel3_hw_M4.c,660 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,661 :: 		}
L_end_accel3_interrupt1_x_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_x_low_enable
_accel3_is_interrupt1:
;accel3_hw_M4.c,663 :: 		int8_t accel3_is_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,666 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw_M4.c,668 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,670 :: 		return (temp >> 6);
LDRB	R0, [SP, #4]
LSRS	R0, R0, #6
SXTB	R0, R0
;accel3_hw_M4.c,671 :: 		}
L_end_accel3_is_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_interrupt1
_accel3_is_z_high_interrupt1:
;accel3_hw_M4.c,673 :: 		int8_t accel3_is_z_high_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,676 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw_M4.c,678 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,680 :: 		temp &= (1<<5);
LDRB	R0, [SP, #4]
AND	R0, R0, #32
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,681 :: 		return (temp >> 5);
LSRS	R0, R0, #5
SXTB	R0, R0
;accel3_hw_M4.c,682 :: 		}
L_end_accel3_is_z_high_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_z_high_interrupt1
_accel3_is_z_low_interrupt1:
;accel3_hw_M4.c,684 :: 		int8_t accel3_is_z_low_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,686 :: 		uint8_t temp = 0;
MOVS	R0, #0
STRB	R0, [SP, #4]
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw_M4.c,687 :: 		uint8_t reg = INT1_SRC;
;accel3_hw_M4.c,689 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,691 :: 		temp &= (1<<4);
LDRB	R0, [SP, #4]
AND	R0, R0, #16
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,692 :: 		return (temp >> 4);
LSRS	R0, R0, #4
SXTB	R0, R0
;accel3_hw_M4.c,693 :: 		}
L_end_accel3_is_z_low_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_z_low_interrupt1
_accel3_is_y_high_interrupt1:
;accel3_hw_M4.c,695 :: 		int8_t accel3_is_y_high_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,698 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw_M4.c,700 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,702 :: 		temp &= ~(1<<3);
LDRB	R1, [SP, #4]
MOVW	R0, #65527
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,703 :: 		return (temp >> 3);
UXTB	R0, R0
LSRS	R0, R0, #3
SXTB	R0, R0
;accel3_hw_M4.c,704 :: 		}
L_end_accel3_is_y_high_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_y_high_interrupt1
_accel3_is_y_low_interrupt1:
;accel3_hw_M4.c,706 :: 		int8_t accel3_is_y_low_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,709 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw_M4.c,711 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,713 :: 		temp &= ~(1<<2);
LDRB	R1, [SP, #4]
MOVW	R0, #65531
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,714 :: 		return (temp >> 2);
UXTB	R0, R0
LSRS	R0, R0, #2
SXTB	R0, R0
;accel3_hw_M4.c,715 :: 		}
L_end_accel3_is_y_low_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_y_low_interrupt1
_accel3_is_x_high_interrupt1:
;accel3_hw_M4.c,717 :: 		int8_t accel3_is_x_high_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,720 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw_M4.c,722 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,724 :: 		temp &= (1<<1);
LDRB	R0, [SP, #4]
AND	R0, R0, #2
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,725 :: 		return (temp >> 1);
LSRS	R0, R0, #1
SXTB	R0, R0
;accel3_hw_M4.c,726 :: 		}
L_end_accel3_is_x_high_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_x_high_interrupt1
_accel3_is_x_low_interrupt1:
;accel3_hw_M4.c,728 :: 		int8_t accel3_is_x_low_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,731 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw_M4.c,733 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,735 :: 		temp &= (1);
LDRB	R0, [SP, #4]
AND	R0, R0, #1
STRB	R0, [SP, #4]
;accel3_hw_M4.c,736 :: 		return (temp);
SXTB	R0, R0
;accel3_hw_M4.c,737 :: 		}
L_end_accel3_is_x_low_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_x_low_interrupt1
_accel3_int1_set_threshold:
;accel3_hw_M4.c,739 :: 		int8_t accel3_int1_set_threshold(uint8_t threshold)
; threshold start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; threshold end address is: 0 (R0)
; threshold start address is: 0 (R0)
;accel3_hw_M4.c,741 :: 		uint8_t temp = threshold;
STRB	R0, [SP, #4]
;accel3_hw_M4.c,742 :: 		uint8_t reg = INT1_THS;
MOVS	R1, #50
STRB	R1, [SP, #5]
;accel3_hw_M4.c,744 :: 		if (threshold > (1<<7))
CMP	R0, #128
IT	LS
BLS	L_accel3_int1_set_threshold66
; threshold end address is: 0 (R0)
;accel3_hw_M4.c,745 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_int1_set_threshold
L_accel3_int1_set_threshold66:
;accel3_hw_M4.c,747 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #4
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,748 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw_M4.c,749 :: 		}
L_end_accel3_int1_set_threshold:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_int1_set_threshold
_accel3_int1_set_duration:
;accel3_hw_M4.c,751 :: 		int8_t accel3_int1_set_duration(uint8_t duration)
; duration start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; duration end address is: 0 (R0)
; duration start address is: 0 (R0)
;accel3_hw_M4.c,753 :: 		uint8_t temp = duration;
STRB	R0, [SP, #4]
; duration end address is: 0 (R0)
;accel3_hw_M4.c,754 :: 		uint8_t reg = INT1_DUR;
MOVS	R1, #51
STRB	R1, [SP, #5]
;accel3_hw_M4.c,756 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #4
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,757 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw_M4.c,758 :: 		}
L_end_accel3_int1_set_duration:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_int1_set_duration
_accel3_interrupt2_set_combination:
;accel3_hw_M4.c,760 :: 		int8_t accel3_interrupt2_set_combination(int_comb_t combination)
; combination start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; combination end address is: 0 (R0)
; combination start address is: 0 (R0)
;accel3_hw_M4.c,763 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw_M4.c,765 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,767 :: 		if ( combination == OR)
CMP	R0, #0
IT	NE
BNE	L_accel3_interrupt2_set_combination68
; combination end address is: 0 (R0)
;accel3_hw_M4.c,768 :: 		temp &= ~(1 << 7);
LDRB	R1, [SP, #8]
AND	R1, R1, #127
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_set_combination69
L_accel3_interrupt2_set_combination68:
;accel3_hw_M4.c,769 :: 		else if ( combination == AND)
; combination start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_set_combination70
; combination end address is: 0 (R0)
;accel3_hw_M4.c,770 :: 		temp |= (1 << 7);
LDRB	R1, [SP, #8]
ORR	R1, R1, #128
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_set_combination71
L_accel3_interrupt2_set_combination70:
;accel3_hw_M4.c,772 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_interrupt2_set_combination
L_accel3_interrupt2_set_combination71:
L_accel3_interrupt2_set_combination69:
;accel3_hw_M4.c,773 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,774 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw_M4.c,775 :: 		}
L_end_accel3_interrupt2_set_combination:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_set_combination
_accel3_interrupt2_z_high_enable:
;accel3_hw_M4.c,777 :: 		void accel3_interrupt2_z_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,780 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw_M4.c,782 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,784 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_z_high_enable72
; enable end address is: 0 (R0)
;accel3_hw_M4.c,785 :: 		temp |= ( 1 << 5 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #32
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_z_high_enable73
L_accel3_interrupt2_z_high_enable72:
;accel3_hw_M4.c,787 :: 		temp &= ~( 1 << 5);
LDRB	R2, [SP, #8]
MOVW	R1, #65503
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_z_high_enable73:
;accel3_hw_M4.c,789 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,790 :: 		}
L_end_accel3_interrupt2_z_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_z_high_enable
_accel3_interrupt2_z_low_enable:
;accel3_hw_M4.c,792 :: 		void accel3_interrupt2_z_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,795 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw_M4.c,797 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,799 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_z_low_enable74
; enable end address is: 0 (R0)
;accel3_hw_M4.c,800 :: 		temp |= ( 1 << 4 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #16
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_z_low_enable75
L_accel3_interrupt2_z_low_enable74:
;accel3_hw_M4.c,802 :: 		temp &= ~( 1 << 4);
LDRB	R2, [SP, #8]
MOVW	R1, #65519
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_z_low_enable75:
;accel3_hw_M4.c,804 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,805 :: 		}
L_end_accel3_interrupt2_z_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_z_low_enable
_accel3_interrupt2_y_high_enable:
;accel3_hw_M4.c,807 :: 		void accel3_interrupt2_y_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,810 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw_M4.c,812 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,814 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_y_high_enable76
; enable end address is: 0 (R0)
;accel3_hw_M4.c,815 :: 		temp |= ( 1 << 3 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #8
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_y_high_enable77
L_accel3_interrupt2_y_high_enable76:
;accel3_hw_M4.c,817 :: 		temp &= ~( 1 << 3 );
LDRB	R2, [SP, #8]
MOVW	R1, #65527
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_y_high_enable77:
;accel3_hw_M4.c,819 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,820 :: 		}
L_end_accel3_interrupt2_y_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_y_high_enable
_accel3_interrupt2_y_low_enable:
;accel3_hw_M4.c,822 :: 		void accel3_interrupt2_y_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,825 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw_M4.c,827 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,829 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_y_low_enable78
; enable end address is: 0 (R0)
;accel3_hw_M4.c,830 :: 		temp |= ( 1 << 2 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #4
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_y_low_enable79
L_accel3_interrupt2_y_low_enable78:
;accel3_hw_M4.c,832 :: 		temp &= ~( 1 << 2 );
LDRB	R2, [SP, #8]
MOVW	R1, #65531
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_y_low_enable79:
;accel3_hw_M4.c,834 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,835 :: 		}
L_end_accel3_interrupt2_y_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_y_low_enable
_accel3_interrupt2_x_high_enable:
;accel3_hw_M4.c,837 :: 		void accel3_interrupt2_x_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,840 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw_M4.c,842 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,844 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_x_high_enable80
; enable end address is: 0 (R0)
;accel3_hw_M4.c,845 :: 		temp |= ( 1 << 1 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #2
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_x_high_enable81
L_accel3_interrupt2_x_high_enable80:
;accel3_hw_M4.c,847 :: 		temp &= ~( 1 << 1);
LDRB	R2, [SP, #8]
MOVW	R1, #65533
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_x_high_enable81:
;accel3_hw_M4.c,849 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,850 :: 		}
L_end_accel3_interrupt2_x_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_x_high_enable
_accel3_interrupt2_x_low_enable:
;accel3_hw_M4.c,852 :: 		void accel3_interrupt2_x_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw_M4.c,855 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw_M4.c,857 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw_M4.c,859 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_x_low_enable82
; enable end address is: 0 (R0)
;accel3_hw_M4.c,860 :: 		temp |= 1;
LDRB	R1, [SP, #8]
ORR	R1, R1, #1
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_x_low_enable83
L_accel3_interrupt2_x_low_enable82:
;accel3_hw_M4.c,862 :: 		temp &= ~( 1 );
LDRB	R2, [SP, #8]
MOVW	R1, #65534
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_x_low_enable83:
;accel3_hw_M4.c,864 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,865 :: 		}
L_end_accel3_interrupt2_x_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_x_low_enable
_accel3_is_interrupt2:
;accel3_hw_M4.c,867 :: 		int8_t accel3_is_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,870 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw_M4.c,872 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,874 :: 		temp &= ( 1 << 6 );
LDRB	R0, [SP, #4]
AND	R0, R0, #64
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,875 :: 		return (temp >> 6); //Returns 1 if interrupt is triggered
LSRS	R0, R0, #6
SXTB	R0, R0
;accel3_hw_M4.c,876 :: 		}
L_end_accel3_is_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_interrupt2
_accel3_is_z_high_interrupt2:
;accel3_hw_M4.c,878 :: 		int8_t accel3_is_z_high_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,881 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw_M4.c,883 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,885 :: 		temp &= (1 << 5);
LDRB	R0, [SP, #4]
AND	R0, R0, #32
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,886 :: 		return (temp >> 5);
LSRS	R0, R0, #5
SXTB	R0, R0
;accel3_hw_M4.c,887 :: 		}
L_end_accel3_is_z_high_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_z_high_interrupt2
_accel3_is_z_low_interrupt2:
;accel3_hw_M4.c,889 :: 		int8_t accel3_is_z_low_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,892 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw_M4.c,894 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,896 :: 		temp &= (1 << 4);
LDRB	R0, [SP, #4]
AND	R0, R0, #16
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,897 :: 		return (temp >> 4);
LSRS	R0, R0, #4
SXTB	R0, R0
;accel3_hw_M4.c,898 :: 		}
L_end_accel3_is_z_low_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_z_low_interrupt2
_accel3_is_y_high_interrupt2:
;accel3_hw_M4.c,900 :: 		int8_t accel3_is_y_high_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,903 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw_M4.c,905 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,907 :: 		temp &= (1 << 3);
LDRB	R0, [SP, #4]
AND	R0, R0, #8
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,908 :: 		return (temp >> 3);
LSRS	R0, R0, #3
SXTB	R0, R0
;accel3_hw_M4.c,909 :: 		}
L_end_accel3_is_y_high_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_y_high_interrupt2
_accel3_is_y_low_interrupt2:
;accel3_hw_M4.c,911 :: 		int8_t accel3_is_y_low_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,914 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw_M4.c,916 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,918 :: 		temp &= (1 << 2);
LDRB	R0, [SP, #4]
AND	R0, R0, #4
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,919 :: 		return (temp >> 2);
LSRS	R0, R0, #2
SXTB	R0, R0
;accel3_hw_M4.c,920 :: 		}
L_end_accel3_is_y_low_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_y_low_interrupt2
_accel3_is_x_high_interrupt2:
;accel3_hw_M4.c,922 :: 		int8_t accel3_is_x_high_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,925 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw_M4.c,927 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,929 :: 		temp &= (1 << 1);
LDRB	R0, [SP, #4]
AND	R0, R0, #2
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw_M4.c,930 :: 		return (temp >> 1);
LSRS	R0, R0, #1
SXTB	R0, R0
;accel3_hw_M4.c,931 :: 		}
L_end_accel3_is_x_high_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_x_high_interrupt2
_accel3_is_x_low_interrupt2:
;accel3_hw_M4.c,933 :: 		int8_t accel3_is_x_low_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw_M4.c,936 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw_M4.c,938 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw_M4.c,940 :: 		temp &= (1);
LDRB	R0, [SP, #4]
AND	R0, R0, #1
STRB	R0, [SP, #4]
;accel3_hw_M4.c,941 :: 		return temp;
SXTB	R0, R0
;accel3_hw_M4.c,942 :: 		}
L_end_accel3_is_x_low_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_x_low_interrupt2
_accel3_int2_set_threshold:
;accel3_hw_M4.c,944 :: 		int8_t accel3_int2_set_threshold(uint8_t threshold)
; threshold start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; threshold end address is: 0 (R0)
; threshold start address is: 0 (R0)
;accel3_hw_M4.c,946 :: 		uint8_t temp = threshold;
STRB	R0, [SP, #4]
; threshold end address is: 0 (R0)
;accel3_hw_M4.c,947 :: 		uint8_t reg = INT2_THS;
MOVS	R1, #54
STRB	R1, [SP, #5]
;accel3_hw_M4.c,949 :: 		if ( temp > ( 1<<7 ) )
LDRB	R1, [SP, #4]
CMP	R1, #128
IT	LS
BLS	L_accel3_int2_set_threshold84
;accel3_hw_M4.c,950 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_int2_set_threshold
L_accel3_int2_set_threshold84:
;accel3_hw_M4.c,952 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #4
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,953 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw_M4.c,954 :: 		}
L_end_accel3_int2_set_threshold:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_int2_set_threshold
_accel3_int2_set_duration:
;accel3_hw_M4.c,956 :: 		int8_t accel3_int2_set_duration(uint8_t duration)
; duration start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; duration end address is: 0 (R0)
; duration start address is: 0 (R0)
;accel3_hw_M4.c,958 :: 		uint8_t temp = duration;
STRB	R0, [SP, #4]
; duration end address is: 0 (R0)
;accel3_hw_M4.c,959 :: 		uint8_t reg = INT2_DUR;
MOVS	R1, #55
STRB	R1, [SP, #5]
;accel3_hw_M4.c,961 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #4
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw_M4.c,962 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw_M4.c,963 :: 		}
L_end_accel3_int2_set_duration:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_int2_set_duration
_accel3_get_xyz_sensitivity:
;accel3_hw_M4.c,965 :: 		axes_sens_t* accel3_get_xyz_sensitivity( void )
SUB	SP, SP, #12
;accel3_hw_M4.c,968 :: 		sensitive_t.x = x_sens;
MOVW	R0, #lo_addr(accel3_hw_M4_x_sens+0)
MOVT	R0, #hi_addr(accel3_hw_M4_x_sens+0)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #4]
;accel3_hw_M4.c,969 :: 		sensitive_t.y = y_sens;
MOVW	R0, #lo_addr(accel3_hw_M4_y_sens+0)
MOVT	R0, #hi_addr(accel3_hw_M4_y_sens+0)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #6]
;accel3_hw_M4.c,970 :: 		sensitive_t.z = z_sens;
MOVW	R0, #lo_addr(accel3_hw_M4_z_sens+0)
MOVT	R0, #hi_addr(accel3_hw_M4_z_sens+0)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #8]
;accel3_hw_M4.c,972 :: 		return &sensitive_t;
ADD	R0, SP, #4
;accel3_hw_M4.c,973 :: 		}
L_end_accel3_get_xyz_sensitivity:
ADD	SP, SP, #12
BX	LR
; end of _accel3_get_xyz_sensitivity
