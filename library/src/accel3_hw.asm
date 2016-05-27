_accel3_hw_init:
;accel3_hw.c,51 :: 		uint8_t accel3_hw_init(uint8_t address, bus_mode_t mode)
; mode start address is: 4 (R1)
; address start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; mode end address is: 4 (R1)
; address end address is: 0 (R0)
; address start address is: 0 (R0)
; mode start address is: 4 (R1)
;accel3_hw.c,54 :: 		uint8_t reg = 0x0F;  //00110000
MOVS	R2, #15
STRB	R2, [SP, #5]
;accel3_hw.c,56 :: 		accel3_hal_init( address, mode );
; mode end address is: 4 (R1)
; address end address is: 0 (R0)
BL	_accel3_hal_init+0
;accel3_hw.c,57 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R3, SP, #4
ADD	R2, SP, #5
MOV	R1, R3
MOV	R0, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,58 :: 		initial_calibrate();
BL	accel3_hw_initial_calibrate+0
;accel3_hw.c,60 :: 		if (temp == 0x32)
LDRB	R2, [SP, #4]
CMP	R2, #50
IT	NE
BNE	L_accel3_hw_init0
;accel3_hw.c,61 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_accel3_hw_init
L_accel3_hw_init0:
;accel3_hw.c,63 :: 		return -1;
MOVS	R0, #-1
;accel3_hw.c,65 :: 		}
L_end_accel3_hw_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_hw_init
accel3_hw_initial_calibrate:
;accel3_hw.c,67 :: 		void static initial_calibrate( void )
;accel3_hw.c,69 :: 		x_sens = 192;
MOVS	R1, #192
SXTH	R1, R1
MOVW	R0, #lo_addr(accel3_hw_x_sens+0)
MOVT	R0, #hi_addr(accel3_hw_x_sens+0)
STRH	R1, [R0, #0]
;accel3_hw.c,70 :: 		y_sens = 199;
MOVS	R1, #199
SXTH	R1, R1
MOVW	R0, #lo_addr(accel3_hw_y_sens+0)
MOVT	R0, #hi_addr(accel3_hw_y_sens+0)
STRH	R1, [R0, #0]
;accel3_hw.c,71 :: 		z_sens = 344;
MOVW	R1, #344
SXTH	R1, R1
MOVW	R0, #lo_addr(accel3_hw_z_sens+0)
MOVT	R0, #hi_addr(accel3_hw_z_sens+0)
STRH	R1, [R0, #0]
;accel3_hw.c,73 :: 		}
L_end_initial_calibrate:
BX	LR
; end of accel3_hw_initial_calibrate
_set_x:
;accel3_hw.c,75 :: 		void set_x( int16_t x )
; x start address is: 0 (R0)
; x end address is: 0 (R0)
; x start address is: 0 (R0)
;accel3_hw.c,77 :: 		x_sens = x;
MOVW	R1, #lo_addr(accel3_hw_x_sens+0)
MOVT	R1, #hi_addr(accel3_hw_x_sens+0)
STRH	R0, [R1, #0]
; x end address is: 0 (R0)
;accel3_hw.c,78 :: 		}
L_end_set_x:
BX	LR
; end of _set_x
_set_y:
;accel3_hw.c,80 :: 		void set_y( int16_t y )
; y start address is: 0 (R0)
; y end address is: 0 (R0)
; y start address is: 0 (R0)
;accel3_hw.c,82 :: 		y_sens = y;
MOVW	R1, #lo_addr(accel3_hw_y_sens+0)
MOVT	R1, #hi_addr(accel3_hw_y_sens+0)
STRH	R0, [R1, #0]
; y end address is: 0 (R0)
;accel3_hw.c,83 :: 		}
L_end_set_y:
BX	LR
; end of _set_y
_set_z:
;accel3_hw.c,85 :: 		void set_z( int16_t z )
; z start address is: 0 (R0)
; z end address is: 0 (R0)
; z start address is: 0 (R0)
;accel3_hw.c,87 :: 		z_sens = z;
MOVW	R1, #lo_addr(accel3_hw_z_sens+0)
MOVT	R1, #hi_addr(accel3_hw_z_sens+0)
STRH	R0, [R1, #0]
; z end address is: 0 (R0)
;accel3_hw.c,88 :: 		}
L_end_set_z:
BX	LR
; end of _set_z
_accel3_set_mode:
;accel3_hw.c,90 :: 		int8_t accel3_set_mode(accel_mode_t mode)
; mode start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; mode end address is: 0 (R0)
; mode start address is: 0 (R0)
;accel3_hw.c,93 :: 		uint8_t reg = CTRL_REG1;
MOVS	R1, #32
STRB	R1, [SP, #9]
;accel3_hw.c,95 :: 		if (mode > 7)
CMP	R0, #7
IT	LS
BLS	L_accel3_set_mode2
; mode end address is: 0 (R0)
;accel3_hw.c,96 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_set_mode
L_accel3_set_mode2:
;accel3_hw.c,98 :: 		accel3_hal_read( &reg, &temp, 1 );
; mode start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,99 :: 		temp |= ( mode << 5 );
LSLS	R2, R0, #5
UXTH	R2, R2
; mode end address is: 0 (R0)
LDRB	R1, [SP, #8]
ORRS	R1, R2
STRB	R1, [SP, #8]
;accel3_hw.c,100 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,101 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw.c,102 :: 		}
L_end_accel3_set_mode:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_set_mode
_accel3_set_data_rate:
;accel3_hw.c,104 :: 		int8_t accel3_set_data_rate(data_rate_t data_rate)
; data_rate start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; data_rate end address is: 0 (R0)
; data_rate start address is: 0 (R0)
;accel3_hw.c,107 :: 		uint8_t reg = CTRL_REG1;
MOVS	R1, #32
STRB	R1, [SP, #9]
;accel3_hw.c,109 :: 		if (data_rate > 3)
CMP	R0, #3
IT	LS
BLS	L_accel3_set_data_rate3
; data_rate end address is: 0 (R0)
;accel3_hw.c,110 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_set_data_rate
L_accel3_set_data_rate3:
;accel3_hw.c,111 :: 		accel3_hal_read( &reg, &temp, 1 );
; data_rate start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,113 :: 		temp |= ( data_rate << 3 );
LSLS	R2, R0, #3
UXTH	R2, R2
; data_rate end address is: 0 (R0)
LDRB	R1, [SP, #8]
ORRS	R1, R2
STRB	R1, [SP, #8]
;accel3_hw.c,114 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,115 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw.c,116 :: 		}
L_end_accel3_set_data_rate:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_set_data_rate
_accel3_z_enable:
;accel3_hw.c,118 :: 		void accel3_z_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,121 :: 		uint8_t reg = CTRL_REG1;
MOVS	R1, #32
STRB	R1, [SP, #9]
;accel3_hw.c,123 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,124 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_z_enable4
;accel3_hw.c,125 :: 		temp |= (1 << 2);
LDRB	R1, [SP, #8]
ORR	R1, R1, #4
STRB	R1, [SP, #8]
L_accel3_z_enable4:
;accel3_hw.c,126 :: 		if (enable == false)
CMP	R0, #0
IT	NE
BNE	L_accel3_z_enable5
; enable end address is: 0 (R0)
;accel3_hw.c,127 :: 		temp &= ~(1 << 2);
LDRB	R2, [SP, #8]
MOVW	R1, #65531
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_z_enable5:
;accel3_hw.c,128 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,129 :: 		}
L_end_accel3_z_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_z_enable
_accel3_y_enable:
;accel3_hw.c,131 :: 		void accel3_y_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,134 :: 		uint8_t reg = CTRL_REG1;
MOVS	R1, #32
STRB	R1, [SP, #9]
;accel3_hw.c,136 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,137 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_y_enable6
;accel3_hw.c,138 :: 		temp |= (1 << 1);
LDRB	R1, [SP, #8]
ORR	R1, R1, #2
STRB	R1, [SP, #8]
L_accel3_y_enable6:
;accel3_hw.c,139 :: 		if (enable == false)
CMP	R0, #0
IT	NE
BNE	L_accel3_y_enable7
; enable end address is: 0 (R0)
;accel3_hw.c,140 :: 		temp &= ~(1 << 1);
LDRB	R2, [SP, #8]
MOVW	R1, #65533
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_y_enable7:
;accel3_hw.c,141 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,142 :: 		}
L_end_accel3_y_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_y_enable
_accel3_x_enable:
;accel3_hw.c,144 :: 		void accel3_x_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,147 :: 		uint8_t reg = CTRL_REG1;
MOVS	R1, #32
STRB	R1, [SP, #9]
;accel3_hw.c,149 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,150 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_x_enable8
; enable end address is: 0 (R0)
;accel3_hw.c,151 :: 		temp |= 1;
LDRB	R1, [SP, #8]
ORR	R1, R1, #1
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_x_enable9
L_accel3_x_enable8:
;accel3_hw.c,153 :: 		temp &= ~1;
LDRB	R2, [SP, #8]
MOVW	R1, #65534
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_x_enable9:
;accel3_hw.c,154 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,155 :: 		}
L_end_accel3_x_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_x_enable
_accel3_reboot:
;accel3_hw.c,157 :: 		void accel3_reboot()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,160 :: 		uint8_t reg = CTRL_REG2;
MOVS	R0, #33
STRB	R0, [SP, #5]
;accel3_hw.c,162 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,163 :: 		temp |= (1<<7);
LDRB	R0, [SP, #4]
ORR	R0, R0, #128
STRB	R0, [SP, #4]
;accel3_hw.c,164 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,165 :: 		}
L_end_accel3_reboot:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_reboot
_accel3_hp_filter_mode_select:
;accel3_hw.c,167 :: 		int8_t accel3_hp_filter_mode_select(hp_filter_mode_t mode)
; mode start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; mode end address is: 0 (R0)
; mode start address is: 0 (R0)
;accel3_hw.c,170 :: 		uint8_t reg = CTRL_REG2;
MOVS	R1, #33
STRB	R1, [SP, #9]
;accel3_hw.c,172 :: 		if (mode > 2)
CMP	R0, #2
IT	LS
BLS	L_accel3_hp_filter_mode_select10
; mode end address is: 0 (R0)
;accel3_hw.c,173 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_hp_filter_mode_select
L_accel3_hp_filter_mode_select10:
;accel3_hw.c,175 :: 		accel3_hal_read( &reg, &temp, 1 );
; mode start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,176 :: 		temp |= mode;
LDRB	R1, [SP, #8]
ORRS	R1, R0
; mode end address is: 0 (R0)
STRB	R1, [SP, #8]
;accel3_hw.c,177 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,178 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw.c,179 :: 		}
L_end_accel3_hp_filter_mode_select:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_hp_filter_mode_select
_accel3_filtered_data_selection_enable:
;accel3_hw.c,181 :: 		void accel3_filtered_data_selection_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,184 :: 		uint8_t reg = CTRL_REG2;
MOVS	R1, #33
STRB	R1, [SP, #9]
;accel3_hw.c,186 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,188 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_filtered_data_selection_enable11
; enable end address is: 0 (R0)
;accel3_hw.c,189 :: 		temp |= (1<<4);
LDRB	R1, [SP, #8]
ORR	R1, R1, #16
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_filtered_data_selection_enable12
L_accel3_filtered_data_selection_enable11:
;accel3_hw.c,191 :: 		temp &= ~(1<<4);
LDRB	R2, [SP, #8]
MOVW	R1, #65519
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_filtered_data_selection_enable12:
;accel3_hw.c,192 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,193 :: 		}
L_end_accel3_filtered_data_selection_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_filtered_data_selection_enable
_accel3_hp2_filter_enable:
;accel3_hw.c,195 :: 		void accel3_hp2_filter_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,198 :: 		uint8_t reg = CTRL_REG2;
MOVS	R1, #33
STRB	R1, [SP, #9]
;accel3_hw.c,200 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,202 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_hp2_filter_enable13
; enable end address is: 0 (R0)
;accel3_hw.c,203 :: 		temp |= (1<<3);
LDRB	R1, [SP, #8]
ORR	R1, R1, #8
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_hp2_filter_enable14
L_accel3_hp2_filter_enable13:
;accel3_hw.c,205 :: 		temp &= ~(1<<3);
LDRB	R2, [SP, #8]
MOVW	R1, #65527
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_hp2_filter_enable14:
;accel3_hw.c,206 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,207 :: 		}
L_end_accel3_hp2_filter_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_hp2_filter_enable
_accel3_hp1_filter_enable:
;accel3_hw.c,209 :: 		void accel3_hp1_filter_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,212 :: 		uint8_t reg = CTRL_REG2;
MOVS	R1, #33
STRB	R1, [SP, #9]
;accel3_hw.c,214 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,216 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_hp1_filter_enable15
; enable end address is: 0 (R0)
;accel3_hw.c,217 :: 		temp |= (1<<2);
LDRB	R1, [SP, #8]
ORR	R1, R1, #4
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_hp1_filter_enable16
L_accel3_hp1_filter_enable15:
;accel3_hw.c,219 :: 		temp &= ~(1<<2);
LDRB	R2, [SP, #8]
MOVW	R1, #65531
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_hp1_filter_enable16:
;accel3_hw.c,220 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,221 :: 		}
L_end_accel3_hp1_filter_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_hp1_filter_enable
_accel3_hp_cutoff_freq_config:
;accel3_hw.c,223 :: 		int8_t accel3_hp_cutoff_freq_config(cutoff_freq_t freq)
; freq start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; freq end address is: 0 (R0)
; freq start address is: 0 (R0)
;accel3_hw.c,226 :: 		uint8_t reg = CTRL_REG2;
MOVS	R1, #33
STRB	R1, [SP, #9]
;accel3_hw.c,228 :: 		if ( freq > 3)
CMP	R0, #3
IT	LS
BLS	L_accel3_hp_cutoff_freq_config17
; freq end address is: 0 (R0)
;accel3_hw.c,229 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_hp_cutoff_freq_config
L_accel3_hp_cutoff_freq_config17:
;accel3_hw.c,230 :: 		accel3_hal_read( &reg, &temp, 1 );
; freq start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,231 :: 		temp |= freq;
LDRB	R1, [SP, #8]
ORRS	R1, R0
; freq end address is: 0 (R0)
STRB	R1, [SP, #8]
;accel3_hw.c,232 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,233 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw.c,234 :: 		}
L_end_accel3_hp_cutoff_freq_config:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_hp_cutoff_freq_config
_accel3_interrupt_active_level:
;accel3_hw.c,236 :: 		int8_t accel3_interrupt_active_level(level_t level)
; level start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; level end address is: 0 (R0)
; level start address is: 0 (R0)
;accel3_hw.c,239 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw.c,241 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,243 :: 		if (level == LOW)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt_active_level18
; level end address is: 0 (R0)
;accel3_hw.c,244 :: 		temp |= 0x80;
LDRB	R1, [SP, #8]
ORR	R1, R1, #128
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt_active_level19
L_accel3_interrupt_active_level18:
;accel3_hw.c,245 :: 		else if (level == HIGH)
; level start address is: 0 (R0)
CMP	R0, #0
IT	NE
BNE	L_accel3_interrupt_active_level20
; level end address is: 0 (R0)
;accel3_hw.c,246 :: 		temp &= ~0x80;
LDRB	R1, [SP, #8]
AND	R1, R1, #127
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt_active_level21
L_accel3_interrupt_active_level20:
;accel3_hw.c,247 :: 		else return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_interrupt_active_level
L_accel3_interrupt_active_level21:
L_accel3_interrupt_active_level19:
;accel3_hw.c,249 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,250 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw.c,251 :: 		}
L_end_accel3_interrupt_active_level:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt_active_level
_accel3_interrupt_pad_selection:
;accel3_hw.c,253 :: 		int8_t accel3_interrupt_pad_selection(interrupt_pad_t select)
; select start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; select end address is: 0 (R0)
; select start address is: 0 (R0)
;accel3_hw.c,256 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw.c,258 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,259 :: 		if ( select == PUSH_PULL)
CMP	R0, #0
IT	NE
BNE	L_accel3_interrupt_pad_selection22
; select end address is: 0 (R0)
;accel3_hw.c,260 :: 		temp &= ~(1 << 6);
LDRB	R2, [SP, #8]
MOVW	R1, #65471
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt_pad_selection23
L_accel3_interrupt_pad_selection22:
;accel3_hw.c,261 :: 		else if (select == OPEN_DRAIN )
; select start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt_pad_selection24
; select end address is: 0 (R0)
;accel3_hw.c,262 :: 		temp |= ( 1 << 6);
LDRB	R1, [SP, #8]
ORR	R1, R1, #64
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt_pad_selection25
L_accel3_interrupt_pad_selection24:
;accel3_hw.c,264 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_interrupt_pad_selection
L_accel3_interrupt_pad_selection25:
L_accel3_interrupt_pad_selection23:
;accel3_hw.c,266 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,267 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw.c,268 :: 		}
L_end_accel3_interrupt_pad_selection:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt_pad_selection
_accel3_latched_interrupt1_enable:
;accel3_hw.c,270 :: 		void accel3_latched_interrupt1_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,273 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw.c,275 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,277 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_latched_interrupt1_enable26
; enable end address is: 0 (R0)
;accel3_hw.c,278 :: 		temp |= ( 1<<2 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #4
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_latched_interrupt1_enable27
L_accel3_latched_interrupt1_enable26:
;accel3_hw.c,280 :: 		temp &= ~(1<<2);
LDRB	R2, [SP, #8]
MOVW	R1, #65531
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_latched_interrupt1_enable27:
;accel3_hw.c,282 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,283 :: 		}
L_end_accel3_latched_interrupt1_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_latched_interrupt1_enable
_accel3_latched_interrupt2_enable:
;accel3_hw.c,285 :: 		void accel3_latched_interrupt2_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,288 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw.c,290 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,292 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_latched_interrupt2_enable28
; enable end address is: 0 (R0)
;accel3_hw.c,293 :: 		temp |= (1<<3);
LDRB	R1, [SP, #8]
ORR	R1, R1, #8
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_latched_interrupt2_enable29
L_accel3_latched_interrupt2_enable28:
;accel3_hw.c,295 :: 		temp &= ~(1<<3);
LDRB	R2, [SP, #8]
MOVW	R1, #65527
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_latched_interrupt2_enable29:
;accel3_hw.c,296 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,297 :: 		}
L_end_accel3_latched_interrupt2_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_latched_interrupt2_enable
_accel3_int1_signal_config:
;accel3_hw.c,299 :: 		int8_t accel3_int1_signal_config(int_signal_t config)
; config start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; config end address is: 0 (R0)
; config start address is: 0 (R0)
;accel3_hw.c,302 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw.c,304 :: 		accel3_hal_read( &reg, &temp, 1);
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,305 :: 		temp |= config;
LDRB	R1, [SP, #8]
ORRS	R1, R0
; config end address is: 0 (R0)
STRB	R1, [SP, #8]
;accel3_hw.c,306 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,307 :: 		return 1;
MOVS	R0, #1
SXTB	R0, R0
;accel3_hw.c,308 :: 		}
L_end_accel3_int1_signal_config:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_int1_signal_config
_accel3_int2_signal_config:
;accel3_hw.c,310 :: 		int8_t accel3_int2_signal_config(int_signal_t config)
; config start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; config end address is: 0 (R0)
; config start address is: 0 (R0)
;accel3_hw.c,313 :: 		uint8_t reg = CTRL_REG3;
MOVS	R1, #34
STRB	R1, [SP, #9]
;accel3_hw.c,315 :: 		if ( (config > 3) || (config < 0) )
CMP	R0, #3
IT	HI
BHI	L__accel3_int2_signal_config85
CMP	R0, #0
IT	CC
BCC	L__accel3_int2_signal_config84
IT	AL
BAL	L_accel3_int2_signal_config32
; config end address is: 0 (R0)
L__accel3_int2_signal_config85:
L__accel3_int2_signal_config84:
;accel3_hw.c,316 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_int2_signal_config
L_accel3_int2_signal_config32:
;accel3_hw.c,318 :: 		accel3_hal_read( &reg, &temp, 1 );
; config start address is: 0 (R0)
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,319 :: 		temp |= ( config << 3 );
LSLS	R2, R0, #3
UXTH	R2, R2
; config end address is: 0 (R0)
LDRB	R1, [SP, #8]
ORRS	R1, R2
STRB	R1, [SP, #8]
;accel3_hw.c,320 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,321 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw.c,322 :: 		}
L_end_accel3_int2_signal_config:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_int2_signal_config
_accel3_bdu_enable:
;accel3_hw.c,324 :: 		void accel3_bdu_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,327 :: 		uint8_t reg = CTRL_REG4;
MOVS	R1, #35
STRB	R1, [SP, #9]
;accel3_hw.c,329 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,331 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_bdu_enable33
; enable end address is: 0 (R0)
;accel3_hw.c,332 :: 		temp |= (1<<7);
LDRB	R1, [SP, #8]
ORR	R1, R1, #128
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_bdu_enable34
L_accel3_bdu_enable33:
;accel3_hw.c,334 :: 		temp &= ~(1<<7);
LDRB	R1, [SP, #8]
AND	R1, R1, #127
STRB	R1, [SP, #8]
L_accel3_bdu_enable34:
;accel3_hw.c,335 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,336 :: 		}
L_end_accel3_bdu_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_bdu_enable
_accel3_ble_enable:
;accel3_hw.c,338 :: 		void accel3_ble_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,341 :: 		uint8_t reg = CTRL_REG4;
MOVS	R1, #35
STRB	R1, [SP, #9]
;accel3_hw.c,343 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,345 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_ble_enable35
; enable end address is: 0 (R0)
;accel3_hw.c,346 :: 		temp |= (1<<6);
LDRB	R1, [SP, #8]
ORR	R1, R1, #64
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_ble_enable36
L_accel3_ble_enable35:
;accel3_hw.c,348 :: 		temp &= ~(1<<6);
LDRB	R2, [SP, #8]
MOVW	R1, #65471
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_ble_enable36:
;accel3_hw.c,349 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,350 :: 		}
L_end_accel3_ble_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_ble_enable
_accel3_set_full_scale:
;accel3_hw.c,352 :: 		int8_t accel3_set_full_scale(full_scale_t scale)
; scale start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; scale end address is: 0 (R0)
; scale start address is: 0 (R0)
;accel3_hw.c,355 :: 		uint8_t reg = CTRL_REG4;
MOVS	R1, #35
STRB	R1, [SP, #9]
;accel3_hw.c,357 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,359 :: 		if ((scale > 3) || (scale < 0))
CMP	R0, #3
IT	HI
BHI	L__accel3_set_full_scale88
CMP	R0, #0
IT	CC
BCC	L__accel3_set_full_scale87
IT	AL
BAL	L_accel3_set_full_scale39
; scale end address is: 0 (R0)
L__accel3_set_full_scale88:
L__accel3_set_full_scale87:
;accel3_hw.c,360 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_set_full_scale
L_accel3_set_full_scale39:
;accel3_hw.c,362 :: 		temp |= ( scale << 4 );
; scale start address is: 0 (R0)
LSLS	R2, R0, #4
UXTH	R2, R2
; scale end address is: 0 (R0)
LDRB	R1, [SP, #8]
ORRS	R1, R2
STRB	R1, [SP, #8]
;accel3_hw.c,363 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,364 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw.c,365 :: 		}
L_end_accel3_set_full_scale:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_set_full_scale
_accel3_get_full_scale:
;accel3_hw.c,367 :: 		full_scale_t accel3_get_full_scale( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,370 :: 		uint8_t reg = CTRL_REG4;
MOVS	R0, #35
STRB	R0, [SP, #5]
;accel3_hw.c,372 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,373 :: 		temp &= ~(0xC0);
LDRB	R0, [SP, #4]
AND	R0, R0, #63
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,374 :: 		temp = temp >> 4;
LSRS	R0, R0, #4
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,375 :: 		if( temp == 0x00 )
CMP	R0, #0
IT	NE
BNE	L_accel3_get_full_scale40
;accel3_hw.c,376 :: 		return SCALE_100_G;
MOVS	R0, #0
IT	AL
BAL	L_end_accel3_get_full_scale
L_accel3_get_full_scale40:
;accel3_hw.c,377 :: 		else if( temp == 0x01 )
LDRB	R0, [SP, #4]
CMP	R0, #1
IT	NE
BNE	L_accel3_get_full_scale42
;accel3_hw.c,378 :: 		return SCALE_200_G;
MOVS	R0, #1
IT	AL
BAL	L_end_accel3_get_full_scale
L_accel3_get_full_scale42:
;accel3_hw.c,379 :: 		else if( temp == 0x03 )
LDRB	R0, [SP, #4]
CMP	R0, #3
IT	NE
BNE	L_accel3_get_full_scale44
;accel3_hw.c,380 :: 		return SCALE_400_G;
MOVS	R0, #3
IT	AL
BAL	L_end_accel3_get_full_scale
L_accel3_get_full_scale44:
;accel3_hw.c,382 :: 		}
L_end_accel3_get_full_scale:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_get_full_scale
_accel3_sleep_to_wake_enable:
;accel3_hw.c,384 :: 		void accel3_sleep_to_wake_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,387 :: 		uint8_t reg = CTRL_REG5;
MOVS	R1, #36
STRB	R1, [SP, #9]
;accel3_hw.c,389 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,390 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_sleep_to_wake_enable45
; enable end address is: 0 (R0)
;accel3_hw.c,391 :: 		temp |= (3);
LDRB	R1, [SP, #8]
ORR	R1, R1, #3
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_sleep_to_wake_enable46
L_accel3_sleep_to_wake_enable45:
;accel3_hw.c,393 :: 		temp &= ~(3);
LDRB	R2, [SP, #8]
MOVW	R1, #65532
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_sleep_to_wake_enable46:
;accel3_hw.c,394 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,395 :: 		}
L_end_accel3_sleep_to_wake_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_sleep_to_wake_enable
_accel3_hp_filter_reset:
;accel3_hw.c,397 :: 		void  accel3_hp_filter_reset()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,400 :: 		uint8_t reg = HP_FILTER_RESET;
MOVS	R0, #37
STRB	R0, [SP, #5]
;accel3_hw.c,402 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,403 :: 		}
L_end_accel3_hp_filter_reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_hp_filter_reset
_accel3_hp_filter_set_reference:
;accel3_hw.c,405 :: 		void accel3_hp_filter_set_reference(uint8_t reference)
; reference start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; reference end address is: 0 (R0)
; reference start address is: 0 (R0)
;accel3_hw.c,407 :: 		uint8_t temp = reference;
STRB	R0, [SP, #4]
; reference end address is: 0 (R0)
;accel3_hw.c,408 :: 		uint8_t reg = REFERENCE_REG;
MOVS	R1, #38
STRB	R1, [SP, #5]
;accel3_hw.c,410 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #4
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,411 :: 		}
L_end_accel3_hp_filter_set_reference:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_hp_filter_set_reference
_accel3_is_overrun_all:
;accel3_hw.c,413 :: 		int8_t accel3_is_overrun_all()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,416 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw.c,418 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,420 :: 		return (temp >> 7);
LDRB	R0, [SP, #4]
LSRS	R0, R0, #7
SXTB	R0, R0
;accel3_hw.c,421 :: 		}
L_end_accel3_is_overrun_all:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_overrun_all
_accel3_is_overrun_x:
;accel3_hw.c,423 :: 		int8_t accel3_is_overrun_x()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,426 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw.c,428 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,430 :: 		temp &= ~(1 << 4);
LDRB	R1, [SP, #4]
MOVW	R0, #65519
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw.c,431 :: 		return ( temp >> 4 );
UXTB	R0, R0
LSRS	R0, R0, #4
SXTB	R0, R0
;accel3_hw.c,432 :: 		}
L_end_accel3_is_overrun_x:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_overrun_x
_accel3_is_overrun_y:
;accel3_hw.c,434 :: 		int8_t accel3_is_overrun_y()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,437 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw.c,439 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,441 :: 		temp &= ~(1 << 5);
LDRB	R1, [SP, #4]
MOVW	R0, #65503
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw.c,442 :: 		return ( temp >> 5 );
UXTB	R0, R0
LSRS	R0, R0, #5
SXTB	R0, R0
;accel3_hw.c,443 :: 		}
L_end_accel3_is_overrun_y:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_overrun_y
_accel3_is_overrun_z:
;accel3_hw.c,445 :: 		int8_t accel3_is_overrun_z()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,448 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw.c,450 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,452 :: 		temp &= ~(1 << 6);
LDRB	R1, [SP, #4]
MOVW	R0, #65471
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw.c,453 :: 		return ( temp >> 6 );
UXTB	R0, R0
LSRS	R0, R0, #6
SXTB	R0, R0
;accel3_hw.c,454 :: 		}
L_end_accel3_is_overrun_z:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_overrun_z
_accel3_is_new_data_all:
;accel3_hw.c,456 :: 		int8_t accel3_is_new_data_all()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,459 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw.c,461 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,463 :: 		temp &= (1 << 3);
LDRB	R0, [SP, #4]
AND	R0, R0, #8
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,464 :: 		return ( temp >> 3 );
LSRS	R0, R0, #3
SXTB	R0, R0
;accel3_hw.c,465 :: 		}
L_end_accel3_is_new_data_all:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_new_data_all
_accel3_is_new_data_x:
;accel3_hw.c,467 :: 		int8_t accel3_is_new_data_x()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,470 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw.c,472 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,474 :: 		temp &= (1);
LDRB	R0, [SP, #4]
AND	R0, R0, #1
STRB	R0, [SP, #4]
;accel3_hw.c,475 :: 		return temp;
SXTB	R0, R0
;accel3_hw.c,476 :: 		}
L_end_accel3_is_new_data_x:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_new_data_x
_accel3_is_new_data_y:
;accel3_hw.c,478 :: 		int8_t accel3_is_new_data_y()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,481 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw.c,483 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,485 :: 		temp &= (1 << 1);
LDRB	R0, [SP, #4]
AND	R0, R0, #2
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,486 :: 		return ( temp >> 1 );
LSRS	R0, R0, #1
SXTB	R0, R0
;accel3_hw.c,487 :: 		}
L_end_accel3_is_new_data_y:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_new_data_y
_accel3_is_new_data_z:
;accel3_hw.c,490 :: 		int8_t accel3_is_new_data_z()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,493 :: 		uint8_t reg = STATUS_REG;
MOVS	R0, #39
STRB	R0, [SP, #5]
;accel3_hw.c,495 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,497 :: 		temp &= (1 << 2);
LDRB	R0, [SP, #4]
AND	R0, R0, #4
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,498 :: 		return ( temp >> 2 );
LSRS	R0, R0, #2
SXTB	R0, R0
;accel3_hw.c,499 :: 		}
L_end_accel3_is_new_data_z:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_new_data_z
_accel3_read_acc_x:
;accel3_hw.c,501 :: 		int16_t accel3_read_acc_x()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,507 :: 		uint8_t reg_1 = OUT_X_L;
MOVS	R0, #40
STRB	R0, [SP, #6]
MOVS	R0, #41
STRB	R0, [SP, #7]
;accel3_hw.c,508 :: 		uint8_t reg_2 = OUT_X_H;
;accel3_hw.c,510 :: 		accel3_hal_read( &reg_1, &temp_1, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #6
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,511 :: 		accel3_hal_read( &reg_2, &temp_2, 1 );
ADD	R1, SP, #5
ADD	R0, SP, #7
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,514 :: 		retval = ((int16_t) temp_2 ) << 8;
LDRSB	R0, [SP, #5]
LSLS	R1, R0, #8
SXTH	R1, R1
;accel3_hw.c,515 :: 		retval |= (int16_t)temp_1;
LDRSB	R0, [SP, #4]
ORR	R0, R1, R0, LSL #0
;accel3_hw.c,517 :: 		return retval;
;accel3_hw.c,518 :: 		}
L_end_accel3_read_acc_x:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_read_acc_x
_accel3_read_acc_y:
;accel3_hw.c,520 :: 		int16_t accel3_read_acc_y()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,525 :: 		uint8_t reg_1 = OUT_Y_L;
MOVS	R0, #42
STRB	R0, [SP, #6]
MOVS	R0, #43
STRB	R0, [SP, #7]
;accel3_hw.c,526 :: 		uint8_t reg_2 = OUT_Y_H;
;accel3_hw.c,528 :: 		accel3_hal_read( &reg_1, &temp_1, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #6
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,529 :: 		accel3_hal_read( &reg_2, &temp_2, 1 );
ADD	R1, SP, #5
ADD	R0, SP, #7
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,531 :: 		retval = ((int16_t) temp_2 ) << 8;
LDRSB	R0, [SP, #5]
LSLS	R1, R0, #8
SXTH	R1, R1
;accel3_hw.c,532 :: 		retval |= (int16_t)temp_1;
LDRSB	R0, [SP, #4]
ORR	R0, R1, R0, LSL #0
;accel3_hw.c,534 :: 		return retval;
;accel3_hw.c,535 :: 		}
L_end_accel3_read_acc_y:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_read_acc_y
_accel3_read_acc_z:
;accel3_hw.c,537 :: 		int16_t accel3_read_acc_z()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,542 :: 		uint8_t reg_1 = OUT_Z_L;
MOVS	R0, #44
STRB	R0, [SP, #6]
MOVS	R0, #45
STRB	R0, [SP, #7]
;accel3_hw.c,543 :: 		uint8_t reg_2 = OUT_Z_H;
;accel3_hw.c,545 :: 		accel3_hal_read( &reg_1, &temp_1, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #6
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,546 :: 		accel3_hal_read( &reg_2, &temp_2, 1 );
ADD	R1, SP, #5
ADD	R0, SP, #7
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,548 :: 		retval = ((int16_t) temp_2 ) << 8;
LDRSB	R0, [SP, #5]
LSLS	R1, R0, #8
SXTH	R1, R1
;accel3_hw.c,549 :: 		retval |= (int16_t)temp_1;
LDRSB	R0, [SP, #4]
ORR	R0, R1, R0, LSL #0
;accel3_hw.c,551 :: 		return retval;
;accel3_hw.c,552 :: 		}
L_end_accel3_read_acc_z:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_read_acc_z
_accel3_interrupt1_set_combination:
;accel3_hw.c,554 :: 		int8_t accel3_interrupt1_set_combination(int_comb_t combination)
; combination start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; combination end address is: 0 (R0)
; combination start address is: 0 (R0)
;accel3_hw.c,557 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw.c,559 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,561 :: 		if ( combination == OR)
CMP	R0, #0
IT	NE
BNE	L_accel3_interrupt1_set_combination47
; combination end address is: 0 (R0)
;accel3_hw.c,562 :: 		temp &= ~(1 << 7);
LDRB	R1, [SP, #8]
AND	R1, R1, #127
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_set_combination48
L_accel3_interrupt1_set_combination47:
;accel3_hw.c,563 :: 		else if ( combination == AND)
; combination start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_set_combination49
; combination end address is: 0 (R0)
;accel3_hw.c,564 :: 		temp |= (1 << 7);
LDRB	R1, [SP, #8]
ORR	R1, R1, #128
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_set_combination50
L_accel3_interrupt1_set_combination49:
;accel3_hw.c,566 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_interrupt1_set_combination
L_accel3_interrupt1_set_combination50:
L_accel3_interrupt1_set_combination48:
;accel3_hw.c,567 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,568 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw.c,569 :: 		}
L_end_accel3_interrupt1_set_combination:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_set_combination
_accel3_interrupt1_z_high_enable:
;accel3_hw.c,571 :: 		void accel3_interrupt1_z_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,574 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw.c,576 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,578 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_z_high_enable51
; enable end address is: 0 (R0)
;accel3_hw.c,579 :: 		temp |= (1 << 5);
LDRB	R1, [SP, #8]
ORR	R1, R1, #32
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_z_high_enable52
L_accel3_interrupt1_z_high_enable51:
;accel3_hw.c,581 :: 		temp &= ~(1 << 5);
LDRB	R2, [SP, #8]
MOVW	R1, #65503
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_z_high_enable52:
;accel3_hw.c,583 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,584 :: 		}
L_end_accel3_interrupt1_z_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_z_high_enable
_accel3_interrupt1_z_low_enable:
;accel3_hw.c,586 :: 		void accel3_interrupt1_z_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,589 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw.c,591 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,593 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_z_low_enable53
; enable end address is: 0 (R0)
;accel3_hw.c,594 :: 		temp |= (1 << 4);
LDRB	R1, [SP, #8]
ORR	R1, R1, #16
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_z_low_enable54
L_accel3_interrupt1_z_low_enable53:
;accel3_hw.c,596 :: 		temp &= ~(1 << 4);
LDRB	R2, [SP, #8]
MOVW	R1, #65519
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_z_low_enable54:
;accel3_hw.c,597 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,598 :: 		}
L_end_accel3_interrupt1_z_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_z_low_enable
_accel3_interrupt1_y_high_enable:
;accel3_hw.c,600 :: 		void accel3_interrupt1_y_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,603 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw.c,605 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,607 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_y_high_enable55
; enable end address is: 0 (R0)
;accel3_hw.c,608 :: 		temp |= (1 << 3);
LDRB	R1, [SP, #8]
ORR	R1, R1, #8
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_y_high_enable56
L_accel3_interrupt1_y_high_enable55:
;accel3_hw.c,610 :: 		temp &= ~(1 << 3);
LDRB	R2, [SP, #8]
MOVW	R1, #65527
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_y_high_enable56:
;accel3_hw.c,611 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,612 :: 		}
L_end_accel3_interrupt1_y_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_y_high_enable
_accel3_interrupt1_y_low_enable:
;accel3_hw.c,614 :: 		void accel3_interrupt1_y_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,617 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw.c,619 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,621 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_y_low_enable57
; enable end address is: 0 (R0)
;accel3_hw.c,622 :: 		temp |= (1 << 2);
LDRB	R1, [SP, #8]
ORR	R1, R1, #4
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_y_low_enable58
L_accel3_interrupt1_y_low_enable57:
;accel3_hw.c,624 :: 		temp &= ~(1 << 2);
LDRB	R2, [SP, #8]
MOVW	R1, #65531
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_y_low_enable58:
;accel3_hw.c,625 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,626 :: 		}
L_end_accel3_interrupt1_y_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_y_low_enable
_accel3_interrupt1_x_high_enable:
;accel3_hw.c,628 :: 		void accel3_interrupt1_x_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,631 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw.c,633 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,635 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_x_high_enable59
; enable end address is: 0 (R0)
;accel3_hw.c,636 :: 		temp |= (1 << 1);
LDRB	R1, [SP, #8]
ORR	R1, R1, #2
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_x_high_enable60
L_accel3_interrupt1_x_high_enable59:
;accel3_hw.c,638 :: 		temp &= ~(1 << 1);
LDRB	R2, [SP, #8]
MOVW	R1, #65533
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_x_high_enable60:
;accel3_hw.c,639 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,640 :: 		}
L_end_accel3_interrupt1_x_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_x_high_enable
_accel3_interrupt1_x_low_enable:
;accel3_hw.c,642 :: 		void accel3_interrupt1_x_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,645 :: 		uint8_t reg = INT1_CFG;
MOVS	R1, #48
STRB	R1, [SP, #9]
;accel3_hw.c,647 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,649 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt1_x_low_enable61
; enable end address is: 0 (R0)
;accel3_hw.c,650 :: 		temp |= 1;
LDRB	R1, [SP, #8]
ORR	R1, R1, #1
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt1_x_low_enable62
L_accel3_interrupt1_x_low_enable61:
;accel3_hw.c,652 :: 		temp &= ~(1);
LDRB	R2, [SP, #8]
MOVW	R1, #65534
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt1_x_low_enable62:
;accel3_hw.c,653 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,654 :: 		}
L_end_accel3_interrupt1_x_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt1_x_low_enable
_accel3_is_interrupt1:
;accel3_hw.c,656 :: 		int8_t accel3_is_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,659 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw.c,661 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,663 :: 		return (temp >> 6);
LDRB	R0, [SP, #4]
LSRS	R0, R0, #6
SXTB	R0, R0
;accel3_hw.c,664 :: 		}
L_end_accel3_is_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_interrupt1
_accel3_is_z_high_interrupt1:
;accel3_hw.c,666 :: 		int8_t accel3_is_z_high_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,669 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw.c,671 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,673 :: 		temp &= (1<<5);
LDRB	R0, [SP, #4]
AND	R0, R0, #32
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,674 :: 		return (temp >> 5);
LSRS	R0, R0, #5
SXTB	R0, R0
;accel3_hw.c,675 :: 		}
L_end_accel3_is_z_high_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_z_high_interrupt1
_accel3_is_z_low_interrupt1:
;accel3_hw.c,677 :: 		int8_t accel3_is_z_low_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,679 :: 		uint8_t temp = 0;
MOVS	R0, #0
STRB	R0, [SP, #4]
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw.c,680 :: 		uint8_t reg = INT1_SRC;
;accel3_hw.c,682 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,684 :: 		temp &= (1<<4);
LDRB	R0, [SP, #4]
AND	R0, R0, #16
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,685 :: 		return (temp >> 4);
LSRS	R0, R0, #4
SXTB	R0, R0
;accel3_hw.c,686 :: 		}
L_end_accel3_is_z_low_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_z_low_interrupt1
_accel3_is_y_high_interrupt1:
;accel3_hw.c,688 :: 		int8_t accel3_is_y_high_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,691 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw.c,693 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,695 :: 		temp &= ~(1<<3);
LDRB	R1, [SP, #4]
MOVW	R0, #65527
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw.c,696 :: 		return (temp >> 3);
UXTB	R0, R0
LSRS	R0, R0, #3
SXTB	R0, R0
;accel3_hw.c,697 :: 		}
L_end_accel3_is_y_high_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_y_high_interrupt1
_accel3_is_y_low_interrupt1:
;accel3_hw.c,699 :: 		int8_t accel3_is_y_low_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,702 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw.c,704 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,706 :: 		temp &= ~(1<<2);
LDRB	R1, [SP, #4]
MOVW	R0, #65531
SXTH	R0, R0
AND	R0, R1, R0, LSL #0
STRB	R0, [SP, #4]
;accel3_hw.c,707 :: 		return (temp >> 2);
UXTB	R0, R0
LSRS	R0, R0, #2
SXTB	R0, R0
;accel3_hw.c,708 :: 		}
L_end_accel3_is_y_low_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_y_low_interrupt1
_accel3_is_x_high_interrupt1:
;accel3_hw.c,710 :: 		int8_t accel3_is_x_high_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,713 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw.c,715 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,717 :: 		temp &= (1<<1);
LDRB	R0, [SP, #4]
AND	R0, R0, #2
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,718 :: 		return (temp >> 1);
LSRS	R0, R0, #1
SXTB	R0, R0
;accel3_hw.c,719 :: 		}
L_end_accel3_is_x_high_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_x_high_interrupt1
_accel3_is_x_low_interrupt1:
;accel3_hw.c,721 :: 		int8_t accel3_is_x_low_interrupt1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,724 :: 		uint8_t reg = INT1_SRC;
MOVS	R0, #49
STRB	R0, [SP, #5]
;accel3_hw.c,726 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,728 :: 		temp &= (1);
LDRB	R0, [SP, #4]
AND	R0, R0, #1
STRB	R0, [SP, #4]
;accel3_hw.c,729 :: 		return (temp);
SXTB	R0, R0
;accel3_hw.c,730 :: 		}
L_end_accel3_is_x_low_interrupt1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_x_low_interrupt1
_accel3_int1_set_threshold:
;accel3_hw.c,732 :: 		int8_t accel3_int1_set_threshold(uint8_t threshold)
; threshold start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; threshold end address is: 0 (R0)
; threshold start address is: 0 (R0)
;accel3_hw.c,734 :: 		uint8_t temp = threshold;
STRB	R0, [SP, #4]
;accel3_hw.c,735 :: 		uint8_t reg = INT1_THS;
MOVS	R1, #50
STRB	R1, [SP, #5]
;accel3_hw.c,737 :: 		if (threshold > (1<<7))
CMP	R0, #128
IT	LS
BLS	L_accel3_int1_set_threshold63
; threshold end address is: 0 (R0)
;accel3_hw.c,738 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_int1_set_threshold
L_accel3_int1_set_threshold63:
;accel3_hw.c,740 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #4
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,741 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw.c,742 :: 		}
L_end_accel3_int1_set_threshold:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_int1_set_threshold
_accel3_int1_set_duration:
;accel3_hw.c,744 :: 		int8_t accel3_int1_set_duration(uint8_t duration)
; duration start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; duration end address is: 0 (R0)
; duration start address is: 0 (R0)
;accel3_hw.c,746 :: 		uint8_t temp = duration;
STRB	R0, [SP, #4]
; duration end address is: 0 (R0)
;accel3_hw.c,747 :: 		uint8_t reg = INT1_DUR;
MOVS	R1, #51
STRB	R1, [SP, #5]
;accel3_hw.c,749 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #4
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,750 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw.c,751 :: 		}
L_end_accel3_int1_set_duration:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_int1_set_duration
_accel3_interrupt2_set_combination:
;accel3_hw.c,753 :: 		int8_t accel3_interrupt2_set_combination(int_comb_t combination)
; combination start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; combination end address is: 0 (R0)
; combination start address is: 0 (R0)
;accel3_hw.c,756 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw.c,758 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,760 :: 		if ( combination == OR)
CMP	R0, #0
IT	NE
BNE	L_accel3_interrupt2_set_combination65
; combination end address is: 0 (R0)
;accel3_hw.c,761 :: 		temp &= ~(1 << 7);
LDRB	R1, [SP, #8]
AND	R1, R1, #127
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_set_combination66
L_accel3_interrupt2_set_combination65:
;accel3_hw.c,762 :: 		else if ( combination == AND)
; combination start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_set_combination67
; combination end address is: 0 (R0)
;accel3_hw.c,763 :: 		temp |= (1 << 7);
LDRB	R1, [SP, #8]
ORR	R1, R1, #128
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_set_combination68
L_accel3_interrupt2_set_combination67:
;accel3_hw.c,765 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_interrupt2_set_combination
L_accel3_interrupt2_set_combination68:
L_accel3_interrupt2_set_combination66:
;accel3_hw.c,766 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,767 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
;accel3_hw.c,768 :: 		}
L_end_accel3_interrupt2_set_combination:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_set_combination
_accel3_interrupt2_z_high_enable:
;accel3_hw.c,770 :: 		void accel3_interrupt2_z_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,773 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw.c,775 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,777 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_z_high_enable69
; enable end address is: 0 (R0)
;accel3_hw.c,778 :: 		temp |= ( 1 << 5 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #32
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_z_high_enable70
L_accel3_interrupt2_z_high_enable69:
;accel3_hw.c,780 :: 		temp &= ~( 1 << 5);
LDRB	R2, [SP, #8]
MOVW	R1, #65503
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_z_high_enable70:
;accel3_hw.c,782 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,783 :: 		}
L_end_accel3_interrupt2_z_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_z_high_enable
_accel3_interrupt2_z_low_enable:
;accel3_hw.c,785 :: 		void accel3_interrupt2_z_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,788 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw.c,790 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,792 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_z_low_enable71
; enable end address is: 0 (R0)
;accel3_hw.c,793 :: 		temp |= ( 1 << 4 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #16
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_z_low_enable72
L_accel3_interrupt2_z_low_enable71:
;accel3_hw.c,795 :: 		temp &= ~( 1 << 4);
LDRB	R2, [SP, #8]
MOVW	R1, #65519
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_z_low_enable72:
;accel3_hw.c,797 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,798 :: 		}
L_end_accel3_interrupt2_z_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_z_low_enable
_accel3_interrupt2_y_high_enable:
;accel3_hw.c,800 :: 		void accel3_interrupt2_y_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,803 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw.c,805 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,807 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_y_high_enable73
; enable end address is: 0 (R0)
;accel3_hw.c,808 :: 		temp |= ( 1 << 3 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #8
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_y_high_enable74
L_accel3_interrupt2_y_high_enable73:
;accel3_hw.c,810 :: 		temp &= ~( 1 << 3 );
LDRB	R2, [SP, #8]
MOVW	R1, #65527
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_y_high_enable74:
;accel3_hw.c,812 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,813 :: 		}
L_end_accel3_interrupt2_y_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_y_high_enable
_accel3_interrupt2_y_low_enable:
;accel3_hw.c,815 :: 		void accel3_interrupt2_y_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,818 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw.c,820 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,822 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_y_low_enable75
; enable end address is: 0 (R0)
;accel3_hw.c,823 :: 		temp |= ( 1 << 2 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #4
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_y_low_enable76
L_accel3_interrupt2_y_low_enable75:
;accel3_hw.c,825 :: 		temp &= ~( 1 << 2 );
LDRB	R2, [SP, #8]
MOVW	R1, #65531
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_y_low_enable76:
;accel3_hw.c,827 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,828 :: 		}
L_end_accel3_interrupt2_y_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_y_low_enable
_accel3_interrupt2_x_high_enable:
;accel3_hw.c,830 :: 		void accel3_interrupt2_x_high_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,833 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw.c,835 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,837 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_x_high_enable77
; enable end address is: 0 (R0)
;accel3_hw.c,838 :: 		temp |= ( 1 << 1 );
LDRB	R1, [SP, #8]
ORR	R1, R1, #2
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_x_high_enable78
L_accel3_interrupt2_x_high_enable77:
;accel3_hw.c,840 :: 		temp &= ~( 1 << 1);
LDRB	R2, [SP, #8]
MOVW	R1, #65533
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_x_high_enable78:
;accel3_hw.c,842 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,843 :: 		}
L_end_accel3_interrupt2_x_high_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_x_high_enable
_accel3_interrupt2_x_low_enable:
;accel3_hw.c,845 :: 		void accel3_interrupt2_x_low_enable(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;accel3_hw.c,848 :: 		uint8_t reg = INT2_CFG;
MOVS	R1, #52
STRB	R1, [SP, #9]
;accel3_hw.c,850 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
STRB	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_read+0
LDRB	R0, [SP, #4]
;accel3_hw.c,852 :: 		if (enable == true)
CMP	R0, #1
IT	NE
BNE	L_accel3_interrupt2_x_low_enable79
; enable end address is: 0 (R0)
;accel3_hw.c,853 :: 		temp |= 1;
LDRB	R1, [SP, #8]
ORR	R1, R1, #1
STRB	R1, [SP, #8]
IT	AL
BAL	L_accel3_interrupt2_x_low_enable80
L_accel3_interrupt2_x_low_enable79:
;accel3_hw.c,855 :: 		temp &= ~( 1 );
LDRB	R2, [SP, #8]
MOVW	R1, #65534
SXTH	R1, R1
AND	R1, R2, R1, LSL #0
STRB	R1, [SP, #8]
L_accel3_interrupt2_x_low_enable80:
;accel3_hw.c,857 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #8
ADD	R1, SP, #9
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,858 :: 		}
L_end_accel3_interrupt2_x_low_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _accel3_interrupt2_x_low_enable
_accel3_is_interrupt2:
;accel3_hw.c,860 :: 		int8_t accel3_is_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,863 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw.c,865 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,867 :: 		temp &= ( 1 << 6 );
LDRB	R0, [SP, #4]
AND	R0, R0, #64
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,868 :: 		return (temp >> 6); //Returns 1 if interrupt is triggered
LSRS	R0, R0, #6
SXTB	R0, R0
;accel3_hw.c,869 :: 		}
L_end_accel3_is_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_interrupt2
_accel3_is_z_high_interrupt2:
;accel3_hw.c,871 :: 		int8_t accel3_is_z_high_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,874 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw.c,876 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,878 :: 		temp &= (1 << 5);
LDRB	R0, [SP, #4]
AND	R0, R0, #32
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,879 :: 		return (temp >> 5);
LSRS	R0, R0, #5
SXTB	R0, R0
;accel3_hw.c,880 :: 		}
L_end_accel3_is_z_high_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_z_high_interrupt2
_accel3_is_z_low_interrupt2:
;accel3_hw.c,882 :: 		int8_t accel3_is_z_low_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,885 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw.c,887 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,889 :: 		temp &= (1 << 4);
LDRB	R0, [SP, #4]
AND	R0, R0, #16
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,890 :: 		return (temp >> 4);
LSRS	R0, R0, #4
SXTB	R0, R0
;accel3_hw.c,891 :: 		}
L_end_accel3_is_z_low_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_z_low_interrupt2
_accel3_is_y_high_interrupt2:
;accel3_hw.c,893 :: 		int8_t accel3_is_y_high_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,896 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw.c,898 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,900 :: 		temp &= (1 << 3);
LDRB	R0, [SP, #4]
AND	R0, R0, #8
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,901 :: 		return (temp >> 3);
LSRS	R0, R0, #3
SXTB	R0, R0
;accel3_hw.c,902 :: 		}
L_end_accel3_is_y_high_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_y_high_interrupt2
_accel3_is_y_low_interrupt2:
;accel3_hw.c,904 :: 		int8_t accel3_is_y_low_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,907 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw.c,909 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,911 :: 		temp &= (1 << 2);
LDRB	R0, [SP, #4]
AND	R0, R0, #4
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,912 :: 		return (temp >> 2);
LSRS	R0, R0, #2
SXTB	R0, R0
;accel3_hw.c,913 :: 		}
L_end_accel3_is_y_low_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_y_low_interrupt2
_accel3_is_x_high_interrupt2:
;accel3_hw.c,915 :: 		int8_t accel3_is_x_high_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,918 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw.c,920 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,922 :: 		temp &= (1 << 1);
LDRB	R0, [SP, #4]
AND	R0, R0, #2
UXTB	R0, R0
STRB	R0, [SP, #4]
;accel3_hw.c,923 :: 		return (temp >> 1);
LSRS	R0, R0, #1
SXTB	R0, R0
;accel3_hw.c,924 :: 		}
L_end_accel3_is_x_high_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_x_high_interrupt2
_accel3_is_x_low_interrupt2:
;accel3_hw.c,926 :: 		int8_t accel3_is_x_low_interrupt2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;accel3_hw.c,929 :: 		uint8_t reg = INT2_SRC;
MOVS	R0, #53
STRB	R0, [SP, #5]
;accel3_hw.c,931 :: 		accel3_hal_read( &reg, &temp, 1 );
ADD	R1, SP, #4
ADD	R0, SP, #5
MOVS	R2, #1
BL	_accel3_hal_read+0
;accel3_hw.c,933 :: 		temp &= (1);
LDRB	R0, [SP, #4]
AND	R0, R0, #1
STRB	R0, [SP, #4]
;accel3_hw.c,934 :: 		return temp;
SXTB	R0, R0
;accel3_hw.c,935 :: 		}
L_end_accel3_is_x_low_interrupt2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_is_x_low_interrupt2
_accel3_int2_set_threshold:
;accel3_hw.c,937 :: 		int8_t accel3_int2_set_threshold(uint8_t threshold)
; threshold start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; threshold end address is: 0 (R0)
; threshold start address is: 0 (R0)
;accel3_hw.c,939 :: 		uint8_t temp = threshold;
STRB	R0, [SP, #4]
; threshold end address is: 0 (R0)
;accel3_hw.c,940 :: 		uint8_t reg = INT2_THS;
MOVS	R1, #54
STRB	R1, [SP, #5]
;accel3_hw.c,942 :: 		if ( temp > ( 1<<7 ) )
LDRB	R1, [SP, #4]
CMP	R1, #128
IT	LS
BLS	L_accel3_int2_set_threshold81
;accel3_hw.c,943 :: 		return 0;
MOVS	R0, #0
SXTB	R0, R0
IT	AL
BAL	L_end_accel3_int2_set_threshold
L_accel3_int2_set_threshold81:
;accel3_hw.c,945 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #4
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,946 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw.c,947 :: 		}
L_end_accel3_int2_set_threshold:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_int2_set_threshold
_accel3_int2_set_duration:
;accel3_hw.c,949 :: 		int8_t accel3_int2_set_duration(uint8_t duration)
; duration start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; duration end address is: 0 (R0)
; duration start address is: 0 (R0)
;accel3_hw.c,951 :: 		uint8_t temp = duration;
STRB	R0, [SP, #4]
; duration end address is: 0 (R0)
;accel3_hw.c,952 :: 		uint8_t reg = INT2_DUR;
MOVS	R1, #55
STRB	R1, [SP, #5]
;accel3_hw.c,954 :: 		accel3_hal_write( &reg, &temp, 1 );
ADD	R2, SP, #4
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #1
BL	_accel3_hal_write+0
;accel3_hw.c,955 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
;accel3_hw.c,956 :: 		}
L_end_accel3_int2_set_duration:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _accel3_int2_set_duration
_accel3_get_xyz_sensitivity:
;accel3_hw.c,958 :: 		axes_sens_t* accel3_get_xyz_sensitivity( void )
SUB	SP, SP, #8
;accel3_hw.c,961 :: 		sensitive_t.x = x_sens;
MOVW	R0, #lo_addr(accel3_hw_x_sens+0)
MOVT	R0, #hi_addr(accel3_hw_x_sens+0)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #0]
;accel3_hw.c,962 :: 		sensitive_t.y = y_sens;
MOVW	R0, #lo_addr(accel3_hw_y_sens+0)
MOVT	R0, #hi_addr(accel3_hw_y_sens+0)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #2]
;accel3_hw.c,963 :: 		sensitive_t.z = z_sens;
MOVW	R0, #lo_addr(accel3_hw_z_sens+0)
MOVT	R0, #hi_addr(accel3_hw_z_sens+0)
LDRSH	R0, [R0, #0]
STRH	R0, [SP, #4]
;accel3_hw.c,965 :: 		return &sensitive_t;
ADD	R0, SP, #0
;accel3_hw.c,966 :: 		}
L_end_accel3_get_xyz_sensitivity:
ADD	SP, SP, #8
BX	LR
; end of _accel3_get_xyz_sensitivity
