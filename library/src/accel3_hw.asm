_accel3_hw_init:
;accel3_hw.c,51 :: 		uint8_t accel3_hw_init(uint8_t address, bus_mode_t mode)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,54 :: 		uint8_t reg = 0x0F;  //00110000
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 15
SB	R30, 17(SP)
;accel3_hw.c,56 :: 		accel3_hal_init( address, mode );
JAL	_accel3_hal_init+0
NOP	
;accel3_hw.c,57 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,58 :: 		initial_calibrate();
JAL	accel3_hw_initial_calibrate+0
NOP	
;accel3_hw.c,60 :: 		if (temp == 0x32)
LBU	R3, 16(SP)
ORI	R2, R0, 50
BEQ	R3, R2, L__accel3_hw_init88
NOP	
J	L_accel3_hw_init0
NOP	
L__accel3_hw_init88:
;accel3_hw.c,61 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_accel3_hw_init
NOP	
L_accel3_hw_init0:
;accel3_hw.c,63 :: 		return -1;
ORI	R2, R0, 255
;accel3_hw.c,65 :: 		}
;accel3_hw.c,63 :: 		return -1;
;accel3_hw.c,65 :: 		}
L_end_accel3_hw_init:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_hw_init
accel3_hw_initial_calibrate:
;accel3_hw.c,67 :: 		void static initial_calibrate( void )
ADDIU	SP, SP, -4
;accel3_hw.c,69 :: 		x_sens = 192;
ORI	R2, R0, 192
SH	R2, Offset(accel3_hw_x_sens+0)(GP)
;accel3_hw.c,70 :: 		y_sens = 199;
ORI	R2, R0, 199
SH	R2, Offset(accel3_hw_y_sens+0)(GP)
;accel3_hw.c,71 :: 		z_sens = 344;
ORI	R2, R0, 344
SH	R2, Offset(accel3_hw_z_sens+0)(GP)
;accel3_hw.c,73 :: 		}
L_end_initial_calibrate:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of accel3_hw_initial_calibrate
_set_x:
;accel3_hw.c,75 :: 		void set_x( int16_t x )
ADDIU	SP, SP, -4
;accel3_hw.c,77 :: 		x_sens = x;
SH	R25, Offset(accel3_hw_x_sens+0)(GP)
;accel3_hw.c,78 :: 		}
L_end_set_x:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _set_x
_set_y:
;accel3_hw.c,80 :: 		void set_y( int16_t y )
ADDIU	SP, SP, -4
;accel3_hw.c,82 :: 		y_sens = y;
SH	R25, Offset(accel3_hw_y_sens+0)(GP)
;accel3_hw.c,83 :: 		}
L_end_set_y:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _set_y
_set_z:
;accel3_hw.c,85 :: 		void set_z( int16_t z )
ADDIU	SP, SP, -4
;accel3_hw.c,87 :: 		z_sens = z;
SH	R25, Offset(accel3_hw_z_sens+0)(GP)
;accel3_hw.c,88 :: 		}
L_end_set_z:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _set_z
_accel3_set_mode:
;accel3_hw.c,90 :: 		int8_t accel3_set_mode(accel_mode_t mode)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,93 :: 		uint8_t reg = CTRL_REG1;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 32
SB	R30, 18(SP)
;accel3_hw.c,95 :: 		if (mode > 7)
ANDI	R2, R25, 255
SLTIU	R2, R2, 8
BEQ	R2, R0, L__accel3_set_mode94
NOP	
J	L_accel3_set_mode2
NOP	
L__accel3_set_mode94:
;accel3_hw.c,96 :: 		return -1;
ORI	R2, R0, 255
J	L_end_accel3_set_mode
NOP	
L_accel3_set_mode2:
;accel3_hw.c,98 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,99 :: 		temp |= ( mode << 5 );
ANDI	R2, R25, 255
SLL	R3, R2, 5
LBU	R2, 17(SP)
OR	R2, R2, R3
SB	R2, 17(SP)
;accel3_hw.c,100 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,101 :: 		return 0;
MOVZ	R2, R0, R0
;accel3_hw.c,102 :: 		}
;accel3_hw.c,101 :: 		return 0;
;accel3_hw.c,102 :: 		}
L_end_accel3_set_mode:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_set_mode
_accel3_set_data_rate:
;accel3_hw.c,104 :: 		int8_t accel3_set_data_rate(data_rate_t data_rate)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,107 :: 		uint8_t reg = CTRL_REG1;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 32
SB	R30, 18(SP)
;accel3_hw.c,109 :: 		if (data_rate > 3)
ANDI	R2, R25, 255
SLTIU	R2, R2, 4
BEQ	R2, R0, L__accel3_set_data_rate96
NOP	
J	L_accel3_set_data_rate3
NOP	
L__accel3_set_data_rate96:
;accel3_hw.c,110 :: 		return -1;
ORI	R2, R0, 255
J	L_end_accel3_set_data_rate
NOP	
L_accel3_set_data_rate3:
;accel3_hw.c,111 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,113 :: 		temp |= ( data_rate << 3 );
ANDI	R2, R25, 255
SLL	R3, R2, 3
LBU	R2, 17(SP)
OR	R2, R2, R3
SB	R2, 17(SP)
;accel3_hw.c,114 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,115 :: 		return 0;
MOVZ	R2, R0, R0
;accel3_hw.c,116 :: 		}
;accel3_hw.c,115 :: 		return 0;
;accel3_hw.c,116 :: 		}
L_end_accel3_set_data_rate:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_set_data_rate
_accel3_z_enable:
;accel3_hw.c,118 :: 		void accel3_z_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,121 :: 		uint8_t reg = CTRL_REG1;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 32
SB	R30, 18(SP)
;accel3_hw.c,123 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,124 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_z_enable98
NOP	
J	L_accel3_z_enable4
NOP	
L__accel3_z_enable98:
;accel3_hw.c,125 :: 		temp |= (1 << 2);
LBU	R2, 17(SP)
ORI	R2, R2, 4
SB	R2, 17(SP)
L_accel3_z_enable4:
;accel3_hw.c,126 :: 		if (enable == false)
ANDI	R2, R25, 255
BEQ	R2, R0, L__accel3_z_enable99
NOP	
J	L_accel3_z_enable5
NOP	
L__accel3_z_enable99:
;accel3_hw.c,127 :: 		temp &= ~(1 << 2);
LBU	R3, 17(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_z_enable5:
;accel3_hw.c,128 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,129 :: 		}
L_end_accel3_z_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_z_enable
_accel3_y_enable:
;accel3_hw.c,131 :: 		void accel3_y_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,134 :: 		uint8_t reg = CTRL_REG1;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 32
SB	R30, 18(SP)
;accel3_hw.c,136 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,137 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_y_enable101
NOP	
J	L_accel3_y_enable6
NOP	
L__accel3_y_enable101:
;accel3_hw.c,138 :: 		temp |= (1 << 1);
LBU	R2, 17(SP)
ORI	R2, R2, 2
SB	R2, 17(SP)
L_accel3_y_enable6:
;accel3_hw.c,139 :: 		if (enable == false)
ANDI	R2, R25, 255
BEQ	R2, R0, L__accel3_y_enable102
NOP	
J	L_accel3_y_enable7
NOP	
L__accel3_y_enable102:
;accel3_hw.c,140 :: 		temp &= ~(1 << 1);
LBU	R3, 17(SP)
ORI	R2, R0, 253
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_y_enable7:
;accel3_hw.c,141 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,142 :: 		}
L_end_accel3_y_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_y_enable
_accel3_x_enable:
;accel3_hw.c,144 :: 		void accel3_x_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,147 :: 		uint8_t reg = CTRL_REG1;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 32
SB	R30, 18(SP)
;accel3_hw.c,149 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,150 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_x_enable104
NOP	
J	L_accel3_x_enable8
NOP	
L__accel3_x_enable104:
;accel3_hw.c,151 :: 		temp |= 1;
LBU	R2, 17(SP)
ORI	R2, R2, 1
SB	R2, 17(SP)
J	L_accel3_x_enable9
NOP	
L_accel3_x_enable8:
;accel3_hw.c,153 :: 		temp &= ~1;
LBU	R3, 17(SP)
ORI	R2, R0, 254
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_x_enable9:
;accel3_hw.c,154 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,155 :: 		}
L_end_accel3_x_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_x_enable
_accel3_reboot:
;accel3_hw.c,157 :: 		void accel3_reboot()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,160 :: 		uint8_t reg = CTRL_REG2;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 33
SB	R30, 17(SP)
;accel3_hw.c,162 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,163 :: 		temp |= (1<<7);
LBU	R2, 16(SP)
ORI	R2, R2, 128
SB	R2, 16(SP)
;accel3_hw.c,164 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,165 :: 		}
L_end_accel3_reboot:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_reboot
_accel3_hp_filter_mode_select:
;accel3_hw.c,167 :: 		int8_t accel3_hp_filter_mode_select(hp_filter_mode_t mode)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,170 :: 		uint8_t reg = CTRL_REG2;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 33
SB	R30, 18(SP)
;accel3_hw.c,172 :: 		if (mode > 2)
ANDI	R2, R25, 255
SLTIU	R2, R2, 3
BEQ	R2, R0, L__accel3_hp_filter_mode_select107
NOP	
J	L_accel3_hp_filter_mode_select10
NOP	
L__accel3_hp_filter_mode_select107:
;accel3_hw.c,173 :: 		return -1;
ORI	R2, R0, 255
J	L_end_accel3_hp_filter_mode_select
NOP	
L_accel3_hp_filter_mode_select10:
;accel3_hw.c,175 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,176 :: 		temp |= mode;
LBU	R2, 17(SP)
OR	R2, R2, R25
SB	R2, 17(SP)
;accel3_hw.c,177 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,178 :: 		return 0;
MOVZ	R2, R0, R0
;accel3_hw.c,179 :: 		}
;accel3_hw.c,178 :: 		return 0;
;accel3_hw.c,179 :: 		}
L_end_accel3_hp_filter_mode_select:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_hp_filter_mode_select
_accel3_filtered_data_selection_enable:
;accel3_hw.c,181 :: 		void accel3_filtered_data_selection_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,184 :: 		uint8_t reg = CTRL_REG2;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 33
SB	R30, 18(SP)
;accel3_hw.c,186 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,188 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_filtered_data_selection_enable109
NOP	
J	L_accel3_filtered_data_selection_enable11
NOP	
L__accel3_filtered_data_selection_enable109:
;accel3_hw.c,189 :: 		temp |= (1<<4);
LBU	R2, 17(SP)
ORI	R2, R2, 16
SB	R2, 17(SP)
J	L_accel3_filtered_data_selection_enable12
NOP	
L_accel3_filtered_data_selection_enable11:
;accel3_hw.c,191 :: 		temp &= ~(1<<4);
LBU	R3, 17(SP)
ORI	R2, R0, 239
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_filtered_data_selection_enable12:
;accel3_hw.c,192 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,193 :: 		}
L_end_accel3_filtered_data_selection_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_filtered_data_selection_enable
_accel3_hp2_filter_enable:
;accel3_hw.c,195 :: 		void accel3_hp2_filter_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,198 :: 		uint8_t reg = CTRL_REG2;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 33
SB	R30, 18(SP)
;accel3_hw.c,200 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,202 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_hp2_filter_enable111
NOP	
J	L_accel3_hp2_filter_enable13
NOP	
L__accel3_hp2_filter_enable111:
;accel3_hw.c,203 :: 		temp |= (1<<3);
LBU	R2, 17(SP)
ORI	R2, R2, 8
SB	R2, 17(SP)
J	L_accel3_hp2_filter_enable14
NOP	
L_accel3_hp2_filter_enable13:
;accel3_hw.c,205 :: 		temp &= ~(1<<3);
LBU	R3, 17(SP)
ORI	R2, R0, 247
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_hp2_filter_enable14:
;accel3_hw.c,206 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,207 :: 		}
L_end_accel3_hp2_filter_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_hp2_filter_enable
_accel3_hp1_filter_enable:
;accel3_hw.c,209 :: 		void accel3_hp1_filter_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,212 :: 		uint8_t reg = CTRL_REG2;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 33
SB	R30, 18(SP)
;accel3_hw.c,214 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,216 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_hp1_filter_enable113
NOP	
J	L_accel3_hp1_filter_enable15
NOP	
L__accel3_hp1_filter_enable113:
;accel3_hw.c,217 :: 		temp |= (1<<2);
LBU	R2, 17(SP)
ORI	R2, R2, 4
SB	R2, 17(SP)
J	L_accel3_hp1_filter_enable16
NOP	
L_accel3_hp1_filter_enable15:
;accel3_hw.c,219 :: 		temp &= ~(1<<2);
LBU	R3, 17(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_hp1_filter_enable16:
;accel3_hw.c,220 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,221 :: 		}
L_end_accel3_hp1_filter_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_hp1_filter_enable
_accel3_hp_cutoff_freq_config:
;accel3_hw.c,223 :: 		int8_t accel3_hp_cutoff_freq_config(cutoff_freq_t freq)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,226 :: 		uint8_t reg = CTRL_REG2;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 33
SB	R30, 18(SP)
;accel3_hw.c,228 :: 		if ( freq > 3)
ANDI	R2, R25, 255
SLTIU	R2, R2, 4
BEQ	R2, R0, L__accel3_hp_cutoff_freq_config115
NOP	
J	L_accel3_hp_cutoff_freq_config17
NOP	
L__accel3_hp_cutoff_freq_config115:
;accel3_hw.c,229 :: 		return -1;
ORI	R2, R0, 255
J	L_end_accel3_hp_cutoff_freq_config
NOP	
L_accel3_hp_cutoff_freq_config17:
;accel3_hw.c,230 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,231 :: 		temp |= freq;
LBU	R2, 17(SP)
OR	R2, R2, R25
SB	R2, 17(SP)
;accel3_hw.c,232 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,233 :: 		return 0;
MOVZ	R2, R0, R0
;accel3_hw.c,234 :: 		}
;accel3_hw.c,233 :: 		return 0;
;accel3_hw.c,234 :: 		}
L_end_accel3_hp_cutoff_freq_config:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_hp_cutoff_freq_config
_accel3_interrupt_active_level:
;accel3_hw.c,236 :: 		int8_t accel3_interrupt_active_level(level_t level)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,239 :: 		uint8_t reg = CTRL_REG3;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 34
SB	R30, 18(SP)
;accel3_hw.c,241 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,243 :: 		if (level == HIGH)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt_active_level117
NOP	
J	L_accel3_interrupt_active_level18
NOP	
L__accel3_interrupt_active_level117:
;accel3_hw.c,244 :: 		temp |= (level << 7);
ANDI	R2, R25, 255
SLL	R3, R2, 7
LBU	R2, 17(SP)
OR	R2, R2, R3
SB	R2, 17(SP)
J	L_accel3_interrupt_active_level19
NOP	
L_accel3_interrupt_active_level18:
;accel3_hw.c,245 :: 		else if (level == LOW)
ANDI	R2, R25, 255
BEQ	R2, R0, L__accel3_interrupt_active_level118
NOP	
J	L_accel3_interrupt_active_level20
NOP	
L__accel3_interrupt_active_level118:
;accel3_hw.c,246 :: 		temp &= ~(level << 7);
ANDI	R2, R25, 255
SLL	R2, R2, 7
NOR	R3, R2, R0
LBU	R2, 17(SP)
AND	R2, R2, R3
SB	R2, 17(SP)
J	L_accel3_interrupt_active_level21
NOP	
L_accel3_interrupt_active_level20:
;accel3_hw.c,247 :: 		else return -1;
ORI	R2, R0, 255
J	L_end_accel3_interrupt_active_level
NOP	
L_accel3_interrupt_active_level21:
L_accel3_interrupt_active_level19:
;accel3_hw.c,249 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,250 :: 		return 0;
MOVZ	R2, R0, R0
;accel3_hw.c,251 :: 		}
;accel3_hw.c,250 :: 		return 0;
;accel3_hw.c,251 :: 		}
L_end_accel3_interrupt_active_level:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt_active_level
_accel3_interrupt_pad_selection:
;accel3_hw.c,253 :: 		int8_t accel3_interrupt_pad_selection(interrupt_pad_t select)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,256 :: 		uint8_t reg = CTRL_REG3;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 34
SB	R30, 18(SP)
;accel3_hw.c,258 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,259 :: 		if ( select == PUSH_PULL)
ANDI	R2, R25, 255
BEQ	R2, R0, L__accel3_interrupt_pad_selection120
NOP	
J	L_accel3_interrupt_pad_selection22
NOP	
L__accel3_interrupt_pad_selection120:
;accel3_hw.c,260 :: 		temp &= ~(1 << 6);
LBU	R3, 17(SP)
ORI	R2, R0, 191
AND	R2, R3, R2
SB	R2, 17(SP)
J	L_accel3_interrupt_pad_selection23
NOP	
L_accel3_interrupt_pad_selection22:
;accel3_hw.c,261 :: 		else if (select == OPEN_DRAIN )
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt_pad_selection121
NOP	
J	L_accel3_interrupt_pad_selection24
NOP	
L__accel3_interrupt_pad_selection121:
;accel3_hw.c,262 :: 		temp |= ( 1 << 6);
LBU	R2, 17(SP)
ORI	R2, R2, 64
SB	R2, 17(SP)
J	L_accel3_interrupt_pad_selection25
NOP	
L_accel3_interrupt_pad_selection24:
;accel3_hw.c,264 :: 		return -1;
ORI	R2, R0, 255
J	L_end_accel3_interrupt_pad_selection
NOP	
L_accel3_interrupt_pad_selection25:
L_accel3_interrupt_pad_selection23:
;accel3_hw.c,266 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,267 :: 		return 0;
MOVZ	R2, R0, R0
;accel3_hw.c,268 :: 		}
;accel3_hw.c,267 :: 		return 0;
;accel3_hw.c,268 :: 		}
L_end_accel3_interrupt_pad_selection:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt_pad_selection
_accel3_latched_interrupt1_enable:
;accel3_hw.c,270 :: 		void accel3_latched_interrupt1_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,273 :: 		uint8_t reg = CTRL_REG3;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 34
SB	R30, 17(SP)
;accel3_hw.c,275 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,281 :: 		temp |= 0x04;
LBU	R2, 16(SP)
ORI	R2, R2, 4
SB	R2, 16(SP)
;accel3_hw.c,282 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,283 :: 		}
L_end_accel3_latched_interrupt1_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_latched_interrupt1_enable
_accel3_latched_interrupt2_enable:
;accel3_hw.c,285 :: 		void accel3_latched_interrupt2_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,288 :: 		uint8_t reg = CTRL_REG3;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 34
SB	R30, 18(SP)
;accel3_hw.c,290 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,292 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_latched_interrupt2_enable124
NOP	
J	L_accel3_latched_interrupt2_enable26
NOP	
L__accel3_latched_interrupt2_enable124:
;accel3_hw.c,293 :: 		temp |= (1<<3);
LBU	R2, 17(SP)
ORI	R2, R2, 8
SB	R2, 17(SP)
J	L_accel3_latched_interrupt2_enable27
NOP	
L_accel3_latched_interrupt2_enable26:
;accel3_hw.c,295 :: 		temp &= ~(1<<3);
LBU	R3, 17(SP)
ORI	R2, R0, 247
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_latched_interrupt2_enable27:
;accel3_hw.c,296 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,297 :: 		}
L_end_accel3_latched_interrupt2_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_latched_interrupt2_enable
_accel3_int1_signal_config:
;accel3_hw.c,299 :: 		int8_t accel3_int1_signal_config(int_signal_t config)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,302 :: 		uint8_t reg = CTRL_REG3;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 34
SB	R30, 18(SP)
;accel3_hw.c,307 :: 		accel3_hal_read( &reg, &temp, 1);
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,308 :: 		temp |= config;
LBU	R2, 17(SP)
OR	R2, R2, R25
SB	R2, 17(SP)
;accel3_hw.c,309 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,310 :: 		return 1;
ORI	R2, R0, 1
;accel3_hw.c,311 :: 		}
;accel3_hw.c,310 :: 		return 1;
;accel3_hw.c,311 :: 		}
L_end_accel3_int1_signal_config:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_int1_signal_config
_accel3_int2_signal_config:
;accel3_hw.c,313 :: 		int8_t accel3_int2_signal_config(int_signal_t config)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,316 :: 		uint8_t reg = CTRL_REG3;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 34
SB	R30, 18(SP)
;accel3_hw.c,318 :: 		if ( (config > 3) || (config < 0) )
ANDI	R2, R25, 255
SLTIU	R2, R2, 4
BNE	R2, R0, L__accel3_int2_signal_config127
NOP	
J	L__accel3_int2_signal_config83
NOP	
L__accel3_int2_signal_config127:
ANDI	R2, R25, 255
SLTIU	R2, R2, 0
BEQ	R2, R0, L__accel3_int2_signal_config128
NOP	
J	L__accel3_int2_signal_config82
NOP	
L__accel3_int2_signal_config128:
J	L_accel3_int2_signal_config30
NOP	
L__accel3_int2_signal_config83:
L__accel3_int2_signal_config82:
;accel3_hw.c,319 :: 		return -1;
ORI	R2, R0, 255
J	L_end_accel3_int2_signal_config
NOP	
L_accel3_int2_signal_config30:
;accel3_hw.c,321 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,322 :: 		temp |= ( config << 3 );
ANDI	R2, R25, 255
SLL	R3, R2, 3
LBU	R2, 17(SP)
OR	R2, R2, R3
SB	R2, 17(SP)
;accel3_hw.c,323 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,324 :: 		return 0;
MOVZ	R2, R0, R0
;accel3_hw.c,325 :: 		}
;accel3_hw.c,324 :: 		return 0;
;accel3_hw.c,325 :: 		}
L_end_accel3_int2_signal_config:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_int2_signal_config
_accel3_bdu_enable:
;accel3_hw.c,327 :: 		void accel3_bdu_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,330 :: 		uint8_t reg = CTRL_REG4;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 35
SB	R30, 18(SP)
;accel3_hw.c,332 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,334 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_bdu_enable130
NOP	
J	L_accel3_bdu_enable31
NOP	
L__accel3_bdu_enable130:
;accel3_hw.c,335 :: 		temp |= (1<<7);
LBU	R2, 17(SP)
ORI	R2, R2, 128
SB	R2, 17(SP)
J	L_accel3_bdu_enable32
NOP	
L_accel3_bdu_enable31:
;accel3_hw.c,337 :: 		temp &= ~(1<<7);
LBU	R2, 17(SP)
ANDI	R2, R2, 127
SB	R2, 17(SP)
L_accel3_bdu_enable32:
;accel3_hw.c,338 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,339 :: 		}
L_end_accel3_bdu_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_bdu_enable
_accel3_ble_enable:
;accel3_hw.c,341 :: 		void accel3_ble_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,344 :: 		uint8_t reg = CTRL_REG4;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 35
SB	R30, 18(SP)
;accel3_hw.c,346 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,348 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_ble_enable132
NOP	
J	L_accel3_ble_enable33
NOP	
L__accel3_ble_enable132:
;accel3_hw.c,349 :: 		temp |= (1<<6);
LBU	R2, 17(SP)
ORI	R2, R2, 64
SB	R2, 17(SP)
J	L_accel3_ble_enable34
NOP	
L_accel3_ble_enable33:
;accel3_hw.c,351 :: 		temp &= ~(1<<6);
LBU	R3, 17(SP)
ORI	R2, R0, 191
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_ble_enable34:
;accel3_hw.c,352 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,353 :: 		}
L_end_accel3_ble_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_ble_enable
_accel3_set_full_scale:
;accel3_hw.c,355 :: 		int8_t accel3_set_full_scale(full_scale_t scale)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,358 :: 		uint8_t reg = CTRL_REG4;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 35
SB	R30, 18(SP)
;accel3_hw.c,360 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,362 :: 		if ((scale > 3) || (scale < 0))
ANDI	R2, R25, 255
SLTIU	R2, R2, 4
BNE	R2, R0, L__accel3_set_full_scale134
NOP	
J	L__accel3_set_full_scale86
NOP	
L__accel3_set_full_scale134:
ANDI	R2, R25, 255
SLTIU	R2, R2, 0
BEQ	R2, R0, L__accel3_set_full_scale135
NOP	
J	L__accel3_set_full_scale85
NOP	
L__accel3_set_full_scale135:
J	L_accel3_set_full_scale37
NOP	
L__accel3_set_full_scale86:
L__accel3_set_full_scale85:
;accel3_hw.c,363 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_accel3_set_full_scale
NOP	
L_accel3_set_full_scale37:
;accel3_hw.c,365 :: 		temp |= ( scale << 4 );
ANDI	R2, R25, 255
SLL	R3, R2, 4
LBU	R2, 17(SP)
OR	R2, R2, R3
SB	R2, 17(SP)
;accel3_hw.c,366 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,367 :: 		return -1;
ORI	R2, R0, 255
;accel3_hw.c,368 :: 		}
;accel3_hw.c,367 :: 		return -1;
;accel3_hw.c,368 :: 		}
L_end_accel3_set_full_scale:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_set_full_scale
_accel3_get_full_scale:
;accel3_hw.c,370 :: 		full_scale_t accel3_get_full_scale( void )
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,373 :: 		uint8_t reg = CTRL_REG4;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 35
SB	R30, 17(SP)
;accel3_hw.c,375 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,376 :: 		temp &= ~(0xC0);
LBU	R2, 16(SP)
ANDI	R2, R2, 63
SB	R2, 16(SP)
;accel3_hw.c,377 :: 		temp = temp >> 4;
ANDI	R2, R2, 255
SRL	R2, R2, 4
SB	R2, 16(SP)
;accel3_hw.c,378 :: 		if( temp == 0x00 )
ANDI	R2, R2, 255
BEQ	R2, R0, L__accel3_get_full_scale137
NOP	
J	L_accel3_get_full_scale38
NOP	
L__accel3_get_full_scale137:
;accel3_hw.c,379 :: 		return SCALE_100_G;
MOVZ	R2, R0, R0
J	L_end_accel3_get_full_scale
NOP	
L_accel3_get_full_scale38:
;accel3_hw.c,380 :: 		else if( temp == 0x01 )
LBU	R3, 16(SP)
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_get_full_scale138
NOP	
J	L_accel3_get_full_scale40
NOP	
L__accel3_get_full_scale138:
;accel3_hw.c,381 :: 		return SCALE_200_G;
ORI	R2, R0, 1
J	L_end_accel3_get_full_scale
NOP	
L_accel3_get_full_scale40:
;accel3_hw.c,382 :: 		else if( temp == 0x03 )
LBU	R3, 16(SP)
ORI	R2, R0, 3
BEQ	R3, R2, L__accel3_get_full_scale139
NOP	
J	L_accel3_get_full_scale42
NOP	
L__accel3_get_full_scale139:
;accel3_hw.c,383 :: 		return SCALE_400_G;
ORI	R2, R0, 3
J	L_end_accel3_get_full_scale
NOP	
L_accel3_get_full_scale42:
;accel3_hw.c,385 :: 		}
L_end_accel3_get_full_scale:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_get_full_scale
_accel3_sleep_to_wake_enable:
;accel3_hw.c,387 :: 		void accel3_sleep_to_wake_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,390 :: 		uint8_t reg = CTRL_REG5;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 36
SB	R30, 18(SP)
;accel3_hw.c,392 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,393 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_sleep_to_wake_enable141
NOP	
J	L_accel3_sleep_to_wake_enable43
NOP	
L__accel3_sleep_to_wake_enable141:
;accel3_hw.c,394 :: 		temp |= (3);
LBU	R2, 17(SP)
ORI	R2, R2, 3
SB	R2, 17(SP)
J	L_accel3_sleep_to_wake_enable44
NOP	
L_accel3_sleep_to_wake_enable43:
;accel3_hw.c,396 :: 		temp &= ~(3);
LBU	R3, 17(SP)
ORI	R2, R0, 252
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_sleep_to_wake_enable44:
;accel3_hw.c,397 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,398 :: 		}
L_end_accel3_sleep_to_wake_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_sleep_to_wake_enable
_accel3_hp_filter_reset:
;accel3_hw.c,400 :: 		void  accel3_hp_filter_reset()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,403 :: 		uint8_t reg = HP_FILTER_RESET;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 37
SB	R30, 17(SP)
;accel3_hw.c,405 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,406 :: 		}
L_end_accel3_hp_filter_reset:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_hp_filter_reset
_accel3_hp_filter_set_reference:
;accel3_hw.c,408 :: 		void accel3_hp_filter_set_reference(uint8_t reference)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,410 :: 		uint8_t temp = reference;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
;accel3_hw.c,411 :: 		uint8_t reg = REFERENCE_REG;
ORI	R30, R0, 38
SB	R30, 17(SP)
;accel3_hw.c,413 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,414 :: 		}
L_end_accel3_hp_filter_set_reference:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_hp_filter_set_reference
_accel3_is_overrun_all:
;accel3_hw.c,416 :: 		int8_t accel3_is_overrun_all()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,419 :: 		uint8_t reg = STATUS_REG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 39
SB	R30, 17(SP)
;accel3_hw.c,421 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,423 :: 		return (temp >> 7);
LBU	R2, 16(SP)
SRL	R2, R2, 7
;accel3_hw.c,424 :: 		}
;accel3_hw.c,423 :: 		return (temp >> 7);
;accel3_hw.c,424 :: 		}
L_end_accel3_is_overrun_all:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_overrun_all
_accel3_is_overrun_x:
;accel3_hw.c,426 :: 		int8_t accel3_is_overrun_x()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,429 :: 		uint8_t reg = STATUS_REG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 39
SB	R30, 17(SP)
;accel3_hw.c,431 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,433 :: 		temp &= ~(1 << 4);
LBU	R3, 16(SP)
ORI	R2, R0, 239
AND	R2, R3, R2
SB	R2, 16(SP)
;accel3_hw.c,434 :: 		return ( temp >> 4 );
ANDI	R2, R2, 255
SRL	R2, R2, 4
;accel3_hw.c,435 :: 		}
;accel3_hw.c,434 :: 		return ( temp >> 4 );
;accel3_hw.c,435 :: 		}
L_end_accel3_is_overrun_x:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_overrun_x
_accel3_is_overrun_y:
;accel3_hw.c,437 :: 		int8_t accel3_is_overrun_y()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,440 :: 		uint8_t reg = STATUS_REG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 39
SB	R30, 17(SP)
;accel3_hw.c,442 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,444 :: 		temp &= ~(1 << 5);
LBU	R3, 16(SP)
ORI	R2, R0, 223
AND	R2, R3, R2
SB	R2, 16(SP)
;accel3_hw.c,445 :: 		return ( temp >> 5 );
ANDI	R2, R2, 255
SRL	R2, R2, 5
;accel3_hw.c,446 :: 		}
;accel3_hw.c,445 :: 		return ( temp >> 5 );
;accel3_hw.c,446 :: 		}
L_end_accel3_is_overrun_y:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_overrun_y
_accel3_is_overrun_z:
;accel3_hw.c,448 :: 		int8_t accel3_is_overrun_z()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,451 :: 		uint8_t reg = STATUS_REG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 39
SB	R30, 17(SP)
;accel3_hw.c,453 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,455 :: 		temp &= ~(1 << 6);
LBU	R3, 16(SP)
ORI	R2, R0, 191
AND	R2, R3, R2
SB	R2, 16(SP)
;accel3_hw.c,456 :: 		return ( temp >> 6 );
ANDI	R2, R2, 255
SRL	R2, R2, 6
;accel3_hw.c,457 :: 		}
;accel3_hw.c,456 :: 		return ( temp >> 6 );
;accel3_hw.c,457 :: 		}
L_end_accel3_is_overrun_z:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_overrun_z
_accel3_is_new_data_all:
;accel3_hw.c,459 :: 		int8_t accel3_is_new_data_all()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,462 :: 		uint8_t reg = STATUS_REG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 39
SB	R30, 17(SP)
;accel3_hw.c,464 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,466 :: 		temp &= (1 << 3);
LBU	R2, 16(SP)
ANDI	R2, R2, 8
SB	R2, 16(SP)
;accel3_hw.c,467 :: 		return ( temp >> 3 );
ANDI	R2, R2, 255
SRL	R2, R2, 3
;accel3_hw.c,468 :: 		}
;accel3_hw.c,467 :: 		return ( temp >> 3 );
;accel3_hw.c,468 :: 		}
L_end_accel3_is_new_data_all:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_new_data_all
_accel3_is_new_data_x:
;accel3_hw.c,470 :: 		int8_t accel3_is_new_data_x()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,473 :: 		uint8_t reg = STATUS_REG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 39
SB	R30, 17(SP)
;accel3_hw.c,475 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,477 :: 		temp &= (1);
LBU	R2, 16(SP)
ANDI	R2, R2, 1
SB	R2, 16(SP)
;accel3_hw.c,478 :: 		return temp;
;accel3_hw.c,479 :: 		}
;accel3_hw.c,478 :: 		return temp;
;accel3_hw.c,479 :: 		}
L_end_accel3_is_new_data_x:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_new_data_x
_accel3_is_new_data_y:
;accel3_hw.c,481 :: 		int8_t accel3_is_new_data_y()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,484 :: 		uint8_t reg = STATUS_REG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 39
SB	R30, 17(SP)
;accel3_hw.c,486 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,488 :: 		temp &= (1 << 1);
LBU	R2, 16(SP)
ANDI	R2, R2, 2
SB	R2, 16(SP)
;accel3_hw.c,489 :: 		return ( temp >> 1 );
ANDI	R2, R2, 255
SRL	R2, R2, 1
;accel3_hw.c,490 :: 		}
;accel3_hw.c,489 :: 		return ( temp >> 1 );
;accel3_hw.c,490 :: 		}
L_end_accel3_is_new_data_y:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_new_data_y
_accel3_is_new_data_z:
;accel3_hw.c,493 :: 		int8_t accel3_is_new_data_z()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,496 :: 		uint8_t reg = STATUS_REG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 39
SB	R30, 17(SP)
;accel3_hw.c,498 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,500 :: 		temp &= (1 << 2);
LBU	R2, 16(SP)
ANDI	R2, R2, 4
SB	R2, 16(SP)
;accel3_hw.c,501 :: 		return ( temp >> 2 );
ANDI	R2, R2, 255
SRL	R2, R2, 2
;accel3_hw.c,502 :: 		}
;accel3_hw.c,501 :: 		return ( temp >> 2 );
;accel3_hw.c,502 :: 		}
L_end_accel3_is_new_data_z:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_new_data_z
_accel3_read_acc_x:
;accel3_hw.c,504 :: 		int16_t accel3_read_acc_x()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,510 :: 		uint8_t reg_1 = OUT_X_L;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 40
SB	R30, 18(SP)
ORI	R30, R0, 41
SB	R30, 19(SP)
;accel3_hw.c,511 :: 		uint8_t reg_2 = OUT_X_H;
;accel3_hw.c,513 :: 		accel3_hal_read( &reg_1, &temp_1, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,514 :: 		accel3_hal_read( &reg_2, &temp_2, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 19
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,517 :: 		retval = ((int16_t) temp_2 ) << 8;
LB	R2, 17(SP)
SEH	R2, R2
SLL	R3, R2, 8
;accel3_hw.c,518 :: 		retval |= (int16_t)temp_1;
LB	R2, 16(SP)
OR	R2, R3, R2
;accel3_hw.c,520 :: 		return retval;
;accel3_hw.c,521 :: 		}
;accel3_hw.c,520 :: 		return retval;
;accel3_hw.c,521 :: 		}
L_end_accel3_read_acc_x:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_read_acc_x
_accel3_read_acc_y:
;accel3_hw.c,523 :: 		int16_t accel3_read_acc_y()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,528 :: 		uint8_t reg_1 = OUT_Y_L;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 42
SB	R30, 18(SP)
ORI	R30, R0, 43
SB	R30, 19(SP)
;accel3_hw.c,529 :: 		uint8_t reg_2 = OUT_Y_H;
;accel3_hw.c,531 :: 		accel3_hal_read( &reg_1, &temp_1, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,532 :: 		accel3_hal_read( &reg_2, &temp_2, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 19
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,534 :: 		retval = ((int16_t) temp_2 ) << 8;
LB	R2, 17(SP)
SEH	R2, R2
SLL	R3, R2, 8
;accel3_hw.c,535 :: 		retval |= (int16_t)temp_1;
LB	R2, 16(SP)
OR	R2, R3, R2
;accel3_hw.c,537 :: 		return retval;
;accel3_hw.c,538 :: 		}
;accel3_hw.c,537 :: 		return retval;
;accel3_hw.c,538 :: 		}
L_end_accel3_read_acc_y:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_read_acc_y
_accel3_read_acc_z:
;accel3_hw.c,540 :: 		int16_t accel3_read_acc_z()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,545 :: 		uint8_t reg_1 = OUT_Z_L;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 44
SB	R30, 18(SP)
ORI	R30, R0, 45
SB	R30, 19(SP)
;accel3_hw.c,546 :: 		uint8_t reg_2 = OUT_Z_H;
;accel3_hw.c,548 :: 		accel3_hal_read( &reg_1, &temp_1, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,549 :: 		accel3_hal_read( &reg_2, &temp_2, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 19
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,551 :: 		retval = ((int16_t) temp_2 ) << 8;
LB	R2, 17(SP)
SEH	R2, R2
SLL	R3, R2, 8
;accel3_hw.c,552 :: 		retval |= (int16_t)temp_1;
LB	R2, 16(SP)
OR	R2, R3, R2
;accel3_hw.c,554 :: 		return retval;
;accel3_hw.c,555 :: 		}
;accel3_hw.c,554 :: 		return retval;
;accel3_hw.c,555 :: 		}
L_end_accel3_read_acc_z:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_read_acc_z
_accel3_interrupt1_set_combination:
;accel3_hw.c,557 :: 		int8_t accel3_interrupt1_set_combination(int_comb_t combination)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,560 :: 		uint8_t reg = INT1_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 48
SB	R30, 18(SP)
;accel3_hw.c,562 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,564 :: 		if ( combination == OR)
ANDI	R2, R25, 255
BEQ	R2, R0, L__accel3_interrupt1_set_combination156
NOP	
J	L_accel3_interrupt1_set_combination45
NOP	
L__accel3_interrupt1_set_combination156:
;accel3_hw.c,565 :: 		temp &= ~(1 << 7);
LBU	R2, 17(SP)
ANDI	R2, R2, 127
SB	R2, 17(SP)
J	L_accel3_interrupt1_set_combination46
NOP	
L_accel3_interrupt1_set_combination45:
;accel3_hw.c,566 :: 		else if ( combination == AND)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt1_set_combination157
NOP	
J	L_accel3_interrupt1_set_combination47
NOP	
L__accel3_interrupt1_set_combination157:
;accel3_hw.c,567 :: 		temp |= (1 << 7);
LBU	R2, 17(SP)
ORI	R2, R2, 128
SB	R2, 17(SP)
J	L_accel3_interrupt1_set_combination48
NOP	
L_accel3_interrupt1_set_combination47:
;accel3_hw.c,569 :: 		return -1;
ORI	R2, R0, 255
J	L_end_accel3_interrupt1_set_combination
NOP	
L_accel3_interrupt1_set_combination48:
L_accel3_interrupt1_set_combination46:
;accel3_hw.c,570 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,571 :: 		return 0;
MOVZ	R2, R0, R0
;accel3_hw.c,572 :: 		}
;accel3_hw.c,571 :: 		return 0;
;accel3_hw.c,572 :: 		}
L_end_accel3_interrupt1_set_combination:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt1_set_combination
_accel3_interrupt1_z_high_enable:
;accel3_hw.c,574 :: 		void accel3_interrupt1_z_high_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,577 :: 		uint8_t reg = INT1_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 48
SB	R30, 18(SP)
;accel3_hw.c,579 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,581 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt1_z_high_enable159
NOP	
J	L_accel3_interrupt1_z_high_enable49
NOP	
L__accel3_interrupt1_z_high_enable159:
;accel3_hw.c,582 :: 		temp |= (1 << 5);
LBU	R2, 17(SP)
ORI	R2, R2, 32
SB	R2, 17(SP)
J	L_accel3_interrupt1_z_high_enable50
NOP	
L_accel3_interrupt1_z_high_enable49:
;accel3_hw.c,584 :: 		temp &= ~(1 << 5);
LBU	R3, 17(SP)
ORI	R2, R0, 223
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt1_z_high_enable50:
;accel3_hw.c,586 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,587 :: 		}
L_end_accel3_interrupt1_z_high_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt1_z_high_enable
_accel3_interrupt1_z_low_enable:
;accel3_hw.c,589 :: 		void accel3_interrupt1_z_low_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,592 :: 		uint8_t reg = INT1_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 48
SB	R30, 18(SP)
;accel3_hw.c,594 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,596 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt1_z_low_enable161
NOP	
J	L_accel3_interrupt1_z_low_enable51
NOP	
L__accel3_interrupt1_z_low_enable161:
;accel3_hw.c,597 :: 		temp |= (1 << 4);
LBU	R2, 17(SP)
ORI	R2, R2, 16
SB	R2, 17(SP)
J	L_accel3_interrupt1_z_low_enable52
NOP	
L_accel3_interrupt1_z_low_enable51:
;accel3_hw.c,599 :: 		temp &= ~(1 << 4);
LBU	R3, 17(SP)
ORI	R2, R0, 239
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt1_z_low_enable52:
;accel3_hw.c,600 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,601 :: 		}
L_end_accel3_interrupt1_z_low_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt1_z_low_enable
_accel3_interrupt1_y_high_enable:
;accel3_hw.c,603 :: 		void accel3_interrupt1_y_high_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,606 :: 		uint8_t reg = INT1_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 48
SB	R30, 18(SP)
;accel3_hw.c,608 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,610 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt1_y_high_enable163
NOP	
J	L_accel3_interrupt1_y_high_enable53
NOP	
L__accel3_interrupt1_y_high_enable163:
;accel3_hw.c,611 :: 		temp |= (1 << 3);
LBU	R2, 17(SP)
ORI	R2, R2, 8
SB	R2, 17(SP)
J	L_accel3_interrupt1_y_high_enable54
NOP	
L_accel3_interrupt1_y_high_enable53:
;accel3_hw.c,613 :: 		temp &= ~(1 << 3);
LBU	R3, 17(SP)
ORI	R2, R0, 247
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt1_y_high_enable54:
;accel3_hw.c,614 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,615 :: 		}
L_end_accel3_interrupt1_y_high_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt1_y_high_enable
_accel3_interrupt1_y_low_enable:
;accel3_hw.c,617 :: 		void accel3_interrupt1_y_low_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,620 :: 		uint8_t reg = INT1_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 48
SB	R30, 18(SP)
;accel3_hw.c,622 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,624 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt1_y_low_enable165
NOP	
J	L_accel3_interrupt1_y_low_enable55
NOP	
L__accel3_interrupt1_y_low_enable165:
;accel3_hw.c,625 :: 		temp |= (1 << 2);
LBU	R2, 17(SP)
ORI	R2, R2, 4
SB	R2, 17(SP)
J	L_accel3_interrupt1_y_low_enable56
NOP	
L_accel3_interrupt1_y_low_enable55:
;accel3_hw.c,627 :: 		temp &= ~(1 << 2);
LBU	R3, 17(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt1_y_low_enable56:
;accel3_hw.c,628 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,629 :: 		}
L_end_accel3_interrupt1_y_low_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt1_y_low_enable
_accel3_interrupt1_x_high_enable:
;accel3_hw.c,631 :: 		void accel3_interrupt1_x_high_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,634 :: 		uint8_t reg = INT1_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 48
SB	R30, 18(SP)
;accel3_hw.c,636 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,638 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt1_x_high_enable167
NOP	
J	L_accel3_interrupt1_x_high_enable57
NOP	
L__accel3_interrupt1_x_high_enable167:
;accel3_hw.c,639 :: 		temp |= (1 << 1);
LBU	R2, 17(SP)
ORI	R2, R2, 2
SB	R2, 17(SP)
J	L_accel3_interrupt1_x_high_enable58
NOP	
L_accel3_interrupt1_x_high_enable57:
;accel3_hw.c,641 :: 		temp &= ~(1 << 1);
LBU	R3, 17(SP)
ORI	R2, R0, 253
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt1_x_high_enable58:
;accel3_hw.c,642 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,643 :: 		}
L_end_accel3_interrupt1_x_high_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt1_x_high_enable
_accel3_interrupt1_x_low_enable:
;accel3_hw.c,645 :: 		void accel3_interrupt1_x_low_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,648 :: 		uint8_t reg = INT1_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 48
SB	R30, 18(SP)
;accel3_hw.c,650 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,652 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt1_x_low_enable169
NOP	
J	L_accel3_interrupt1_x_low_enable59
NOP	
L__accel3_interrupt1_x_low_enable169:
;accel3_hw.c,653 :: 		temp |= 1;
LBU	R2, 17(SP)
ORI	R2, R2, 1
SB	R2, 17(SP)
J	L_accel3_interrupt1_x_low_enable60
NOP	
L_accel3_interrupt1_x_low_enable59:
;accel3_hw.c,655 :: 		temp &= ~(1);
LBU	R3, 17(SP)
ORI	R2, R0, 254
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt1_x_low_enable60:
;accel3_hw.c,656 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,657 :: 		}
L_end_accel3_interrupt1_x_low_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt1_x_low_enable
_accel3_is_interrupt1:
;accel3_hw.c,659 :: 		int8_t accel3_is_interrupt1()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,662 :: 		uint8_t reg = INT1_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 49
SB	R30, 17(SP)
;accel3_hw.c,664 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,666 :: 		return (temp >> 6);
LBU	R2, 16(SP)
SRL	R2, R2, 6
;accel3_hw.c,667 :: 		}
;accel3_hw.c,666 :: 		return (temp >> 6);
;accel3_hw.c,667 :: 		}
L_end_accel3_is_interrupt1:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_interrupt1
_accel3_is_z_high_interrupt1:
;accel3_hw.c,669 :: 		int8_t accel3_is_z_high_interrupt1()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,672 :: 		uint8_t reg = INT1_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 49
SB	R30, 17(SP)
;accel3_hw.c,674 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,676 :: 		temp &= (1<<5);
LBU	R2, 16(SP)
ANDI	R2, R2, 32
SB	R2, 16(SP)
;accel3_hw.c,677 :: 		return (temp >> 5);
ANDI	R2, R2, 255
SRL	R2, R2, 5
;accel3_hw.c,678 :: 		}
;accel3_hw.c,677 :: 		return (temp >> 5);
;accel3_hw.c,678 :: 		}
L_end_accel3_is_z_high_interrupt1:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_z_high_interrupt1
_accel3_is_z_low_interrupt1:
;accel3_hw.c,680 :: 		int8_t accel3_is_z_low_interrupt1()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,682 :: 		uint8_t temp = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 16(SP)
ORI	R30, R0, 49
SB	R30, 17(SP)
;accel3_hw.c,683 :: 		uint8_t reg = INT1_SRC;
;accel3_hw.c,685 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,687 :: 		temp &= (1<<4);
LBU	R2, 16(SP)
ANDI	R2, R2, 16
SB	R2, 16(SP)
;accel3_hw.c,688 :: 		return (temp >> 4);
ANDI	R2, R2, 255
SRL	R2, R2, 4
;accel3_hw.c,689 :: 		}
;accel3_hw.c,688 :: 		return (temp >> 4);
;accel3_hw.c,689 :: 		}
L_end_accel3_is_z_low_interrupt1:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_z_low_interrupt1
_accel3_is_y_high_interrupt1:
;accel3_hw.c,691 :: 		int8_t accel3_is_y_high_interrupt1()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,694 :: 		uint8_t reg = INT1_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 49
SB	R30, 17(SP)
;accel3_hw.c,696 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,698 :: 		temp &= ~(1<<3);
LBU	R3, 16(SP)
ORI	R2, R0, 247
AND	R2, R3, R2
SB	R2, 16(SP)
;accel3_hw.c,699 :: 		return (temp >> 3);
ANDI	R2, R2, 255
SRL	R2, R2, 3
;accel3_hw.c,700 :: 		}
;accel3_hw.c,699 :: 		return (temp >> 3);
;accel3_hw.c,700 :: 		}
L_end_accel3_is_y_high_interrupt1:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_y_high_interrupt1
_accel3_is_y_low_interrupt1:
;accel3_hw.c,702 :: 		int8_t accel3_is_y_low_interrupt1()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,705 :: 		uint8_t reg = INT1_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 49
SB	R30, 17(SP)
;accel3_hw.c,707 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,709 :: 		temp &= ~(1<<2);
LBU	R3, 16(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R2, 16(SP)
;accel3_hw.c,710 :: 		return (temp >> 2);
ANDI	R2, R2, 255
SRL	R2, R2, 2
;accel3_hw.c,711 :: 		}
;accel3_hw.c,710 :: 		return (temp >> 2);
;accel3_hw.c,711 :: 		}
L_end_accel3_is_y_low_interrupt1:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_y_low_interrupt1
_accel3_is_x_high_interrupt1:
;accel3_hw.c,713 :: 		int8_t accel3_is_x_high_interrupt1()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,716 :: 		uint8_t reg = INT1_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 49
SB	R30, 17(SP)
;accel3_hw.c,718 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,720 :: 		temp &= (1<<1);
LBU	R2, 16(SP)
ANDI	R2, R2, 2
SB	R2, 16(SP)
;accel3_hw.c,721 :: 		return (temp >> 1);
ANDI	R2, R2, 255
SRL	R2, R2, 1
;accel3_hw.c,722 :: 		}
;accel3_hw.c,721 :: 		return (temp >> 1);
;accel3_hw.c,722 :: 		}
L_end_accel3_is_x_high_interrupt1:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_x_high_interrupt1
_accel3_is_x_low_interrupt1:
;accel3_hw.c,724 :: 		int8_t accel3_is_x_low_interrupt1()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,727 :: 		uint8_t reg = INT1_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 49
SB	R30, 17(SP)
;accel3_hw.c,729 :: 		accel3_hal_read ( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,731 :: 		temp &= (1);
LBU	R2, 16(SP)
ANDI	R2, R2, 1
SB	R2, 16(SP)
;accel3_hw.c,732 :: 		return (temp);
;accel3_hw.c,733 :: 		}
;accel3_hw.c,732 :: 		return (temp);
;accel3_hw.c,733 :: 		}
L_end_accel3_is_x_low_interrupt1:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_x_low_interrupt1
_accel3_int1_set_threshold:
;accel3_hw.c,735 :: 		int8_t accel3_int1_set_threshold(uint8_t threshold)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,737 :: 		uint8_t temp = threshold;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
;accel3_hw.c,738 :: 		uint8_t reg = INT1_THS;
ORI	R30, R0, 50
SB	R30, 17(SP)
;accel3_hw.c,740 :: 		if (threshold > (1<<7))
ANDI	R2, R25, 255
SLTIU	R2, R2, 129
BEQ	R2, R0, L__accel3_int1_set_threshold178
NOP	
J	L_accel3_int1_set_threshold61
NOP	
L__accel3_int1_set_threshold178:
;accel3_hw.c,741 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_accel3_int1_set_threshold
NOP	
L_accel3_int1_set_threshold61:
;accel3_hw.c,743 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,744 :: 		return -1;
ORI	R2, R0, 255
;accel3_hw.c,745 :: 		}
;accel3_hw.c,744 :: 		return -1;
;accel3_hw.c,745 :: 		}
L_end_accel3_int1_set_threshold:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_int1_set_threshold
_accel3_int1_set_duration:
;accel3_hw.c,747 :: 		int8_t accel3_int1_set_duration(uint8_t duration)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,749 :: 		uint8_t temp = duration;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
;accel3_hw.c,750 :: 		uint8_t reg = INT1_DUR;
ORI	R30, R0, 51
SB	R30, 17(SP)
;accel3_hw.c,752 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,753 :: 		return -1;
ORI	R2, R0, 255
;accel3_hw.c,754 :: 		}
;accel3_hw.c,753 :: 		return -1;
;accel3_hw.c,754 :: 		}
L_end_accel3_int1_set_duration:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_int1_set_duration
_accel3_interrupt2_set_combination:
;accel3_hw.c,756 :: 		int8_t accel3_interrupt2_set_combination(int_comb_t combination)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,759 :: 		uint8_t reg = INT2_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 52
SB	R30, 18(SP)
;accel3_hw.c,761 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,763 :: 		if ( combination == OR)
ANDI	R2, R25, 255
BEQ	R2, R0, L__accel3_interrupt2_set_combination181
NOP	
J	L_accel3_interrupt2_set_combination63
NOP	
L__accel3_interrupt2_set_combination181:
;accel3_hw.c,764 :: 		temp &= ~(1 << 7);
LBU	R2, 17(SP)
ANDI	R2, R2, 127
SB	R2, 17(SP)
J	L_accel3_interrupt2_set_combination64
NOP	
L_accel3_interrupt2_set_combination63:
;accel3_hw.c,765 :: 		else if ( combination == AND)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt2_set_combination182
NOP	
J	L_accel3_interrupt2_set_combination65
NOP	
L__accel3_interrupt2_set_combination182:
;accel3_hw.c,766 :: 		temp |= (1 << 7);
LBU	R2, 17(SP)
ORI	R2, R2, 128
SB	R2, 17(SP)
J	L_accel3_interrupt2_set_combination66
NOP	
L_accel3_interrupt2_set_combination65:
;accel3_hw.c,768 :: 		return -1;
ORI	R2, R0, 255
J	L_end_accel3_interrupt2_set_combination
NOP	
L_accel3_interrupt2_set_combination66:
L_accel3_interrupt2_set_combination64:
;accel3_hw.c,769 :: 		accel3_hal_write ( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,770 :: 		return 0;
MOVZ	R2, R0, R0
;accel3_hw.c,771 :: 		}
;accel3_hw.c,770 :: 		return 0;
;accel3_hw.c,771 :: 		}
L_end_accel3_interrupt2_set_combination:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt2_set_combination
_accel3_interrupt2_z_high_enable:
;accel3_hw.c,773 :: 		void accel3_interrupt2_z_high_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,776 :: 		uint8_t reg = INT2_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 52
SB	R30, 18(SP)
;accel3_hw.c,778 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,780 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt2_z_high_enable184
NOP	
J	L_accel3_interrupt2_z_high_enable67
NOP	
L__accel3_interrupt2_z_high_enable184:
;accel3_hw.c,781 :: 		temp |= ( 1 << 5 );
LBU	R2, 17(SP)
ORI	R2, R2, 32
SB	R2, 17(SP)
J	L_accel3_interrupt2_z_high_enable68
NOP	
L_accel3_interrupt2_z_high_enable67:
;accel3_hw.c,783 :: 		temp &= ~( 1 << 5);
LBU	R3, 17(SP)
ORI	R2, R0, 223
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt2_z_high_enable68:
;accel3_hw.c,785 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,786 :: 		}
L_end_accel3_interrupt2_z_high_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt2_z_high_enable
_accel3_interrupt2_z_low_enable:
;accel3_hw.c,788 :: 		void accel3_interrupt2_z_low_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,791 :: 		uint8_t reg = INT2_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 52
SB	R30, 18(SP)
;accel3_hw.c,793 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,795 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt2_z_low_enable186
NOP	
J	L_accel3_interrupt2_z_low_enable69
NOP	
L__accel3_interrupt2_z_low_enable186:
;accel3_hw.c,796 :: 		temp |= ( 1 << 4 );
LBU	R2, 17(SP)
ORI	R2, R2, 16
SB	R2, 17(SP)
J	L_accel3_interrupt2_z_low_enable70
NOP	
L_accel3_interrupt2_z_low_enable69:
;accel3_hw.c,798 :: 		temp &= ~( 1 << 4);
LBU	R3, 17(SP)
ORI	R2, R0, 239
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt2_z_low_enable70:
;accel3_hw.c,800 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,801 :: 		}
L_end_accel3_interrupt2_z_low_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt2_z_low_enable
_accel3_interrupt2_y_high_enable:
;accel3_hw.c,803 :: 		void accel3_interrupt2_y_high_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,806 :: 		uint8_t reg = INT2_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 52
SB	R30, 18(SP)
;accel3_hw.c,808 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,810 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt2_y_high_enable188
NOP	
J	L_accel3_interrupt2_y_high_enable71
NOP	
L__accel3_interrupt2_y_high_enable188:
;accel3_hw.c,811 :: 		temp |= ( 1 << 3 );
LBU	R2, 17(SP)
ORI	R2, R2, 8
SB	R2, 17(SP)
J	L_accel3_interrupt2_y_high_enable72
NOP	
L_accel3_interrupt2_y_high_enable71:
;accel3_hw.c,813 :: 		temp &= ~( 1 << 3 );
LBU	R3, 17(SP)
ORI	R2, R0, 247
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt2_y_high_enable72:
;accel3_hw.c,815 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,816 :: 		}
L_end_accel3_interrupt2_y_high_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt2_y_high_enable
_accel3_interrupt2_y_low_enable:
;accel3_hw.c,818 :: 		void accel3_interrupt2_y_low_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,821 :: 		uint8_t reg = INT2_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 52
SB	R30, 18(SP)
;accel3_hw.c,823 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,825 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt2_y_low_enable190
NOP	
J	L_accel3_interrupt2_y_low_enable73
NOP	
L__accel3_interrupt2_y_low_enable190:
;accel3_hw.c,826 :: 		temp |= ( 1 << 2 );
LBU	R2, 17(SP)
ORI	R2, R2, 4
SB	R2, 17(SP)
J	L_accel3_interrupt2_y_low_enable74
NOP	
L_accel3_interrupt2_y_low_enable73:
;accel3_hw.c,828 :: 		temp &= ~( 1 << 2 );
LBU	R3, 17(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt2_y_low_enable74:
;accel3_hw.c,830 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,831 :: 		}
L_end_accel3_interrupt2_y_low_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt2_y_low_enable
_accel3_interrupt2_x_high_enable:
;accel3_hw.c,833 :: 		void accel3_interrupt2_x_high_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,836 :: 		uint8_t reg = INT2_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 52
SB	R30, 18(SP)
;accel3_hw.c,838 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,840 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt2_x_high_enable192
NOP	
J	L_accel3_interrupt2_x_high_enable75
NOP	
L__accel3_interrupt2_x_high_enable192:
;accel3_hw.c,841 :: 		temp |= ( 1 << 1 );
LBU	R2, 17(SP)
ORI	R2, R2, 2
SB	R2, 17(SP)
J	L_accel3_interrupt2_x_high_enable76
NOP	
L_accel3_interrupt2_x_high_enable75:
;accel3_hw.c,843 :: 		temp &= ~( 1 << 1);
LBU	R3, 17(SP)
ORI	R2, R0, 253
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt2_x_high_enable76:
;accel3_hw.c,845 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,846 :: 		}
L_end_accel3_interrupt2_x_high_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt2_x_high_enable
_accel3_interrupt2_x_low_enable:
;accel3_hw.c,848 :: 		void accel3_interrupt2_x_low_enable(bool enable)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,851 :: 		uint8_t reg = INT2_CFG;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 52
SB	R30, 18(SP)
;accel3_hw.c,853 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
LBU	R25, 16(SP)
;accel3_hw.c,855 :: 		if (enable == true)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__accel3_interrupt2_x_low_enable194
NOP	
J	L_accel3_interrupt2_x_low_enable77
NOP	
L__accel3_interrupt2_x_low_enable194:
;accel3_hw.c,856 :: 		temp |= 1;
LBU	R2, 17(SP)
ORI	R2, R2, 1
SB	R2, 17(SP)
J	L_accel3_interrupt2_x_low_enable78
NOP	
L_accel3_interrupt2_x_low_enable77:
;accel3_hw.c,858 :: 		temp &= ~( 1 );
LBU	R3, 17(SP)
ORI	R2, R0, 254
AND	R2, R3, R2
SB	R2, 17(SP)
L_accel3_interrupt2_x_low_enable78:
;accel3_hw.c,860 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 17
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,861 :: 		}
L_end_accel3_interrupt2_x_low_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_interrupt2_x_low_enable
_accel3_is_interrupt2:
;accel3_hw.c,863 :: 		int8_t accel3_is_interrupt2()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,866 :: 		uint8_t reg = INT2_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 53
SB	R30, 17(SP)
;accel3_hw.c,868 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,870 :: 		temp &= ( 1 << 6 );
LBU	R2, 16(SP)
ANDI	R2, R2, 64
SB	R2, 16(SP)
;accel3_hw.c,871 :: 		return (temp >> 6); //Returns 1 if interrupt is triggered
ANDI	R2, R2, 255
SRL	R2, R2, 6
;accel3_hw.c,872 :: 		}
;accel3_hw.c,871 :: 		return (temp >> 6); //Returns 1 if interrupt is triggered
;accel3_hw.c,872 :: 		}
L_end_accel3_is_interrupt2:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_interrupt2
_accel3_is_z_high_interrupt2:
;accel3_hw.c,874 :: 		int8_t accel3_is_z_high_interrupt2()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,877 :: 		uint8_t reg = INT2_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 53
SB	R30, 17(SP)
;accel3_hw.c,879 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,881 :: 		temp &= (1 << 5);
LBU	R2, 16(SP)
ANDI	R2, R2, 32
SB	R2, 16(SP)
;accel3_hw.c,882 :: 		return (temp >> 5);
ANDI	R2, R2, 255
SRL	R2, R2, 5
;accel3_hw.c,883 :: 		}
;accel3_hw.c,882 :: 		return (temp >> 5);
;accel3_hw.c,883 :: 		}
L_end_accel3_is_z_high_interrupt2:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_z_high_interrupt2
_accel3_is_z_low_interrupt2:
;accel3_hw.c,885 :: 		int8_t accel3_is_z_low_interrupt2()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,888 :: 		uint8_t reg = INT2_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 53
SB	R30, 17(SP)
;accel3_hw.c,890 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,892 :: 		temp &= (1 << 4);
LBU	R2, 16(SP)
ANDI	R2, R2, 16
SB	R2, 16(SP)
;accel3_hw.c,893 :: 		return (temp >> 4);
ANDI	R2, R2, 255
SRL	R2, R2, 4
;accel3_hw.c,894 :: 		}
;accel3_hw.c,893 :: 		return (temp >> 4);
;accel3_hw.c,894 :: 		}
L_end_accel3_is_z_low_interrupt2:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_z_low_interrupt2
_accel3_is_y_high_interrupt2:
;accel3_hw.c,896 :: 		int8_t accel3_is_y_high_interrupt2()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,899 :: 		uint8_t reg = INT2_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 53
SB	R30, 17(SP)
;accel3_hw.c,901 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,903 :: 		temp &= (1 << 3);
LBU	R2, 16(SP)
ANDI	R2, R2, 8
SB	R2, 16(SP)
;accel3_hw.c,904 :: 		return (temp >> 3);
ANDI	R2, R2, 255
SRL	R2, R2, 3
;accel3_hw.c,905 :: 		}
;accel3_hw.c,904 :: 		return (temp >> 3);
;accel3_hw.c,905 :: 		}
L_end_accel3_is_y_high_interrupt2:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_y_high_interrupt2
_accel3_is_y_low_interrupt2:
;accel3_hw.c,907 :: 		int8_t accel3_is_y_low_interrupt2()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,910 :: 		uint8_t reg = INT2_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 53
SB	R30, 17(SP)
;accel3_hw.c,912 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,914 :: 		temp &= (1 << 2);
LBU	R2, 16(SP)
ANDI	R2, R2, 4
SB	R2, 16(SP)
;accel3_hw.c,915 :: 		return (temp >> 2);
ANDI	R2, R2, 255
SRL	R2, R2, 2
;accel3_hw.c,916 :: 		}
;accel3_hw.c,915 :: 		return (temp >> 2);
;accel3_hw.c,916 :: 		}
L_end_accel3_is_y_low_interrupt2:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_y_low_interrupt2
_accel3_is_x_high_interrupt2:
;accel3_hw.c,918 :: 		int8_t accel3_is_x_high_interrupt2()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,921 :: 		uint8_t reg = INT2_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 53
SB	R30, 17(SP)
;accel3_hw.c,923 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,925 :: 		temp &= (1 << 1);
LBU	R2, 16(SP)
ANDI	R2, R2, 2
SB	R2, 16(SP)
;accel3_hw.c,926 :: 		return (temp >> 1);
ANDI	R2, R2, 255
SRL	R2, R2, 1
;accel3_hw.c,927 :: 		}
;accel3_hw.c,926 :: 		return (temp >> 1);
;accel3_hw.c,927 :: 		}
L_end_accel3_is_x_high_interrupt2:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_x_high_interrupt2
_accel3_is_x_low_interrupt2:
;accel3_hw.c,929 :: 		int8_t accel3_is_x_low_interrupt2()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,932 :: 		uint8_t reg = INT2_SRC;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 53
SB	R30, 17(SP)
;accel3_hw.c,934 :: 		accel3_hal_read( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_read+0
NOP	
;accel3_hw.c,936 :: 		temp &= (1);
LBU	R2, 16(SP)
ANDI	R2, R2, 1
SB	R2, 16(SP)
;accel3_hw.c,937 :: 		return temp;
;accel3_hw.c,938 :: 		}
;accel3_hw.c,937 :: 		return temp;
;accel3_hw.c,938 :: 		}
L_end_accel3_is_x_low_interrupt2:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_is_x_low_interrupt2
_accel3_int2_set_threshold:
;accel3_hw.c,940 :: 		int8_t accel3_int2_set_threshold(uint8_t threshold)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,942 :: 		uint8_t temp = threshold;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
;accel3_hw.c,943 :: 		uint8_t reg = INT2_THS;
ORI	R30, R0, 54
SB	R30, 17(SP)
;accel3_hw.c,945 :: 		if ( temp > ( 1<<7 ) )
LBU	R2, 16(SP)
SLTIU	R2, R2, 129
BEQ	R2, R0, L__accel3_int2_set_threshold203
NOP	
J	L_accel3_int2_set_threshold79
NOP	
L__accel3_int2_set_threshold203:
;accel3_hw.c,946 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_accel3_int2_set_threshold
NOP	
L_accel3_int2_set_threshold79:
;accel3_hw.c,948 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,949 :: 		return -1;
ORI	R2, R0, 255
;accel3_hw.c,950 :: 		}
;accel3_hw.c,949 :: 		return -1;
;accel3_hw.c,950 :: 		}
L_end_accel3_int2_set_threshold:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_int2_set_threshold
_accel3_int2_set_duration:
;accel3_hw.c,952 :: 		int8_t accel3_int2_set_duration(uint8_t duration)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;accel3_hw.c,954 :: 		uint8_t temp = duration;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
;accel3_hw.c,955 :: 		uint8_t reg = INT2_DUR;
ORI	R30, R0, 55
SB	R30, 17(SP)
;accel3_hw.c,957 :: 		accel3_hal_write( &reg, &temp, 1 );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_accel3_hal_write+0
NOP	
;accel3_hw.c,958 :: 		return -1;
ORI	R2, R0, 255
;accel3_hw.c,959 :: 		}
;accel3_hw.c,958 :: 		return -1;
;accel3_hw.c,959 :: 		}
L_end_accel3_int2_set_duration:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _accel3_int2_set_duration
_accel3_get_xyz_sensitivity:
;accel3_hw.c,961 :: 		axes_sens_t* accel3_get_xyz_sensitivity( void )
ADDIU	SP, SP, -12
;accel3_hw.c,964 :: 		sensitive_t.x = x_sens;
LH	R2, Offset(accel3_hw_x_sens+0)(GP)
SH	R2, 4(SP)
;accel3_hw.c,965 :: 		sensitive_t.y = y_sens;
LH	R2, Offset(accel3_hw_y_sens+0)(GP)
SH	R2, 6(SP)
;accel3_hw.c,966 :: 		sensitive_t.z = z_sens;
LH	R2, Offset(accel3_hw_z_sens+0)(GP)
SH	R2, 8(SP)
;accel3_hw.c,968 :: 		return &sensitive_t;
ADDIU	R2, SP, 4
;accel3_hw.c,969 :: 		}
L_end_accel3_get_xyz_sensitivity:
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _accel3_get_xyz_sensitivity
