; da65 V2.15 - Git b3d84d5
; Created:    2016-05-13 11:27:53
; Input file: ../START.COM
; Page:       1


	.setcpu "6502"

; ----------------------------------------------------------------------------
DOSINI		:= $000A
ROWCRS		:= $0054
off_AE		:= $00AE
CDTMV3		:= $021C
CDTMF3		:= $022A
CRSINH		:= $02F0
ICCOM		:= $0342
ICBA		:= $0344
LD8E6           := $D8E6
LD9AA           := $D9AA
CIOV		:= $E456
; ----------------------------------------------------------------------------

.macro  Inverse       Arg
	.repeat .strlen(Arg), I
		.scope
			Ch = .strat(Arg, I)
			.byte Ch | $80
		.endscope
	.endrep
.endmacro

	.include "action.inc"

	.segment "HDR00"

	.word	$FFFF
	.addr	L2CEC
	.addr	$5ED5

	.segment "SEG00"

L2CEC:
	.byte   $49                             ; 2CEC 49                       I
L2CED:  lsr     $D6                             ; 2CED 46 D6                    F.
	lsr     a:$02,x                         ; 2CEF 5E 02 00                 ^..
L2CF2:	.byte	$00
	brk                                     ; 2CF3 00                       .
	brk                                     ; 2CF4 00                       .
	brk                                     ; 2CF5 00                       .
L2CF6:	.byte	$00
L2CF7:	.byte	$00
L2CF8:  ora     ($02,x)                         ; 2CF8 01 02                    ..
	brk                                     ; 2CFA 00                       .
L2CFB:  .byte   $FE                             ; 2CFB FE                       .
L2CFC:	.byte	$00
L2CFD:  jsr     $2CEE                           ; 2CFD 20 EE 2C                  .,
	.byte   $5A                             ; 2D00 5A                       Z
	brk                                     ; 2D01 00                       .
	.byte	" INC"
	brk                                     ; 2D06 00                       .
	brk                                     ; 2D07 00                       .
	ora     $6F,y                           ; 2D08 19 6F 00                 .o.
	brk                                     ; 2D0B 00                       .
	ora     ($3B,x)                         ; 2D0C 01 3B                    .;
	brk                                     ; 2D0E 00                       .
	brk                                     ; 2D0F 00                       .
	ora     ($6F),y                         ; 2D10 11 6F                    .o
	brk                                     ; 2D12 00                       .
	brk                                     ; 2D13 00                       .
	.byte   $0B,"   Put("
	.byte	$20
	.byte	$27
	.byte	$7D
	and     #$00                            ; 2D1F 29 00                    ).
	brk                                     ; 2D21 00                       .
	.byte   $FF                             ; 2D22 FF                       .
	ror     a:$00                           ; 2D23 6E 00 00                 n..
	.byte	$2A,"   BoxStr( "
	.byte	$38
	.byte	$2C
	.byte	" 10, ",$22," "
	ldy     #$C1                            ; 2D3B A0 C1                    ..
	.byte   $E3                             ; 2D3D E3                       .
	.byte   $E3                             ; 2D3E E3                       .
	sbc     $F3                             ; 2D3F E5 F3                    ..
	.byte   $F3                             ; 2D41 F3                       .
	sbc     #$EE                            ; 2D42 E9 EE                    ..
	.byte   $E7                             ; 2D44 E7                       .
	ldy     #$C7                            ; 2D45 A0 C7                    ..
	.byte   $C3                             ; 2D47 C3                       .
	bne     L2CF6                           ; 2D48 D0 AC                    ..
	ldy     #$C9                            ; 2D4A A0 C9                    ..
	inc     $A0E3                           ; 2D4C EE E3 A0                 ...
	.byte   $22                             ; 2D4F 22                       "
	and     #$00                            ; 2D50 29 00                    ).
	brk                                     ; 2D52 00                       .
	dec     a:$6E                           ; 2D53 CE 6E 00                 .n.
	brk                                     ; 2D56 00                       .
	.byte   $13                             ; 2D57 13                       .
L2D58:  .byte   $20                             ; 2D58 20                        
	.byte   $20                             ; 2D59 20                        
L2D5A:  .byte   $20                             ; 2D5A 20                        
L2D5B:  inc     L5A2C                           ; 2D5B EE 2C 5A                 .,Z
	brk                                     ; 2D5E 00                       .
	.byte   $74                             ; 2D5F 74                       t
	adc     #$6F                            ; 2D60 69 6F                    io
	ror     $2028                           ; 2D62 6E 28 20                 n( 
	.byte	$30
	.byte	$2C
	jsr     L3531                           ; 2D67 20 31 35                  15
	and     #$00                            ; 2D6A 29 00                    ).
	brk                                     ; 2D6C 00                       .
	ldy     $6E,x                           ; 2D6D B4 6E                    .n
	brk                                     ; 2D6F 00                       .
	brk                                     ; 2D70 00                       .
	ora     #$20                            ; 2D71 09 20                    . 
	jsr     L4920                           ; 2D73 20 20 49                   I
	eor     $6D64                           ; 2D76 4D 64 6D                 Mdm
	plp                                     ; 2D79 28                       (
	and     #$00                            ; 2D7A 29 00                    ).
	brk                                     ; 2D7C 00                       .
	ldy     $6E                             ; 2D7D A4 6E                    .n
	brk                                     ; 2D7F 00                       .
	brk                                     ; 2D80 00                       .
	ora     ($3B,x)                         ; 2D81 01 3B                    .;
	brk                                     ; 2D83 00                       .
	brk                                     ; 2D84 00                       .
	.byte   $9C                             ; 2D85 9C                       .
	ror     a:$00                           ; 2D86 6E 00 00                 n..
	.byte   $13                             ; 2D89 13                       .
	.byte	";--- SEND"
	.byte	$20
	.byte	$4C
	.byte	$4F
	.byte   $47                             ; 2D96 47                       G
	.byte   $4F                             ; 2D97 4F                       O
	.byte	$4E,$20,$50
	.byte   $4B                             ; 2D9B 4B                       K
	.byte   $54                             ; 2D9C 54                       T
	brk                                     ; 2D9D 00                       .
	brk                                     ; 2D9E 00                       .
	.byte   $82                             ; 2D9F 82                       .
	ror     a:$00                           ; 2DA0 6E 00 00                 n..
	ora     ($3B,x)                         ; 2DA3 01 3B                    .;
	brk                                     ; 2DA5 00                       .
	brk                                     ; 2DA6 00                       .
	.byte   $7A                             ; 2DA7 7A                       z
	ror     a:$00                           ; 2DA8 6E 00 00                 n..
	.byte   $2F,"   "
	bvc     L2E26                           ; 2DAF 50 75                    Pu
	.byte   $74                             ; 2DB1 74                       t
	bvc     L2E1F                           ; 2DB2 50 6B                    Pk
	.byte   $74                             ; 2DB4 74                       t
L2DB5:
	.byte	$EE,$2C,$5A,$00
	.byte   $73                             ; 2DB9 73                       s
	.byte   $22                             ; 2DBA 22                       "
	.byte	", 'l, logon_msg(0), logon_msg+1)"
	brk                                     ; 2DDB 00                       .
	brk                                     ; 2DDC 00                       .
	.byte   $44                             ; 2DDD 44                       D
	ror     a:$00                           ; 2DDE 6E 00 00                 n..
	brk                                     ; 2DE1 00                       .
	brk                                     ; 2DE2 00                       .
	brk                                     ; 2DE3 00                       .
	and     a:$6E,x                         ; 2DE4 3D 6E 00                 =n.
	brk                                     ; 2DE7 00                       .
	ora     #$20                            ; 2DE8 09 20                    . 
	jsr     L4320                           ; 2DEA 20 20 43                   C
	eor     $6D64                           ; 2DED 4D 64 6D                 Mdm
	plp                                     ; 2DF0 28                       (
	and     #$00                            ; 2DF1 29 00                    ).
	brk                                     ; 2DF3 00                       .
	.byte   $2D                             ; 2DF4 2D                       -
	.byte   $6E                             ; 2DF5 6E                       n
L2DF6:	.byte	$00
	brk                                     ; 2DF7 00                       .
	ora     ($3B,x)                         ; 2DF8 01 3B                    .;
	brk                                     ; 2DFA 00                       .
	brk                                     ; 2DFB 00                       .
	and     $6E                             ; 2DFC 25 6E                    %n
	brk                                     ; 2DFE 00                       .
	brk                                     ; 2DFF 00                       .
	.byte	$19
	.byte	";--- BOOT IN T"
L2E0F:	.byte	$00
L2E10:	.byte	$00
	brk                                     ; 2E11 00                       .
L2E12:  inc     $1E2C                           ; 2E12 EE 2C 1E                 .,.
	brk                                     ; 2E15 00                       .
	.byte   $47                             ; 2E16 47                       G
	.byte   $52                             ; 2E17 52                       R
	eor     ($4D,x)                         ; 2E18 41 4D                    AM
	brk                                     ; 2E1A 00                       .
	brk                                     ; 2E1B 00                       .
	ora     $6E                             ; 2E1C 05 6E                    .n
	brk                                     ; 2E1E 00                       .
L2E1F:	.byte	$00
	ora     ($3B,x)                         ; 2E20 01 3B                    .;
	brk                                     ; 2E22 00                       .
	brk                                     ; 2E23 00                       .
	.byte   $FD                             ; 2E24 FD                       .
	.byte   $6D                             ; 2E25 6D                       m
L2E26:	.byte	$00
	brk                                     ; 2E27 00                       .
	.byte   $0B,"   "
	.byte	"Put("
L2E30:  inc     $1E2C                           ; 2E30 EE 2C 1E                 .,.
	brk                                     ; 2E33 00                       .
	brk                                     ; 2E34 00                       .
	brk                                     ; 2E35 00                       .
	.byte   $EB                             ; 2E36 EB                       .
	adc     a:$00                           ; 2E37 6D 00 00                 m..
	.byte	$2E,"   BoxStr( 6, 10, "
	.byte	$22
L2E4E:  inc     $1E2C                           ; 2E4E EE 2C 1E                 .,.
	brk                                     ; 2E51 00                       .
	Inverse	"ting in Main Program "
	.byte	$22,")",$00
	brk                                     ; 2E6A 00                       .
	.byte   $B6                             ; 2E6B B6                       .
L2E6C:  inc     $1E2C                           ; 2E6C EE 2C 1E                 .,.
	brk                                     ; 2E6F 00                       .
	.byte	"   ITerm()     ;initialize"
L2E8A:  inc     $782C                           ; 2E8A EE 2C 78                 .,x
	brk                                     ; 2E8D 00                       .
	.byte	"tem for TERM program",$00
L2EA3:	.byte	$00
	adc     a:$6D,x                         ; 2EA4 7D 6D 00                 }m.
	brk                                     ; 2EA7 00                       .
	.byte	$19,"   RdBoot( ",$22,"D1:TERM.COM",$22,")"
	brk                                     ; 2EC2 00                       .
	brk                                     ; 2EC3 00                       .
	eor     a:$6D,x                         ; 2EC4 5D 6D 00                 ]m.
	brk                                     ; 2EC7 00                       .
	.byte	$08,"   END()",$00
	brk                                     ; 2ED2 00                       .
	lsr     a:$6D                           ; 2ED3 4E 6D 00                 Nm.
	brk                                     ; 2ED6 00                       .
	.byte	$09,"   RETURN"
	.byte	$00,$00
	rol     a:$6D,x                         ; 2EE3 3E 6D 00                 >m.
	brk                                     ; 2EE6 00                       .
	brk                                     ; 2EE7 00                       .
	brk                                     ; 2EE8 00                       .
	brk                                     ; 2EE9 00                       .
	.byte   $37                             ; 2EEA 37                       7
	adc     a:$00                           ; 2EEB 6D 00 00                 m..
	brk                                     ; 2EEE 00                       .
	brk                                     ; 2EEF 00                       .
	brk                                     ; 2EF0 00                       .
	brk                                     ; 2EF1 00                       .
	brk                                     ; 2EF2 00                       .
	brk                                     ; 2EF3 00                       .
	brk                                     ; 2EF4 00                       .
	brk                                     ; 2EF5 00                       .
	brk                                     ; 2EF6 00                       .
	brk                                     ; 2EF7 00                       .
	brk                                     ; 2EF8 00                       .
	brk                                     ; 2EF9 00                       .
	brk                                     ; 2EFA 00                       .
	brk                                     ; 2EFB 00                       .
	brk                                     ; 2EFC 00                       .
	brk                                     ; 2EFD 00                       .
	brk                                     ; 2EFE 00                       .
	brk                                     ; 2EFF 00                       .
	brk                                     ; 2F00 00                       .
	brk                                     ; 2F01 00                       .
L2F02:	.byte	$05,"123KA"
L2F08:	.addr	L2F02
L2F0A:	.byte	$06,"123KAT"
L2F11:	.addr	L2F0A
L2F13:	.byte	$07,"123KABT"
L2F1B:	.addr	L2F13
L2F1D:	.byte	$00
L2F1E:	.byte	$00
	.byte	" (c)1983 Action Computer Services"

sub_2F40:
	ldx     #$FF                            ; 2F40 A2 FF                    ..
	stx     $A6                             ; 2F42 86 A6                    ..
	ldy     #$0C                            ; 2F44 A0 0C                    ..
	bne     L2F52                           ; 2F46 D0 0A                    ..

sub_2F48:
	sty     $A6                             ; 2F48 84 A6                    ..
	ldy     #$0B                            ; 2F4A A0 0B                    ..
	bne     L2F52                           ; 2F4C D0 04                    ..
L2F4E:  sty     $A6                             ; 2F4E 84 A6                    ..
	ldy     #$05                            ; 2F50 A0 05                    ..
L2F52:  stx     $A5                             ; 2F52 86 A5                    ..
	ldx     #$00                            ; 2F54 A2 00                    ..
	stx     $A3                             ; 2F56 86 A3                    ..

sub_2F58:
	asl     a                               ; 2F58 0A                       .
	asl     a                               ; 2F59 0A                       .
	asl     a                               ; 2F5A 0A                       .
	asl     a                               ; 2F5B 0A                       .
	tax                                     ; 2F5C AA                       .
	tya                                     ; 2F5D 98                       .
	sta     ICCOM,x                         ; 2F5E 9D 42 03                 .B.
	lda     $A3                             ; 2F61 A5 A3                    ..
	beq     L2F6F                           ; 2F63 F0 0A                    ..
	sta     $034A,x                         ; 2F65 9D 4A 03                 .J.
	lda     $A4                             ; 2F68 A5 A4                    ..
	sta     $034B,x                         ; 2F6A 9D 4B 03                 .K.
	lda     #$00                            ; 2F6D A9 00                    ..
L2F6F:  tay                                     ; 2F6F A8                       .
	sta     $0349,x                         ; 2F70 9D 49 03                 .I.
	lda     ($A5),y                         ; 2F73 B1 A5                    ..
	sta     $0348,x                         ; 2F75 9D 48 03                 .H.
	beq     L2F8C                           ; 2F78 F0 12                    ..
	clc                                     ; 2F7A 18                       .
	lda     $A5                             ; 2F7B A5 A5                    ..
	adc     #$01                            ; 2F7D 69 01                    i.
	sta     ICBA,x
	lda     $A6                             ; 2F82 A5 A6                    ..
	adc     #$00                            ; 2F84 69 00                    i.
	sta     ICBA+1,x
	jmp     CIOV

; ----------------------------------------------------------------------------
L2F8C:  rts                                     ; 2F8C 60                       `

; ----------------------------------------------------------------------------
sub_2F8D:  
	stx     $A5                             ; 2F8D 86 A5                    ..
	sty     $A6                             ; 2F8F 84 A6                    ..
	ldy     #$03                            ; 2F91 A0 03                    ..
	jmp     sub_2F58

; ----------------------------------------------------------------------------
sub_2F96:
	stx     $A5                             ; 2F96 86 A5                    ..
	sty     $A6                             ; 2F98 84 A6                    ..
	ldx     #$00                            ; 2F9A A2 00                    ..
	stx     $A3                             ; 2F9C 86 A3                    ..
	ldy     #$09                            ; 2F9E A0 09                    ..
	jsr     sub_2F58
	bne     L2FAF                           ; 2FA3 D0 0A                    ..
	lda     #$0B                            ; 2FA5 A9 0B                    ..
	sta     ICCOM,x
	lda     #$9B                            ; 2FAA A9 9B                    ..
	jmp     CIOV

; ----------------------------------------------------------------------------
L2FAF:  rts                                     ; 2FAF 60                       `

; ----------------------------------------------------------------------------
L2FB0:	.byte	$00
L2FB1:  jmp     L2FB4                           ; 2FB1 4C B4 2F                 L./

; ----------------------------------------------------------------------------
L2FB4:  sta     L2FB0                           ; 2FB4 8D B0 2F                 ../
	jmp     (DOSINI)

; ----------------------------------------------------------------------------
	.byte	$13,$11,$01,$83
L2FBE:  rts                                     ; 2FBE 60                       `

; ----------------------------------------------------------------------------
	ldy     $84                             ; 2FBF A4 84                    ..
	beq     L2FCD                           ; 2FC1 F0 0A                    ..
	stx     $85                             ; 2FC3 86 85                    ..
L2FC5:  asl     a                               ; 2FC5 0A                       .
	rol     $85                             ; 2FC6 26 85                    &.
	dey                                     ; 2FC8 88                       .
	bne     L2FC5                           ; 2FC9 D0 FA                    ..
	ldx     $85                             ; 2FCB A6 85                    ..
L2FCD:  rts                                     ; 2FCD 60                       `

; ----------------------------------------------------------------------------
	ldy     $84                             ; 2FCE A4 84                    ..
	beq     L2FDC                           ; 2FD0 F0 0A                    ..
	stx     $85                             ; 2FD2 86 85                    ..
L2FD4:  lsr     $85                             ; 2FD4 46 85                    F.
	ror     a                               ; 2FD6 6A                       j
	dey                                     ; 2FD7 88                       .
	bne     L2FD4                           ; 2FD8 D0 FA                    ..
	ldx     $85                             ; 2FDA A6 85                    ..
L2FDC:  rts                                     ; 2FDC 60                       `

; ----------------------------------------------------------------------------
L2FDD:  ldy     $D3                             ; 2FDD A4 D3                    ..
	bpl     L2FF1                           ; 2FDF 10 10                    ..

sub_2FE1:
	sta     $86                             ; 2FE1 85 86                    ..
	stx     $87                             ; 2FE3 86 87                    ..
	sec                                     ; 2FE5 38                       8
	lda     #$00                            ; 2FE6 A9 00                    ..
	sbc     $86                             ; 2FE8 E5 86                    ..
	tay                                     ; 2FEA A8                       .
	lda     #$00                            ; 2FEB A9 00                    ..
	sbc     $87                             ; 2FED E5 87                    ..
	tax                                     ; 2FEF AA                       .
	tya                                     ; 2FF0 98                       .
L2FF1:  rts                                     ; 2FF1 60                       `

; ----------------------------------------------------------------------------
sub_2FF2:
	stx     $D3                             ; 2FF2 86 D3                    ..
	cpx     #$00                            ; 2FF4 E0 00                    ..
	bpl     L2FFB                           ; 2FF6 10 03                    ..
	jsr     sub_2FE1
L2FFB:  sta     $82                             ; 2FFB 85 82                    ..
	stx     $83                             ; 2FFD 86 83                    ..
	lda     $85                             ; 2FFF A5 85                    ..
	bpl     L3011                           ; 3001 10 0E                    ..
	tax                                     ; 3003 AA                       .
	eor     $D3                             ; 3004 45 D3                    E.
	sta     $D3                             ; 3006 85 D3                    ..
	lda     $84                             ; 3008 A5 84                    ..
	jsr     sub_2FE1
	sta     $84                             ; 300D 85 84                    ..
	stx     $85                             ; 300F 86 85                    ..
L3011:  lda     #$00                            ; 3011 A9 00                    ..
	sta     $87                             ; 3013 85 87                    ..
	rts                                     ; 3015 60                       `

; ----------------------------------------------------------------------------
L3016:  beq     L3033                           ; 3016 F0 1B                    ..
	dex                                     ; 3018 CA                       .
	stx     $C7                             ; 3019 86 C7                    ..
	tax                                     ; 301B AA                       .
	beq     L3033                           ; 301C F0 15                    ..
	stx     $C6                             ; 301E 86 C6                    ..
	lda     #$00                            ; 3020 A9 00                    ..
	ldx     #$08                            ; 3022 A2 08                    ..
L3024:  asl     a                               ; 3024 0A                       .
	asl     $C6                             ; 3025 06 C6                    ..
	bcc     L302B                           ; 3027 90 02                    ..
	adc     $C7                             ; 3029 65 C7                    e.
L302B:  dex                                     ; 302B CA                       .
	bne     L3024                           ; 302C D0 F6                    ..
	clc                                     ; 302E 18                       .
	adc     $87                             ; 302F 65 87                    e.
L3031:  sta     $87                             ; 3031 85 87                    ..
L3033:  lda     $86                             ; 3033 A5 86                    ..
	ldx     $87                             ; 3035 A6 87                    ..
	rts                                     ; 3037 60                       `

; ----------------------------------------------------------------------------
sub_3038:
	jsr     sub_2FF2
	ldx     $82                             ; 303B A6 82                    ..
	beq     L305A                           ; 303D F0 1B                    ..
	stx     $C6                             ; 303F 86 C6                    ..
	ldx     $84                             ; 3041 A6 84                    ..
	beq     L305A                           ; 3043 F0 15                    ..
	dex                                     ; 3045 CA                       .
	stx     $C7                             ; 3046 86 C7                    ..
	ldx     #$08                            ; 3048 A2 08                    ..
L304A:  asl     a                               ; 304A 0A                       .
	rol     $87                             ; 304B 26 87                    &.
	asl     $C6                             ; 304D 06 C6                    ..
	bcc     L3057                           ; 304F 90 06                    ..
	adc     $C7                             ; 3051 65 C7                    e.
	bcc     L3057                           ; 3053 90 02                    ..
	inc     $87                             ; 3055 E6 87                    ..
L3057:  dex                                     ; 3057 CA                       .
	bne     L304A                           ; 3058 D0 F0                    ..
L305A:  sta     $86                             ; 305A 85 86                    ..
	lda     $82                             ; 305C A5 82                    ..
	ldx     $85                             ; 305E A6 85                    ..
	jsr     L3016                           ; 3060 20 16 30                  .0
	lda     $83                             ; 3063 A5 83                    ..
	ldx     $84                             ; 3065 A6 84                    ..
	jsr     L3016                           ; 3067 20 16 30                  .0
	jmp     L2FDD                           ; 306A 4C DD 2F                 L./

; ----------------------------------------------------------------------------
L306D:  jsr     sub_2FF2
	lda     $85                             ; 3070 A5 85                    ..
	beq     L309B                           ; 3072 F0 27                    .'
	ldx     #$08                            ; 3074 A2 08                    ..
L3076:  rol     $82                             ; 3076 26 82                    &.
	rol     $83                             ; 3078 26 83                    &.
	rol     $87                             ; 307A 26 87                    &.
	sec                                     ; 307C 38                       8
	lda     $83                             ; 307D A5 83                    ..
	sbc     $84                             ; 307F E5 84                    ..
	tay                                     ; 3081 A8                       .
	lda     $87                             ; 3082 A5 87                    ..
	sbc     $85                             ; 3084 E5 85                    ..
	bcc     L308C                           ; 3086 90 04                    ..
	sta     $87                             ; 3088 85 87                    ..
	sty     $83                             ; 308A 84 83                    ..
L308C:  dex                                     ; 308C CA                       .
	bne     L3076                           ; 308D D0 E7                    ..
	lda     $82                             ; 308F A5 82                    ..
	rol     a                               ; 3091 2A                       *
	ldx     #$00                            ; 3092 A2 00                    ..
	ldy     $83                             ; 3094 A4 83                    ..
	sty     $86                             ; 3096 84 86                    ..
	jmp     L2FDD                           ; 3098 4C DD 2F                 L./

; ----------------------------------------------------------------------------
L309B:  ldx     #$10                            ; 309B A2 10                    ..
L309D:  rol     $82                             ; 309D 26 82                    &.
	rol     $83                             ; 309F 26 83                    &.
	rol     a                               ; 30A1 2A                       *
	bcs     L30A8                           ; 30A2 B0 04                    ..
	cmp     $84                             ; 30A4 C5 84                    ..
	bcc     L30AB                           ; 30A6 90 03                    ..
L30A8:  sbc     $84                             ; 30A8 E5 84                    ..
	sec                                     ; 30AA 38                       8
L30AB:  dex                                     ; 30AB CA                       .
	bne     L309D                           ; 30AC D0 EF                    ..
	rol     $82                             ; 30AE 26 82                    &.
	rol     $83                             ; 30B0 26 83                    &.
	sta     $86                             ; 30B2 85 86                    ..
	lda     $82                             ; 30B4 A5 82                    ..
	ldx     $83                             ; 30B6 A6 83                    ..
	jmp     L2FDD                           ; 30B8 4C DD 2F                 L./

; ----------------------------------------------------------------------------
	jsr     L306D                           ; 30BB 20 6D 30                  m0
	lda     $86                             ; 30BE A5 86                    ..
	ldx     $87                             ; 30C0 A6 87                    ..
	rts                                     ; 30C2 60                       `

; ----------------------------------------------------------------------------
SArgs:  
	sta     $A0                             ; 30C3 85 A0                    ..
	stx     $A1                             ; 30C5 86 A1                    ..
	sty     $A2                             ; 30C7 84 A2                    ..
	clc                                     ; 30C9 18                       .
	pla                                     ; 30CA 68                       h
	sta     $84                             ; 30CB 85 84                    ..
	adc     #$03                            ; 30CD 69 03                    i.
	tay                                     ; 30CF A8                       .
	pla                                     ; 30D0 68                       h
	sta     $85                             ; 30D1 85 85                    ..
	adc     #$00                            ; 30D3 69 00                    i.
	pha                                     ; 30D5 48                       H
	tya                                     ; 30D6 98                       .
	pha                                     ; 30D7 48                       H
	ldy     #$01                            ; 30D8 A0 01                    ..
	lda     ($84),y                         ; 30DA B1 84                    ..
	sta     $82                             ; 30DC 85 82                    ..
	iny                                     ; 30DE C8                       .
	lda     ($84),y                         ; 30DF B1 84                    ..
	sta     $83                             ; 30E1 85 83                    ..
	iny                                     ; 30E3 C8                       .
	lda     ($84),y                         ; 30E4 B1 84                    ..
	tay                                     ; 30E6 A8                       .
L30E7:  lda     $A0,y                           ; 30E7 B9 A0 00                 ...
	sta     ($82),y                         ; 30EA 91 82                    ..
	dey                                     ; 30EC 88                       .
	bpl     L30E7                           ; 30ED 10 F8                    ..
	lda     $11                             ; 30EF A5 11                    ..
	bne     L3102                           ; 30F1 D0 0F                    ..
	inc     $11                             ; 30F3 E6 11                    ..
	jmp     L2FBE                           ; 30F5 4C BE 2F                 L./

; ----------------------------------------------------------------------------
	php                                     ; 30F8 08                       .
	.byte   $63                             ; 30F9 63                       c
	ora     #$11                            ; 30FA 09 11                    ..
	ora     $1318,y                         ; 30FC 19 18 13                 ...
	and     ($23,x)                         ; 30FF 21 23                    !#
	.byte   $33                             ; 3101 33                       3
L3102:  rts                                     ; 3102 60                       `

; ----------------------------------------------------------------------------
L3103:  bpl     L311B                           ; 3103 10 16                    ..
	cpy     #$88                            ; 3105 C0 88                    ..
	beq     L3111                           ; 3107 F0 08                    ..
	tya                                     ; 3109 98                       .
	cpy     #$80                            ; 310A C0 80                    ..
	beq     L311F                           ; 310C F0 11                    ..
	jmp     L2FB1                           ; 310E 4C B1 2F                 L./

; ----------------------------------------------------------------------------
L3111:  txa                                     ; 3111 8A                       .
	lsr     a                               ; 3112 4A                       J
	lsr     a                               ; 3113 4A                       J
	lsr     a                               ; 3114 4A                       J
	lsr     a                               ; 3115 4A                       J
	tax                                     ; 3116 AA                       .
	tya                                     ; 3117 98                       .
	sta     $05C0,x                         ; 3118 9D C0 05                 ...
L311B:  rts                                     ; 311B 60                       `

; ----------------------------------------------------------------------------
	ldx     #$01                            ; 311C A2 01                    ..
	.byte   $86                             ; 311E 86                       .
L311F:  ora     ($48),y                         ; 311F 11 48                    .H
	jsr     L2FBE                           ; 3121 20 BE 2F                  ./
	pla                                     ; 3124 68                       h
	tay                                     ; 3125 A8                       .
	rts                                     ; 3126 60                       `

; ----------------------------------------------------------------------------
sub_3127: 	; open 
	pha                                     ; 3127 48                       H
	stx     $A1                             ; 3128 86 A1                    ..
	sty     $A2                             ; 312A 84 A2                    ..
	tay                                     ; 312C A8                       .
	lda     #$00                            ; 312D A9 00                    ..
	sta     $05C0,y                         ; 312F 99 C0 05                 ...
	tay                                     ; 3132 A8                       .
	lda     ($A1),y                         ; 3133 B1 A1                    ..
	sta     $0500                           ; 3135 8D 00 05                 ...
	tay                                     ; 3138 A8                       .
	iny                                     ; 3139 C8                       .
	lda     #$9B                            ; 313A A9 9B                    ..
	bne     L3140                           ; 313C D0 02                    ..
L313E:  lda     ($A1),y                         ; 313E B1 A1                    ..
L3140:  sta     $0500,y                         ; 3140 99 00 05                 ...
	dey                                     ; 3143 88                       .
L3144:  bne     L313E                           ; 3144 D0 F8                    ..
	pla                                     ; 3146 68                       h
	ldx     #$00                            ; 3147 A2 00                    ..
	ldy     #$05                            ; 3149 A0 05                    ..
	jsr     sub_2F8D
	jmp     L3103                           ; 314E 4C 03 31                 L.1

; ----------------------------------------------------------------------------
sub_3151:  
	stx     $A1                             ; 3151 86 A1                    ..
	tax                                     ; 3153 AA                       .
	ldy     $A1                             ; 3154 A4 A1                    ..
	lda     $B7                             ; 3156 A5 B7                    ..
L3158:  jsr     sub_2F96
	jmp     L3103                           ; 315B 4C 03 31                 L.1

; ----------------------------------------------------------------------------
sub_315E:
	jsr     sub_2F40
	jmp     L3103                           ; 3161 4C 03 31                 L.1

; ----------------------------------------------------------------------------
sub_3164:
	stx     $A1                             ; 3164 86 A1                    ..
	tax                                     ; 3166 AA                       .
	ldy     $A1                             ; 3167 A4 A1                    ..
	lda     $B7                             ; 3169 A5 B7                    ..
	jsr     sub_2F48
	jmp     L3103                           ; 316E 4C 03 31                 L.1

; ----------------------------------------------------------------------------
L3171:  jsr     L2F4E                           ; 3171 20 4E 2F                  N/
	sty     $A0                             ; 3174 84 A0                    ..
	lda     $0348,x                         ; 3176 BD 48 03                 .H.
	beq     L317E                           ; 3179 F0 03                    ..
	sec                                     ; 317B 38                       8
	sbc     #$01                            ; 317C E9 01                    ..
L317E:  ldy     #$00                            ; 317E A0 00                    ..
	sta     ($A5),y                         ; 3180 91 A5                    ..
	ldy     $A0                             ; 3182 A4 A0                    ..
	rts                                     ; 3184 60                       `

; ----------------------------------------------------------------------------
	stx     $A2                             ; 3185 86 A2                    ..
	tax                                     ; 3187 AA                       .
	ldy     $A2                             ; 3188 A4 A2                    ..
	lda     $B7                             ; 318A A5 B7                    ..

sub_318C:
	pha                                     ; 318C 48                       H
	lda     #$FF                            ; 318D A9 FF                    ..
	sta     $A3                             ; 318F 85 A3                    ..
	pla                                     ; 3191 68                       h
	pha                                     ; 3192 48                       H
	stx     $A1                             ; 3193 86 A1                    ..
	sty     $A2                             ; 3195 84 A2                    ..
	ldy     #$00                            ; 3197 A0 00                    ..
	lda     $A3                             ; 3199 A5 A3                    ..
	sta     ($A1),y                         ; 319B 91 A1                    ..
	pla                                     ; 319D 68                       h
	ldy     $A2                             ; 319E A4 A2                    ..
L31A0:  jsr     L3171                           ; 31A0 20 71 31                  q1
	jmp     L3103                           ; 31A3 4C 03 31                 L.1

; ----------------------------------------------------------------------------
sub_31A6:  
	ldx     #$07                            ; 31A6 A2 07                    ..

L31A8:  
	stx     $A4                             ; 31A8 86 A4                    ..
	asl     a                               ; 31AA 0A                       .
	asl     a                               ; 31AB 0A                       .
	asl     a                               ; 31AC 0A                       .
	asl     a                               ; 31AD 0A                       .
	tax                                     ; 31AE AA                       .
	lda     $A4                             ; 31AF A5 A4                    ..
	sta     ICCOM,x
	lda     #$00                            ; 31B4 A9 00                    ..
	sta     $0348,x                         ; 31B6 9D 48 03                 .H.
	sta     $0349,x                         ; 31B9 9D 49 03                 .I.
	tya                                     ; 31BC 98                       .
	jsr     CIOV
	sta     $A0                             ; 31C0 85 A0                    ..
	jmp     L3103                           ; 31C2 4C 03 31                 L.1

; ----------------------------------------------------------------------------
; println
sub_31C5:  
	lda     #$9B                            ; 31C5 A9 9B                    ..

; printchr
sub_31C7:
	tax                                     ; 31C7 AA                       .
	lda     $B7                             ; 31C8 A5 B7                    ..

sub_31CA:
	stx     $A1                             ; 31CA 86 A1                    ..
	ldy     $A1                             ; 31CC A4 A1                    ..
L31CE:  ldx     #$0B                            ; 31CE A2 0B                    ..
	jmp     L31A8                           ; 31D0 4C A8 31                 L.1

; ----------------------------------------------------------------------------
L31D3:  ldy     #$9B                            ; 31D3 A0 9B                    ..
	bne     L31CE                           ; 31D5 D0 F7                    ..

sub_31D7:  
	jsr     sub_2F58
	jmp     L3103                           ; 31DA 4C 03 31                 L.1

; ----------------------------------------------------------------------------
L31DD:  sta     $D4                             ; 31DD 85 D4                    ..
	stx     $D5                             ; 31DF 86 D5                    ..
	jsr     LD9AA                           ; 31E1 20 AA D9                  ..
	jsr     LD8E6                           ; 31E4 20 E6 D8                  ..
	ldy     #$FF                            ; 31E7 A0 FF                    ..
	ldx     #$00                            ; 31E9 A2 00                    ..
L31EB:  iny                                     ; 31EB C8                       .
	inx                                     ; 31EC E8                       .
	lda     ($F3),y                         ; 31ED B1 F3                    ..
	sta     $0550,x                         ; 31EF 9D 50 05                 .P.
	bpl     L31EB                           ; 31F2 10 F7                    ..
	eor     #$80                            ; 31F4 49 80                    I.
	sta     $0550,x                         ; 31F6 9D 50 05                 .P.
	stx     $0550                           ; 31F9 8E 50 05                 .P.
	rts                                     ; 31FC 60                       `

; ----------------------------------------------------------------------------
	ldx     #$00                            ; 31FD A2 00                    ..
L31FF:  jsr     L31DD                           ; 31FF 20 DD 31                  .1
	lda     $B7                             ; 3202 A5 B7                    ..
L3204:  ldx     #$50                            ; 3204 A2 50                    .P
	ldy     #$05                            ; 3206 A0 05                    ..
	jsr     sub_2F48
	jmp     L3103                           ; 320B 4C 03 31                 L.1

; ----------------------------------------------------------------------------
	ldx     #$00                            ; 320E A2 00                    ..
	jsr     L31FF                           ; 3210 20 FF 31                  .1
	jmp     sub_31C5

; ----------------------------------------------------------------------------
	ldy     #$00                            ; 3216 A0 00                    ..
L3218:  sta     $A0                             ; 3218 85 A0                    ..
	txa                                     ; 321A 8A                       .
	sty     $A2                             ; 321B 84 A2                    ..
	ldx     $A2                             ; 321D A6 A2                    ..
	jsr     L31DD                           ; 321F 20 DD 31                  .1
	lda     $A0                             ; 3222 A5 A0                    ..
	jmp     L3204                           ; 3224 4C 04 32                 L.2

; ----------------------------------------------------------------------------
L3227:  ldy     #$00                            ; 3227 A0 00                    ..
	jsr     L3218                           ; 3229 20 18 32                  .2
L322C:  lda     $A0                             ; 322C A5 A0                    ..
	jmp     L31D3                           ; 322E 4C D3 31                 L.1

; ----------------------------------------------------------------------------
L3231:  stx     $A2                             ; 3231 86 A2                    ..
	tax                                     ; 3233 AA                       .
	ldy     $A2                             ; 3234 A4 A2                    ..
	lda     $B7                             ; 3236 A5 B7                    ..
L3238:  cpy     #$00                            ; 3238 C0 00                    ..
	bpl     L3252                           ; 323A 10 16                    ..
	pha                                     ; 323C 48                       H
	stx     $A1                             ; 323D 86 A1                    ..
	sty     $A2                             ; 323F 84 A2                    ..
	ldy     #$2D                            ; 3241 A0 2D                    .-
	jsr     L31CE                           ; 3243 20 CE 31                  .1
	sec                                     ; 3246 38                       8
	lda     #$00                            ; 3247 A9 00                    ..
	sbc     $A1                             ; 3249 E5 A1                    ..
	tax                                     ; 324B AA                       .
	lda     #$00                            ; 324C A9 00                    ..
	sbc     $A2                             ; 324E E5 A2                    ..
	tay                                     ; 3250 A8                       .
	pla                                     ; 3251 68                       h
L3252:  jmp     L3218                           ; 3252 4C 18 32                 L.2

; ----------------------------------------------------------------------------
	jsr     L3231                           ; 3255 20 31 32                  12
	jmp     sub_31C5

; ----------------------------------------------------------------------------
	jsr     L3238                           ; 325B 20 38 32                  82
	lda     $A0                             ; 325E A5 A0                    ..
	jmp     L31D3                           ; 3260 4C D3 31                 L.1

; ----------------------------------------------------------------------------
	stx     $A2                             ; 3263 86 A2                    ..
	sty     $A3                             ; 3265 84 A3                    ..
	ldx     #$00                            ; 3267 A2 00                    ..
	ldy     $A2                             ; 3269 A4 A2                    ..
L326B:  sty     $A2                             ; 326B 84 A2                    ..
	jsr     L31DD                           ; 326D 20 DD 31                  .1
	iny                                     ; 3270 C8                       .
L3271:  lda     $0550,y                         ; 3271 B9 50 05                 .P.
	sta     ($A2),y                         ; 3274 91 A2                    ..
	dey                                     ; 3276 88                       .
	bpl     L3271                           ; 3277 10 F8                    ..
	rts                                     ; 3279 60                       `

; ----------------------------------------------------------------------------
	cpx     #$00                            ; 327A E0 00                    ..
	bpl     L326B                           ; 327C 10 ED                    ..
	sta     $A0                             ; 327E 85 A0                    ..
	stx     $A1                             ; 3280 86 A1                    ..
	sty     $A2                             ; 3282 84 A2                    ..
	sec                                     ; 3284 38                       8
	lda     #$00                            ; 3285 A9 00                    ..
	sbc     $A0                             ; 3287 E5 A0                    ..
	tay                                     ; 3289 A8                       .
	lda     #$00                            ; 328A A9 00                    ..
	sbc     $A1                             ; 328C E5 A1                    ..
	tax                                     ; 328E AA                       .
	tya                                     ; 328F 98                       .
	jsr     L31DD                           ; 3290 20 DD 31                  .1
	inx                                     ; 3293 E8                       .
	txa                                     ; 3294 8A                       .
	tay                                     ; 3295 A8                       .
L3296:  lda     $054F,y                         ; 3296 B9 4F 05                 .O.
	sta     ($A2),y                         ; 3299 91 A2                    ..
	dey                                     ; 329B 88                       .
	bne     L3296                           ; 329C D0 F8                    ..
	txa                                     ; 329E 8A                       .
	sta     ($A2),y                         ; 329F 91 A2                    ..
	iny                                     ; 32A1 C8                       .
	lda     #$2D                            ; 32A2 A9 2D                    .-
	sta     ($A2),y                         ; 32A4 91 A2                    ..
	rts                                     ; 32A6 60                       `

; ----------------------------------------------------------------------------
	lda     $B7                             ; 32A7 A5 B7                    ..
L32A9:  ldx     #$13                            ; 32A9 A2 13                    ..
	stx     $0550                           ; 32AB 8E 50 05                 .P.
	ldx     #$50                            ; 32AE A2 50                    .P
	ldy     #$05                            ; 32B0 A0 05                    ..
	jsr     L31A0                           ; 32B2 20 A0 31                  .1
	lda     #$50                            ; 32B5 A9 50                    .P
	ldx     #$05                            ; 32B7 A2 05                    ..
	sta     $A4                             ; 32B9 85 A4                    ..
	stx     $A5                             ; 32BB 86 A5                    ..
	ldy     #$00                            ; 32BD A0 00                    ..
	sty     $A0                             ; 32BF 84 A0                    ..
	sty     $A1                             ; 32C1 84 A1                    ..
	sty     $A2                             ; 32C3 84 A2                    ..
	lda     ($A4),y                         ; 32C5 B1 A4                    ..
	sta     $A3                             ; 32C7 85 A3                    ..
	inc     $A3                             ; 32C9 E6 A3                    ..
	lda     #$20                            ; 32CB A9 20                    . 
	iny                                     ; 32CD C8                       .
L32CE:  cmp     ($A4),y                         ; 32CE D1 A4                    ..
	bne     L32D7                           ; 32D0 D0 05                    ..
	iny                                     ; 32D2 C8                       .
	cpy     $A3                             ; 32D3 C4 A3                    ..
	bmi     L32CE                           ; 32D5 30 F7                    0.
L32D7:  lda     ($A4),y                         ; 32D7 B1 A4                    ..
	cmp     #$2D                            ; 32D9 C9 2D                    .-
	bne     L32E0                           ; 32DB D0 03                    ..
	sta     $A2                             ; 32DD 85 A2                    ..
	iny                                     ; 32DF C8                       .
L32E0:  cpy     $A3                             ; 32E0 C4 A3                    ..
	bpl     L331A                           ; 32E2 10 36                    .6
L32E4:  lda     ($A4),y                         ; 32E4 B1 A4                    ..
	cmp     #$30                            ; 32E6 C9 30                    .0
	bmi     L331A                           ; 32E8 30 30                    00
	cmp     #$3A                            ; 32EA C9 3A                    .:
	bpl     L331A                           ; 32EC 10 2C                    .,
	sec                                     ; 32EE 38                       8
	sbc     #$30                            ; 32EF E9 30                    .0
	tax                                     ; 32F1 AA                       .
	lda     $A1                             ; 32F2 A5 A1                    ..
	pha                                     ; 32F4 48                       H
	lda     $A0                             ; 32F5 A5 A0                    ..
	asl     a                               ; 32F7 0A                       .
	rol     $A1                             ; 32F8 26 A1                    &.
	asl     a                               ; 32FA 0A                       .
	rol     $A1                             ; 32FB 26 A1                    &.
	clc                                     ; 32FD 18                       .
	adc     $A0                             ; 32FE 65 A0                    e.
	sta     $A0                             ; 3300 85 A0                    ..
	pla                                     ; 3302 68                       h
	adc     $A1                             ; 3303 65 A1                    e.
	sta     $A1                             ; 3305 85 A1                    ..
	asl     $A0                             ; 3307 06 A0                    ..
	rol     $A1                             ; 3309 26 A1                    &.
	clc                                     ; 330B 18                       .
	txa                                     ; 330C 8A                       .
	adc     $A0                             ; 330D 65 A0                    e.
	sta     $A0                             ; 330F 85 A0                    ..
	bcc     L3315                           ; 3311 90 02                    ..
	inc     $A1                             ; 3313 E6 A1                    ..
L3315:  iny                                     ; 3315 C8                       .
	cpy     $A3                             ; 3316 C4 A3                    ..
	bmi     L32E4                           ; 3318 30 CA                    0.
L331A:  lda     $A2                             ; 331A A5 A2                    ..
	beq     L332B                           ; 331C F0 0D                    ..
	sec                                     ; 331E 38                       8
	lda     #$00                            ; 331F A9 00                    ..
	sbc     $A0                             ; 3321 E5 A0                    ..
	sta     $A0                             ; 3323 85 A0                    ..
	lda     #$00                            ; 3325 A9 00                    ..
	sbc     $A1                             ; 3327 E5 A1                    ..
	sta     $A1                             ; 3329 85 A1                    ..
L332B:  rts                                     ; 332B 60                       `

; ----------------------------------------------------------------------------
L332C:  sta     $A4                             ; 332C 85 A4                    ..
	stx     $A5                             ; 332E 86 A5                    ..
	lda     #$04                            ; 3330 A9 04                    ..
	sta     $A6                             ; 3332 85 A6                    ..
	lda     #'$'
	jsr	sub_31C7
L3339:  lda     #$00                            ; 3339 A9 00                    ..
	ldx     #$04                            ; 333B A2 04                    ..
L333D:  asl     $A4                             ; 333D 06 A4                    ..
	rol     $A5                             ; 333F 26 A5                    &.
	rol     a                               ; 3341 2A                       *
	dex                                     ; 3342 CA                       .
	bne     L333D                           ; 3343 D0 F8                    ..
	adc     #$30                            ; 3345 69 30                    i0
	cmp     #$3A                            ; 3347 C9 3A                    .:
	bmi     L334D                           ; 3349 30 02                    0.
	adc     #$06                            ; 334B 69 06                    i.
L334D:  jsr     sub_31C7
	dec     $A6                             ; 3350 C6 A6                    ..
	bne     L3339                           ; 3352 D0 E5                    ..
L3354:  rts                                     ; 3354 60                       `

; ----------------------------------------------------------------------------
sub_3355:
	sta     $C0                             ; 3355 85 C0                    ..
	stx     $C1                             ; 3357 86 C1                    ..
	sty     $05F0                           ; 3359 8C F0 05                 ...
	ldy     #$00                            ; 335C A0 00                    ..
	lda     ($C0),y                         ; 335E B1 C0                    ..
	sta     $C2                             ; 3360 85 C2                    ..
	inc     $C2                             ; 3362 E6 C2                    ..
	ldx     #$0D                            ; 3364 A2 0D                    ..
L3366:  lda     $A2,x                           ; 3366 B5 A2                    ..
	sta     $05F0,x                         ; 3368 9D F0 05                 ...
	dex                                     ; 336B CA                       .
	bne     L3366                           ; 336C D0 F8                    ..
	stx     $8B                             ; 336E 86 8B                    ..
	stx     $8A                             ; 3370 86 8A                    ..
L3372:  inc     $8A                             ; 3372 E6 8A                    ..
	ldy     $8A                             ; 3374 A4 8A                    ..
	cpy     $C2                             ; 3376 C4 C2                    ..
	bcs     L3354                           ; 3378 B0 DA                    ..
	lda     ($C0),y                         ; 337A B1 C0                    ..
	cmp     #$25                            ; 337C C9 25                    .%
	bne     L338F                           ; 337E D0 0F                    ..
	inc     $8A                             ; 3380 E6 8A                    ..
	iny                                     ; 3382 C8                       .
	lda     ($C0),y                         ; 3383 B1 C0                    ..
	cmp     #$25                            ; 3385 C9 25                    .%
	beq     L338F                           ; 3387 F0 06                    ..
	cmp     #$45                            ; 3389 C9 45                    .E
	bne     L3395                           ; 338B D0 08                    ..
	lda     #$9B                            ; 338D A9 9B                    ..
L338F:  jsr     sub_31C7
	jmp     L3372                           ; 3392 4C 72 33                 Lr3

; ----------------------------------------------------------------------------
L3395:  ldy     $8B                             ; 3395 A4 8B                    ..
	inc     $8B                             ; 3397 E6 8B                    ..
	inc     $8B                             ; 3399 E6 8B                    ..
	sta     $A0                             ; 339B 85 A0                    ..
	lda     $05F0,y                         ; 339D B9 F0 05                 ...
	ldx     $05F1,y                         ; 33A0 BE F1 05                 ...
	ldy     $A0                             ; 33A3 A4 A0                    ..
	cpy     #'C'
	beq     L338F                           ; 33A7 F0 E6                    ..
	cpy     #'S'
	bne     L33B3                           ; 33AB D0 06                    ..
	jsr     sub_3164
	jmp     L3372                           ; 33B0 4C 72 33                 Lr3

; ----------------------------------------------------------------------------
L33B3:  cpy     #'I'
	bne     L33BD                           ; 33B5 D0 06                    ..
	jsr     L3231                           ; 33B7 20 31 32                  12
	jmp     L3372                           ; 33BA 4C 72 33                 Lr3

; ----------------------------------------------------------------------------
L33BD:  cpy     #'H'
	bne     L33C7                           ; 33BF D0 06                    ..
	jsr     L332C                           ; 33C1 20 2C 33                  ,3
	jmp     L3372                           ; 33C4 4C 72 33                 Lr3

; ----------------------------------------------------------------------------
L33C7:  jsr     L31FF                           ; 33C7 20 FF 31                  .1
	jmp     L3372                           ; 33CA 4C 72 33                 Lr3

; ----------------------------------------------------------------------------
L33CD:	.byte   $02,"S:"
L33D0:  .word   L33CD
L33D2:	.byte   $02,"E:"
L33D5:  .word   L33D2
	pha                                     ; 33D7 48                       H
	lda     #$00                            ; 33D8 A9 00                    ..
	jsr     sub_315E
	lda     #$0C                            ; 33DD A9 0C                    ..
	sta     $A3                             ; 33DF 85 A3                    ..
	lda     #$00                            ; 33E1 A9 00                    ..
	ldx     L33D5                           ; 33E3 AE D5 33                 ..3
	ldy     L33D5+1
	jsr     sub_3127
	lda     #$06                            ; 33EC A9 06                    ..
	jsr     sub_315E
	pla                                     ; 33F1 68                       h
	sta     $A4                             ; 33F2 85 A4                    ..
	and     #$30                            ; 33F4 29 30                    )0
	eor     #$1C                            ; 33F6 49 1C                    I.
	sta     $A3                             ; 33F8 85 A3                    ..
	lda     #$06                            ; 33FA A9 06                    ..
	ldx     L33D0                           ; 33FC AE D0 33                 ..3
	ldy     L33D0+1
	jmp     sub_3127

; ----------------------------------------------------------------------------
sub_3405:  
	sta     $5B                             ; 3405 85 5B                    .[
	stx     $5C                             ; 3407 86 5C                    .\
	sty     $5A                             ; 3409 84 5A                    .Z
	sta     $55                             ; 340B 85 55                    .U
	stx     $56                             ; 340D 86 56                    .V
	sty     ROWCRS
	rts                                     ; 3411 60                       `

; ----------------------------------------------------------------------------
	pha                                     ; 3412 48                       H
	ldi	$A4, $00
	pla                                     ; 3417 68                       h
	sta     $A0                             ; 3418 85 A0                    ..
	stx     $A1                             ; 341A 86 A1                    ..
	sty     $A2                             ; 341C 84 A2                    ..
	ldy     #$00                            ; 341E A0 00                    ..
	lda     $A4                             ; 3420 A5 A4                    ..
	ldx     $A3                             ; 3422 A6 A3                    ..
	beq     L3436                           ; 3424 F0 10                    ..
L3426:  sta     ($A0),y                         ; 3426 91 A0                    ..
	iny                                     ; 3428 C8                       .
	bne     L3426                           ; 3429 D0 FB                    ..
	inc     $A1                             ; 342B E6 A1                    ..
	dec     $A3                             ; 342D C6 A3                    ..
	bne     L3426                           ; 342F D0 F5                    ..
	beq     L3436                           ; 3431 F0 03                    ..
L3433:  sta     ($A0),y                         ; 3433 91 A0                    ..
	iny                                     ; 3435 C8                       .
L3436:  cpy     $A2                             ; 3436 C4 A2                    ..
	bne     L3433                           ; 3438 D0 F9                    ..
	rts                                     ; 343A 60                       `

; ----------------------------------------------------------------------------
; memmove
sub_343B:  
	sta     $A0                             ; 343B 85 A0                    ..
	stx     $A1                             ; 343D 86 A1                    ..
	sty     $A2                             ; 343F 84 A2                    ..
	ldy     #$00                            ; 3441 A0 00                    ..
	lda     $A5                             ; 3443 A5 A5                    ..
	beq     L345D                           ; 3445 F0 16                    ..
L3447:  lda     ($A2),y                         ; 3447 B1 A2                    ..
	sta     ($A0),y                         ; 3449 91 A0                    ..
	iny                                     ; 344B C8                       .
	bne     L3447                           ; 344C D0 F9                    ..
	inc     $A1                             ; 344E E6 A1                    ..
	inc     $A3                             ; 3450 E6 A3                    ..
	dec     $A5                             ; 3452 C6 A5                    ..
	bne     L3447                           ; 3454 D0 F1                    ..
	beq     L345D                           ; 3456 F0 05                    ..
L3458:  lda     ($A2),y                         ; 3458 B1 A2                    ..
	sta     ($A0),y                         ; 345A 91 A0                    ..
	iny                                     ; 345C C8                       .
L345D:  cpy     $A4                             ; 345D C4 A4                    ..
	bne     L3458                           ; 345F D0 F7                    ..
	rts                                     ; 3461 60                       `

; ----------------------------------------------------------------------------
sub_3462:
	sta     $A0                             ; 3462 85 A0                    ..
	stx     $A1                             ; 3464 86 A1                    ..
	sty     $A2                             ; 3466 84 A2                    ..
	ldy     #$00                            ; 3468 A0 00                    ..
	lda     ($A2),y                         ; 346A B1 A2                    ..
	sta     ($A0),y                         ; 346C 91 A0                    ..
	beq     L3478                           ; 346E F0 08                    ..
	tay                                     ; 3470 A8                       .
L3471:  lda     ($A2),y                         ; 3471 B1 A2                    ..
	sta     ($A0),y                         ; 3473 91 A0                    ..
	dey                                     ; 3475 88                       .
	bne     L3471                           ; 3476 D0 F9                    ..
L3478:  rts                                     ; 3478 60                       `

; ----------------------------------------------------------------------------
L3479:	.byte   $02,"R:"
L347C:	.byte	$00

; ----------------------------------------------------------------------------
L347D:  and     #$0F                            ; 347D 29 0F                    ).
	sta     $A0                             ; 347F 85 A0                    ..
	stx     $A1                             ; 3481 86 A1                    ..
	asl     a                               ; 3483 0A                       .
	asl     a                               ; 3484 0A                       .
	asl     a                               ; 3485 0A                       .
	asl     a                               ; 3486 0A                       .
	tax                                     ; 3487 AA                       .
	lda     $A5                             ; 3488 A5 A5                    ..
	sta     ICCOM,x
	lda     $A3                             ; 348D A5 A3                    ..
	sta     $0348,x                         ; 348F 9D 48 03                 .H.
	lda     $A4                             ; 3492 A5 A4                    ..
	sta     $0349,x                         ; 3494 9D 49 03                 .I.
	lda     $A6                             ; 3497 A5 A6                    ..
	beq     L34A3                           ; 3499 F0 08                    ..
	sta     $034A,x                         ; 349B 9D 4A 03                 .J.
	lda     $A7                             ; 349E A5 A7                    ..
	sta     $034B,x                         ; 34A0 9D 4B 03                 .K.
L34A3:  tya                                     ; 34A3 98                       .
	sta     ICBA+1,x
	lda     $A1                             ; 34A7 A5 A1                    ..
	sta     ICBA,x
	jsr     CIOV
	sty     L347C                           ; 34AF 8C 7C 34                 .|4
	cpy     #$88                            ; 34B2 C0 88                    ..
	bne     L34BC                           ; 34B4 D0 06                    ..
	tya                                     ; 34B6 98                       .
	ldy     $A0                             ; 34B7 A4 A0                    ..
	sta     $05C0,y                         ; 34B9 99 C0 05                 ...
L34BC:  rts                                     ; 34BC 60                       `

; ----------------------------------------------------------------------------
L34BD:	.byte	$00

; ----------------------------------------------------------------------------
sub_34BE:
	prolog
	sta     L34BD                           ; 34C1 8D BD 34                 ..4
	dldi	$A3, $0000
	rdldi	$A5, L3479
	ldy     #$0D                            ; 34D4 A0 0D                    ..
	ldx     #$00                            ; 34D6 A2 00                    ..
	lda     L34BD                           ; 34D8 AD BD 34                 ..4
	jsr     sub_31D7
	rts                                     ; 34DE 60                       `

; ----------------------------------------------------------------------------
sub_34DF:  
	prolog
	lda     #$02                            ; 34E2 A9 02                    ..
	jsr     sub_34BE
	lda     #$00                            ; 34E7 A9 00                    ..
	cmp     $02EB                           ; 34E9 CD EB 02                 ...
	lbcs	L34F5
	yldi	$4D, $00
L34F5:  lda     $02EB                           ; 34F5 AD EB 02                 ...
	sta     $A0                             ; 34F8 85 A0                    ..
	rts                                     ; 34FA 60                       `

; ----------------------------------------------------------------------------
sub_34FB:  
	pha                                     ; 34FB 48                       H
	lda     #$07                            ; 34FC A9 07                    ..
	sta     $A5                             ; 34FE 85 A5                    ..
	lda     #$00                            ; 3500 A9 00                    ..
	sta     $A6                             ; 3502 85 A6                    ..
	lda     $A3                             ; 3504 A5 A3                    ..
	ora     $A4                             ; 3506 05 A4                    ..
	bne     L3510                           ; 3508 D0 06                    ..
	sta     $A0                             ; 350A 85 A0                    ..
	sta     $A1                             ; 350C 85 A1                    ..
	pla                                     ; 350E 68                       h
	rts                                     ; 350F 60                       `

; ----------------------------------------------------------------------------
L3510:  pla                                     ; 3510 68                       h
	jsr     L347D                           ; 3511 20 7D 34                  }4
	lda     $0348,x                         ; 3514 BD 48 03                 .H.
	sta     $A0                             ; 3517 85 A0                    ..
	lda     $0349,x                         ; 3519 BD 49 03                 .I.
	sta     $A1                             ; 351C 85 A1                    ..
	rts                                     ; 351E 60                       `

; ----------------------------------------------------------------------------
	pha                                     ; 351F 48                       H
	lda     #$0B                            ; 3520 A9 0B                    ..
	sta     $A5                             ; 3522 85 A5                    ..
	lda     #$00                            ; 3524 A9 00                    ..
	sta     $A6                             ; 3526 85 A6                    ..
	lda     $A3                             ; 3528 A5 A3                    ..
	ora     $A4                             ; 352A 05 A4                    ..
	bne     L3530                           ; 352C D0 02                    ..
	pla                                     ; 352E 68                       h
	rts                                     ; 352F 60                       `

; ----------------------------------------------------------------------------
L3530:  pla                                     ; 3530 68                       h
L3531:  jmp     L347D                           ; 3531 4C 7D 34                 L}4

; ----------------------------------------------------------------------------
sub_3534:
	prolog

L3537:	.byte	$00
L3538:	.byte	$00
L3539:	.byte	$00
L353A:	.byte	$00
L353B:	.byte	$00
L353C:	.byte	$00
L353D:	.byte	$00
L353E:	.byte	$00
L353F:	.byte	$00
L3540:	.byte	$00
L3541:	.byte	$00
L3542:	.byte	$00
L3543:  .byte   $EE                             ; 3543 EE                       .
L3544:  .byte   $2C                             ; 3544 2C                       ,

; ----------------------------------------------------------------------------
sub_3545:
	prolog
	stxa	L3537
	rdldi	L3541, L3543
	yldi	L347C, $00
	ldi	$05C5, $00
	dldi	$A3, $0004
	ldy     L3538                           ; 356A AC 38 35                 .85
	ldx     L3537                           ; 356D AE 37 35                 .75
	lda     #$05                            ; 3570 A9 05                    ..
	jsr     sub_3127
L3575:  lda     $05C5                           ; 3575 AD C5 05                 ...
	lbne	L3688
L357D:	lda     #$05                            ; 357D A9 05                    ..
	jsr     sub_31A6
	mv	L3543, $A0
	lda     $05C5                           ; 3587 AD C5 05                 ...
	lbeq	L3592
	jmp     L35CF                           ; 358F 4C CF 35                 L.5

; ----------------------------------------------------------------------------
L3592:  lda     #$05                            ; 3592 A9 05                    ..
	jsr     sub_31A6
	lda     $A0                             ; 3597 A5 A0                    ..
	sta     L3544                           ; 3599 8D 44 35                 .D5
	lda     $05C5                           ; 359C AD C5 05                 ...
	lbeq	L35A7
	jmp     L35CF                           ; 35A4 4C CF 35                 L.5

; ----------------------------------------------------------------------------
L35A7:	dmv	$AE, L3541
	ldy     #$01                            ; 35B1 A0 01                    ..
	lda     ($AE),y                         ; 35B3 B1 AE                    ..
	sta     L353E                           ; 35B5 8D 3E 35                 .>5
	dey                                     ; 35B8 88                       .
	lda     ($AE),y                         ; 35B9 B1 AE                    ..
	sta     L353D                           ; 35BB 8D 3D 35                 .=5
	lda     L353D                           ; 35BE AD 3D 35                 .=5
	eor     #$FF                            ; 35C1 49 FF                    I.
	bne     L35CA                           ; 35C3 D0 05                    ..
	ora     L353E                           ; 35C5 0D 3E 35                 .>5
	eor     #$FF                            ; 35C8 49 FF                    I.
L35CA:  bne     L35CF                           ; 35CA D0 03                    ..
	jmp     L357D                           ; 35CC 4C 7D 35                 L}5

; ----------------------------------------------------------------------------
L35CF:  lda     $05C5                           ; 35CF AD C5 05                 ...
	bne     L35D7                           ; 35D2 D0 03                    ..
	jmp     L35DA                           ; 35D4 4C DA 35                 L.5

; ----------------------------------------------------------------------------
L35D7:  jmp     L3688                           ; 35D7 4C 88 36                 L.6

; ----------------------------------------------------------------------------
L35DA:  lda     #$05                            ; 35DA A9 05                    ..
	jsr     sub_31A6
	lda     $A0                             ; 35DF A5 A0                    ..
	sta     L3543                           ; 35E1 8D 43 35                 .C5
	lda     $05C5                           ; 35E4 AD C5 05                 ...
	lbeq	L35EF
	jmp     L3688                           ; 35EC 4C 88 36                 L.6

; ----------------------------------------------------------------------------
L35EF:  lda     #$05                            ; 35EF A9 05                    ..
	jsr     sub_31A6
	lda     $A0                             ; 35F4 A5 A0                    ..
	sta     L3544                           ; 35F6 8D 44 35                 .D5
	lda     $05C5                           ; 35F9 AD C5 05                 ...
	lbeq	L3604
	jmp     L3688                           ; 3601 4C 88 36                 L.6

; ----------------------------------------------------------------------------
L3604:	dmv	$AE, L3541
	ldp16	L353F
	sub16m	off_AE, L353F, L353D
	add16i	L353B, off_AE, $0001
	rdmv	$A3, L353B
	ldy     L353E                           ; 3645 AC 3E 35                 .>5
	ldx     L353D                           ; 3648 AE 3D 35                 .=5
	lda     #$05                            ; 364B A9 05                    ..
	jsr     sub_34FB
	rdmv	L3539, $A0
	lda     $05C5                           ; 365A AD C5 05                 ...
	lbeq	L3665
	jmp     L3688                           ; 3662 4C 88 36                 L.6

; ----------------------------------------------------------------------------
L3665:  lda     L353D                           ; 3665 AD 3D 35                 .=5
	eor     #$E2                            ; 3668 49 E2                    I.
	bne     L3671                           ; 366A D0 05                    ..
	ora     L353E                           ; 366C 0D 3E 35                 .>5
	eor     #$02                            ; 366F 49 02                    I.
L3671:  beq     L3676                           ; 3671 F0 03                    ..
	jmp     L3685                           ; 3673 4C 85 36                 L.6

; ----------------------------------------------------------------------------
L3676:	rdmv	sub_3534+1, $02E2
	jsr     sub_3534
L3685:  jmp     L3575                           ; 3685 4C 75 35                 Lu5

; ----------------------------------------------------------------------------
L3688:  lda     #$05                            ; 3688 A9 05                    ..
	jsr     sub_315E
L368D:  lda     #$01                            ; 368D A9 01                    ..
	lbeq	L369E
	ldx     #$FD                            ; 3694 A2 FD                    ..
	lda     #$00                            ; 3696 A9 00                    ..
	jsr     sub_31CA
	jmp     L368D                           ; 369B 4C 8D 36                 L.6

; ----------------------------------------------------------------------------
L369E:  rts                                     ; 369E 60                       `

; ----------------------------------------------------------------------------
sub_369F:
	; byte to hex string  
	stx     $AE
	sty     $AE+1
	ldy     #$00                            ; 36A3 A0 00                    ..
	tax                                     ; 36A5 AA                       .
	lsr     a                               ; 36A6 4A                       J
	lsr     a                               ; 36A7 4A                       J
	lsr     a                               ; 36A8 4A                       J
	lsr     a                               ; 36A9 4A                       J
	ora     #$30                            ; 36AA 09 30                    .0
	cmp     #$3A                            ; 36AC C9 3A                    .:
	bcc     :+
	adc     #$06                            ; 36B0 69 06                    i.
:	sta     ($AE),y                         ; 36B2 91 AE                    ..
	txa                                     ; 36B4 8A                       .
	and     #$0F                            ; 36B5 29 0F                    ).
	ora     #$30                            ; 36B7 09 30                    .0
	cmp     #$3A                            ; 36B9 C9 3A                    .:
	bcc     :+
	adc     #$06                            ; 36BD 69 06                    i.
:	iny                                     ; 36BF C8                       .
	sta     ($AE),y                         ; 36C0 91 AE                    ..
	rts                                     ; 36C2 60                       `

; ----------------------------------------------------------------------------
L36C3:  sec                                     ; 36C3 38                       8
	sbc     #$30                            ; 36C4 E9 30                    .0
	and     #$1F                            ; 36C6 29 1F                    ).
	cmp     #$0A                            ; 36C8 C9 0A                    ..
	bcc     L36CE                           ; 36CA 90 02                    ..
	sbc     #$07                            ; 36CC E9 07                    ..
L36CE:  sta     $A0                             ; 36CE 85 A0                    ..
	rts                                     ; 36D0 60                       `

; ----------------------------------------------------------------------------
	stx     $AF                             ; 36D1 86 AF                    ..
	sta     $AE                             ; 36D3 85 AE                    ..
	ldy     #$00                            ; 36D5 A0 00                    ..
	lda     ($AE),y                         ; 36D7 B1 AE                    ..
	jsr     L36C3                           ; 36D9 20 C3 36                  .6
	lda     $A0                             ; 36DC A5 A0                    ..
	asl     a                               ; 36DE 0A                       .
	asl     a                               ; 36DF 0A                       .
	asl     a                               ; 36E0 0A                       .
	asl     a                               ; 36E1 0A                       .
	sta     $A1                             ; 36E2 85 A1                    ..
	iny                                     ; 36E4 C8                       .
	lda     ($AE),y                         ; 36E5 B1 AE                    ..
	jsr     L36C3                           ; 36E7 20 C3 36                  .6
	lda     $A0                             ; 36EA A5 A0                    ..
	clc                                     ; 36EC 18                       .
	adc     $A1                             ; 36ED 65 A1                    e.
	sta     $A0                             ; 36EF 85 A0                    ..
	rts                                     ; 36F1 60                       `

; ----------------------------------------------------------------------------
	tay                                     ; 36F2 A8                       .
	and     #$80                            ; 36F3 29 80                    ).
	sta     $A0                             ; 36F5 85 A0                    ..
	tya                                     ; 36F7 98                       .
	and     #$7F                            ; 36F8 29 7F                    ).
	cmp     #$20                            ; 36FA C9 20                    . 
	bcs     L3702                           ; 36FC B0 04                    ..
	adc     #$40                            ; 36FE 69 40                    i@
	bcc     L3709                           ; 3700 90 07                    ..
L3702:  cmp     #$60                            ; 3702 C9 60                    .`
	bcs     L3709                           ; 3704 B0 03                    ..
	sec                                     ; 3706 38                       8
	sbc     #$20                            ; 3707 E9 20                    . 
L3709:  ora     $A0                             ; 3709 05 A0                    ..
	sta     $A0                             ; 370B 85 A0                    ..
	rts                                     ; 370D 60                       `

; ----------------------------------------------------------------------------
	sta     $AE                             ; 370E 85 AE                    ..
	stx     $AF                             ; 3710 86 AF                    ..
L3712:  dey                                     ; 3712 88                       .
	bmi     L3719                           ; 3713 30 04                    0.
	lda     ($AE),y                         ; 3715 B1 AE                    ..
	beq     L3712                           ; 3717 F0 F9                    ..
L3719:  iny                                     ; 3719 C8                       .
	tya                                     ; 371A 98                       .
	sta     $A0                             ; 371B 85 A0                    ..
	rts                                     ; 371D 60                       `

; ----------------------------------------------------------------------------
L371E:  lda     $13                             ; 371E A5 13                    ..
	ldy     $14                             ; 3720 A4 14                    ..
	cmp     $13                             ; 3722 C5 13                    ..
	beq     L372A                           ; 3724 F0 04                    ..
	lda     $13                             ; 3726 A5 13                    ..
	ldy     #$00                            ; 3728 A0 00                    ..
L372A:  sta     $A1                             ; 372A 85 A1                    ..
	sty     $A0                             ; 372C 84 A0                    ..
	rts                                     ; 372E 60                       `

; ----------------------------------------------------------------------------
sub_372F:  
	sta     $A0                             ; 372F 85 A0                    ..
	and     #$60                            ; 3731 29 60                    )`
	sta     $A2                             ; 3733 85 A2                    ..
	asl     a                               ; 3735 0A                       .
	sta     $A3                             ; 3736 85 A3                    ..
	eor     $A2                             ; 3738 45 A2                    E.
	eor     #$FF                            ; 373A 49 FF                    I.
	and     #$40                            ; 373C 29 40                    )@
	lsr     a                               ; 373E 4A                       J
	sta     $A1                             ; 373F 85 A1                    ..
	lda     $A0                             ; 3741 A5 A0                    ..
	and     #$9F                            ; 3743 29 9F                    ).
	sta     $A0                             ; 3745 85 A0                    ..
	lda     $A3                             ; 3747 A5 A3                    ..
	and     #$40                            ; 3749 29 40                    )@
	ora     $A0                             ; 374B 05 A0                    ..
	ora     $A1                             ; 374D 05 A1                    ..
	sta     $A0                             ; 374F 85 A0                    ..
	rts                                     ; 3751 60                       `

; ----------------------------------------------------------------------------
L3752:	.byte	$00
L3753:	.byte	$00
L3754:	.byte	$00
L3755:	.byte	$00

; ----------------------------------------------------------------------------
sub_3756:
	prolog
	stx     L3753                           ; 3759 8E 53 37                 .S7
	sta     L3752                           ; 375C 8D 52 37                 .R7
	jsr     L371E                           ; 375F 20 1E 37                  .7
	clc                                     ; 3762 18                       .
	lda     L3752                           ; 3763 AD 52 37                 .R7
	adc     $A0                             ; 3766 65 A0                    e.
	sta     L3754                           ; 3768 8D 54 37                 .T7
	lda     L3753                           ; 376B AD 53 37                 .S7
	adc     $A1                             ; 376E 65 A1                    e.
	sta     L3755                           ; 3770 8D 55 37                 .U7
L3773:  jsr     L371E                           ; 3773 20 1E 37                  .7
	lda     $A0                             ; 3776 A5 A0                    ..
	cmp     L3754                           ; 3778 CD 54 37                 .T7
	lda     $A1                             ; 377B A5 A1                    ..
	sbc     L3755                           ; 377D ED 55 37                 .U7
	bcc     L3785                           ; 3780 90 03                    ..
	jmp     L3788                           ; 3782 4C 88 37                 L.7

; ----------------------------------------------------------------------------
L3785:  jmp     L3773                           ; 3785 4C 73 37                 Ls7

; ----------------------------------------------------------------------------
L3788:  rts                                     ; 3788 60                       `

; ----------------------------------------------------------------------------
L3789:	.byte	$00
	jmp     L378D                           ; 378A 4C 8D 37                 L.7

; ----------------------------------------------------------------------------
L378D:  sta     L3789                           ; 378D 8D 89 37                 ..7
	lda     #$00                            ; 3790 A9 00                    ..
	sta     $85                             ; 3792 85 85                    ..
	lda     #$06                            ; 3794 A9 06                    ..
	sta     $84                             ; 3796 85 84                    ..
	lda     L3789                           ; 3798 AD 89 37                 ..7
	ldx     #$00                            ; 379B A2 00                    ..
	jsr     sub_3038
	sta     $A0                             ; 37A0 85 A0                    ..
	txa                                     ; 37A2 8A                       .
	sta     $A1                             ; 37A3 85 A1                    ..
	ldx     $A1                             ; 37A5 A6 A1                    ..
	lda     $A0                             ; 37A7 A5 A0                    ..
	jsr     sub_3756
	rts                                     ; 37AC 60                       `

; ----------------------------------------------------------------------------
sub_37AD:
	prolog
	lda     L2CF2                           ; 37B0 AD F2 2C                 ..,
	eor     #$01                            ; 37B3 49 01                    I.
	lbne	L37BF
	lda     #$01                            ; 37BA A9 01                    ..
	sta     $A0                             ; 37BC 85 A0                    ..
	rts                                     ; 37BE 60                       `

; ----------------------------------------------------------------------------
L37BF:  lda     $D01F                           ; 37BF AD 1F D0                 ...
	and     #$04                            ; 37C2 29 04                    ).
	sta     $AE                             ; 37C4 85 AE                    ..
	lda     $AE                             ; 37C6 A5 AE                    ..
	beq     L37CD                           ; 37C8 F0 03                    ..
	jmp     L37D7                           ; 37CA 4C D7 37                 L.7

; ----------------------------------------------------------------------------
L37CD:  ldy     #$01                            ; 37CD A0 01                    ..
	sty     L2CF2                           ; 37CF 8C F2 2C                 ..,
	lda     #$01                            ; 37D2 A9 01                    ..
	sta     $A0                             ; 37D4 85 A0                    ..
	rts                                     ; 37D6 60                       `

; ----------------------------------------------------------------------------
L37D7:  lda     #$00                            ; 37D7 A9 00                    ..
	sta     $A0                             ; 37D9 85 A0                    ..
	rts                                     ; 37DB 60                       `

; ----------------------------------------------------------------------------
L37DC:	.byte	$00
L37DD:	.byte	$00
L37DE:	.byte	$00
L37DF:	.byte	$00

; ----------------------------------------------------------------------------
sub_37E0:
	prolog
	yldi	L37DF, $01
	rdldi	L37DC, $B818
	dmv	off_AE, L37DC
	dey                                     ; 37FC 88                       .
	lda     ($AE),y                         ; 37FD B1 AE                    ..
	eor     #$FF                            ; 37FF 49 FF                    I.
	sta     L37DE                           ; 3801 8D DE 37                 ..7
	dmv	off_AE, L37DC
	lda     L37DE                           ; 380E AD DE 37                 ..7
	sta     ($AE),y                         ; 3811 91 AE                    ..
	dmv	off_AE, L37DC
	lda     ($AE),y                         ; 381D B1 AE                    ..
	eor     L37DE                           ; 381F 4D DE 37                 M.7
	lbeq	L3870
	jmp     L3840                           ; 3827 4C 40 38                 L@8

; ----------------------------------------------------------------------------
L382A:	.byte	$15,"Insufficient Memory%E"

; ----------------------------------------------------------------------------
L3840:	ldxai	L382A
	jsr     sub_3355
	jmp     L3864                           ; 3847 4C 64 38                 Ld8

; ----------------------------------------------------------------------------
L384A:	.byte	$19,"Please remove cartridge%E"

; ----------------------------------------------------------------------------
L3864:	ldxai	L384A
	jsr     sub_3355
	ldy     #$00                            ; 386B A0 00                    ..
	sty     L37DF                           ; 386D 8C DF 37                 ..7
L3870:  lda     #<$2700
	cmp     $02E7                           ; 3872 CD E7 02                 ...
	lda     #>$2700
	sbc     $02E8                           ; 3877 ED E8 02                 ...
	bcc     L387F                           ; 387A 90 03                    ..
	jmp     L38CF                           ; 387C 4C CF 38                 L.8

; ----------------------------------------------------------------------------
L387F:  jmp     L389A                           ; 387F 4C 9A 38                 L.8

; ----------------------------------------------------------------------------
L3882:	.byte	$17,"Modem Handler too big%E"
L389A:  ldx     #>L3882
	lda     #<L3882
	jsr     sub_3355
	jmp     L38C3                           ; 38A1 4C C3 38                 L.8

; ----------------------------------------------------------------------------
L38A4: .byte	$1E,"Call GCP, Inc for Assistance%E"
L38C3:  ldx     #>L38A4
	lda     #<L38A4
	jsr     sub_3355
	ldy     #$00                            ; 38CA A0 00                    ..
	sty     L37DF                           ; 38CC 8C DF 37                 ..7
L38CF:  lda     L37DF                           ; 38CF AD DF 37                 ..7
	sta     $A0                             ; 38D2 85 A0                    ..
	rts                                     ; 38D4 60                       `

; ----------------------------------------------------------------------------
L38D5:  .byte   $F0                             ; 38D5 F0                       .

; ----------------------------------------------------------------------------
sub_38D6:
	prolog
	sta	L38D5
	lda     L38D5                           ; 38DC AD D5 38                 ..8
	eor     #$01                            ; 38DF 49 01                    I.
	lbne	L38EE
	yldi	CRSINH, $00
	jmp     L38F3                           ; 38EB 4C F3 38                 L.8

; ----------------------------------------------------------------------------
L38EE:	yldi CRSINH, $01
L38F3:  lda     #$1E                            ; 38F3 A9 1E                    ..
	jsr     sub_31C7
	lda     #$1F                            ; 38F8 A9 1F                    ..
	jsr     sub_31C7
	rts                                     ; 38FD 60                       `

; ----------------------------------------------------------------------------
sub_38FE:
	prolog
L3901:	lda     #$01                            ; 3901 A9 01                    ..
	lbeq	L390B
L3908:  jmp     L3901                           ; 3908 4C 01 39                 L.9

; ----------------------------------------------------------------------------
L390B:  rts                                     ; 390B 60                       `

; ----------------------------------------------------------------------------
L390C:  dey                                     ; 390C 88                       .
L390D:  .byte   $D0                             ; 390D D0                       .

; ----------------------------------------------------------------------------
sub_390E:
	prolog
	sta     L390C                           ; 3911 8D 0C 39                 ..9
	lda     L390C                           ; 3914 AD 0C 39                 ..9
	and     #$7F                            ; 3917 29 7F                    ).
	sta     L390D                           ; 3919 8D 0D 39                 ..9
	lda     L390C                           ; 391C AD 0C 39                 ..9
	eor     #$0A                            ; 391F 49 0A                    I.
	beq     L392D                           ; 3921 F0 0A                    ..
L3923:	ifm8eqi	L390C, $9B, L3933
L392D:	jsr     sub_31C5
	jmp     L396B                           ; 3930 4C 6B 39                 Lk9

; ----------------------------------------------------------------------------
L3933:  lda     L390D                           ; 3933 AD 0D 39                 ..9
	cmp     #$2E                            ; 3936 C9 2E                    ..
	lbcs	L3965
	lda     L390D                           ; 393D AD 0D 39                 ..9
	eor     L390C                           ; 3940 4D 0C 39                 M.9
	lbeq	L3950
	lda     #$DE                            ; 3948 A9 DE                    ..
	jsr     sub_31C7
	jmp     L3955                           ; 394D 4C 55 39                 LU9

; ----------------------------------------------------------------------------
L3950:  lda     #$5E                            ; 3950 A9 5E                    .^
	jsr     sub_31C7
L3955:  clc                                     ; 3955 18                       .
	lda     L390C                           ; 3956 AD 0C 39                 ..9
	adc     #$20                            ; 3959 69 20                    i 
L395B:  sta     $A0                             ; 395B 85 A0                    ..
	lda     $A0                             ; 395D A5 A0                    ..
	jsr     sub_31C7
	jmp     L396B                           ; 3962 4C 6B 39                 Lk9

; ----------------------------------------------------------------------------
L3965:  lda     L390C                           ; 3965 AD 0C 39                 ..9
	jsr     sub_31C7
L396B:  rts                                     ; 396B 60                       `

; ----------------------------------------------------------------------------
L396C:  .byte   $A3                             ; 396C A3                       .
L396D:  .byte   $A9                             ; 396D A9                       .
L396E:  .word	$AE06
L3970:  .byte   $43                             ; 3970 43                       C

; ----------------------------------------------------------------------------
sub_3971:
	prolog
	stx     L396D                           ; 3974 8E 6D 39                 .m9
	sta     L396C                           ; 3977 8D 6C 39                 .l9
	ldi	$85, $00
	mv	$84, L396D
	lda     #$3C                            ; 3983 A9 3C                    .<
	ldx     #$00                            ; 3985 A2 00                    ..
	jsr     sub_3038
	sta     $AE                             ; 398A 85 AE                    ..
	txa                                     ; 398C 8A                       .
	sta     $AF                             ; 398D 85 AF                    ..
	lda     $AF                             ; 398F A5 AF                    ..
	pha                                     ; 3991 48                       H
	lda     $AE                             ; 3992 A5 AE                    ..
	pha                                     ; 3994 48                       H
	jsr     L371E                           ; 3995 20 1E 37                  .7
	pla                                     ; 3998 68                       h
	sta     $AE                             ; 3999 85 AE                    ..
	pla                                     ; 399B 68                       h
	sta     $AF                             ; 399C 85 AF                    ..
	clc                                     ; 399E 18                       .
	lda     $AE                             ; 399F A5 AE                    ..
	adc     $A0                             ; 39A1 65 A0                    e.
	sta     L396E
	lda     $AF                             ; 39A6 A5 AF                    ..
	adc     $A1                             ; 39A8 65 A1                    e.
	sta     L396E+1
	clc                                     ; 39AD 18                       .
	lda     L396C                           ; 39AE AD 6C 39                 .l9
	adc     #$01                            ; 39B1 69 01                    i.
	sta     L3970                           ; 39B3 8D 70 39                 .p9
L39B6:  jsr     L371E                           ; 39B6 20 1E 37                  .7
	sec                                     ; 39B9 38                       8
	lda     L396E                           ; 39BA AD 6E 39                 .n9
	sbc     $A0                             ; 39BD E5 A0                    ..
	sta     $AE                             ; 39BF 85 AE                    ..
	lda     L396E+1
	sbc     $A1                             ; 39C4 E5 A1                    ..
	sta     $AF                             ; 39C6 85 AF                    ..
	lda     $AE                             ; 39C8 A5 AE                    ..
	cmp     #$00                            ; 39CA C9 00                    ..
	lda     $AF                             ; 39CC A5 AF                    ..
	sbc     #$00                            ; 39CE E9 00                    ..
	bmi     L39D5                           ; 39D0 30 03                    0.
	jmp     L39DF                           ; 39D2 4C DF 39                 L.9

; ----------------------------------------------------------------------------
L39D5:  ldy     #$01                            ; 39D5 A0 01                    ..
	sty     L2CF2                           ; 39D7 8C F2 2C                 ..,
	ldi	$A0, $00
	rts                                     ; 39DE 60                       `

; ----------------------------------------------------------------------------
L39DF:  jsr     sub_34DF
	lda     #$00                            ; 39E2 A9 00                    ..
	cmp     $A0                             ; 39E4 C5 A0                    ..
	lbcs	L3A38
	ldi	$85, $00
	lda     L396D                           ; 39EF AD 6D 39                 .m9
	sta     $84                             ; 39F2 85 84                    ..
	lda     #$3C                            ; 39F4 A9 3C                    .<
	ldx     #$00                            ; 39F6 A2 00                    ..
	jsr     sub_3038
	sta     $AE                             ; 39FB 85 AE                    ..
	txa                                     ; 39FD 8A                       .
	sta     $AF                             ; 39FE 85 AF                    ..
	lda     $AF                             ; 3A00 A5 AF                    ..
	pha                                     ; 3A02 48                       H
	lda     $AE                             ; 3A03 A5 AE                    ..
	pha                                     ; 3A05 48                       H
	jsr     L371E                           ; 3A06 20 1E 37                  .7
	pla                                     ; 3A09 68                       h
	sta     $AE                             ; 3A0A 85 AE                    ..
	pla                                     ; 3A0C 68                       h
	sta     $AF                             ; 3A0D 85 AF                    ..
	clc                                     ; 3A0F 18                       .
	lda     $AE                             ; 3A10 A5 AE                    ..
	adc     $A0                             ; 3A12 65 A0                    e.
	sta     L396E
	lda     $AF                             ; 3A17 A5 AF                    ..
	adc     $A1                             ; 3A19 65 A1                    e.
	sta     L396E+1
	lda     #$02                            ; 3A1E A9 02                    ..
	jsr     sub_31A6
	lda     $A0                             ; 3A23 A5 A0                    ..
	sta     L3970                           ; 3A25 8D 70 39                 .p9
	lda     L3970                           ; 3A28 AD 70 39                 .p9
	eor     #$0A                            ; 3A2B 49 0A                    I.
	lbeq	L3A38
	lda     L3970                           ; 3A32 AD 70 39                 .p9
	jsr     sub_31C7
L3A38:  jsr     sub_37AD
	lda     $A0                             ; 3A3B A5 A0                    ..
	lbeq	L3A47
	ldi	$A0, $00
	rts                                     ; 3A46 60                       `

; ----------------------------------------------------------------------------
L3A47:  lda     L3970                           ; 3A47 AD 70 39                 .p9
	eor     L396C                           ; 3A4A 4D 6C 39                 Ml9
	lbne	L39B6
	ldi	$A0, $01
	rts                                     ; 3A56 60                       `

; ----------------------------------------------------------------------------
L3A57:	.byte	$00
L3A58:  .byte   $85
L3A59:  .byte   $A0
L3A5A:  .byte	$60
L3A5B:  .byte	$18

; ----------------------------------------------------------------------------
sub_3A5C:
	prolog
	stx     L3A58                           ; 3A5F 8E 58 3A                 .X:
	sta     L3A57                           ; 3A62 8D 57 3A                 .W:
	lda     #$01                            ; 3A65 A9 01                    ..
	jsr     sub_38D6
	lda     $02FC                           ; 3A6A AD FC 02                 ...
	eor     #$FF                            ; 3A6D 49 FF                    I.
	lbeq	L3A79
	lda     #$07                            ; 3A74 A9 07                    ..
	jsr     sub_31A6
L3A79:  lda     L3A57                           ; 3A79 AD 57 3A                 .W:
	sta     $AE                             ; 3A7C 85 AE                    ..
	lda     L3A58                           ; 3A7E AD 58 3A                 .X:
	sta     $AF                             ; 3A81 85 AF                    ..
	ldy     #$00                            ; 3A83 A0 00                    ..
	lda     ($AE),y                         ; 3A85 B1 AE                    ..
	sta     L3A59                           ; 3A87 8D 59 3A                 .Y:
L3A8A:  lda     #$01                            ; 3A8A A9 01                    ..
	lbeq	L3AFD
	lda     #$07                            ; 3A91 A9 07                    ..
	jsr     sub_31A6
	lda     $A0                             ; 3A96 A5 A0                    ..
	sta     L3A5B                           ; 3A98 8D 5B 3A                 .[:
	lda     L3A5B                           ; 3A9B AD 5B 3A                 .[:
	and     #$7F                            ; 3A9E 29 7F                    ).
	sta     L3A5B                           ; 3AA0 8D 5B 3A                 .[:
	lda     L3A5B                           ; 3AA3 AD 5B 3A                 .[:
	cmp     #$61                            ; 3AA6 C9 61                    .a
	lbcc	L3AB6
	sec                                     ; 3AAD 38                       8
	lda     L3A5B                           ; 3AAE AD 5B 3A                 .[:
	sbc     #$20                            ; 3AB1 E9 20                    . 
	sta     L3A5B                           ; 3AB3 8D 5B 3A                 .[:
L3AB6:  ldy     #$01                            ; 3AB6 A0 01                    ..
	sty     L3A5A                           ; 3AB8 8C 5A 3A                 .Z:
	lda     L3A59                           ; 3ABB AD 59 3A                 .Y:
	sta     L3ACC                           ; 3ABE 8D CC 3A                 ..:
L3AC1:  lda     L3ACC                           ; 3AC1 AD CC 3A                 ..:
	cmp     L3A5A                           ; 3AC4 CD 5A 3A                 .Z:
	bcs     L3ACD                           ; 3AC7 B0 04                    ..
	jmp     L3AFA                           ; 3AC9 4C FA 3A                 L.:

; ----------------------------------------------------------------------------
L3ACC:  .byte   $09                             ; 3ACC 09                       .

; ----------------------------------------------------------------------------
L3ACD:  clc                                     ; 3ACD 18                       .
	lda     L3A57                           ; 3ACE AD 57 3A                 .W:
	adc     L3A5A                           ; 3AD1 6D 5A 3A                 mZ:
	sta     $AE                             ; 3AD4 85 AE                    ..
	lda     L3A58                           ; 3AD6 AD 58 3A                 .X:
	adc     #$00                            ; 3AD9 69 00                    i.
	sta     $AF                             ; 3ADB 85 AF                    ..
	ldy     #$00                            ; 3ADD A0 00                    ..
	lda     ($AE),y                         ; 3ADF B1 AE                    ..
	eor     L3A5B                           ; 3AE1 4D 5B 3A                 M[:
	lbne	L3AF4
	lda     #$00                            ; 3AE9 A9 00                    ..
	jsr     sub_38D6
	mv	$A0, L3A5B
	rts                                     ; 3AF3 60                       `

; ----------------------------------------------------------------------------
L3AF4:  inc     L3A5A                           ; 3AF4 EE 5A 3A                 .Z:
	jmp     L3AC1                           ; 3AF7 4C C1 3A                 L.:

; ----------------------------------------------------------------------------
L3AFA:  jmp     L3A8A                           ; 3AFA 4C 8A 3A                 L.:

; ----------------------------------------------------------------------------
L3AFD:  lda     #$00                            ; 3AFD A9 00                    ..
	jsr     sub_38D6
	mv	$A0, L3A5B
	rts                                     ; 3B07 60                       `

; ----------------------------------------------------------------------------
L3B08:  .byte   $7C                             ; 3B08 7C                       |
L3B09:  .byte   $39                             ; 3B09 39                       9
L3B0A:  .byte   $AD                             ; 3B0A AD                       .
L3B0B:  .byte   $59                             ; 3B0B 59                       Y
L3B0C:  .byte   $03                             ; 3B0C 03                       .
L3B0D:  .byte   $8D                             ; 3B0D 8D                       .
L3B0E:  .byte   $C5                             ; 3B0E C5                       .

; ----------------------------------------------------------------------------
L3B0F:  stack_prolog L3B08, $03
	ldy     L3B09                           ; 3B18 AC 09 3B                 ..;
	ldx     #$00                            ; 3B1B A2 00                    ..
	lda     L3B08                           ; 3B1D AD 08 3B                 ..;
	jsr     sub_3405
	lda     #$11                            ; 3B23 A9 11                    ..
	jsr     sub_31C7
	ldi	L3B0C, $02
	mv	L3B3E, L3B0A
L3B33:  lda     L3B3E                           ; 3B33 AD 3E 3B                 .>;
	cmp     L3B0C                           ; 3B36 CD 0C 3B                 ..;
	bcs     L3B3F                           ; 3B39 B0 04                    ..
	jmp     L3B4A                           ; 3B3B 4C 4A 3B                 LJ;

; ----------------------------------------------------------------------------
L3B3E:  .byte   $A3                             ; 3B3E A3                       .

; ----------------------------------------------------------------------------
L3B3F:  lda     #$12                            ; 3B3F A9 12                    ..
	jsr     sub_31C7
	inc     L3B0C                           ; 3B44 EE 0C 3B                 ..;
	jmp     L3B33                           ; 3B47 4C 33 3B                 L3;

; ----------------------------------------------------------------------------
L3B4A:  lda     #$05                            ; 3B4A A9 05                    ..
	jsr     sub_31C7
	add8i	L3B0E, L3B09, $01
	ldi	L3B0D, $03
	mv	L3B6E, L3B0B
L3B63:  lda     L3B6E                           ; 3B63 AD 6E 3B                 .n;
	cmp     L3B0D                           ; 3B66 CD 0D 3B                 ..;
	bcs     L3B6F                           ; 3B69 B0 04                    ..
	jmp     L3BAF                           ; 3B6B 4C AF 3B                 L.;

; ----------------------------------------------------------------------------
L3B6E:  .byte   $20                             ; 3B6E 20                        

; ----------------------------------------------------------------------------
L3B6F:  ldy     L3B0E                           ; 3B6F AC 0E 3B                 ..;
	ldx     #$00                            ; 3B72 A2 00                    ..
	lda     L3B08                           ; 3B74 AD 08 3B                 ..;
	jsr     sub_3405
	lda     #$7C                            ; 3B7A A9 7C                    .|
	jsr     sub_31C7
	ldi	L3B0C, $02
	lda     L3B0A                           ; 3B84 AD 0A 3B                 ..;
	sta     L3B95                           ; 3B87 8D 95 3B                 ..;
L3B8A:  lda     L3B95                           ; 3B8A AD 95 3B                 ..;
	cmp     L3B0C                           ; 3B8D CD 0C 3B                 ..;
	bcs     L3B96                           ; 3B90 B0 04                    ..
	jmp     L3BA1                           ; 3B92 4C A1 3B                 L.;

; ----------------------------------------------------------------------------
L3B95:  .byte   $70                             ; 3B95 70                       p

; ----------------------------------------------------------------------------
L3B96:  lda     #$20                            ; 3B96 A9 20                    . 
	jsr     sub_31C7
	inc     L3B0C                           ; 3B9B EE 0C 3B                 ..;
	jmp     L3B8A                           ; 3B9E 4C 8A 3B                 L.;

; ----------------------------------------------------------------------------
L3BA1:  lda     #$7C                            ; 3BA1 A9 7C                    .|
	jsr     sub_31C7
	inc     L3B0E                           ; 3BA6 EE 0E 3B                 ..;
	inc     L3B0D                           ; 3BA9 EE 0D 3B                 ..;
	jmp     L3B63                           ; 3BAC 4C 63 3B                 Lc;

; ----------------------------------------------------------------------------
L3BAF:  ldy     L3B0E                           ; 3BAF AC 0E 3B                 ..;
	ldx     #$00                            ; 3BB2 A2 00                    ..
	lda     L3B08                           ; 3BB4 AD 08 3B                 ..;
	jsr     sub_3405
	lda     #$1A                            ; 3BBA A9 1A                    ..
	jsr     sub_31C7
	lda     #$02                            ; 3BBF A9 02                    ..
	sta     L3B0C                           ; 3BC1 8D 0C 3B                 ..;
	lda     L3B0A                           ; 3BC4 AD 0A 3B                 ..;
	sta     L3BD5                           ; 3BC7 8D D5 3B                 ..;
L3BCA:  lda     L3BD5                           ; 3BCA AD D5 3B                 ..;
	cmp     L3B0C                           ; 3BCD CD 0C 3B                 ..;
	bcs     L3BD6                           ; 3BD0 B0 04                    ..
	jmp     L3BE1                           ; 3BD2 4C E1 3B                 L.;

; ----------------------------------------------------------------------------
L3BD5:  .byte   $A9

; ----------------------------------------------------------------------------
L3BD6:  lda     #$12                            ; 3BD6 A9 12                    ..
	jsr     sub_31C7
	inc     L3B0C                           ; 3BDB EE 0C 3B                 ..;
	jmp     L3BCA                           ; 3BDE 4C CA 3B                 L.;

; ----------------------------------------------------------------------------
L3BE1:  lda     #$03                            ; 3BE1 A9 03                    ..
	jsr     sub_31C7
	rts                                     ; 3BE6 60                       `

; ----------------------------------------------------------------------------
L3BE7:  .byte   $85
L3BE8:  .byte   $A3
L3BE9:  .byte   $A9,$00


; ----------------------------------------------------------------------------
sub_3BEB:  
	stack_prolog L3BE7, $03
	dmv	off_AE, L3BE9
	clc                                     ; 3BFE 18                       .
	ldy     #$00                            ; 3BFF A0 00                    ..
	lda     ($AE),y                         ; 3C01 B1 AE                    ..
	adc     #$02                            ; 3C03 69 02                    i.
	sta     $A2                             ; 3C05 85 A2                    ..
	lda     #$03                            ; 3C07 A9 03                    ..
	sta     $A3                             ; 3C09 85 A3                    ..
	ldy     $A2                             ; 3C0B A4 A2                    ..
	ldx     L3BE8                           ; 3C0D AE E8 3B                 ..;
	lda     L3BE7                           ; 3C10 AD E7 3B                 ..;
	jsr     L3B0F                           ; 3C13 20 0F 3B                  .;

	clc                                     ; 3C16 18                       .
	lda     L3BE7                           ; 3C17 AD E7 3B                 ..;
	adc     #$01                            ; 3C1A 69 01                    i.
	sta     $A0                             ; 3C1C 85 A0                    ..

	lda     #$00                            ; 3C1E A9 00                    ..
	sta     $A1                             ; 3C20 85 A1                    ..

	clc                                     ; 3C22 18                       .
	lda     L3BE8                           ; 3C23 AD E8 3B                 ..;
	adc     #$01                            ; 3C26 69 01                    i.
	sta     $A2                             ; 3C28 85 A2                    ..

	ldy     $A2                             ; 3C2A A4 A2                    ..
	ldx     $A1                             ; 3C2C A6 A1                    ..
	lda     $A0                             ; 3C2E A5 A0                    ..
	jsr     sub_3405
	ldx     L3BE9+1
	lda     L3BE9                           ; 3C36 AD E9 3B                 ..;
	jsr     sub_3164
	rts                                     ; 3C3C 60                       `

; ----------------------------------------------------------------------------
L3C3D:	.byte	$00

; ----------------------------------------------------------------------------
sub_3C3E:
	prolog
	sta     L3C3D                           ; 3C41 8D 3D 3C                 .=<
	lda     L3C3D                           ; 3C44 AD 3D 3C                 .=<
	lbne	L3C57
	ldi	$022F, $22
	ldy     #$00                            ; 3C51 A0 00                    ..
	sty     $D01D                           ; 3C53 8C 1D D0                 ...
	rts                                     ; 3C56 60                       `

; ----------------------------------------------------------------------------
L3C57:  ldy     #$00                            ; 3C57 A0 00                    ..
	sty     $D003                           ; 3C59 8C 03 D0                 ...
	sty     $D00B                           ; 3C5C 8C 0B D0                 ...
	sty     $D010                           ; 3C5F 8C 10 D0                 ...
	ldi	$022F, $2A
	ldi	$D407, $B0
	lda     $026F                           ; 3C6C AD 6F 02                 .o.
	and     #$C0                            ; 3C6F 29 C0                    ).
	sta     $AE                             ; 3C71 85 AE                    ..
	lda     $AE                             ; 3C73 A5 AE                    ..
	ora     #$21                            ; 3C75 09 21                    .!
	sta     $026F                           ; 3C77 8D 6F 02                 .o.
	lda     #$02                            ; 3C7A A9 02                    ..
	sta     $D01D                           ; 3C7C 8D 1D D0                 ...
	rts                                     ; 3C7F 60                       `

; ----------------------------------------------------------------------------
sub_3C80:
	prolog
	lda     #$01                            ; 3C83 A9 01                    ..
	jsr     sub_38D6
	lda     #$01                            ; 3C88 A9 01                    ..
	jsr     sub_3C3E
	rts                                     ; 3C8D 60                       `

; ----------------------------------------------------------------------------
L3C8E:	.byte	$00
L3C8F:	.byte	$00

; ----------------------------------------------------------------------------
sub_3C90:
	prolog
	lda     #$05                            ; 3C93 A9 05                    ..
	jsr     sub_315E
	lda     $B148                           ; 3C98 AD 48 B1                 .H.
	eor     #$01                            ; 3C9B 49 01                    I.
	lbne	L3D0F
	lda     L2E0F                           ; 3CA2 AD 0F 2E                 ...
	eor     #$01                            ; 3CA5 49 01                    I.
	lbne	L3D0F
	lda     #$02                            ; 3CAC A9 02                    ..
	asl     a                               ; 3CAE 0A                       .
	asl     a                               ; 3CAF 0A                       .
	asl     a                               ; 3CB0 0A                       .
	asl     a                               ; 3CB1 0A                       .
	sta     $AE                             ; 3CB2 85 AE                    ..
	clc                                     ; 3CB4 18                       .
	lda     #$4A                            ; 3CB5 A9 4A                    .J
	adc     $AE                             ; 3CB7 65 AE                    e.
	sta     L3C8E                           ; 3CB9 8D 8E 3C                 ..<
	lda     #$03                            ; 3CBC A9 03                    ..
	adc     #$00                            ; 3CBE 69 00                    i.
	sta     L3C8F                           ; 3CC0 8D 8F 3C                 ..<
	lda     L3C8E                           ; 3CC3 AD 8E 3C                 ..<
	sta     $AE                             ; 3CC6 85 AE                    ..
	lda     L3C8F                           ; 3CC8 AD 8F 3C                 ..<
	sta     $AF                             ; 3CCB 85 AF                    ..
	lda     #$00                            ; 3CCD A9 00                    ..
	ldy     #$01                            ; 3CCF A0 01                    ..
	sta     ($AE),y                         ; 3CD1 91 AE                    ..
	lda     #$00                            ; 3CD3 A9 00                    ..
	dey                                     ; 3CD5 88                       .
	sta     ($AE),y                         ; 3CD6 91 AE                    ..
	lda     #$00                            ; 3CD8 A9 00                    ..
	sta     $A3                             ; 3CDA 85 A3                    ..
	lda     #$00                            ; 3CDC A9 00                    ..
	sta     $A4                             ; 3CDE 85 A4                    ..
	lda     #$34                            ; 3CE0 A9 34                    .4
	sta     $A6                             ; 3CE2 85 A6                    ..
	lda     #$79                            ; 3CE4 A9 79                    .y
	sta     $A5                             ; 3CE6 85 A5                    ..
	ldy     #$28                            ; 3CE8 A0 28                    .(
	ldx     #$00                            ; 3CEA A2 00                    ..
	lda     #$02                            ; 3CEC A9 02                    ..
	jsr     sub_31D7
	dldi	$A3, $00
	rdldi	$A5, L3479
	ldy     #$59                            ; 3D01 A0 59                    .Y
	ldx     #$00                            ; 3D03 A2 00                    ..
	lda     #$02                            ; 3D05 A9 02                    ..
	jsr     sub_31D7
	ldi	$A0, $01
	rts                                     ; 3D0E 60                       `

; ----------------------------------------------------------------------------
L3D0F:  lda     #$02                            ; 3D0F A9 02                    ..
	jsr     sub_315E
	ldi	$05C2, $00
	ldi	$A3, $0D
	ldy     #>L3479
	ldx     #<L3479
	lda     #$02                            ; 3D21 A9 02                    ..
	jsr     sub_3127
	ldi	$A3, $C0
	ldi	$A4, $00
	ldi	$A6, $34
	ldi	$A5, $79
	ldy     #$22                            ; 3D36 A0 22                    ."
	ldx     #$00                            ; 3D38 A2 00                    ..
	lda     #$02                            ; 3D3A A9 02                    ..
	jsr     sub_31D7
	mv	$A3, $B149
	ldi	$A4, $00
	ldi	$A6, >L3479
	ldi	$A5, <L3479
	ldy     #$24                            ; 3D50 A0 24                    .$
	ldx     #$00                            ; 3D52 A2 00                    ..
	lda     #$02                            ; 3D54 A9 02                    ..
	jsr     sub_31D7
	ldi	$A3, $00
	ldi	$A4, $00
	ldi	$A6, >L3479
	ldi	$A5, <L3479
	ldy     #$26                            ; 3D69 A0 26                    .&
	ldx     #$00                            ; 3D6B A2 00                    ..
	lda     #$02                            ; 3D6D A9 02                    ..
	jsr     sub_31D7
	lda     #$02                            ; 3D72 A9 02                    ..
	asl     a                               ; 3D74 0A                       .
	asl     a                               ; 3D75 0A                       .
	asl     a                               ; 3D76 0A                       .
	asl     a                               ; 3D77 0A                       .
	sta     $AE                             ; 3D78 85 AE                    ..
	clc                                     ; 3D7A 18                       .
	lda     #$4A                            ; 3D7B A9 4A                    .J
	adc     $AE                             ; 3D7D 65 AE                    e.
	sta     L3C8E                           ; 3D7F 8D 8E 3C                 ..<
	lda     #$03                            ; 3D82 A9 03                    ..
	adc     #$00                            ; 3D84 69 00                    i.
	sta     L3C8F                           ; 3D86 8D 8F 3C                 ..<
	lda     L3C8E                           ; 3D89 AD 8E 3C                 ..<
	sta     $AE                             ; 3D8C 85 AE                    ..
	lda     L3C8F                           ; 3D8E AD 8F 3C                 ..<
	sta     $AF                             ; 3D91 85 AF                    ..
	lda     #$00                            ; 3D93 A9 00                    ..
	ldy     #$01                            ; 3D95 A0 01                    ..
	sta     ($AE),y                         ; 3D97 91 AE                    ..
	lda     #$00                            ; 3D99 A9 00                    ..
	dey                                     ; 3D9B 88                       .
	sta     ($AE),y                         ; 3D9C 91 AE                    ..
	lda     #$00                            ; 3D9E A9 00                    ..
	sta     $A3                             ; 3DA0 85 A3                    ..
	lda     #$00                            ; 3DA2 A9 00                    ..
	sta     $A4                             ; 3DA4 85 A4                    ..
	lda     #$34                            ; 3DA6 A9 34                    .4
	sta     $A6                             ; 3DA8 85 A6                    ..
	lda     #$79                            ; 3DAA A9 79                    .y
	sta     $A5                             ; 3DAC 85 A5                    ..
	ldy     #$28                            ; 3DAE A0 28                    .(
	ldx     #$00                            ; 3DB0 A2 00                    ..
	lda     #$02                            ; 3DB2 A9 02                    ..
	jsr     sub_31D7
	lda     $B148                           ; 3DB7 AD 48 B1                 .H.
	eor     #$01                            ; 3DBA 49 01                    I.
	lbne	L3DDA
	lda     #$00                            ; 3DC1 A9 00                    ..
	sta     $A3                             ; 3DC3 85 A3                    ..
	lda     #$00                            ; 3DC5 A9 00                    ..
	sta     $A4                             ; 3DC7 85 A4                    ..
	lda     #$34                            ; 3DC9 A9 34                    .4
	sta     $A6                             ; 3DCB 85 A6                    ..
	lda     #$79                            ; 3DCD A9 79                    .y
	sta     $A5                             ; 3DCF 85 A5                    ..
	ldy     #$4C                            ; 3DD1 A0 4C                    .L
	ldx     #$00                            ; 3DD3 A2 00                    ..
	lda     #$02                            ; 3DD5 A9 02                    ..
	jsr     sub_31D7
L3DDA:  ldy     #$01                            ; 3DDA A0 01                    ..
	sty     L2E0F                           ; 3DDC 8C 0F 2E                 ...
	lda     $10                             ; 3DDF A5 10                    ..
	and     #$7F                            ; 3DE1 29 7F                    ).
	sta     $10                             ; 3DE3 85 10                    ..
	lda     #$01                            ; 3DE5 A9 01                    ..
	sta     $A0                             ; 3DE7 85 A0                    ..
	rts                                     ; 3DE9 60                       `

; ----------------------------------------------------------------------------
	brk                                     ; 3DEA 00                       .
	brk                                     ; 3DEB 00                       .

; ----------------------------------------------------------------------------
sub_3DEC:
	prolog
	ldx     #$00                            ; 3DEF A2 00                    ..
	lda     #$03                            ; 3DF1 A9 03                    ..
	jsr     sub_3756
L3DF6:  jsr     sub_34DF
	lda     $A0                             ; 3DF9 A5 A0                    ..
	lbeq	L3E0F
L3E00:  lda     #$02                            ; 3E00 A9 02                    ..
	jsr     sub_31A6
	ldx     #$00                            ; 3E05 A2 00                    ..
	lda     #$02                            ; 3E07 A9 02                    ..
	jsr     sub_3756
	jmp     L3DF6                           ; 3E0C 4C F6 3D                 L.=

; ----------------------------------------------------------------------------
L3E0F:  lda     $B148                           ; 3E0F AD 48 B1                 .H.
	eor     #$01                            ; 3E12 49 01                    I.
	lbne	L3E6F
	jsr     sub_37AD
	lda     $A0                             ; 3E1C A5 A0                    ..
	lbne	L3E56
	ldi	$A3, $00
	ldi	$A4, $00
	ldi	$A6, >L3479
	ldi	$A5, <L3479
	ldy     #$5A                            ; 3E33 A0 5A                    .Z
	ldx     #$00                            ; 3E35 A2 00                    ..
	lda     #$02                            ; 3E37 A9 02                    ..
	jsr     sub_31D7
	lda     #$20                            ; 3E3C A9 20                    . 
	sta     $A3                             ; 3E3E 85 A3                    ..
	lda     #$00                            ; 3E40 A9 00                    ..
	sta     $A4                             ; 3E42 85 A4                    ..
	lda     #$34                            ; 3E44 A9 34                    .4
	sta     $A6                             ; 3E46 85 A6                    ..
	lda     #$79                            ; 3E48 A9 79                    .y
	sta     $A5                             ; 3E4A 85 A5                    ..
	ldy     #$26                            ; 3E4C A0 26                    .&
	ldx     #$00                            ; 3E4E A2 00                    ..
	lda     #$02                            ; 3E50 A9 02                    ..
	jsr     sub_31D7
	rts                                     ; 3E55 60                       `

; ----------------------------------------------------------------------------
L3E56:  lda     #$00                            ; 3E56 A9 00                    ..
	sta     $A3                             ; 3E58 85 A3                    ..
	lda     #$00                            ; 3E5A A9 00                    ..
	sta     $A4                             ; 3E5C 85 A4                    ..
	lda     #$34                            ; 3E5E A9 34                    .4
	sta     $A6                             ; 3E60 85 A6                    ..
	lda     #$79                            ; 3E62 A9 79                    .y
	sta     $A5                             ; 3E64 85 A5                    ..
	ldy     #$4D                            ; 3E66 A0 4D                    .M
	ldx     #$00                            ; 3E68 A2 00                    ..
	lda     #$02                            ; 3E6A A9 02                    ..
	jsr     sub_31D7
L3E6F:  lda     #$02                            ; 3E6F A9 02                    ..
	jsr     sub_315E
	ldy     #$00                            ; 3E74 A0 00                    ..
	sty     L2E0F                           ; 3E76 8C 0F 2E                 ...
	rts                                     ; 3E79 60                       `

; ----------------------------------------------------------------------------
sub_3E7A:
	prolog
	lda     $B148                           ; 3E7D AD 48 B1                 .H.
	eor     #$02                            ; 3E80 49 02                    I.
	lbne	L3E90
	lda     $D300                           ; 3E87 AD 00 D3                 ...
	eor     #$40                            ; 3E8A 49 40                    I@
	sta     $D300                           ; 3E8C 8D 00 D3                 ...
	rts                                     ; 3E8F 60                       `

; ----------------------------------------------------------------------------
L3E90:  lda     $B148                           ; 3E90 AD 48 B1                 .H.
	eor     #$01                            ; 3E93 49 01                    I.
	lbeq	L3E9B
	rts                                     ; 3E9A 60                       `

; ----------------------------------------------------------------------------
L3E9B:  lda     #$00                            ; 3E9B A9 00                    ..
	sta     $A3                             ; 3E9D 85 A3                    ..
	lda     #$00                            ; 3E9F A9 00                    ..
	sta     $A4                             ; 3EA1 85 A4                    ..
	lda     #$34                            ; 3EA3 A9 34                    .4
	sta     $A6                             ; 3EA5 85 A6                    ..
	lda     #$79                            ; 3EA7 A9 79                    .y
	sta     $A5                             ; 3EA9 85 A5                    ..
	ldy     #$4D                            ; 3EAB A0 4D                    .M
	ldx     #$00                            ; 3EAD A2 00                    ..
	lda     #$02                            ; 3EAF A9 02                    ..
	jsr     sub_31D7
	lda     $02EA                           ; 3EB4 AD EA 02                 ...
	and     #$7F                            ; 3EB7 29 7F                    ).
	sta     $02EA                           ; 3EB9 8D EA 02                 ...
	rts                                     ; 3EBC 60                       `

; ----------------------------------------------------------------------------
sub_3EBD:
	prolog
	lda     $B148                           ; 3EC0 AD 48 B1                 .H.
	eor     #$01                            ; 3EC3 49 01                    I.
	lbne	L3EE2
	lda     $02EA                           ; 3ECA AD EA 02                 ...
	and     #$80                            ; 3ECD 29 80                    ).
	sta     $AE                             ; 3ECF 85 AE                    ..
	lda     $AE                             ; 3ED1 A5 AE                    ..
	lbeq	L3EDD
	ldi	$A0, $01
	rts                                     ; 3EDC 60                       `

; ----------------------------------------------------------------------------
L3EDD:	ldi	$A0, $00
	rts                                     ; 3EE1 60                       `

; ----------------------------------------------------------------------------
L3EE2:  lda     $B148                           ; 3EE2 AD 48 B1                 .H.
	eor     #$02                            ; 3EE5 49 02                    I.
	lbne	L3F00
	lda     $D300                           ; 3EEC AD 00 D3                 ...
	eor     #$8F                            ; 3EEF 49 8F                    I.
	lbne	L3EFB
	ldi	$A0, $01
	rts                                     ; 3EFA 60                       `

; ----------------------------------------------------------------------------
L3EFB:	ldi     $A0, $00
	rts                                     ; 3EFF 60                       `

; ----------------------------------------------------------------------------
L3F00:	ldi	$A0, $FF
	rts                                     ; 3F04 60                       `

; ----------------------------------------------------------------------------
L3F05:	.byte	$00
L3F06:	.byte	$00,$00
L3F08:	.byte	$00
L3F09:	.byte	$00
L3F0A:	.byte	$00
L3F0B:	.byte	$00
L3F0C:	.byte	$00,$00
	.byte	$00

; ----------------------------------------------------------------------------
sub_3F0F:
	prolog
	jsr     sub_34DF
	ldi	L3F06+1, $00
	mv	L3F06, $A0
	test16	L3F06
	lbne	L3F2F
	ldi	$A0, $00
	rts                                     ; 3F2E 60                       `

; ----------------------------------------------------------------------------
L3F2F:  lda     #$02                            ; 3F2F A9 02                    ..
	jsr     sub_31A6
	mv	L3F05, $A0
	lda     L3F05                           ; 3F39 AD 05 3F                 ..?
	jsr     sub_390E
	lda     L3F08                           ; 3F3F AD 08 3F                 ..?
	eor     #$01                            ; 3F42 49 01                    I.
	lbne	L3F65
	lda     L3F05                           ; 3F49 AD 05 3F                 ..?
	eor     #$0A                            ; 3F4C 49 0A                    I.
	lbne	L3F60
	ldy     #$00                            ; 3F53 A0 00                    ..
	sty     L3F08                           ; 3F55 8C 08 3F                 ..?
	sty     L2CF6                           ; 3F58 8C F6 2C                 ..,
	ldi	$A0, $04
	rts                                     ; 3F5F 60                       `

; ----------------------------------------------------------------------------
L3F60:	ldi	$A0, $00
	rts                                     ; 3F64 60                       `

; ----------------------------------------------------------------------------
L3F65:  lda     L2CF6                           ; 3F65 AD F6 2C                 ..,
	lbne	L3FDB
	lda     L3F05                           ; 3F6D AD 05 3F                 ..?
	and     #$7F                            ; 3F70 29 7F                    ).
	sta     L3F0A                           ; 3F72 8D 0A 3F                 ..?
	lda     L3F0A                           ; 3F75 AD 0A 3F                 ..?
	cmp     #$05                            ; 3F78 C9 05                    ..
	bcc     L3F86                           ; 3F7A 90 0A                    ..
	lda     #$5E                            ; 3F7C A9 5E                    .^
	cmp     L3F0A                           ; 3F7E CD 0A 3F                 ..?
	lbcs	L3F90
L3F86:	yldi	L3F08, $01
	ldi	$A0, $00
	rts                                     ; 3F8F 60                       `

; ----------------------------------------------------------------------------
L3F90:	mv	L2D58, L3F05
	lda     #>L2D58
	sta     L3F0C+1
	lda     #<L2D58
	sta     L3F0C
	mv	L3F0B, L3F05
	ldy     #$01                            ; 3FA6 A0 01                    ..
	sty     L2CF6                           ; 3FA8 8C F6 2C                 ..,
	sty     L3F09                           ; 3FAB 8C 09 3F                 ..?
	jsr     sub_34DF
	ldi	L3F06+1, $00
	mv	L3F06, $A0
	test16	L3F06
	lbne	L3FCB
	ldi	$A0, $00
	rts                                     ; 3FCA 60                       `

; ----------------------------------------------------------------------------
L3FCB:  lda     #$02                            ; 3FCB A9 02                    ..
	jsr     sub_31A6
	mv	L3F05, $A0
	lda     L3F05                           ; 3FD5 AD 05 3F                 ..?
	jsr     sub_390E
L3FDB:  lda     L3F09                           ; 3FDB AD 09 3F                 ..?
	eor     #$01                            ; 3FDE 49 01                    I.
	lbne	L404B
	lda     L3F05                           ; 3FE5 AD 05 3F                 ..?
	eor     L2D58                           ; 3FE8 4D 58 2D                 MX-
	lbeq	L3FFA
	yldi	L3F08, $01
	ldi	$A0, $00
	rts                                     ; 3FF9 60                       `

; ----------------------------------------------------------------------------
L3FFA:	add16m8 $AE, L3F0C, L3F09
	stp8	L3F05
	clc                                     ; 4011 18                       .
	lda     L3F0B                           ; 4012 AD 0B 3F                 ..?
	adc     L3F05                           ; 4015 6D 05 3F                 m.?
	sta     L3F0B                           ; 4018 8D 0B 3F                 ..?
	inc     L3F09                           ; 401B EE 09 3F                 ..?
	jsr     sub_34DF
	ldi	L3F06+1, $00
	lda     $A0                             ; 4026 A5 A0                    ..
	sta     L3F06                           ; 4028 8D 06 3F                 ..?
	test16	L3F06
	lbne	L403B
	ldi	$A0, $00
	rts                                     ; 403A 60                       `

; ----------------------------------------------------------------------------
L403B:  lda     #$02                            ; 403B A9 02                    ..
	jsr     sub_31A6
	lda     $A0                             ; 4040 A5 A0                    ..
	sta     L3F05                           ; 4042 8D 05 3F                 ..?
	lda     L3F05                           ; 4045 AD 05 3F                 ..?
	jsr     sub_390E
L404B:  clc                                     ; 404B 18                       .
	lda     L3F0C                           ; 404C AD 0C 3F                 ..?
	adc     L3F09                           ; 404F 6D 09 3F                 m.?
	sta     $AE                             ; 4052 85 AE                    ..
	lda     L3F0C+1
	adc     #$00                            ; 4057 69 00                    i.
	sta     $AF                             ; 4059 85 AF                    ..
	lda     L3F05                           ; 405B AD 05 3F                 ..?
	ldy     #$00                            ; 405E A0 00                    ..
	sta     ($AE),y                         ; 4060 91 AE                    ..
	;
	clc                                     ; 4062 18                       .
	lda     L3F0B                           ; 4063 AD 0B 3F                 ..?
	adc     L3F05                           ; 4066 6D 05 3F                 m.?
	sta     L3F0B                           ; 4069 8D 0B 3F                 ..?
;
	inc     L3F09                           ; 406C EE 09 3F                 ..?
	lda     L3F05                           ; 406F AD 05 3F                 ..?
	eor     #$0A                            ; 4072 49 0A                    I.
	lbne	L40A8
;
	clc                                     ; 4079 18                       .
	lda     L3F0A                           ; 407A AD 0A 3F                 ..?
	adc     #$01                            ; 407D 69 01                    i.
	sta     $AE                             ; 407F 85 AE                    ..
	lda     L3F09                           ; 4081 AD 09 3F                 ..?
	eor     $AE                             ; 4084 45 AE                    E.
	lbne	L40A8
	sty     L2CF6                           ; 408B 8C F6 2C                 ..,
	sty     L3F09                           ; 408E 8C 09 3F                 ..?
	lda     L3F0B                           ; 4091 AD 0B 3F                 ..?
	eor     #$0A                            ; 4094 49 0A                    I.
	lbne	L40A3
	lda     #$01                            ; 409B A9 01                    ..
	sta     $A0                             ; 409D 85 A0                    ..
	rts                                     ; 409F 60                       `

; ----------------------------------------------------------------------------
	jmp     L40A8                           ; 40A0 4C A8 40                 L.@

; ----------------------------------------------------------------------------
L40A3:  lda     #$04                            ; 40A3 A9 04                    ..
	sta     $A0                             ; 40A5 85 A0                    ..
	rts                                     ; 40A7 60                       `

; ----------------------------------------------------------------------------
L40A8:  lda     L3F0A                           ; 40A8 AD 0A 3F                 ..?
	cmp     L3F09                           ; 40AB CD 09 3F                 ..?
	bcc     L40B3                           ; 40AE 90 03                    ..
	jmp     L40BD                           ; 40B0 4C BD 40                 L.@

; ----------------------------------------------------------------------------
L40B3:  ldy     #$01                            ; 40B3 A0 01                    ..
	sty     L3F08                           ; 40B5 8C 08 3F                 ..?
	lda     #$00                            ; 40B8 A9 00                    ..
	sta     $A0                             ; 40BA 85 A0                    ..
	rts                                     ; 40BC 60                       `

; ----------------------------------------------------------------------------
L40BD:  jsr     sub_34DF
	ldi	L3F06+1, $00
	mv	L3F06, $A0
	lda     #$00                            ; 40CA A9 00                    ..
	cmp     L3F06                           ; 40CC CD 06 3F                 ..?
	lda     #$00                            ; 40CF A9 00                    ..
	sbc     L3F06+1
	bcc     L40D9                           ; 40D4 90 03                    ..
	jmp     L40E9                           ; 40D6 4C E9 40                 L.@

; ----------------------------------------------------------------------------
L40D9:  lda     #$02                            ; 40D9 A9 02                    ..
	jsr     sub_31A6
	lda     $A0                             ; 40DE A5 A0                    ..
	sta     L3F05                           ; 40E0 8D 05 3F                 ..?
	lda     L3F05                           ; 40E3 AD 05 3F                 ..?
	jsr     sub_390E
L40E9:  lda     L3F06                           ; 40E9 AD 06 3F                 ..?
	ora     L3F06+1
	lbne	L404B
	ldi	$A0, $00
	rts                                     ; 40F8 60                       `

; ----------------------------------------------------------------------------
L40F9:	.byte	$00
L40FA:	.byte	$00
L40FB:	.byte	$00
L40FC:	.byte	$00
L40FD:	.byte	$00
L40FE:	.byte	$00
L40FF:	.byte	$00
L4100:	.byte	$00
L4101:	.byte	$00

sub_4102:  
	stack_prolog L40F9, $04
	ldy     #$00                            ; 410B A0 00                    ..
	sty     L40FF                           ; 410D 8C FF 40                 ..@
	sty     L40FE                           ; 4110 8C FE 40                 ..@
L4113:  lda     L40FE                           ; 4113 AD FE 40                 ..@
	cmp     L40FD                           ; 4116 CD FD 40                 ..@
	lbcs	L41B4
	clc                                     ; 411E 18                       .
	lda     L40FB                           ; 411F AD FB 40                 ..@
	adc     L40FE                           ; 4122 6D FE 40                 m.@
	sta     $AE                             ; 4125 85 AE                    ..
	lda     L40FC                           ; 4127 AD FC 40                 ..@
	adc     #$00                            ; 412A 69 00                    i.
	sta     $AF                             ; 412C 85 AF                    ..
	ldy     #$00                            ; 412E A0 00                    ..
	lda     ($AE),y                         ; 4130 B1 AE                    ..
	sta     L4100                           ; 4132 8D 00 41                 ..A
	lda     L4100                           ; 4135 AD 00 41                 ..A
	and     #$7F                            ; 4138 29 7F                    ).
	sta     L4101                           ; 413A 8D 01 41                 ..A
	lda     L4101                           ; 413D AD 01 41                 ..A
	eor     L4100                           ; 4140 4D 00 41                 M.A
	lbeq	L4196
	inc     L40FE                           ; 4148 EE FE 40                 ..@
	add16m8	off_AE, L40FB, L40FE
	lda     ($AE),y                         ; 415B B1 AE                    ..
	sta     L4100                           ; 415D 8D 00 41                 ..A
	inc     L40FE                           ; 4160 EE FE 40                 ..@
L4163:  lda     #$00                            ; 4163 A9 00                    ..
	cmp     L4101                           ; 4165 CD 01 41                 ..A
	lbcs	L4193
	add16m8	off_AE, L40F9, L40FF
	stp8	L4100
	inc     L40FF                           ; 4184 EE FF 40                 ..@
	sub8i	L4101, L4101, $01
	jmp     L4163                           ; 4190 4C 63 41                 LcA

; ----------------------------------------------------------------------------
L4193:  jmp     L41B1                           ; 4193 4C B1 41                 L.A

; ----------------------------------------------------------------------------
L4196:	add16m8	off_AE, L40F9, L40FF
	lda     L4100                           ; 41A6 AD 00 41                 ..A
	sta     ($AE),y                         ; 41A9 91 AE                    ..
	inc     L40FF                           ; 41AB EE FF 40                 ..@
	inc     L40FE                           ; 41AE EE FE 40                 ..@
L41B1:  jmp     L4113                           ; 41B1 4C 13 41                 L.A

; ----------------------------------------------------------------------------
L41B4:  rts                                     ; 41B4 60                       `

; ----------------------------------------------------------------------------
L41B5:	.byte	$00
L41B6:	.byte	$00
L41B7:	.byte	$00
L41B8:	.byte	$00
L41B9:	.byte	$00
;
L41BA:	.byte	$00
L41BB:	.byte	$00
L41BC:	.byte	$00

; ----------------------------------------------------------------------------
sub_41BD:
	stack_prolog L41B5, $05
	dmv	off_AE, L41B9
	clc                                     ; 41D0 18                       .
	lda     L41B5                           ; 41D1 AD B5 41                 ..A
	adc     #$03                            ; 41D4 69 03                    i.
	ldy     #$00                            ; 41D6 A0 00                    ..
	sta     ($AE),y                         ; 41D8 91 AE                    ..
	add16i	off_AE, L41B9, $0001
	lda     L41B6                           ; 41E9 AD B6 41                 ..A
	sta     ($AE),y                         ; 41EC 91 AE                    ..
	lda     L41B6                           ; 41EE AD B6 41                 ..A
	sta     L2CFB                           ; 41F1 8D FB 2C                 ..,
	add8i	off_AE, L41B5, $03
	add8m	L41BB, off_AE, L41B6
	sty     L41BC                           ; 4205 8C BC 41                 ..A
	sub8i	L421C, L41B5, $01
L4211:
	; while (L421C < L41BC) {
	lda     L421C                           ; 4211 AD 1C 42                 ..B
	cmp     L41BC                           ; 4214 CD BC 41                 ..A
	bcs     L421D                           ; 4217 B0 04                    ..
	jmp     L423E                           ; 4219 4C 3E 42                 L>B

; ----------------------------------------------------------------------------
L421C:	.byte	$00

; ----------------------------------------------------------------------------
L421D:
	; AE = L41B7 + L41BC;
	add16m8	off_AE, L41B7, L41BC
	; L41BB += *AE;
	clc                                     ; 422D 18                       .
	lda     L41BB                           ; 422E AD BB 41                 ..A
	ldy     #$00                            ; 4231 A0 00                    ..
	adc     ($AE),y                         ; 4233 71 AE                    q.
	sta     L41BB                           ; 4235 8D BB 41                 ..A
	; L41BC++;
	inc     L41BC                           ; 4238 EE BC 41                 ..A
	jmp     L4211                           ; 423B 4C 11 42                 L.B
	; }

; ----------------------------------------------------------------------------
L423E:	add16i	$A0, L41B9, $0002
	mv	$A3, L41B8
	ldi	$A5, $00
	mv	$A4, L41B5
	ldy     L41B7                           ; 425B AC B7 41                 ..A
	ldx     $A1                             ; 425E A6 A1                    ..
	lda     $A0                             ; 4260 A5 A0                    ..
	jsr     sub_343B ; memmove
	; $AE = L41B5 + 2;
	clc                                     ; 4265 18                       .
	lda     L41B5                           ; 4266 AD B5 41                 ..A
	adc     #$02                            ; 4269 69 02                    i.
	sta     $AE                             ; 426B 85 AE                    ..
	; $AC = L41B9 + $AE;
	clc                                     ; 426D 18                       .
	lda     L41B9                           ; 426E AD B9 41                 ..A
	adc     $AE                             ; 4271 65 AE                    e.
	sta     $AC                             ; 4273 85 AC                    ..
	lda     L41BA                           ; 4275 AD BA 41                 ..A
	adc     #$00                            ; 4278 69 00                    i.
	sta     $AD                             ; 427A 85 AD                    ..
;	*$AC = 0 - L41BB;
	sec                                     ; 427C 38                       8
	lda     #$00                            ; 427D A9 00                    ..
	sbc     L41BB                           ; 427F ED BB 41                 ..A
	ldy     #$00                            ; 4282 A0 00                    ..
	sta     ($AC),y                         ; 4284 91 AC                    ..
	rts                                     ; 4286 60                       `

; ----------------------------------------------------------------------------
L4287:	.byte	$00
L4288:  .byte   $85
L4289:  .byte   $AF
L428A:	.byte	$00,$00,$00
L428D:	.byte	$00
L428E:	.byte	$00
L428F:	.byte	$00

; ----------------------------------------------------------------------------
sub_4290:
	prolog
	stxa	L4287
	dmv	off_AE, L4287
	ldp8	L4289
	rdmv	L428E, L4287
	sty     L428A                           ; 42B6 8C 8A 42                 ..B
	sub8i	L42CD, L4289, $01
L42C2:  lda     L42CD                           ; 42C2 AD CD 42                 ..B
	cmp     L428A                           ; 42C5 CD 8A 42                 ..B
	bcs     L42CE                           ; 42C8 B0 04                    ..
	jmp     L42F3                           ; 42CA 4C F3 42                 L.B

; ----------------------------------------------------------------------------
L42CD:	.byte	$00

; ----------------------------------------------------------------------------
L42CE:	add16m8	off_AE, L428E, L428A
	ldp8	L428D
	ldx     L428D                           ; 42E5 AE 8D 42                 ..B
	lda     #$02                            ; 42E8 A9 02                    ..
	jsr     sub_31CA
	inc     L428A                           ; 42ED EE 8A 42                 ..B
	jmp     L42C2                           ; 42F0 4C C2 42                 L.B

; ----------------------------------------------------------------------------
L42F3:  ldx     #$0A                            ; 42F3 A2 0A                    ..
	lda     #$02                            ; 42F5 A9 02                    ..
	jsr     sub_31CA
	rts                                     ; 42FA 60                       `

; ----------------------------------------------------------------------------
L42FB:	.byte	$00
L42FC:	.byte	$00

; ----------------------------------------------------------------------------
sub_42FD:	
	prolog
	stxa	L42FB
	ldx     L42FC                           ; 4306 AE FC 42                 ..B
	lda     L42FB                           ; 4309 AD FB 42                 ..B
	jsr     sub_4290
	yldi	CDTMF3, $01
	dey                                     ; 4314 88                       .
	sty     CDTMV3+1
	ldi	CDTMV3, $FA
	rts                                     ; 431D 60                       `

; ----------------------------------------------------------------------------
L431E:	.byte	$06,$00
L4320:  .addr	L431E
L4322:	.byte	$EE,$2C,$04,$00
L4326:	.byte	$00

; ----------------------------------------------------------------------------
sub_4327:  
	prolog
	mv	L4326, L2CFB
	mv	$A3, L4320+1
	rdldi	$A4, L4322
	ldy     L4320                           ; 433D AC 20 43                 . C
	ldx     L2D5A                           ; 4340 AE 5A 2D                 .Z-
	lda     #$01                            ; 4343 A9 01                    ..
	jsr     sub_41BD
	mv	L2CFB, L4326
	ldxai	L4322
	jsr     sub_4290
	rts                                     ; 4355 60                       `

; ----------------------------------------------------------------------------
L4356:	.byte	$15,$00
L4358:  .addr	L4356
L435A:	.byte	$EE,$2C,$04,$00
L435E:	.byte	$00

; ----------------------------------------------------------------------------
sub_435F:
	prolog
	mv	L435E, L2CFB
	mv	$A3, L4358+1
	ldi	$A5, >L435A
	ldi	$A4, <L435A
	ldy     L4358                           ; 4375 AC 58 43                 .XC
	ldx     L2D5A                           ; 4378 AE 5A 2D                 .Z-
	lda     #$01                            ; 437B A9 01                    ..
	jsr     sub_41BD
	mv	L2CFB, L435E
	ldxai	L435A
	jsr     sub_4290
	rts                                     ; 438D 60                       `

; ----------------------------------------------------------------------------
L438E:	.byte	$00
L438F:	.byte	$00
L4390:	.byte	$00

sub_4391:
	prolog
	yldi	L438F, $00
	jsr     sub_3F0F
	mv	L438E, $A0
	mv	L4390, L2D5B
	ifm8eqi	L438E, $04, L43BB
	ldxai	L2CFC
	jsr     sub_42FD
	jmp     L4453                           ; 43B8 4C 53 44                 LSD

; ----------------------------------------------------------------------------
L43BB:	ifm8eqi	L438E, $01, L4444
	ifm8eqi	L4390, $06, L4419
	ifm8eqm L2D5A, L2CFD, L4416
	sub8m	L2CF7, L2CF7, L2CFC
;
	clc                                     ; 43E4 18                       .
	lda     #<L2CFC
	adc     L2CFC                           ; 43E7 6D FC 2C                 m.,
	sta     $A2                             ; 43EA 85 A2                    ..
	lda     #>L2CFC
	adc     #$00                            ; 43EE 69 00                    i.
	sta     $A3                             ; 43F0 85 A3                    ..
;
	sec                                     ; 43F2 38                       8
	lda     #$5A                            ; 43F3 A9 5A                    .Z
	sbc     L2CFC                           ; 43F5 ED FC 2C                 ..,
	sta     $A4                             ; 43F8 85 A4                    ..
;
	ldi	$A5, $00
	ldy     $A2                             ; 43FE A4 A2                    ..
	ldxai	L2CFC
	jsr     sub_343B
	lda     L2CF7                           ; 4407 AD F7 2C                 ..,
	lbeq	L4416
L440F:	ldxai	L2CFC
	jsr     sub_42FD
L4416:  jmp     L4441                           ; 4416 4C 41 44                 LAD

; ----------------------------------------------------------------------------
L4419:	ifm8eqi L4390, $15, L442D
	ldxai	L2CFC
	jsr     sub_42FD
	jmp     L4441                           ; 442A 4C 41 44                 LAD

; ----------------------------------------------------------------------------
L442D:	yldi	L438F, $01
	lda     CDTMF3
	lbne	L4441
	ldxai	L2CFC
	jsr     sub_42FD
L4441:  jmp     L4453                           ; 4441 4C 53 44                 LSD

; ----------------------------------------------------------------------------
L4444:  lda     CDTMF3
	lbne	L4453
	ldxai	L2CFC
	jsr     sub_42FD
L4453:	mv	$A0, L438F
	rts                                     ; 4458 60                       `

; ----------------------------------------------------------------------------
L4459:  .byte   $FF                             ; 4459 FF                       .
L445A:  .byte   $FF                             ; 445A FF                       .

; ----------------------------------------------------------------------------
sub_445B:
	prolog
	lda     L2CF8                           ; 445E AD F8 2C                 ..,
	lbne	L446B
	ldi	$A0, $00
	rts                                     ; 446A 60                       `

; ----------------------------------------------------------------------------
L446B:  jsr     sub_4327
	lda     L2D5A                           ; 446E AD 5A 2D                 .Z-
	eor     L4459                           ; 4471 4D 59 44                 MYD
	bne     :+
	ora     #$00                            ; 4476 09 00                    ..
	eor     L445A                           ; 4478 4D 5A 44                 MZD
:	lbeq	L44D6
	ldi	L445A, $00
	lda     L2D5A                           ; 4485 AD 5A 2D                 .Z-
	sta     L4459                           ; 4488 8D 59 44                 .YD
	lda     L2D58                           ; 448B AD 58 2D                 .X-
	and     #$80                            ; 448E 29 80                    ).
	sta     $AE                             ; 4490 85 AE                    ..
	lda     $AE                             ; 4492 A5 AE                    ..
	lbeq	L44B7
	lda     #$2D                            ; 4499 A9 2D                    .-
	sta     $A3                             ; 449B 85 A3                    ..
	lda     L2D58                           ; 449D AD 58 2D                 .X-
	and     #$7F                            ; 44A0 29 7F                    ).
	sta     $AE                             ; 44A2 85 AE                    ..
	sec                                     ; 44A4 38                       8
	lda     $AE                             ; 44A5 A5 AE                    ..
	sbc     #$04                            ; 44A7 E9 04                    ..
	sta     $A4                             ; 44A9 85 A4                    ..
	ldy     #$5B                            ; 44AB A0 5B                    .[
	ldx     #$2D                            ; 44AD A2 2D                    .-
	lda     #$B5                            ; 44AF A9 B5                    ..
	jsr     sub_4102
	jmp     L44CC                           ; 44B4 4C CC 44                 L.D

; ----------------------------------------------------------------------------
L44B7:	ldi	$A3, >L2D5B
	ldi	$A5, >$005A
	ldi	$A4, <$005A
	ldy     #<L2D5B
	ldx     #>L2DB5
	lda     #<L2DB5
	jsr     sub_343B
L44CC:	yldi	L2CF8, $00
	ldi	$A0, $01
	rts                                     ; 44D5 60                       `

; ----------------------------------------------------------------------------
L44D6:	ldi	$A0, $00
	rts                                     ; 44DA 60                       `

; ----------------------------------------------------------------------------
L44DB:	.byte	$00
L44DC:	.byte	$00,$00

; ----------------------------------------------------------------------------
sub_44DE:
	prolog
	lda     L2CF7                           ; 44E1 AD F7 2C                 ..,
	lbeq	L450E
	jsr     sub_4391
	lda     $A0                             ; 44EC A5 A0                    ..
	sta     L44DB                           ; 44EE 8D DB 44                 ..D
	ifm8eqi	L44DB, $01, L4509
	jsr     sub_445B
	mv	L44DB, $A0
	mv	$A0, L44DB
	rts                                     ; 4508 60                       `

; ----------------------------------------------------------------------------
L4509:	ldi	$A0, $00
	rts                                     ; 450D 60                       `

; ----------------------------------------------------------------------------
L450E:  jsr     sub_3F0F
	mv	L44DB, $A0
	ifm8eqi L44DB, $04, L4526
	jsr     sub_435F
	jmp	L4558

; ----------------------------------------------------------------------------
L4526:  lda     L44DB                           ; 4526 AD DB 44                 ..D
	eor     #$01                            ; 4529 49 01                    I.
	lbne	L4558
	lda     L2D5B                           ; 4530 AD 5B 2D                 .[-
	sta     L44DC                           ; 4533 8D DC 44                 ..D
	lda     L44DC                           ; 4536 AD DC 44                 ..D
	eor     #$06                            ; 4539 49 06                    I.
	lbeq	L4558
	lda     L44DC                           ; 4540 AD DC 44                 ..D
	eor     #$15                            ; 4543 49 15                    I.
	lbeq	L4558
	jsr     sub_445B
	lda     $A0                             ; 454D A5 A0                    ..
	sta     L44DB                           ; 454F 8D DB 44                 ..D
	lda	L44DB
	sta     $A0                             ; 4555 85 A0                    ..
	rts                                     ; 4557 60                       `

; ----------------------------------------------------------------------------
L4558:  lda     #$00                            ; 4558 A9 00                    ..
	sta     $A0                             ; 455A 85 A0                    ..
	rts                                     ; 455C 60                       `

; ----------------------------------------------------------------------------
L455D:	.byte	$00,$00
L455F:	.res	12,$00
L456B:	.byte	$00,$00
L456D:	.byte	$00,$00
L456F:	.byte	$00
L4570:	.byte	$00
L4571:	.byte	$00
L4572:	.byte	$00
L4573:	.byte	$00
L4574:	.byte	$00,$EE,$2C
L4577:  .byte   $02
L4578:	.byte	$00
L4579:	.byte	$EE,$2C,$5A
	.res	87,$00

; ----------------------------------------------------------------------------
PutPkt:
	stack_prolog L455D, $0D
	rdldi	L456B, L455F
	yldi	L4573, $00
	iny                                     ; 45EB C8                       .
	sty     L456F                           ; 45EC 8C 6F 45                 .oE
	dmv	off_AE, L455D
	dey                                     ; 45F9 88                       .
	lda     ($AE),y                         ; 45FA B1 AE                    ..
	sta     L460A                           ; 45FC 8D 0A 46                 ..F
L45FF:  lda     L460A                           ; 45FF AD 0A 46                 ..F
	cmp     L456F                           ; 4602 CD 6F 45                 .oE
	bcs     L460B                           ; 4605 B0 04                    ..
	jmp     L4779                           ; 4607 4C 79 47                 LyG

; ----------------------------------------------------------------------------
L460A:	.byte	$00

; ----------------------------------------------------------------------------
L460B:	; L4570 = L455D[L456F];
	add16m8 off_AE, L455D, L456F
	; switch L4570:
	ldp8	L4570
	; case 'C';
	lda     L4570                           ; 4622 AD 70 45                 .pE
	eor     #'C'
	lbne	L4644
	; L4579[L4573] = *L456B; 
	dmv	off_AE, L456B
	lda     ($AE),y                         ; 4636 B1 AE                    ..
	ldx     L4573                           ; 4638 AE 73 45                 .sE
	sta     L4579,x                         ; 463B 9D 79 45                 .yE
	; L4573++;
	inc     L4573                           ; 463E EE 73 45                 .sE
	; break;
	jmp     L4762                           ; 4641 4C 62 47                 LbG

; ----------------------------------------------------------------------------
L4644:	; case 'S','s',:
	lda     L4570                           ; 4644 AD 70 45                 .pE
	eor     #'S'
L4649:  beq     L4655                           ; 4649 F0 0A                    ..
	lda     L4570                           ; 464B AD 70 45                 .pE
	eor     #'s'
	lbne	L472A
L4655:	; L4571 = *L456B;
	dmv	off_AE, L456B
	ldp8	L4571
	; 
	dmv	off_AE, L456B
	lda     ($AE),y                         ; 4670 B1 AE                    ..
	sta     $A0                             ; 4672 85 A0                    ..
	clc                                     ; 4674 18                       .
	lda     #<L4579
	adc     L4573                           ; 4677 6D 73 45                 msE
	sta     $A1                             ; 467A 85 A1                    ..
	lda     #>L4579
	adc     #$00                            ; 467E 69 00                    i.
	sta     $A2                             ; 4680 85 A2                    ..
	ldy     $A2                             ; 4682 A4 A2                    ..
	ldx     $A1                             ; 4684 A6 A1                    ..
	lda     $A0                             ; 4686 A5 A0                    ..
	jsr     sub_369F
	add8i	L4573, L4573, $02
	add16i	L456B, L456B, $0002
	lda     L4571                           ; 46A5 AD 71 45                 .qE
	lbne	L46B0
	jmp     L4779                           ; 46AD 4C 79 47                 LyG

; ----------------------------------------------------------------------------
L46B0:	dmv	off_AE, L456B
	ldp16	L4577
	lda     #$00                            ; 46C7 A9 00                    ..
	cmp     L4571                           ; 46C9 CD 71 45                 .qE
	lbcs	L4727
	sty     L4572                           ; 46D1 8C 72 45                 .rE
	sub8i	L46E8, L4571, $01
L46DD:  lda     L46E8                           ; 46DD AD E8 46                 ..F
	cmp     L4572                           ; 46E0 CD 72 45                 .rE
	bcs     L46E9                           ; 46E3 B0 04                    ..
	jmp     L4727                           ; 46E5 4C 27 47                 L'G

; ----------------------------------------------------------------------------
L46E8:	.byte	$00

; ----------------------------------------------------------------------------
L46E9:	add16m8	off_AE, L4577, L4572
	ldp8	L4574
	lda     L4570                           ; 4700 AD 70 45                 .pE
	eor     #'S'
	lbne	L4715
	lda     L4574                           ; 470A AD 74 45                 .tE
	jsr     sub_372F
	lda     $A0                             ; 4710 A5 A0                    ..
	sta     L4574                           ; 4712 8D 74 45                 .tE
L4715:  lda     L4574                           ; 4715 AD 74 45                 .tE
	ldx     L4573                           ; 4718 AE 73 45                 .sE
	sta     L4579,x                         ; 471B 9D 79 45                 .yE
	inc	L4573
	inc	L4572
	jmp	L46DD

; ----------------------------------------------------------------------------
L4727:  jmp     L4762                           ; 4727 4C 62 47                 LbG

; ----------------------------------------------------------------------------
L472A:  jmp     L4754                           ; 472A 4C 54 47                 LTG

; ----------------------------------------------------------------------------
L472D:	.byte	$26,"*** PutPkt: Unknown format type : %C%E"

; ----------------------------------------------------------------------------
L4754:  lda     #$00                            ; 4754 A9 00                    ..
	sta     $A3                             ; 4756 85 A3                    ..
	ldy     L4570                           ; 4758 AC 70 45                 .pE
	ldxai	L472D
	jsr     sub_3355
L4762:	add16i	L456B, L456B, $0002
	inc     L456F                           ; 4773 EE 6F 45                 .oE
	jmp     L45FF                           ; 4776 4C FF 45                 L.E

; ----------------------------------------------------------------------------
L4779:	add8i	L4571, L4573, $03
L4782:  sec                                     ; 4782 38                       8
	lda     #$5A                            ; 4783 A9 5A                    .Z
	sbc     L2CF7                           ; 4785 ED F7 2C                 ..,
	sta     $AE                             ; 4788 85 AE                    ..
	lda     $AE                             ; 478A A5 AE                    ..
	cmp     L4571                           ; 478C CD 71 45                 .qE
	lbcs	L479A
	jsr     sub_4391
	jmp     L4782                           ; 4797 4C 82 47                 L.G

; ----------------------------------------------------------------------------
L479A:  clc                                     ; 479A 18                       .
	lda     L2CFB                           ; 479B AD FB 2C                 ..,
	adc     #$01                            ; 479E 69 01                    i.
	sta     $A1                             ; 47A0 85 A1                    ..
L47A2:  lda     #$45                            ; 47A2 A9 45                    .E
	sta     $A3                             ; 47A4 85 A3                    ..
	clc                                     ; 47A6 18                       .
	lda     #$FC                            ; 47A7 A9 FC                    ..
	adc     L2CF7                           ; 47A9 6D F7 2C                 m.,
	sta     $A4                             ; 47AC 85 A4                    ..
	lda     #$2C                            ; 47AE A9 2C                    .,
	adc     #$00                            ; 47B0 69 00                    i.
L47B2:  sta     $A5                             ; 47B2 85 A5                    ..
	ldy     #$79                            ; 47B4 A0 79                    .y
	ldx     $A1                             ; 47B6 A6 A1                    ..
	lda     L4573                           ; 47B8 AD 73 45                 .sE
	jsr     sub_41BD
	clc                                     ; 47BE 18                       .
	lda     L2CF7                           ; 47BF AD F7 2C                 ..,
	adc     L4571                           ; 47C2 6D 71 45                 mqE
	sta     L2CF7                           ; 47C5 8D F7 2C                 ..,
	lda     L2CF7                           ; 47C8 AD F7 2C                 ..,
	eor     L4571                           ; 47CB 4D 71 45                 MqE
	lbne	L47DA
	ldxai	L2CFC
	jsr     sub_42FD
L47DA:  rts                                     ; 47DA 60                       `

; ----------------------------------------------------------------------------
sub_47DB:  
	prolog
L47DE:	lda     L2CF7                           ; 47DE AD F7 2C                 ..,
	lbeq	L47EC
	jsr     sub_4391
	jmp     L47DE                           ; 47E9 4C DE 47                 L.G

; ----------------------------------------------------------------------------
L47EC:  ldx     #$00                            ; 47EC A2 00                    ..
	lda     #$03                            ; 47EE A9 03                    ..
	jsr     sub_3756
L47F3:  jsr     sub_34DF
	lda     $A0                             ; 47F6 A5 A0                    ..
	lbeq	L480C
	lda     #$02                            ; 47FD A9 02                    ..
	jsr     sub_31A6
	ldx     #$00                            ; 4802 A2 00                    ..
	lda     #$02                            ; 4804 A9 02                    ..
	jsr     sub_3756
	jmp     L47F3                           ; 4809 4C F3 47                 L.G

; ----------------------------------------------------------------------------
L480C:  lda     $B148                           ; 480C AD 48 B1                 .H.
	eor     #$01                            ; 480F 49 01                    I.
	lbne	L4832
	ldi	$A3, $00
	ldi	$A4, $00
	ldi	$A6, $34
	ldi	$A5, $79
	ldy     #$5A                            ; 4826 A0 5A                    .Z
	ldx     #$00                            ; 4828 A2 00                    ..
	lda     #$02                            ; 482A A9 02                    ..
	jsr     sub_31D7
	jmp     L4837                           ; 482F 4C 37 48                 L7H

; ----------------------------------------------------------------------------
L4832:  lda     #$02                            ; 4832 A9 02                    ..
	jsr     sub_315E
L4837:  rts                                     ; 4837 60                       `

; ----------------------------------------------------------------------------
L4838:	.byte	$00,$00

; ----------------------------------------------------------------------------
sub_483A:  
	prolog
	; if ( B148 == 1 ) {
	lda     $B148                           ; 483D AD 48 B1                 .H.
	eor     #$01                            ; 4840 49 01                    I.
	lbne	L48A8
	; AE = 2 << 4;
	lda     #$02                            ; 4847 A9 02                    ..
	asl     a                               ; 4849 0A                       .
	asl     a                               ; 484A 0A                       .
	asl     a                               ; 484B 0A                       .
	asl     a                               ; 484C 0A                       .
	sta     $AE                             ; 484D 85 AE                    ..
	;
	clc                                     ; 484F 18                       .
	lda     #$4A                            ; 4850 A9 4A                    .J
	adc     $AE                             ; 4852 65 AE                    e.
	sta     L4838                           ; 4854 8D 38 48                 .8H
	lda     #$03                            ; 4857 A9 03                    ..
	adc     #$00                            ; 4859 69 00                    i.
	sta     L4838+1
	dmv	$AE, L4838
	lda     #$00                            ; 4868 A9 00                    ..
	ldy     #$01                            ; 486A A0 01                    ..
	sta     ($AE),y                         ; 486C 91 AE                    ..
	lda     #$00                            ; 486E A9 00                    ..
	dey                                     ; 4870 88                       .
	sta     ($AE),y                         ; 4871 91 AE                    ..
	dldi	$A3, $0000
	rdldi	$A5, L3479
	ldy     #$28                            ; 4883 A0 28                    .(
	ldx     #$00                            ; 4885 A2 00                    ..
	lda     #$02                            ; 4887 A9 02                    ..
	jsr     sub_31D7
	ldi	$A3, $00
	ldi	$A4, $00
	ldi	$A6, >L3479
	ldi	$A5, <L3479
	ldy     #$59                            ; 489C A0 59                    .Y
	ldx     #$00                            ; 489E A2 00                    ..
	lda     #$02                            ; 48A0 A9 02                    ..
	jsr     sub_31D7
	jmp     L494B                           ; 48A5 4C 4B 49                 LKI

; ----------------------------------------------------------------------------
L48A8:  lda     #$02                            ; 48A8 A9 02                    ..
	jsr     sub_315E
	lda     #$0D                            ; 48AD A9 0D                    ..
	sta     $A3                             ; 48AF 85 A3                    ..
	ldy     #>L3479
	ldx     #<L3479
	lda     #$02                            ; 48B5 A9 02                    ..
	jsr     sub_3127
	lda     #$30                            ; 48BA A9 30                    .0
	sta     $A3                             ; 48BC 85 A3                    ..
	lda     #$00                            ; 48BE A9 00                    ..
	sta     $A4                             ; 48C0 85 A4                    ..
	lda     #>L3479
	sta     $A6                             ; 48C4 85 A6                    ..
	lda     #<L3479
	sta     $A5                             ; 48C8 85 A5                    ..
	ldy     #$22                            ; 48CA A0 22                    ."
	ldx     #$00                            ; 48CC A2 00                    ..
	lda     #$02                            ; 48CE A9 02                    ..
	jsr     sub_31D7
	lda     $B149                           ; 48D3 AD 49 B1                 .I.
	sta     $A3                             ; 48D6 85 A3                    ..
	lda     #$00                            ; 48D8 A9 00                    ..
	sta     $A4                             ; 48DA 85 A4                    ..
	lda     #>L3479
	sta     $A6                             ; 48DE 85 A6                    ..
	lda     #<L3479
	sta     $A5                             ; 48E2 85 A5                    ..
	ldy     #$24                            ; 48E4 A0 24                    .$
	ldx     #$00                            ; 48E6 A2 00                    ..
	lda     #$02                            ; 48E8 A9 02                    ..
	jsr     sub_31D7
	lda     #$20                            ; 48ED A9 20                    . 
	sta     $A3                             ; 48EF 85 A3                    ..
	lda     #$00                            ; 48F1 A9 00                    ..
	sta     $A4                             ; 48F3 85 A4                    ..
	lda     #>L3479
	sta     $A6                             ; 48F7 85 A6                    ..
	lda     #<L3479
	sta     $A5                             ; 48FB 85 A5                    ..
	ldy     #$26                            ; 48FD A0 26                    .&
	ldx     #$00                            ; 48FF A2 00                    ..
	lda     #$02                            ; 4901 A9 02                    ..
	jsr     sub_31D7
	lda     #$02                            ; 4906 A9 02                    ..
	asl     a                               ; 4908 0A                       .
	asl     a                               ; 4909 0A                       .
	asl     a                               ; 490A 0A                       .
	asl     a                               ; 490B 0A                       .
	sta     $AE                             ; 490C 85 AE                    ..
	clc                                     ; 490E 18                       .
	lda     #$4A                            ; 490F A9 4A                    .J
	adc     $AE                             ; 4911 65 AE                    e.
	sta     L4838                           ; 4913 8D 38 48                 .8H
	lda     #$03                            ; 4916 A9 03                    ..
	adc     #$00                            ; 4918 69 00                    i.
	sta     L4838+1
	lda     L4838                           ; 491D AD 38 48                 .8H
L4920:  sta     $AE                             ; 4920 85 AE                    ..
	lda     L4838+1
	sta     $AF                             ; 4925 85 AF                    ..
	lda     #$00                            ; 4927 A9 00                    ..
	ldy     #$01                            ; 4929 A0 01                    ..
	sta     ($AE),y                         ; 492B 91 AE                    ..
	lda     #$00                            ; 492D A9 00                    ..
	dey                                     ; 492F 88                       .
	sta     ($AE),y                         ; 4930 91 AE                    ..
	lda     #$00                            ; 4932 A9 00                    ..
	sta     $A3                             ; 4934 85 A3                    ..
	lda     #$00                            ; 4936 A9 00                    ..
	sta     $A4                             ; 4938 85 A4                    ..
	rdldi	$A5, L3479
	ldy     #$28                            ; 4942 A0 28                    .(
	ldx     #$00                            ; 4944 A2 00                    ..
L4946:  lda     #$02                            ; 4946 A9 02                    ..
	jsr     sub_31D7
L494B:  jmp     L4950                           ; 494B 4C 50 49                 LPI

; ----------------------------------------------------------------------------
L494E:	.byte	$01,"C"

; ----------------------------------------------------------------------------
L4950:	ldi	$A3, $00
	ldy     #$13
	ldxai	L494E
	jsr     PutPkt
	rts

; ----------------------------------------------------------------------------
L495E:  .byte	$00
L495F:  .byte	$00
L4960:  .byte	$00

; ----------------------------------------------------------------------------
sub_4961:  
	prolog
	lda     #$01                            ; 4964 A9 01                    ..
	jsr     sub_38D6
	jmp     L496E                           ; 4969 4C 6E 49                 LnI

; ----------------------------------------------------------------------------
L496C:	.byte	$01,"}"

; ----------------------------------------------------------------------------
L496E:	ldxai	L496C
	jsr     sub_3164
	jmp     L49A0                           ; 4975 4C A0 49                 L.I

; ----------------------------------------------------------------------------
L4978:	.byte   $27," "
	Inverse	"            Terminal mode:            "

; ----------------------------------------------------------------------------
L49A0:	ldxai	L4978
	jsr     sub_3151
	jmp     L49D2                           ; 49A7 4C D2 49                 L.I

; ----------------------------------------------------------------------------
L49AA:	.byte   $27," "
	Inverse "    Press OPTION to return to Menu    "

; ----------------------------------------------------------------------------
L49D2:	ldxai	L49AA
	jsr     sub_3151
	jmp     L4A04                           ; 49D9 4C 04 4A                 L.J

; ----------------------------------------------------------------------------
L49DC:	.byte   $27," "
	Inverse	"   Press START when connected to GCP  "

; ----------------------------------------------------------------------------
L4A04:	ldxai	L49DC
	jsr     sub_3151
	jsr     sub_31C5
	ldy     #$01                            ; 4A0E A0 01                    ..
	sty     L495E                           ; 4A10 8C 5E 49                 .^I
L4A13:  jsr     sub_37AD
	lda     $A0                             ; 4A16 A5 A0                    ..
	lbeq	L4A1E
L4A1D:  rts                                     ; 4A1D 60                       `

; ----------------------------------------------------------------------------
L4A1E:  lda     $B148                           ; 4A1E AD 48 B1                 .H.
	eor     #$01                            ; 4A21 49 01                    I.
	lbne	L4A38
	jsr     sub_3EBD
	lda     $A0                             ; 4A2B A5 A0                    ..
	lbne	L4A38
	ldy     #$01                            ; 4A32 A0 01                    ..
	sty     L2CF2                           ; 4A34 8C F2 2C                 ..,
	rts                                     ; 4A37 60                       `

; ----------------------------------------------------------------------------
L4A38:  lda     $02FC                           ; 4A38 AD FC 02                 ...
	eor     #$FF                            ; 4A3B 49 FF                    I.
	lbeq	L4A54
	lda     #$07                            ; 4A42 A9 07                    ..
	jsr     sub_31A6
	lda     $A0                             ; 4A47 A5 A0                    ..
	sta     L495F                           ; 4A49 8D 5F 49                 ._I
	ldx     L495F                           ; 4A4C AE 5F 49                 ._I
	lda     #$02                            ; 4A4F A9 02                    ..
	jsr     sub_31CA
L4A54:  jsr     sub_34DF
	lda     $A0                             ; 4A57 A5 A0                    ..
	lbeq	L4A90
	lda     #$02                            ; 4A5E A9 02                    ..
	jsr     sub_31A6
	lda     $A0                             ; 4A63 A5 A0                    ..
	sta     L4960                           ; 4A65 8D 60 49                 .`I
	lda     L4960                           ; 4A68 AD 60 49                 .`I
	eor     #$9B                            ; 4A6B 49 9B                    I.
	lbne	L4A78
	jsr     sub_31C5
	jmp     L4A90                           ; 4A75 4C 90 4A                 L.J

; ----------------------------------------------------------------------------
L4A78:  lda     L4960                           ; 4A78 AD 60 49                 .`I
	and     #$7F                            ; 4A7B 29 7F                    ).
	sta     L4960                           ; 4A7D 8D 60 49                 .`I
	lda     L4960                           ; 4A80 AD 60 49                 .`I
	eor     #$0A                            ; 4A83 49 0A                    I.
	bne     L4A8A                           ; 4A85 D0 03                    ..
	jmp     L4A90                           ; 4A87 4C 90 4A                 L.J

; ----------------------------------------------------------------------------
L4A8A:	lda	L4960
	jsr	sub_31C7
L4A90:  lda     $D01F                           ; 4A90 AD 1F D0                 ...
	and     #$01                            ; 4A93 29 01                    ).
	sta     L495E                           ; 4A95 8D 5E 49                 .^I
	lda     L495E                           ; 4A98 AD 5E 49                 .^I
	lbne	L4A13
	rts                                     ; 4AA0 60                       `

; ----------------------------------------------------------------------------
L4AA1:  jmp     L4AA4                           ; 4AA1 4C A4 4A                 L.J

; ----------------------------------------------------------------------------
L4AA4:  lda     #$7D                            ; 4AA4 A9 7D                    .}
	jsr     sub_31C7
	jmp     L4AC5                           ; 4AA9 4C C5 4A                 L.J

; ----------------------------------------------------------------------------
L4AAC:	.byte	$18," "
	Inverse	" Press OPTION for menu "

; ----------------------------------------------------------------------------
L4AC5:  lda     #$4A                            ; 4AC5 A9 4A                    .J
	sta     $A3                             ; 4AC7 85 A3                    ..
	ldy     #$AC                            ; 4AC9 A0 AC                    ..
	ldx     #$00                            ; 4ACB A2 00                    ..
	lda     #$07                            ; 4ACD A9 07                    ..
	jsr     sub_3BEB
	jmp     L4AEC                           ; 4AD2 4C EC 4A                 L.J

; ----------------------------------------------------------------------------
L4AD5:	.byte	$16," "
	Inverse	" Waiting For Carrier "

; ----------------------------------------------------------------------------
L4AEC:  lda     #>L4AD5
	sta     $A3                             ; 4AEE 85 A3                    ..
	ldy     #<L4AD5
	ldx     #$0A                            ; 4AF2 A2 0A                    ..
	lda     #$08                            ; 4AF4 A9 08                    ..
	jsr     sub_3BEB
	rts                                     ; 4AF9 60                       `

; ----------------------------------------------------------------------------
L4AFA:	prolog
	yldi	$D302, $00
	ldi	$D300, $50
	ldi	$D302, $3C
	ldi	$D300, $4F
	rts                                     ; 4B11 60                       `

; ----------------------------------------------------------------------------
sub_4B12:  
	prolog
	lda     $D300                           ; 4B15 AD 00 D3                 ...
	and     #$BF                            ; 4B18 29 BF                    ).
	sta     $D300                           ; 4B1A 8D 00 D3                 ...
	rts                                     ; 4B1D 60                       `

; ----------------------------------------------------------------------------
L4B1E:	.byte	$00
L4B1F:	.byte	$00
L4B20:  .byte   $3C                             ; 4B20 3C                       <
L4B21:  .byte   $3C                             ; 4B21 3C                       <
L4B22:  .byte   $02                             ; 4B22 02                       .
L4B23:  .byte   $04                             ; 4B23 04                       .
L4B24:  .byte   $3C                             ; 4B24 3C                       <
L4B25:	.byte	$00
L4B26:	.byte	$00
L4B27:	.byte	$00

; ----------------------------------------------------------------------------
L4B28:  prolog
	stx     L4B1E+1
	sta     L4B1E                           ; 4B2E 8D 1E 4B                 ..K
	jsr     sub_3E7A
	jsr     sub_4B12
	ldx     #$00                            ; 4B37 A2 00                    ..
	lda     L4B20                           ; 4B39 AD 20 4B                 . K
	jsr     sub_3756
	ldy     #$01                            ; 4B3F A0 01                    ..
	sty     L4B26                           ; 4B41 8C 26 4B                 .&K
	dmv	$AE, L4B1E
	dey                                     ; 4B4E 88                       .
	lda     ($AE),y                         ; 4B4F B1 AE                    ..
	sta     L4B5F                           ; 4B51 8D 5F 4B                 ._K
L4B54:  lda     L4B5F                           ; 4B54 AD 5F 4B                 ._K
	cmp     L4B26                           ; 4B57 CD 26 4B                 .&K
	bcs     L4B60                           ; 4B5A B0 04                    ..
	jmp     L4C0B                           ; 4B5C 4C 0B 4C                 L.L

; ----------------------------------------------------------------------------
L4B5F:	.byte	$00

; ----------------------------------------------------------------------------
L4B60:	add16m8	off_AE, L4B1E, L4B26
	ldp8	L4B25
	lda     L4B25                           ; 4B77 AD 25 4B                 .%K
	jsr     sub_31C7
	lda     L4B25                           ; 4B7D AD 25 4B                 .%K
	cmp     #$30                            ; 4B80 C9 30                    .0
	lbcc	L4BE5
	lda     #$39                            ; 4B87 A9 39                    .9
	cmp     L4B25                           ; 4B89 CD 25 4B                 .%K
	lbcc	L4BE5
	sec                                     ; 4B91 38                       8
	lda     L4B25                           ; 4B92 AD 25 4B                 .%K
	sbc     #$30                            ; 4B95 E9 30                    .0
	sta     L4B25                           ; 4B97 8D 25 4B                 .%K
	lda     L4B25                           ; 4B9A AD 25 4B                 .%K
	lbne	L4BA7
	lda     #$0A                            ; 4BA2 A9 0A                    ..
	sta     L4B25                           ; 4BA4 8D 25 4B                 .%K
L4BA7:  ldy     #$01                            ; 4BA7 A0 01                    ..
	sty     L4B27                           ; 4BA9 8C 27 4B                 .'K
	lda     L4B25                           ; 4BAC AD 25 4B                 .%K
	sta     L4BBD                           ; 4BAF 8D BD 4B                 ..K
L4BB2:  lda     L4BBD                           ; 4BB2 AD BD 4B                 ..K
	cmp     L4B27                           ; 4BB5 CD 27 4B                 .'K
	bcs     L4BBE                           ; 4BB8 B0 04                    ..
	jmp     L4BDA                           ; 4BBA 4C DA 4B                 L.K

; ----------------------------------------------------------------------------
L4BBD:	.byte	$00

; ----------------------------------------------------------------------------
L4BBE:  jsr     sub_3E7A
	ldx     #$00                            ; 4BC1 A2 00                    ..
	lda     L4B23                           ; 4BC3 AD 23 4B                 .#K
	jsr     sub_3756
	jsr     sub_4B12
	ldx     #$00                            ; 4BCC A2 00                    ..
	lda     L4B22                           ; 4BCE AD 22 4B                 ."K
	jsr     sub_3756
	inc     L4B27                           ; 4BD4 EE 27 4B                 .'K
	jmp     L4BB2                           ; 4BD7 4C B2 4B                 L.K

; ----------------------------------------------------------------------------
L4BDA:  ldx     #$00                            ; 4BDA A2 00                    ..
	lda     L4B21                           ; 4BDC AD 21 4B                 .!K
	jsr     sub_3756
	jmp     L4BF6                           ; 4BE2 4C F6 4B                 L.K

; ----------------------------------------------------------------------------
L4BE5:  lda     L4B25                           ; 4BE5 AD 25 4B                 .%K
	eor     #$2C                            ; 4BE8 49 2C                    I,
	lbne	L4BF6
	ldx     #$00                            ; 4BEF A2 00                    ..
	lda     #$0A                            ; 4BF1 A9 0A                    ..
	jsr     sub_3756
L4BF6:  jsr     sub_37AD
	lda     $A0                             ; 4BF9 A5 A0                    ..
	lbeq	L4C05
	ldi	$A0, $00
	rts                                     ; 4C04 60                       `

; ----------------------------------------------------------------------------
L4C05:  inc     L4B26                           ; 4C05 EE 26 4B                 .&K
	jmp     L4B54                           ; 4C08 4C 54 4B                 LTK

; ----------------------------------------------------------------------------
L4C0B:  jsr     L4AA1                           ; 4C0B 20 A1 4A                  .J
	ldy     #$00                            ; 4C0E A0 00                    ..
	sty     $14                             ; 4C10 84 14                    ..
	sty     $13                             ; 4C12 84 13                    ..
L4C14:  jsr     sub_3EBD
	lda     $A0                             ; 4C17 A5 A0                    ..
	lbeq	L4C2B
	ldx     #$00                            ; 4C1E A2 00                    ..
	lda     L4B24                           ; 4C20 AD 24 4B                 .$K
	jsr     sub_3756
	lda     #$01                            ; 4C26 A9 01                    ..
	sta     $A0                             ; 4C28 85 A0                    ..
	rts                                     ; 4C2A 60                       `

; ----------------------------------------------------------------------------
L4C2B:	jsr	sub_37AD
	lda	$A0
	lbeq	L4C3A
	ldi	$A0, $00
	rts                                     ; 4C39 60                       `

; ----------------------------------------------------------------------------
L4C3A:  lda     $13                             ; 4C3A A5 13                    ..
	eor     #$06                            ; 4C3C 49 06                    I.
	lbne	L4C14
	ldi	$A0, $00
	rts                                     ; 4C47 60                       `

; ----------------------------------------------------------------------------
L4C48:	.byte	$00
L4C49:	.byte	$00
L4C4A:	.byte	$00
L4C4B:	.byte	$00
L4C4C:	.byte	$00
L4C4D:	.byte	$00
L4C4E:	.byte	$00

; ----------------------------------------------------------------------------
L4C4F:  prolog
	stx     L4C49                           ; 4C52 8E 49 4C                 .IL
	sta     L4C48                           ; 4C55 8D 48 4C                 .HL
	lda     L4C48                           ; 4C58 AD 48 4C                 .HL
	sta     $AE                             ; 4C5B 85 AE                    ..
	lda     L4C49                           ; 4C5D AD 49 4C                 .IL
	sta     $AF                             ; 4C60 85 AF                    ..
	ldy     #$00                            ; 4C62 A0 00                    ..
	lda     ($AE),y                         ; 4C64 B1 AE                    ..
	sta     L4C4B                           ; 4C66 8D 4B 4C                 .KL
	iny                                     ; 4C69 C8                       .
	sty     L4C4A                           ; 4C6A 8C 4A 4C                 .JL
	lda     L4C4B                           ; 4C6D AD 4B 4C                 .KL
	sta     L4C7E                           ; 4C70 8D 7E 4C                 .~L
L4C73:  lda     L4C7E                           ; 4C73 AD 7E 4C                 .~L
	cmp     L4C4A                           ; 4C76 CD 4A 4C                 .JL
	bcs     L4C7F                           ; 4C79 B0 04                    ..
	jmp     L4CF0                           ; 4C7B 4C F0 4C                 L.L

; ----------------------------------------------------------------------------
L4C7E:	.byte	$00

; ----------------------------------------------------------------------------
L4C7F:  clc                                     ; 4C7F 18                       .
	lda     L4C48                           ; 4C80 AD 48 4C                 .HL
	adc     L4C4A                           ; 4C83 6D 4A 4C                 mJL
	sta     $AE                             ; 4C86 85 AE                    ..
	lda     L4C49                           ; 4C88 AD 49 4C                 .IL
	adc     #$00                            ; 4C8B 69 00                    i.
	sta     $AF                             ; 4C8D 85 AF                    ..
	ldy     #$00                            ; 4C8F A0 00                    ..
	lda     ($AE),y                         ; 4C91 B1 AE                    ..
	sta     L4C4C                           ; 4C93 8D 4C 4C                 .LL
	lda     L4C4C                           ; 4C96 AD 4C 4C                 .LL
	jsr     sub_31C7
	lda     L4C4C                           ; 4C9C AD 4C 4C                 .LL
	eor     #$2C                            ; 4C9F 49 2C                    I,
	lbne	L4CAD
	ldx     #$00                            ; 4CA6 A2 00                    ..
	lda     #$0A                            ; 4CA8 A9 0A                    ..
	jsr     sub_3756
L4CAD:  lda     L4C4C                           ; 4CAD AD 4C 4C                 .LL
	cmp     #$30                            ; 4CB0 C9 30                    .0
	lbcc	L4CDB
	lda     #$39                            ; 4CB7 A9 39                    .9
	cmp     L4C4C                           ; 4CB9 CD 4C 4C                 .LL
	lbcc	L4CDB
	lda     L4C4C                           ; 4CC1 AD 4C 4C                 .LL
	sta	$A3
	lda     #$00                            ; 4CC6 A9 00                    ..
	sta     $A4                             ; 4CC8 85 A4                    ..
	lda     #$34                            ; 4CCA A9 34                    .4
	sta     $A6                             ; 4CCC 85 A6                    ..
	lda     #$79                            ; 4CCE A9 79                    .y
	sta     $A5                             ; 4CD0 85 A5                    ..
	ldy     #$4B                            ; 4CD2 A0 4B                    .K
	ldx     #$00                            ; 4CD4 A2 00                    ..
	lda     #$02                            ; 4CD6 A9 02                    ..
	jsr     sub_31D7
L4CDB:  jsr     sub_37AD
	lda     $A0                             ; 4CDE A5 A0                    ..
	lbeq	L4CEA
	lda     #$00                            ; 4CE5 A9 00                    ..
	sta     $A0                             ; 4CE7 85 A0                    ..
	rts                                     ; 4CE9 60                       `

; ----------------------------------------------------------------------------
L4CEA:  inc     L4C4A                           ; 4CEA EE 4A 4C                 .JL
	jmp     L4C73                           ; 4CED 4C 73 4C                 LsL

; ----------------------------------------------------------------------------
L4CF0:  jsr     L4AA1                           ; 4CF0 20 A1 4A                  .J
	jsr     L371E                           ; 4CF3 20 1E 37                  .7
	clc                                     ; 4CF6 18                       .
	lda     #$B0                            ; 4CF7 A9 B0                    ..
	adc     $A0                             ; 4CF9 65 A0                    e.
	sta     L4C4D                           ; 4CFB 8D 4D 4C                 .ML
	lda     #$04                            ; 4CFE A9 04                    ..
	adc     $A1                             ; 4D00 65 A1                    e.
	sta     L4C4E                           ; 4D02 8D 4E 4C                 .NL
	lda     $02EA                           ; 4D05 AD EA 02                 ...
	and     #$7F                            ; 4D08 29 7F                    ).
	sta     $02EA                           ; 4D0A 8D EA 02                 ...
L4D0D:  jsr     sub_3EBD
	lda     $A0                             ; 4D10 A5 A0                    ..
	lbne	L4D54
	lda     #$02                            ; 4D17 A9 02                    ..
	jsr     sub_34BE
	jsr     sub_37AD
	lda     $A0                             ; 4D1F A5 A0                    ..
	eor     #$01                            ; 4D21 49 01                    I.
	beq     L4D28                           ; 4D23 F0 03                    ..
	jmp     L4D2D                           ; 4D25 4C 2D 4D                 L-M

; ----------------------------------------------------------------------------
L4D28:  lda     #$00                            ; 4D28 A9 00                    ..
	sta     $A0                             ; 4D2A 85 A0                    ..
	rts                                     ; 4D2C 60                       `

; ----------------------------------------------------------------------------
L4D2D:  jsr     L371E                           ; 4D2D 20 1E 37                  .7
	sec                                     ; 4D30 38                       8
	lda     L4C4D                           ; 4D31 AD 4D 4C                 .ML
	sbc     $A0                             ; 4D34 E5 A0                    ..
	sta     $AE                             ; 4D36 85 AE                    ..
	lda     L4C4E                           ; 4D38 AD 4E 4C                 .NL
	sbc     $A1                             ; 4D3B E5 A1                    ..
	sta     $AF                             ; 4D3D 85 AF                    ..
	lda     $AE                             ; 4D3F A5 AE                    ..
	cmp     #$00                            ; 4D41 C9 00                    ..
	lda     $AF                             ; 4D43 A5 AF                    ..
	sbc     #$00                            ; 4D45 E9 00                    ..
	bmi     L4D4C                           ; 4D47 30 03                    0.
	jmp     L4D51                           ; 4D49 4C 51 4D                 LQM

; ----------------------------------------------------------------------------
L4D4C:  lda     #$00                            ; 4D4C A9 00                    ..
	sta     $A0                             ; 4D4E 85 A0                    ..
	rts                                     ; 4D50 60                       `

; ----------------------------------------------------------------------------
L4D51:  jmp     L4D0D                           ; 4D51 4C 0D 4D                 L.M

; ----------------------------------------------------------------------------
L4D54:  lda     #$01                            ; 4D54 A9 01                    ..
	sta     $A0                             ; 4D56 85 A0                    ..
	rts                                     ; 4D58 60                       `

; ----------------------------------------------------------------------------
L4D59:	.byte	$00
L4D5A:	.byte	$00
	brk                                     ; 4D5B 00                       .
L4D5C:	.byte	$00
L4D5D:	.byte	$00
L4D5E:	.byte	$00
	.byte   $07                             ; 4D5F 07                       .
	ldy     #$C4                            ; 4D60 A0 C4                    ..
	sbc     #$E1                            ; 4D62 E9 E1                    ..
	cpx     $A0BA                           ; 4D64 EC BA A0                 ...
L4D67:  .byte   $5F                             ; 4D67 5F                       _
L4D68:  .byte   $4D                             ; 4D68 4D                       M

; ----------------------------------------------------------------------------
L4D69:  prolog
	stx     L4D5A                           ; 4D6C 8E 5A 4D                 .ZM
	sta     L4D59                           ; 4D6F 8D 59 4D                 .YM
	dmv	$AE, L4D59
	ldy     #$00                            ; 4D7C A0 00                    ..
	lda     ($AE),y                         ; 4D7E B1 AE                    ..
	cmp     #$07                            ; 4D80 C9 07                    ..
	lbcs	L4D8C
	lda     #$00                            ; 4D87 A9 00                    ..
	sta     $A0                             ; 4D89 85 A0                    ..
	rts                                     ; 4D8B 60                       `

; ----------------------------------------------------------------------------
L4D8C:  lda     #$7D                            ; 4D8C A9 7D                    .}
	jsr     sub_31C7
	jmp     L4DAD                           ; 4D91 4C AD 4D                 L.M

; ----------------------------------------------------------------------------
L4D94:	.byte	$18," "
	Inverse	" Press OPTION for menu "

; ----------------------------------------------------------------------------
L4DAD:  lda     #$4D                            ; 4DAD A9 4D                    .M
	sta     $A3                             ; 4DAF 85 A3                    ..
	ldy     #$94                            ; 4DB1 A0 94                    ..
	ldx     #$00                            ; 4DB3 A2 00                    ..
	lda     #$07                            ; 4DB5 A9 07                    ..
	jsr     sub_3BEB
	lda     L4D67                           ; 4DBA AD 67 4D                 .gM
	sta     $AE                             ; 4DBD 85 AE                    ..
	lda     L4D68                           ; 4DBF AD 68 4D                 .hM
	sta     $AF                             ; 4DC2 85 AF                    ..
	lda     L4D59                           ; 4DC4 AD 59 4D                 .YM
	sta     $AC                             ; 4DC7 85 AC                    ..
	lda     L4D5A                           ; 4DC9 AD 5A 4D                 .ZM
	sta     $AD                             ; 4DCC 85 AD                    ..
	clc                                     ; 4DCE 18                       .
	ldy     #$00                            ; 4DCF A0 00                    ..
	lda     ($AE),y                         ; 4DD1 B1 AE                    ..
	adc     ($AC),y                         ; 4DD3 71 AC                    q.
	sta     $AA                             ; 4DD5 85 AA                    ..
	clc                                     ; 4DD7 18                       .
	lda     $AA                             ; 4DD8 A5 AA                    ..
	adc     #$02                            ; 4DDA 69 02                    i.
	sta     L4D5D                           ; 4DDC 8D 5D 4D                 .]M
	sec                                     ; 4DDF 38                       8
	lda     #$28                            ; 4DE0 A9 28                    .(
	sbc     L4D5D                           ; 4DE2 ED 5D 4D                 .]M
	sta     $AE                             ; 4DE5 85 AE                    ..
	lda     $AE                             ; 4DE7 A5 AE                    ..
	lsr     a                               ; 4DE9 4A                       J
	sta     L4D5E                           ; 4DEA 8D 5E 4D                 .^M
	lda     #$03                            ; 4DED A9 03                    ..
	sta     $A3                             ; 4DEF 85 A3                    ..
	ldy     L4D5D                           ; 4DF1 AC 5D 4D                 .]M
	ldx     #$0C                            ; 4DF4 A2 0C                    ..
	lda     L4D5E                           ; 4DF6 AD 5E 4D                 .^M
	jsr     L3B0F                           ; 4DF9 20 0F 3B                  .;
	clc                                     ; 4DFC 18                       .
	lda     L4D5E                           ; 4DFD AD 5E 4D                 .^M
	adc     #$01                            ; 4E00 69 01                    i.
	sta     $A0                             ; 4E02 85 A0                    ..
	lda     #$00                            ; 4E04 A9 00                    ..
	sta     $A1                             ; 4E06 85 A1                    ..
	ldy     #$0D                            ; 4E08 A0 0D                    ..
	ldx     $A1                             ; 4E0A A6 A1                    ..
	lda     $A0                             ; 4E0C A5 A0                    ..
	jsr     sub_3405
	ldx     L4D68                           ; 4E11 AE 68 4D                 .hM
	lda     L4D67                           ; 4E14 AD 67 4D                 .gM
	jsr     sub_3164
	lda     $B148                           ; 4E1A AD 48 B1                 .H.
	eor     #$01                            ; 4E1D 49 01                    I.
	beq     L4E24                           ; 4E1F F0 03                    ..
	jmp     L4E35                           ; 4E21 4C 35 4E                 L5N

; ----------------------------------------------------------------------------
L4E24:  ldx     L4D5A                           ; 4E24 AE 5A 4D                 .ZM
	lda     L4D59                           ; 4E27 AD 59 4D                 .YM
	jsr     L4C4F                           ; 4E2A 20 4F 4C                  OL
	lda     $A0                             ; 4E2D A5 A0                    ..
	sta     L4D5C                           ; 4E2F 8D 5C 4D                 .\M
	jmp     L4E69                           ; 4E32 4C 69 4E                 LiN

; ----------------------------------------------------------------------------
L4E35:  lda     $B148                           ; 4E35 AD 48 B1                 .H.
	eor     #$02                            ; 4E38 49 02                    I.
	beq     L4E3F                           ; 4E3A F0 03                    ..
	jmp     L4E50                           ; 4E3C 4C 50 4E                 LPN

; ----------------------------------------------------------------------------
L4E3F:  ldx     L4D5A                           ; 4E3F AE 5A 4D                 .ZM
	lda     L4D59                           ; 4E42 AD 59 4D                 .YM
	jsr     L4B28                           ; 4E45 20 28 4B                  (K
	lda	$A0
	sta	L4D5C
	jmp	L4E69

; ----------------------------------------------------------------------------
L4E50:  ldx     L4D5A                           ; 4E50 AE 5A 4D                 .ZM
	lda     L4D59                           ; 4E53 AD 59 4D                 .YM
	jsr     sub_3164
	ldy     L4D5A                           ; 4E59 AC 5A 4D                 .ZM
	ldx     L4D59                           ; 4E5C AE 59 4D                 .YM
	lda     #$02                            ; 4E5F A9 02                    ..
	jsr     L3158                           ; 4E61 20 58 31                  X1
	lda     #$02                            ; 4E64 A9 02                    ..
	sta     L4D5C                           ; 4E66 8D 5C 4D                 .\M
L4E69:  lda     L4D5C                           ; 4E69 AD 5C 4D                 .\M
	beq     L4E71                           ; 4E6C F0 03                    ..
	jmp     L4EB7                           ; 4E6E 4C B7 4E                 L.N

; ----------------------------------------------------------------------------
L4E71:  lda     #$7D                            ; 4E71 A9 7D                    .}
	jsr     sub_31C7
	jmp     L4E92                           ; 4E76 4C 92 4E                 L.N

; ----------------------------------------------------------------------------
	.byte	$18," "
	Inverse " No carrier, try again "

L4E92:  lda     #$4E                            ; 4E92 A9 4E                    .N
	sta     $A3                             ; 4E94 85 A3                    ..
	ldy     #$79                            ; 4E96 A0 79                    .y
	ldx     #$0A                            ; 4E98 A2 0A                    ..
	lda     #$08                            ; 4E9A A9 08                    ..
	jsr     sub_3BEB
	ldx     #$00                            ; 4E9F A2 00                    ..
	lda	#$3C
	jsr     sub_3756
	ldy     #$0F                            ; 4EA6 A0 0F                    ..
	ldx     #$00                            ; 4EA8 A2 00                    ..
	lda     #$00                            ; 4EAA A9 00                    ..
	jsr     sub_3405
	yldi	L2CF2, $01
	jmp     L4F02                           ; 4EB4 4C 02 4F                 L.O

; ----------------------------------------------------------------------------
L4EB7:  lda     L4D5C                           ; 4EB7 AD 5C 4D                 .\M
	eor     #$01                            ; 4EBA 49 01                    I.
	lbne	L4EFD
	lda     #$7D                            ; 4EC1 A9 7D                    .}
	jsr     sub_31C7
	jmp     L4EDD                           ; 4EC6 4C DD 4E                 L.N

; ----------------------------------------------------------------------------
L4EC9:	.byte   $13," "
	Inverse	" Carrier Detected "

; ----------------------------------------------------------------------------
L4EDD:  lda     #>L4EC9
	sta     $A3                             ; 4EDF 85 A3                    ..
	ldy     #<L4EC9
	ldx     #$0A                            ; 4EE3 A2 0A                    ..
	lda     #$0A                            ; 4EE5 A9 0A                    ..
	jsr     sub_3BEB
	ldx     #$00                            ; 4EEA A2 00                    ..
	lda     #$3C                            ; 4EEC A9 3C                    .<
	jsr     sub_3756
	ldy     #$0F                            ; 4EF1 A0 0F                    ..
	ldx     #$00                            ; 4EF3 A2 00                    ..
	lda     #$00                            ; 4EF5 A9 00                    ..
	jsr     sub_3405
	jmp     L4F02                           ; 4EFA 4C 02 4F                 L.O

; ----------------------------------------------------------------------------
L4EFD:  ldy     #$01                            ; 4EFD A0 01                    ..
	sty     L4D5C                           ; 4EFF 8C 5C 4D                 .\M
L4F02:  lda     L4D5C                           ; 4F02 AD 5C 4D                 .\M
	sta     $A0                             ; 4F05 85 A0                    ..
	rts                                     ; 4F07 60                       `

; ----------------------------------------------------------------------------
L4F08:	.byte	13,"D1:CONFIG.DAT"
L4F16:  .addr	L4F08
L4F18:	.byte	$00

; ----------------------------------------------------------------------------
sub_4F19:  
	prolog
	lda     #$05                            ; 4F1C A9 05                    ..
	jsr     sub_315E
	yldi	L347C, $00
	add16i	$A1, L4F16, $0001
	dmv	$AC, L4F16
	lda     #$00                            ; 4F3F A9 00                    ..
	sta     $A4                             ; 4F41 85 A4                    ..
	lda     ($AC),y                         ; 4F43 B1 AC                    ..
	sta     $A3                             ; 4F45 85 A3                    ..
	lda     #$03                            ; 4F47 A9 03                    ..
	sta     $A5                             ; 4F49 85 A5                    ..
	lda	#$04
	sta     $A6                             ; 4F4D 85 A6                    ..
	lda     #$00                            ; 4F4F A9 00                    ..
	sta     $A7                             ; 4F51 85 A7                    ..
	ldy     $A2                             ; 4F53 A4 A2                    ..
	ldx     $A1                             ; 4F55 A6 A1                    ..
	lda     #$05                            ; 4F57 A9 05                    ..
	jsr     L347D                           ; 4F59 20 7D 34                  }4
	lda     #$00                            ; 4F5C A9 00                    ..
	sta     $05C5                           ; 4F5E 8D C5 05                 ...
	lda     L347C                           ; 4F61 AD 7C 34                 .|4
	cmp     #$80                            ; 4F64 C9 80                    ..
	bcs     L4F6B                           ; 4F66 B0 03                    ..
	jmp     L4F70                           ; 4F68 4C 70 4F                 LpO

; ----------------------------------------------------------------------------
L4F6B:  lda     #$00                            ; 4F6B A9 00                    ..
	sta     $A0                             ; 4F6D 85 A0                    ..
	rts                                     ; 4F6F 60                       `

; ----------------------------------------------------------------------------
L4F70:  ldy     #$2E                            ; 4F70 A0 2E                    ..
	ldx     #$12                            ; 4F72 A2 12                    ..
	lda     #$05                            ; 4F74 A9 05                    ..
	jsr     sub_318C
	ldy     #$2E                            ; 4F79 A0 2E                    ..
	ldx     #$30                            ; 4F7B A2 30                    .0
	lda     #$05                            ; 4F7D A9 05                    ..
	jsr     sub_318C
	ldy     #$2E                            ; 4F82 A0 2E                    ..
	ldx     #$4E                            ; 4F84 A2 4E                    .N
	lda     #$05                            ; 4F86 A9 05                    ..
	jsr     sub_318C
	ldy     #$2E                            ; 4F8B A0 2E                    ..
	ldx     #$8A                            ; 4F8D A2 8A                    ..
	lda     #$05                            ; 4F8F A9 05                    ..
	jsr     sub_318C
	lda     #$05                            ; 4F94 A9 05                    ..
	jsr     L32A9                           ; 4F96 20 A9 32                  .2
	lda     $A0                             ; 4F99 A5 A0                    ..
	sta     L4F18                           ; 4F9B 8D 18 4F                 ..O
	lda     $B148                           ; 4F9E AD 48 B1                 .H.
	eor     #$03                            ; 4FA1 49 03                    I.
	lbne	L4FAE
	lda     L4F18                           ; 4FA8 AD 18 4F                 ..O
	sta     $B149                           ; 4FAB 8D 49 B1                 .I.
L4FAE:  lda     #$05                            ; 4FAE A9 05                    ..
	jsr     sub_315E
	lda     #$01                            ; 4FB3 A9 01                    ..
	sta     $A0                             ; 4FB5 85 A0                    ..
	rts                                     ; 4FB7 60                       `

; ----------------------------------------------------------------------------
sub_4FB8:
	prolog
	lda     #$05                            ; 4FBB A9 05                    ..
	jsr     sub_315E
	ldy     #$00                            ; 4FC0 A0 00                    ..
	sty     L347C                           ; 4FC2 8C 7C 34                 .|4
	clc                                     ; 4FC5 18                       .
	lda     L4F16                           ; 4FC6 AD 16 4F                 ..O
	adc     #$01                            ; 4FC9 69 01                    i.
	sta     $A1                             ; 4FCB 85 A1                    ..
	lda     L4F16+1
	adc     #$00                            ; 4FD0 69 00                    i.
	sta     $A2                             ; 4FD2 85 A2                    ..
	lda     L4F16                           ; 4FD4 AD 16 4F                 ..O
	sta     $AC                             ; 4FD7 85 AC                    ..
	lda     L4F16+1
	sta     $AD                             ; 4FDC 85 AD                    ..
	lda     #$00                            ; 4FDE A9 00                    ..
	sta     $A4                             ; 4FE0 85 A4                    ..
	lda     ($AC),y                         ; 4FE2 B1 AC                    ..
	sta     $A3                             ; 4FE4 85 A3                    ..
	lda     #$03                            ; 4FE6 A9 03                    ..
	sta     $A5                             ; 4FE8 85 A5                    ..
	lda     #$08                            ; 4FEA A9 08                    ..
	sta     $A6                             ; 4FEC 85 A6                    ..
	lda     #$00                            ; 4FEE A9 00                    ..
	sta     $A7                             ; 4FF0 85 A7                    ..
	ldy     $A2                             ; 4FF2 A4 A2                    ..
	ldx     $A1                             ; 4FF4 A6 A1                    ..
	lda     #$05                            ; 4FF6 A9 05                    ..
	jsr     L347D                           ; 4FF8 20 7D 34                  }4
	lda     #$00                            ; 4FFB A9 00                    ..
	sta     $05C5                           ; 4FFD 8D C5 05                 ...
	lda     L347C                           ; 5000 AD 7C 34                 .|4
	cmp     #$80                            ; 5003 C9 80                    ..
	bcs     L500A                           ; 5005 B0 03                    ..
	jmp     L500F                           ; 5007 4C 0F 50                 L.P

; ----------------------------------------------------------------------------
L500A:  lda     #$00                            ; 500A A9 00                    ..
	sta     $A0                             ; 500C 85 A0                    ..
	rts                                     ; 500E 60                       `

; ----------------------------------------------------------------------------
L500F:  ldy     #$2E                            ; 500F A0 2E                    ..
	ldx     #$12                            ; 5011 A2 12                    ..
	lda     #$05                            ; 5013 A9 05                    ..
	jsr     L3158                           ; 5015 20 58 31                  X1
	ldy     #$2E                            ; 5018 A0 2E                    ..
	ldx     #$30                            ; 501A A2 30                    .0
	lda     #$05                            ; 501C A9 05                    ..
	jsr	L3158
	ldy	#$2E
	ldx	#$4E
	lda     #$05                            ; 5025 A9 05                    ..
	jsr     L3158                           ; 5027 20 58 31                  X1
	ldy     #$2E                            ; 502A A0 2E                    ..
	ldx     #$8A                            ; 502C A2 8A                    ..
	lda     #$05                            ; 502E A9 05                    ..
	jsr     L3158                           ; 5030 20 58 31                  X1
	ldx     $B149                           ; 5033 AE 49 B1                 .I.
	lda     #$05                            ; 5036 A9 05                    ..
	jsr     L3227                           ; 5038 20 27 32                  '2
	lda     #$05                            ; 503B A9 05                    ..
	jsr     sub_315E
	ldi	$A0, $01
	rts

; ----------------------------------------------------------------------------
L5045:	.byte	$00
L5046:	.byte	$00

; ----------------------------------------------------------------------------
sub_5047:
	prolog
	lda     L5045                           ; 504A AD 45 50                 .EP
	eor     #$01                            ; 504D 49 01                    I.
	lbeq	L5055
	rts                                     ; 5054 60                       `

; ----------------------------------------------------------------------------
L5055:  jmp     L507A                           ; 5055 4C 7A 50                 LzP

; ----------------------------------------------------------------------------
L5058:	.byte	$21," Save Configuration to Disk "
	Inverse	"Y/N"	
	.byte	"? "

; ----------------------------------------------------------------------------
L507A:  lda     #>L5058
	sta     $A3                             ; 507C 85 A3                    ..
	ldy     #<L5058
	ldx     #$0E                            ; 5080 A2 0E                    ..
	lda     #$02                            ; 5082 A9 02                    ..
	jsr     sub_3BEB
	jmp     L508D                           ; 5087 4C 8D 50                 L.P

; ----------------------------------------------------------------------------
L508A:	.byte	$02,"YN"

; ----------------------------------------------------------------------------
L508D:	ldxai	L508A
	jsr     sub_3A5C
	lda     $A0                             ; 5094 A5 A0                    ..
	sta     L5046                           ; 5096 8D 46 50                 .FP
	lda     L5046                           ; 5099 AD 46 50                 .FP
	eor     #'Y'
	lbne	L50AC
	jsr     sub_3DEC
	jsr     sub_4FB8
	jsr     sub_3C90
L50AC:  rts                                     ; 50AC 60                       `

; ----------------------------------------------------------------------------
L50AD:  jmp     L50B0                           ; 50AD 4C B0 50                 L.P

; ----------------------------------------------------------------------------
L50B0:  jmp     L50DC                           ; 50B0 4C DC 50                 L.P

; ----------------------------------------------------------------------------
L50B3:	.byte	$28,"}  "
	Inverse	"      Games Computers Play, Inc      "

; ----------------------------------------------------------------------------
L50DC:	ldx	#>L50B3
	lda	#<L50B3
	jsr     sub_3151
	jmp     L510E                           ; 50E3 4C 0E 51                 L.Q

; ----------------------------------------------------------------------------
L50E6:	.byte   $27,"  "
	Inverse	"      Press OPTION for this menu     "

; ----------------------------------------------------------------------------
L510E:	ldxai	L50E6
	jsr     sub_3151
	lda     $B148                           ; 5115 AD 48 B1                 .H.
	eor     #$01                            ; 5118 49 01                    I.
	lbne	L513C
L511F:	jmp	L5132

; ----------------------------------------------------------------------------
L5122:	.byte	$0F,"  "
	Inverse	"  1030/XM301 "

; ----------------------------------------------------------------------------
L5132:	ldxai	L5122
	jsr     sub_3164
	jmp     L51CB                           ; 5139 4C CB 51                 L.Q

; ----------------------------------------------------------------------------
L513C:  lda     $B148                           ; 513C AD 48 B1                 .H.
	eor     #$02                            ; 513F 49 02                    I.
	lbne	L5163
	jmp     L5159                           ; 5146 4C 59 51                 LYQ

; ----------------------------------------------------------------------------
L5149:	.byte   $0F,"  "
	Inverse	"  MPP 1000   "

L5159:	ldxai	L5149
	jsr     sub_3164
	jmp     L51CB                           ; 5160 4C CB 51                 L.Q

; ----------------------------------------------------------------------------
L5163:  lda     $B149                           ; 5163 AD 49 B1                 .I.
	eor     #$08                            ; 5166 49 08                    I.
	lbne	L518A
	jmp     L5180                           ; 516D 4C 80 51                 L.Q

; ----------------------------------------------------------------------------
L5170:	.byte   $0F,"  "
	Inverse	"  300 Baud   "

; ----------------------------------------------------------------------------
L5180:	ldxai	L5170
	jsr     sub_3164
	jmp     L51CB                           ; 5187 4C CB 51                 L.Q

; ----------------------------------------------------------------------------
L518A:  lda     $B149                           ; 518A AD 49 B1                 .I.
	eor     #$0A                            ; 518D 49 0A                    I.
	lbne	L51B1
	jmp     L51A7                           ; 5194 4C A7 51                 L.Q

; ----------------------------------------------------------------------------
L5197:	.byte   $0F,"  "
	Inverse	" 1200 Baud   "

; ----------------------------------------------------------------------------
L51A7:	ldxai	L5197
	jsr     sub_3164
	jmp     L51CB                           ; 51AE 4C CB 51                 L.Q

; ----------------------------------------------------------------------------
L51B1:  jmp     L51C4                           ; 51B1 4C C4 51                 L.Q

; ----------------------------------------------------------------------------
L51B4:	.byte   $0F,"  "
	Inverse	" Unknown Baud"

; ----------------------------------------------------------------------------
L51C4:	ldxai	L51B4
	jsr     sub_3164
L51CB:  jmp     L51E7                           ; 51CB 4C E7 51                 L.Q

; ----------------------------------------------------------------------------
L51CE:	.byte	$18
	Inverse	"    Configuration Menu  "

; ----------------------------------------------------------------------------
L51E7:	ldxai	L51CE
	jsr     sub_3151
	jsr     sub_31C5
	jmp     L5204                           ; 51F1 4C 04 52                 L.R

; ----------------------------------------------------------------------------
L51F4:	.byte   $0F,"  Dial phone..."

; ----------------------------------------------------------------------------
L5204:  ldx     #>L51F4
	lda     #<L51F4
	jsr     sub_3151
	jmp     L5217                           ; 520B 4C 17 52                 L.R

; ----------------------------------------------------------------------------
L520E:	.byte	$08,"    "
	Inverse	"1"
	.byte	" - "
L5217:  ldx     #>L520E
	lda     #<L520E
	jsr     sub_3164
	ldx     #$2E                            ; 521E A2 2E                    ..
L5220:  lda     #$12                            ; 5220 A9 12                    ..
	jsr     sub_3151
	jmp     L5231                           ; 5225 4C 31 52                 L1R

; ----------------------------------------------------------------------------
L5228:	.byte	$08,"    "
	Inverse	"2"
	.byte	" - "
L5231:  ldx     #>L5228
	lda     #<L5228
	jsr     sub_3164
	ldx     #$2E                            ; 5238 A2 2E                    ..
	lda     #$30                            ; 523A A9 30                    .0
	jsr     sub_3151
	jmp     L524B                           ; 523F 4C 4B 52                 LKR

; ----------------------------------------------------------------------------
L5242:	.byte	$08,"    "
	Inverse	"3"
	.byte	" - "
L524B:  ldx     #$52                            ; 524B A2 52                    .R
	lda     #$42                            ; 524D A9 42                    .B
	jsr     sub_3164
	ldx     #$2E                            ; 5252 A2 2E                    ..
	lda     #$4E                            ; 5254 A9 4E                    .N
	jsr     sub_3151
	jmp     L5277                           ; 5259 4C 77 52                 LwR

; ----------------------------------------------------------------------------
L525C:	.byte   $1A,"    "
	Inverse	"K"
	.byte	" - Dial from keyboard"

L5277:  ldx     #>L525C
	lda     #<L525C
	jsr     sub_3151
	jmp     L5290                           ; 527E 4C 90 52                 L.R

; ----------------------------------------------------------------------------
L5281:	.byte	$0E,"  "
	Inverse "A"
	.byte	"uto-connect"

L5290:  ldx     #>L5281
	lda     #<L5281
	jsr     sub_3151
	lda     $B148                           ; 5297 AD 48 B1                 .H.
	eor     #$03                            ; 529A 49 03                    I.
	beq     L52A1                           ; 529C F0 03                    ..
	jmp     L52B7                           ; 529E 4C B7 52                 L.R

; ----------------------------------------------------------------------------
L52A1:  jmp     L52B0                           ; 52A1 4C B0 52                 L.R

; ----------------------------------------------------------------------------
L52A4:	.byte   $0B,"  "
	Inverse "B"
	.byte	"aud rate"

L52B0:  ldx     #$52                            ; 52B0 A2 52                    .R
	lda     #$A4                            ; 52B2 A9 A4                    ..
	jsr     sub_3151
L52B7:  lda     $B148                           ; 52B7 AD 48 B1                 .H.
	eor     #$01                            ; 52BA 49 01                    I.
	bne     L52C1                           ; 52BC D0 03                    ..
	jmp     L52DB                           ; 52BE 4C DB 52                 L.R

; ----------------------------------------------------------------------------
L52C1:  jmp     L52D4                           ; 52C1 4C D4 52                 L.R

; ----------------------------------------------------------------------------
L52C4:	.byte   $0F,"  "
	Inverse	"T"
	.byte	"erminal mode"

L52D4:	ldxai	L52C4
	jsr     sub_3151
L52DB:  jsr     sub_31C5
	jmp     L52F5                           ; 52DE 4C F5 52                 L.R

; ----------------------------------------------------------------------------
L52E1:	.byte   $13,"  Your Selection ? "
L52F5:	ldxai	L52E1
	jsr     sub_3164
	rts                                     ; 52FC 60                       `

; ----------------------------------------------------------------------------
L52FD:	.byte	$00
L52FE:	.byte	$00
L52FF:	.byte	$00
L5300:	.byte	$00

; ----------------------------------------------------------------------------
sub_5301:	
	stack_prolog L52FD, $02
	ldy     L52FE                           ; 530A AC FE 52                 ..R
	ldx     #$00                            ; 530D A2 00                    ..
	lda     L52FD                           ; 530F AD FD 52                 ..R
	jsr     sub_3405
	ldy     #$01                            ; 5315 A0 01                    ..
	sty     L5300                           ; 5317 8C 00 53                 ..S
	lda     L52FF                           ; 531A AD FF 52                 ..R
	sta     L532B                           ; 531D 8D 2B 53                 .+S
L5320:  lda     L532B                           ; 5320 AD 2B 53                 .+S
	cmp     L5300                           ; 5323 CD 00 53                 ..S
	bcs     L532C                           ; 5326 B0 04                    ..
	jmp     L5337                           ; 5328 4C 37 53                 L7S

; ----------------------------------------------------------------------------
L532B:	.byte	$00

; ----------------------------------------------------------------------------
L532C:  lda     #$5F                            ; 532C A9 5F                    ._
	jsr     sub_31C7
	inc     L5300                           ; 5331 EE 00 53                 ..S
	jmp     L5320                           ; 5334 4C 20 53                 L S

; ----------------------------------------------------------------------------
L5337:  jsr     sub_31C5
	ldy     L52FE                           ; 533A AC FE 52                 ..R
	ldx     #$00                            ; 533D A2 00                    ..
	lda     L52FD                           ; 533F AD FD 52                 ..R
	jsr     sub_3405
	lda     #$1F                            ; 5345 A9 1F                    ..
	jsr     sub_31C7
	lda     #$1E                            ; 534A A9 1E                    ..
	jsr     sub_31C7
	rts                                     ; 534F 60                       `

; ----------------------------------------------------------------------------
L5350:	.byte	$00
L5351:	.byte	$00
L5352:	.byte	$00
L5353:	.byte	$00
L5354:	.byte	$00
L5355:	.byte	$00
L5356:	.byte	$00
L5357:	.byte	$00
L5358:	.byte	$00

; ----------------------------------------------------------------------------
L5359:
	stack_prolog L5350, $04
	lda     #$01                            ; 5362 A9 01                    ..
	jsr     sub_38D6
	ldy     L5354                           ; 5367 AC 54 53                 .TS
	ldx     L5351                           ; 536A AE 51 53                 .QS
	lda     L5350                           ; 536D AD 50 53                 .PS
	jsr     sub_5301
	lda     L5352                           ; 5373 AD 52 53                 .RS
	sta     $AE                             ; 5376 85 AE                    ..
	lda     L5353                           ; 5378 AD 53 53                 .SS
	sta     $AF                             ; 537B 85 AF                    ..
	ldy     #$00                            ; 537D A0 00                    ..
	lda     ($AE),y                         ; 537F B1 AE                    ..
	sta     L5358                           ; 5381 8D 58 53                 .XS
	ldx     L5353                           ; 5384 AE 53 53                 .SS
	lda     L5352                           ; 5387 AD 52 53                 .RS
	jsr     sub_3164
	lda     $02FC                           ; 538D AD FC 02                 ...
	eor     #$FF                            ; 5390 49 FF                    I.
	bne     L5397                           ; 5392 D0 03                    ..
	jmp     L539C                           ; 5394 4C 9C 53                 L.S

; ----------------------------------------------------------------------------
L5397:  lda     #$07                            ; 5397 A9 07                    ..
	jsr     sub_31A6
L539C:  lda     L5358                           ; 539C AD 58 53                 .XS
	sta     L5357                           ; 539F 8D 57 53                 .WS
L53A2:  lda     $02FC                           ; 53A2 AD FC 02                 ...
	eor     #$FF                            ; 53A5 49 FF                    I.
	beq     L53AC                           ; 53A7 F0 03                    ..
	jmp     L53AF                           ; 53A9 4C AF 53                 L.S

; ----------------------------------------------------------------------------
L53AC:  jmp     L53A2                           ; 53AC 4C A2 53                 L.S

; ----------------------------------------------------------------------------
L53AF:  lda     $02FC                           ; 53AF AD FC 02                 ...
	.byte   $8D                             ; 53B2 8D                       .
	.byte   $56                             ; 53B3 56                       V
L53B4:  .byte   $53                             ; 53B4 53                       S
	lda     L5356                           ; 53B5 AD 56 53                 .VS
	and     #$C0                            ; 53B8 29 C0                    ).
	sta     $AE                             ; 53BA 85 AE                    ..
	lda     $AE                             ; 53BC A5 AE                    ..
	eor     #$C0                            ; 53BE 49 C0                    I.
	bne     L53C5                           ; 53C0 D0 03                    ..
	jmp     L53CF                           ; 53C2 4C CF 53                 L.S

; ----------------------------------------------------------------------------
L53C5:  lda     #$07                            ; 53C5 A9 07                    ..
	jsr     sub_31A6
	lda     $A0                             ; 53CA A5 A0                    ..
	sta     L5355                           ; 53CC 8D 55 53                 .US
L53CF:  lda     L5355                           ; 53CF AD 55 53                 .US
	eor     #$9B                            ; 53D2 49 9B                    I.
	beq     L53D9                           ; 53D4 F0 03                    ..
	jmp     L53DF                           ; 53D6 4C DF 53                 L.S

; ----------------------------------------------------------------------------
L53D9:  jmp     L54F5                           ; 53D9 4C F5 54                 L.T

; ----------------------------------------------------------------------------
	jmp     L54DE                           ; 53DC 4C DE 54                 L.T

; ----------------------------------------------------------------------------
L53DF:  lda     L5355                           ; 53DF AD 55 53                 .US
	eor     #$7D                            ; 53E2 49 7D                    I}
	beq     L53F0                           ; 53E4 F0 0A                    ..
	lda     L5355                           ; 53E6 AD 55 53                 .US
	eor     #$9C                            ; 53E9 49 9C                    I.
	beq     L53F0                           ; 53EB F0 03                    ..
	jmp     L5418                           ; 53ED 4C 18 54                 L.T

; ----------------------------------------------------------------------------
L53F0:  lda     L5352                           ; 53F0 AD 52 53                 .RS
	sta     $AE                             ; 53F3 85 AE                    ..
	lda     L5353                           ; 53F5 AD 53 53                 .SS
	sta     $AF                             ; 53F8 85 AF                    ..
	lda     #$00                            ; 53FA A9 00                    ..
	ldy     #$00                            ; 53FC A0 00                    ..
	sta     ($AE),y                         ; 53FE 91 AE                    ..
	sty     L5358                           ; 5400 8C 58 53                 .XS
	lda     L5358                           ; 5403 AD 58 53                 .XS
	sta     L5357                           ; 5406 8D 57 53                 .WS
	ldy     L5354                           ; 5409 AC 54 53                 .TS
	ldx     L5351                           ; 540C AE 51 53                 .QS
	lda     L5350                           ; 540F AD 50 53                 .PS
	jsr     sub_5301
	jmp     L54DE                           ; 5415 4C DE 54                 L.T

; ----------------------------------------------------------------------------
L5418:  lda     L5355                           ; 5418 AD 55 53                 .US
	eor     #$1E                            ; 541B 49 1E                    I.
	lbne	L5425
	jmp     L54DE                           ; 5422 4C DE 54                 L.T

; ----------------------------------------------------------------------------
L5425:  lda     L5355                           ; 5425 AD 55 53                 .US
	eor     #$1F                            ; 5428 49 1F                    I.
	lbne	L5432
	jmp     L54DE                           ; 542F 4C DE 54                 L.T

; ----------------------------------------------------------------------------
L5432:  lda     L5355                           ; 5432 AD 55 53                 .US
	eor     #$FF                            ; 5435 49 FF                    I.
	lbne	L543F
	jmp     L54DE                           ; 543C 4C DE 54                 L.T

; ----------------------------------------------------------------------------
L543F:  lda     L5355                           ; 543F AD 55 53                 .US
	eor     #$FE                            ; 5442 49 FE                    I.
	lbne	L544C
	jmp     L54DE                           ; 5449 4C DE 54                 L.T

; ----------------------------------------------------------------------------
L544C:  lda     L5355                           ; 544C AD 55 53                 .US
	eor     #$9D                            ; 544F 49 9D                    I.
	lbne	L5459
	jmp     L54DE                           ; 5456 4C DE 54                 L.T

; ----------------------------------------------------------------------------
L5459:  lda     L5355                           ; 5459 AD 55 53                 .US
	eor     #$1C                            ; 545C 49 1C                    I.
	beq     L546A                           ; 545E F0 0A                    ..
	lda     L5355                           ; 5460 AD 55 53                 .US
	eor     #$1D                            ; 5463 49 1D                    I.
	beq     L546A                           ; 5465 F0 03                    ..
	jmp     L546D                           ; 5467 4C 6D 54                 LmT

; ----------------------------------------------------------------------------
L546A:  jmp     L54DE                           ; 546A 4C DE 54                 L.T

; ----------------------------------------------------------------------------
L546D:  lda     L5355                           ; 546D AD 55 53                 .US
	eor     #$7E                            ; 5470 49 7E                    I~
	lbne	L549A
	lda     L5357                           ; 5477 AD 57 53                 .WS
	lbeq	L5497
	sub8i	L5357, L5357, $01
	sub8i	L5358, L5358, $01
	lda     L5355                           ; 5491 AD 55 53                 .US
	jsr     sub_31C7
L5497:  jmp     L54DE                           ; 5497 4C DE 54                 L.T

; ----------------------------------------------------------------------------
L549A:  sec                                     ; 549A 38                       8
	lda     L5354                           ; 549B AD 54 53                 .TS
	sbc     #$02                            ; 549E E9 02                    ..
	sta     $AE                             ; 54A0 85 AE                    ..
	lda     L5357                           ; 54A2 AD 57 53                 .WS
	cmp     $AE                             ; 54A5 C5 AE                    ..
	lbcs	L54DE
	lda     L5355                           ; 54AC AD 55 53                 .US
	and     #$7F                            ; 54AF 29 7F                    ).
	sta     L5355                           ; 54B1 8D 55 53                 .US
	clc                                     ; 54B4 18                       .
	lda     L5357                           ; 54B5 AD 57 53                 .WS
	adc     #$01                            ; 54B8 69 01                    i.
	sta     $AE                             ; 54BA 85 AE                    ..
	clc                                     ; 54BC 18                       .
	lda     L5352                           ; 54BD AD 52 53                 .RS
	adc     $AE                             ; 54C0 65 AE                    e.
	sta     $AC                             ; 54C2 85 AC                    ..
	lda     L5353                           ; 54C4 AD 53 53                 .SS
	adc     #$00                            ; 54C7 69 00                    i.
	sta     $AD                             ; 54C9 85 AD                    ..
	lda     L5355                           ; 54CB AD 55 53                 .US
	ldy     #$00                            ; 54CE A0 00                    ..
	sta     ($AC),y                         ; 54D0 91 AC                    ..
	inc     L5357                           ; 54D2 EE 57 53                 .WS
	inc     L5358                           ; 54D5 EE 58 53                 .XS
	lda     L5355                           ; 54D8 AD 55 53                 .US
	jsr     sub_31C7
L54DE:  jsr     sub_37AD
	lda     $A0                             ; 54E1 A5 A0                    ..:q
	lbeq	L54EB
L54E8:  jmp     L54F5                           ; 54E8 4C F5 54                 L.T

; ----------------------------------------------------------------------------
L54EB:  lda     L5355                           ; 54EB AD 55 53                 .US
	eor     #$9B                            ; 54EE 49 9B                    I.
	lbne	L53A2
L54F5:	dmv	off_AE, L5352
	stp8	L5358
	lda     #$00                            ; 5506 A9 00                    ..
	jsr     sub_38D6
	rts                                     ; 550B 60                       `

; ----------------------------------------------------------------------------
L550C:	.byte	$00
L550D:	.byte	$00
L550E:	.byte	$00
L550F:	.byte	$00
L5510:	.byte	$00
L5511:	.byte	$00
L5512:	.byte	$00

; ----------------------------------------------------------------------------
sub_5513:  
	prolog
	yldi	L5045, $00
	lda     $B148                           ; 551B AD 48 B1                 .H.
	eor     #$01                            ; 551E 49 01                    I.
	lbne	L5534
	rdmv	L2F1D, L2F08
	jmp     L5559                           ; 5531 4C 59 55                 LYU

; ----------------------------------------------------------------------------
L5534:  lda     $B148                           ; 5534 AD 48 B1                 .H.
	eor     #$02                            ; 5537 49 02                    I.
	lbne	L554D
	rdmv	L2F1D, L2F11
	jmp     L5559                           ; 554A 4C 59 55                 LYU

; ----------------------------------------------------------------------------
L554D:	rdmv	L2F1D, L2F1B
L5559:	yldi	L550D, $00
L555E:	yldi	L2CF2, $00
	jsr     sub_3EBD
	lda     $A0                             ; 5566 A5 A0                    ..
	sta     L5512                           ; 5568 8D 12 55                 ..U
	jsr     sub_3E7A
	lda     L5512                           ; 556E AD 12 55                 ..U
	eor     #$01                            ; 5571 49 01                    I.
	lbne	L55A2
L5578:  jmp     L558E                           ; 5578 4C 8E 55                 L.U

; ----------------------------------------------------------------------------
L557B:
	.byte   $12," "
	Inverse	" Connection Lost "

; ----------------------------------------------------------------------------
L558E:  lda     #>L557B
	sta     $A3                             ; 5590 85 A3                    ..
	ldy     #<L557B
	ldx     #$0F                            ; 5594 A2 0F                    ..
	lda     #$0A                            ; 5596 A9 0A                    ..
	jsr     sub_3BEB
	ldx     #$00                            ; 559B A2 00                    ..
	lda     #$3C                            ; 559D A9 3C                    .<
	jsr     sub_3756
L55A2:  jsr     L50AD                           ; 55A2 20 AD 50                  .P
	ldx     L2F1E                           ; 55A5 AE 1E 2F                 ../
	lda     L2F1D                           ; 55A8 AD 1D 2F                 ../
	jsr     sub_3A5C
	lda     $A0                             ; 55AE A5 A0                    ..
	sta     L550C                           ; 55B0 8D 0C 55                 ..U
	lda     L550C                           ; 55B3 AD 0C 55                 ..U
	cmp     #$31                            ; 55B6 C9 31                    .1
	lbcc	L56B3
	lda     #$33                            ; 55BD A9 33                    .3
	cmp     L550C                           ; 55BF CD 0C 55                 ..U
	lbcc	L56B3
	lda     L550C                           ; 55C7 AD 0C 55                 ..U
	eor     #$31                            ; 55CA 49 31                    I1
	lbne	L55E3
	ldi	L550F, $2E
	ldi	L550E, $12
	ldi	L5511, $05
	jmp     L560E                           ; 55E0 4C 0E 56                 L.V

; ----------------------------------------------------------------------------
L55E3:  lda     L550C                           ; 55E3 AD 0C 55                 ..U
	eor     #$32                            ; 55E6 49 32                    I2
	lbne	L55FF
	ldi	L550F, $2E
	ldi	L550E, $30
	ldi	L5511, $06
	jmp     L560E                           ; 55FC 4C 0E 56                 L.V

; ----------------------------------------------------------------------------
L55FF:	ldi	L550F, $2E
	ldi	L550E, $4E
	ldi	L5511, $07
L560E:  jmp     L5621                           ; 560E 4C 21 56                 L!V

; ----------------------------------------------------------------------------
L5611:	.byte	$0F," "
	Inverse	"E"
	.byte	"dit or "
	Inverse	"D"
	.byte	"ial? "

L5621:  lda     #>L5611
	sta     $A3                             ; 5623 85 A3                    ..
	ldy     #<L5611
	ldx     #$0F                            ; 5627 A2 0F                    ..
	lda     #$0A                            ; 5629 A9 0A                    ..
	jsr     sub_3BEB
	jmp     L5634                           ; 562E 4C 34 56                 L4V

; ----------------------------------------------------------------------------
L5631:	.byte	$02,"ED"

; ----------------------------------------------------------------------------
L5634:  ldx     #>L5631
	lda     #<L5631
	jsr     sub_3A5C
	lda     $A0                             ; 563B A5 A0                    ..
	sta     L550C                           ; 563D 8D 0C 55                 ..U
	lda     L550C                           ; 5640 AD 0C 55                 ..U
	eor     #'E'
	lbne	L569A
	lda     $B148                           ; 564A AD 48 B1                 .H.
	eor     #$03                            ; 564D 49 03                    I.
	lbne	L567E
	lda     L550E                           ; 5654 AD 0E 55                 ..U
	sta     $AE                             ; 5657 85 AE                    ..
	lda     L550F                           ; 5659 AD 0F 55                 ..U
	sta     $AF                             ; 565C 85 AF                    ..
	ldy     #$00                            ; 565E A0 00                    ..
	lda     ($AE),y                         ; 5660 B1 AE                    ..
	beq     L5667                           ; 5662 F0 03                    ..
	jmp     L567E                           ; 5664 4C 7E 56                 L~V

; ----------------------------------------------------------------------------
L5667:  jmp     L566F                           ; 5667 4C 6F 56                 LoV

; ----------------------------------------------------------------------------
L566A:	.byte   $04,"ATDT"

; ----------------------------------------------------------------------------
L566F:  lda     #>L566A
	sta     $A3                             ; 5671 85 A3                    ..
	ldy     #<L566A
	ldx     L550F                           ; 5675 AE 0F 55                 ..U
	lda     L550E                           ; 5678 AD 0E 55                 ..U
	jsr     sub_3462
L567E:  lda     L550F                           ; 567E AD 0F 55                 ..U
	sta     $A3                             ; 5681 85 A3                    ..
	lda     #$1E                            ; 5683 A9 1E                    ..
	sta     $A4                             ; 5685 85 A4                    ..
	ldy     L550E                           ; 5687 AC 0E 55                 ..U
	ldx     L5511                           ; 568A AE 11 55                 ..U
	lda     #$08                            ; 568D A9 08                    ..
	jsr     L5359                           ; 568F 20 59 53                  YS
	ldy     #$01                            ; 5692 A0 01                    ..
	sty     L5045                           ; 5694 8C 45 50                 .EP
	jmp     L56B0                           ; 5697 4C B0 56                 L.V

; ----------------------------------------------------------------------------
L569A:  jsr     sub_5047
	ldx     L550F                           ; 569D AE 0F 55                 ..U
	lda     L550E                           ; 56A0 AD 0E 55                 ..U
	jsr     L4D69                           ; 56A3 20 69 4D                  iM
	lda     $A0                             ; 56A6 A5 A0                    ..
	sta     L550D                           ; 56A8 8D 0D 55                 ..U
	ldy     #$01                            ; 56AB A0 01                    ..
	sty     L5510                           ; 56AD 8C 10 55                 ..U
L56B0:  jmp     L5844                           ; 56B0 4C 44 58                 LDX

; ----------------------------------------------------------------------------
L56B3:  lda     L550C                           ; 56B3 AD 0C 55                 ..U
	eor     #$4B                            ; 56B6 49 4B                    IK
	beq     L56BD                           ; 56B8 F0 03                    ..
	jmp     L574C                           ; 56BA 4C 4C 57                 LLW

; ----------------------------------------------------------------------------
L56BD:  lda     #$2E                            ; 56BD A9 2E                    ..
	sta     L550F                           ; 56BF 8D 0F 55                 ..U
	lda     #$6C                            ; 56C2 A9 6C                    .l
	sta     L550E                           ; 56C4 8D 0E 55                 ..U
	ldy     #$12                            ; 56C7 A0 12                    ..
	ldx     #$00                            ; 56C9 A2 00                    ..
	lda     #$02                            ; 56CB A9 02                    ..
	jsr     sub_3405
	jmp     L56DB                           ; 56D0 4C DB 56                 L.V

; ----------------------------------------------------------------------------
	.byte   $07                             ; 56D3 07                       .
	ldy     #$C4                            ; 56D4 A0 C4                    ..
	sbc     #$E1                            ; 56D6 E9 E1                    ..
	cpx     $20BA                           ; 56D8 EC BA 20                 .. 
L56DB:  ldx     #$56                            ; 56DB A2 56                    .V
	lda     #$D3                            ; 56DD A9 D3                    ..
	jsr     sub_3164
	lda     $B148                           ; 56E2 AD 48 B1                 .H.
	eor     #$03                            ; 56E5 49 03                    I.
	beq     L56EC                           ; 56E7 F0 03                    ..
	jmp     L5716                           ; 56E9 4C 16 57                 L.W

; ----------------------------------------------------------------------------
L56EC:  lda     L550E                           ; 56EC AD 0E 55                 ..U
	sta     $AE                             ; 56EF 85 AE                    ..
	lda     L550F                           ; 56F1 AD 0F 55                 ..U
	sta     $AF                             ; 56F4 85 AF                    ..
	ldy     #$00                            ; 56F6 A0 00                    ..
	lda     ($AE),y                         ; 56F8 B1 AE                    ..
	beq     L56FF                           ; 56FA F0 03                    ..
	jmp     L5716                           ; 56FC 4C 16 57                 L.W

; ----------------------------------------------------------------------------
L56FF:  jmp     L5707                           ; 56FF 4C 07 57                 L.W

; ----------------------------------------------------------------------------
L5702:	.byte   $04,"ATDT"

; ----------------------------------------------------------------------------
L5707:  lda     #$57                            ; 5707 A9 57                    .W
	sta     $A3                             ; 5709 85 A3                    ..
	ldy     #$02                            ; 570B A0 02                    ..
	ldx     L550F                           ; 570D AE 0F 55                 ..U
	lda     L550E                           ; 5710 AD 0E 55                 ..U
	jsr     sub_3462
L5716:  lda     L550F                           ; 5716 AD 0F 55                 ..U
	sta     $A3                             ; 5719 85 A3                    ..
	lda     #$1E                            ; 571B A9 1E                    ..
	sta     $A4                             ; 571D 85 A4                    ..
	ldy     L550E                           ; 571F AC 0E 55                 ..U
	ldx     #$12                            ; 5722 A2 12                    ..
	lda     #$09                            ; 5724 A9 09                    ..
	jsr     L5359                           ; 5726 20 59 53                  YS
	lda     #$00                            ; 5729 A9 00                    ..
	cmp     L2E6C                           ; 572B CD 6C 2E                 .l.
	lbcs	L5749
	jsr     sub_5047
	ldx     L550F                           ; 5736 AE 0F 55                 ..U
	lda     L550E                           ; 5739 AD 0E 55                 ..U
	jsr     L4D69                           ; 573C 20 69 4D                  iM
	lda     $A0                             ; 573F A5 A0                    ..
	sta     L550D                           ; 5741 8D 0D 55                 ..U
	ldy     #$01                            ; 5744 A0 01                    ..
	sty     L5510                           ; 5746 8C 10 55                 ..U
L5749:  jmp     L5844                           ; 5749 4C 44 58                 LDX

; ----------------------------------------------------------------------------
L574C:  lda     L550C                           ; 574C AD 0C 55                 ..U
	eor     #$41                            ; 574F 49 41                    IA
	beq     L5756                           ; 5751 F0 03                    ..
	jmp     L5800                           ; 5753 4C 00 58                 L.X

; ----------------------------------------------------------------------------
L5756:  jmp     L576C                           ; 5756 4C 6C 57                 LlW

; ----------------------------------------------------------------------------
L5759:	.byte   $12," "
	Inverse	"E"
	.byte	"dit or "
	Inverse	"D"
	.byte	"o auto? "
L576C:  lda     #$57                            ; 576C A9 57                    .W
	sta     $A3                             ; 576E 85 A3                    ..
	ldy     #$59                            ; 5770 A0 59                    .Y
	ldx     #$0F                            ; 5772 A2 0F                    ..
	lda     #$0A                            ; 5774 A9 0A                    ..
	jsr     sub_3BEB
	jmp     L577F                           ; 5779 4C 7F 57                 L.W

; ----------------------------------------------------------------------------
L577C:	.byte	$02,"ED"

; ----------------------------------------------------------------------------
L577F:  ldx     #>L577C
	lda     #<L577C
	jsr     sub_3A5C
	lda     $A0                             ; 5786 A5 A0                    ..
	sta     L550C                           ; 5788 8D 0C 55                 ..U
	lda     L550C                           ; 578B AD 0C 55                 ..U
	eor     #$45                            ; 578E 49 45                    IE
	beq     L5795                           ; 5790 F0 03                    ..
	jmp     L57E6                           ; 5792 4C E6 57                 L.W

; ----------------------------------------------------------------------------
L5795:  ldy     #$13                            ; 5795 A0 13                    ..
	ldx     #$00                            ; 5797 A2 00                    ..
	lda     #$02                            ; 5799 A9 02                    ..
	jsr     sub_3405
	jmp     L57C6                           ; 579E 4C C6 57                 L.W

; ----------------------------------------------------------------------------
L57A1:
	.byte	$24,$12,$12,$12,$12,$12,$12,$12
	Inverse	" Auto-connect sequence "
	.byte	$12
	.byte   $12                             ; 57C1 12                       .
	.byte   $12                             ; 57C2 12                       .
	.byte   $12                             ; 57C3 12                       .
	.byte   $12                             ; 57C4 12                       .
	.byte   $12                             ; 57C5 12                       .
L57C6:  ldx     #>L57A1
	lda     #<L57A1
	jsr     sub_3151
	lda     #$2E                            ; 57CD A9 2E                    ..
	sta     $A3                             ; 57CF 85 A3                    ..
	lda     #$77                            ; 57D1 A9 77                    .w
	sta     $A4                             ; 57D3 85 A4                    ..
	ldy     #$8A                            ; 57D5 A0 8A                    ..
	ldx     #$14                            ; 57D7 A2 14                    ..
	lda     #$00                            ; 57D9 A9 00                    ..
	jsr     L5359                           ; 57DB 20 59 53                  YS
	ldy     #$01                            ; 57DE A0 01                    ..
	sty     L5045                           ; 57E0 8C 45 50                 .EP
	jmp     L57FD                           ; 57E3 4C FD 57                 L.W

; ----------------------------------------------------------------------------
L57E6:  lda     #$00                            ; 57E6 A9 00                    ..
	cmp     L2E8A                           ; 57E8 CD 8A 2E                 ...
	lbcs	L57FD
	jsr     sub_5047
	ldy     #$01                            ; 57F3 A0 01                    ..
	sty     L550D                           ; 57F5 8C 0D 55                 ..U
	lda     #$02                            ; 57F8 A9 02                    ..
	sta     L5510                           ; 57FA 8D 10 55                 ..U
L57FD:  jmp     L5844                           ; 57FD 4C 44 58                 LDX

; ----------------------------------------------------------------------------
L5800:  lda     L550C                           ; 5800 AD 0C 55                 ..U
	eor     #$42                            ; 5803 49 42                    IB
	beq     L580A                           ; 5805 F0 03                    ..
	jmp     L582F                           ; 5807 4C 2F 58                 L/X

; ----------------------------------------------------------------------------
L580A:  jsr     sub_3DEC
	lda     $B149                           ; 580D AD 49 B1                 .I.
	eor     #$08                            ; 5810 49 08                    I.
	beq     L5817                           ; 5812 F0 03                    ..
	jmp     L581F                           ; 5814 4C 1F 58                 L.X

; ----------------------------------------------------------------------------
L5817:  lda     #$0A                            ; 5817 A9 0A                    ..
	sta     $B149                           ; 5819 8D 49 B1                 .I.
	jmp     L5824                           ; 581C 4C 24 58                 L$X

; ----------------------------------------------------------------------------
L581F:  lda     #$08                            ; 581F A9 08                    ..
	sta     $B149                           ; 5821 8D 49 B1                 .I.
L5824:  jsr     sub_3C90
	ldy     #$01                            ; 5827 A0 01                    ..
	sty     L5045                           ; 5829 8C 45 50                 .EP
	jmp     L5844                           ; 582C 4C 44 58                 LDX

; ----------------------------------------------------------------------------
L582F:  lda     L550C                           ; 582F AD 0C 55                 ..U
	eor     #$54                            ; 5832 49 54                    IT
	beq     L5839                           ; 5834 F0 03                    ..
	jmp     L5844                           ; 5836 4C 44 58                 LDX

; ----------------------------------------------------------------------------
L5839:  jsr     sub_5047
	ldy     #$01                            ; 583C A0 01                    ..
	sty     L550D                           ; 583E 8C 0D 55                 ..U
	sty     L5510                           ; 5841 8C 10 55                 ..U
L5844:  lda     L550D                           ; 5844 AD 0D 55                 ..U
	eor     #$01                            ; 5847 49 01                    I.
	beq     L584E                           ; 5849 F0 03                    ..
	jmp     L555E                           ; 584B 4C 5E 55                 L^U

; ----------------------------------------------------------------------------
L584E:  lda     L5510                           ; 584E AD 10 55                 ..U
	sta     $A0                             ; 5851 85 A0                    ..
	rts                                     ; 5853 60                       `

; ----------------------------------------------------------------------------
L5854:	.byte	$00
L5855:	.byte	$00
L5856:	.byte	$00
L5857:	.byte	$00
L5858:	.byte	$00

; ----------------------------------------------------------------------------
sub_5859:
	stack_prolog L5854, $03
	ldy     #$00                            ; 5862 A0 00                    ..
	sty     L5858                           ; 5864 8C 58 58                 .XX
L5867:  lda     L5858                           ; 5867 AD 58 58                 .XX
	cmp     L5857                           ; 586A CD 57 58                 .WX
	lbcs	L589A
	clc                                     ; 5872 18                       .
	lda     L5854                           ; 5873 AD 54 58                 .TX
	adc     L5858                           ; 5876 6D 58 58                 mXX
	sta     $AE                             ; 5879 85 AE                    ..
	lda     L5855                           ; 587B AD 55 58                 .UX
	adc     #$00                            ; 587E 69 00                    i.
	sta     $AF                             ; 5880 85 AF                    ..
	ldy     #$00                            ; 5882 A0 00                    ..
	lda     ($AE),y                         ; 5884 B1 AE                    ..
	eor     L5856                           ; 5886 4D 56 58                 MVX
	lbne	L5894
	lda     L5858                           ; 588E AD 58 58                 .XX
	sta     $A0                             ; 5891 85 A0                    ..
	rts                                     ; 5893 60                       `

; ----------------------------------------------------------------------------
L5894:  inc     L5858                           ; 5894 EE 58 58                 .XX
	jmp     L5867                           ; 5897 4C 67 58                 LgX

; ----------------------------------------------------------------------------
L589A:  lda     L5858                           ; 589A AD 58 58                 .XX
	sta     $A0                             ; 589D 85 A0                    ..
	rts                                     ; 589F 60                       `

; ----------------------------------------------------------------------------
L58A0:	.byte	$00
L58A1:	.byte	$00
L58A2:	.byte	$00
L58A3:	.byte	$00

; ----------------------------------------------------------------------------
sub_58A4:  
	prolog
	stx     L58A1                           ; 58A7 8E A1 58                 ..X
	sta     L58A0                           ; 58AA 8D A0 58                 ..X
	lda     L58A0                           ; 58AD AD A0 58                 ..X
	sta     $AE                             ; 58B0 85 AE                    ..
	lda     L58A1                           ; 58B2 AD A1 58                 ..X
	sta     $AF                             ; 58B5 85 AF                    ..
	ldy     #$00                            ; 58B7 A0 00                    ..
	lda     ($AE),y                         ; 58B9 B1 AE                    ..
	sta     L58A2                           ; 58BB 8D A2 58                 ..X
	lda     L58A2                           ; 58BE AD A2 58                 ..X
	eor     #$50                            ; 58C1 49 50                    IP
	lbne	L5929
	lda     #$7D                            ; 58C8 A9 7D                    .}
	jsr     sub_31C7
	jmp     L58E9                           ; 58CD 4C E9 58                 L.X

; ----------------------------------------------------------------------------
L58D0:	.byte	$18," "
	Inverse	" Press OPTION for menu "
L58E9:  lda     #$58                            ; 58E9 A9 58                    .X
	sta     $A3                             ; 58EB 85 A3                    ..
	ldy     #$D0                            ; 58ED A0 D0                    ..
	ldx     #$00                            ; 58EF A2 00                    ..
	lda     #$07                            ; 58F1 A9 07                    ..
	jsr     sub_3BEB
	jmp     L5904                           ; 58F6 4C 04 59                 L.Y

; ----------------------------------------------------------------------------
L58F9:	.byte	$0A," "
	Inverse	" Pausing "

L5904:  lda     #>L58F9
	sta     $A3                             ; 5906 85 A3                    ..
	ldy     #<L58F9
	ldx     #$0A                            ; 590A A2 0A                    ..
	lda     #$0A                            ; 590C A9 0A                    ..
	jsr     sub_3BEB
	ldx     #$00                            ; 5911 A2 00                    ..
	lda     #$B4                            ; 5913 A9 B4                    ..
	jsr     sub_3756
	ldy     #$0F                            ; 5918 A0 0F                    ..
	ldx     #$00                            ; 591A A2 00                    ..
	lda     #$00                            ; 591C A9 00                    ..
	jsr	sub_3405
	ldi	$A0, $01
	rts                                     ; 5925 60                       `

; ----------------------------------------------------------------------------
	jmp     L5A27                           ; 5926 4C 27 5A                 L'Z

; ----------------------------------------------------------------------------
L5929:  lda     L58A2                           ; 5929 AD A2 58                 ..X
	eor     #$57                            ; 592C 49 57                    IW
	lbne	L5A14
	clc                                     ; 5933 18                       .
	lda     L58A0                           ; 5934 AD A0 58                 ..X
	adc     #$01                            ; 5937 69 01                    i.
	sta     $AE                             ; 5939 85 AE                    ..
	lda     L58A1                           ; 593B AD A1 58                 ..X
	adc     #$00                            ; 593E 69 00                    i.
	sta     $AF                             ; 5940 85 AF                    ..
	lda     ($AE),y                         ; 5942 B1 AE                    ..
	sta     L58A3                           ; 5944 8D A3 58                 ..X
	lda     #$7D                            ; 5947 A9 7D                    .}
	jsr     sub_31C7
	jmp     L5968                           ; 594C 4C 68 59                 LhY

; ----------------------------------------------------------------------------
L594F:	.byte	$18," "
	Inverse	" Press OPTION for menu "

L5968:  lda     #$59                            ; 5968 A9 59                    .Y
	sta     $A3                             ; 596A 85 A3                    ..
	ldy     #$4F                            ; 596C A0 4F                    .O
	ldx     #$00                            ; 596E A2 00                    ..
	lda     #$07                            ; 5970 A9 07                    ..
	jsr     sub_3BEB
	jmp     L5989                           ; 5975 4C 89 59                 L.Y

; ----------------------------------------------------------------------------
L5978:	.byte	$10," "
	Inverse	" Waiting For   "

L5989:  lda     #$59                            ; 5989 A9 59                    .Y
	sta     $A3                             ; 598B 85 A3                    ..
L598D:  ldy     #$78                            ; 598D A0 78                    .x
	ldx     #$0A                            ; 598F A2 0A                    ..
	lda     #$0A                            ; 5991 A9 0A                    ..
	jsr     sub_3BEB
	ldy     #$0B                            ; 5996 A0 0B                    ..
	ldx     #$00                            ; 5998 A2 00                    ..
L599A:  lda     #$19                            ; 599A A9 19                    ..
	jsr     sub_3405
	clc                                     ; 599F 18                       .
	lda     L58A3                           ; 59A0 AD A3 58                 ..X
	adc     #$80                            ; 59A3 69 80                    i.
	sta     $A0                             ; 59A5 85 A0                    ..
	lda     $A0                             ; 59A7 A5 A0                    ..
	jsr     sub_31C7
	lda	L58A3
	and     #$7F                            ; 59AF 29 7F                    ).
	sta     L58A3                           ; 59B1 8D A3 58                 ..X
	ldy     #$0F                            ; 59B4 A0 0F                    ..
	ldx     #$00                            ; 59B6 A2 00                    ..
	lda     #$00                            ; 59B8 A9 00                    ..
	jsr     sub_3405
	clc                                     ; 59BD 18                       .
	lda     L58A3                           ; 59BE AD A3 58                 ..X
	adc     #$01                            ; 59C1 69 01                    i.
	sta     L58A2                           ; 59C3 8D A2 58                 ..X
L59C6:  jsr     sub_34DF
	lda     #$00                            ; 59C9 A9 00                    ..
	cmp     $A0                             ; 59CB C5 A0                    ..
	lbcs	L59EC
	lda     #$02                            ; 59D2 A9 02                    ..
	jsr     sub_31A6
	lda     $A0                             ; 59D7 A5 A0                    ..
	sta     L58A2                           ; 59D9 8D A2 58                 ..X
	lda     L58A2                           ; 59DC AD A2 58                 ..X
	eor     #$0A                            ; 59DF 49 0A                    I.
	bne     L59E6                           ; 59E1 D0 03                    ..
	jmp     L59EC                           ; 59E3 4C EC 59                 L.Y

; ----------------------------------------------------------------------------
L59E6:  lda     L58A2                           ; 59E6 AD A2 58                 ..X
	jsr     sub_31C7
L59EC:  jsr     sub_37AD
	lda     $A0                             ; 59EF A5 A0                    ..
	lbeq	L59F9
	jmp     L5A0C                           ; 59F6 4C 0C 5A                 L.Z

; ----------------------------------------------------------------------------
L59F9:  lda     L58A2                           ; 59F9 AD A2 58                 ..X
	and     #$7F                            ; 59FC 29 7F                    ).
	sta     L58A2                           ; 59FE 8D A2 58                 ..X
	lda     L58A2                           ; 5A01 AD A2 58                 ..X
	eor     L58A3                           ; 5A04 4D A3 58                 M.X
	lbne	L59C6
L5A0C:	lda     #$02                            ; 5A0C A9 02                    ..
	sta     $A0                             ; 5A0E 85 A0                    ..
	rts                                     ; 5A10 60                       `

; ----------------------------------------------------------------------------
	jmp     L5A27                           ; 5A11 4C 27 5A                 L'Z

; ----------------------------------------------------------------------------
L5A14:  lda     L58A2                           ; 5A14 AD A2 58                 ..X
	eor     #$53                            ; 5A17 49 53                    IS
	lbne	L5A27
	iny                                     ; 5A1E C8                       .
	sty     L2E10                           ; 5A1F 8C 10 2E                 ...
	lda     #$01                            ; 5A22 A9 01                    ..
	sta     $A0                             ; 5A24 85 A0                    ..
	rts                                     ; 5A26 60                       `

; ----------------------------------------------------------------------------
L5A27:  lda     #$00                            ; 5A27 A9 00                    ..
	sta     $A0                             ; 5A29 85 A0                    ..
	rts                                     ; 5A2B 60                       `

; ----------------------------------------------------------------------------
L5A2C:	.byte	$00
L5A2D:	.byte	$00
L5A2E:	.byte	$00
L5A2F:	.byte	$00
L5A30:	.byte	$00
L5A31:	.byte	$00
L5A32:	.byte	$00
L5A33:	.byte	$00
L5A34:	.byte	$00
L5A35:  inc     L322C                           ; 5A35 EE 2C 32                 .,2
	.res	47,$00

; ----------------------------------------------------------------------------
L5A67:  prolog
	ldy     #$00                            ; 5A6A A0 00                    ..
	sty     L2E10                           ; 5A6C 8C 10 2E                 ...
	lda     L2E8A                           ; 5A6F AD 8A 2E                 ...
	sta     L5A2D                           ; 5A72 8D 2D 5A                 .-Z
	iny                                     ; 5A75 C8                       .
	sty     L5A2E                           ; 5A76 8C 2E 5A                 ..Z
L5A79:  lda     L5A2D                           ; 5A79 AD 2D 5A                 .-Z
	cmp     L5A2E                           ; 5A7C CD 2E 5A                 ..Z
	lbcc	L5C04
	ldx     L5A2E                           ; 5A84 AE 2E 5A                 ..Z
	lda     L2E8A,x                         ; 5A87 BD 8A 2E                 ...
	sta     L5A2C                           ; 5A8A 8D 2C 5A                 .,Z
	clc                                     ; 5A8D 18                       .
L5A8E:  lda     #$8A                            ; 5A8E A9 8A                    ..
	adc     L5A2E                           ; 5A90 6D 2E 5A                 m.Z
	sta     $AE                             ; 5A93 85 AE                    ..
	lda     #$2E                            ; 5A95 A9 2E                    ..
	adc     #$00                            ; 5A97 69 00                    i.
	sta     $AF                             ; 5A99 85 AF                    ..
	clc                                     ; 5A9B 18                       .
	lda     $AE                             ; 5A9C A5 AE                    ..
	adc     #$01                            ; 5A9E 69 01                    i.
	sta     L5A33                           ; 5AA0 8D 33 5A                 .3Z
	lda     $AF                             ; 5AA3 A5 AF                    ..
	adc     #$00                            ; 5AA5 69 00                    i.
	sta     L5A34                           ; 5AA7 8D 34 5A                 .4Z
	sec                                     ; 5AAA 38                       8
	lda     L5A2D                           ; 5AAB AD 2D 5A                 .-Z
	sbc     L5A2E                           ; 5AAE ED 2E 5A                 ..Z
	sta     L5A2F                           ; 5AB1 8D 2F 5A                 ./Z
	lda     L5A2C                           ; 5AB4 AD 2C 5A                 .,Z
	eor     #$7C                            ; 5AB7 49 7C                    I|
	beq     L5ABE                           ; 5AB9 F0 03                    ..
	jmp     L5B51                           ; 5ABB 4C 51 5B                 LQ[

; ----------------------------------------------------------------------------
L5ABE:  lda     L5A2F                           ; 5ABE AD 2F 5A                 ./Z
	sta     $A3                             ; 5AC1 85 A3                    ..
	ldy     #$7C                            ; 5AC3 A0 7C                    .|
	ldx     L5A34                           ; 5AC5 AE 34 5A                 .4Z
	lda     L5A33                           ; 5AC8 AD 33 5A                 .3Z
	jsr     sub_5859
	lda     $A0                             ; 5ACE A5 A0                    ..
	sta     L5A30                           ; 5AD0 8D 30 5A                 .0Z
	lda     L5A30                           ; 5AD3 AD 30 5A                 .0Z
	sta     L5A31                           ; 5AD6 8D 31 5A                 .1Z
	lda     #$1E                            ; 5AD9 A9 1E                    ..
	cmp     L5A31                           ; 5ADB CD 31 5A                 .1Z
	lbcs	L5AE8
	lda     #$1E                            ; 5AE3 A9 1E                    ..
	sta     L5A31                           ; 5AE5 8D 31 5A                 .1Z
L5AE8:  lda     L5A31                           ; 5AE8 AD 31 5A                 .1Z
	sta     L5A35                           ; 5AEB 8D 35 5A                 .5Z
	ldy     #$00                            ; 5AEE A0 00                    ..
	sty     L5A32                           ; 5AF0 8C 32 5A                 .2Z
	lda     L5A31                           ; 5AF3 AD 31 5A                 .1Z
	sta     L5B04                           ; 5AF6 8D 04 5B                 ..[
L5AF9:  lda     L5B04                           ; 5AF9 AD 04 5B                 ..[
	cmp     L5A32                           ; 5AFC CD 32 5A                 .2Z
	bcs     L5B05                           ; 5AFF B0 04                    ..
	jmp     L5B2C                           ; 5B01 4C 2C 5B                 L,[

; ----------------------------------------------------------------------------
L5B04:	.byte	$00

; ----------------------------------------------------------------------------
L5B05:	add8i	$AE, L5A32, $01
	add16m8	$AC, L5A33, L5A32
	ldy     #$00                            ; 5B1D A0 00                    ..
	lda     ($AC),y                         ; 5B1F B1 AC                    ..
	ldx     $AE                             ; 5B21 A6 AE                    ..
	sta     L5A35,x                         ; 5B23 9D 35 5A                 .5Z
	inc     L5A32                           ; 5B26 EE 32 5A                 .2Z
	jmp     L5AF9                           ; 5B29 4C F9 5A                 L.Z

; ----------------------------------------------------------------------------
L5B2C:  lda     $B148                           ; 5B2C AD 48 B1                 .H.
	eor     #$03                            ; 5B2F 49 03                    I.
	lbeq	L5B3D
	ldx     #$5A                            ; 5B36 A2 5A                    .Z
	lda     #$35                            ; 5B38 A9 35                    .5
	jsr     L4D69                           ; 5B3A 20 69 4D                  iM
L5B3D:	add8m	$AE, L5A2E, L5A30
	add8i	L5A2E, $AE, $02
	jmp     L5BF4                           ; 5B4E 4C F4 5B                 L.[

; ----------------------------------------------------------------------------
L5B51:  lda     L5A2C                           ; 5B51 AD 2C 5A                 .,Z
	eor     #$5B                            ; 5B54 49 5B                    I[
	lbne	L5BBD
	ldx     L5A34                           ; 5B5B AE 34 5A                 .4Z
	lda     L5A33                           ; 5B5E AD 33 5A                 .3Z
	jsr     sub_58A4
	clc                                     ; 5B64 18                       .
	lda     L5A2E                           ; 5B65 AD 2E 5A                 ..Z
	adc     $A0                             ; 5B68 65 A0                    e.
	sta     L5A2E                           ; 5B6A 8D 2E 5A                 ..Z
	sec                                     ; 5B6D 38                       8
	lda     L5A2D                           ; 5B6E AD 2D 5A                 .-Z
	sbc     L5A2E                           ; 5B71 ED 2E 5A                 ..Z
	sta     L5A2F                           ; 5B74 8D 2F 5A                 ./Z
	clc                                     ; 5B77 18                       .
	lda     #$8A                            ; 5B78 A9 8A                    ..
	adc     L5A2E                           ; 5B7A 6D 2E 5A                 m.Z
	sta     $AE                             ; 5B7D 85 AE                    ..
	lda     #$2E                            ; 5B7F A9 2E                    ..
	adc     #$00                            ; 5B81 69 00                    i.
	sta     $AF                             ; 5B83 85 AF                    ..
;
	clc                                     ; 5B85 18                       .
	lda     $AE                             ; 5B86 A5 AE                    ..
	adc     #$01                            ; 5B88 69 01                    i.
	sta     L5A33                           ; 5B8A 8D 33 5A                 .3Z
	lda     $AF                             ; 5B8D A5 AF                    ..
	adc     #$00                            ; 5B8F 69 00                    i.
	sta     L5A34                           ; 5B91 8D 34 5A                 .4Z
;
	lda     L5A2F                           ; 5B94 AD 2F 5A                 ./Z
	sta     $A3                             ; 5B97 85 A3                    ..
	ldy     #$5D                            ; 5B99 A0 5D                    .]
	ldx     L5A34                           ; 5B9B AE 34 5A                 .4Z
	lda     L5A33                           ; 5B9E AD 33 5A                 .3Z
	jsr     sub_5859
	lda     $A0                             ; 5BA4 A5 A0                    ..
	sta     L5A30                           ; 5BA6 8D 30 5A                 .0Z
	clc                                     ; 5BA9 18                       .
	lda     L5A2E                           ; 5BAA AD 2E 5A                 ..Z
	adc     L5A30                           ; 5BAD 6D 30 5A                 m0Z
	sta     $AE                             ; 5BB0 85 AE                    ..
	clc                                     ; 5BB2 18                       .
	lda     $AE                             ; 5BB3 A5 AE                    ..
	adc     #$02                            ; 5BB5 69 02                    i.
	sta     L5A2E                           ; 5BB7 8D 2E 5A                 ..Z
	jmp     L5BF4                           ; 5BBA 4C F4 5B                 L.[

; ----------------------------------------------------------------------------
L5BBD:  lda     L5A2C                           ; 5BBD AD 2C 5A                 .,Z
	eor     #$5E                            ; 5BC0 49 5E                    I^
	lbne	L5BE9
	inc     L5A2E                           ; 5BC7 EE 2E 5A                 ..Z
	ldx     L5A2E                           ; 5BCA AE 2E 5A                 ..Z
	lda     L2E8A,x                         ; 5BCD BD 8A 2E                 ...
	sta     L5A2C                           ; 5BD0 8D 2C 5A                 .,Z
	lda     L5A2C                           ; 5BD3 AD 2C 5A                 .,Z
	and     #$9F                            ; 5BD6 29 9F                    ).
	sta     L5A2C                           ; 5BD8 8D 2C 5A                 .,Z
	ldx     L5A2C                           ; 5BDB AE 2C 5A                 .,Z
	lda     #$02                            ; 5BDE A9 02                    ..
	jsr     sub_31CA
	inc     L5A2E                           ; 5BE3 EE 2E 5A                 ..Z
	jmp     L5BF4                           ; 5BE6 4C F4 5B                 L.[

; ----------------------------------------------------------------------------
L5BE9:  ldx     L5A2C                           ; 5BE9 AE 2C 5A                 .,Z
	lda     #$02                            ; 5BEC A9 02                    ..
	jsr     sub_31CA
	inc     L5A2E                           ; 5BF1 EE 2E 5A                 ..Z
L5BF4:  jsr     sub_37AD
	lda     $A0                             ; 5BF7 A5 A0                    ..
	lbeq	L5C01
	jmp     L5C04                           ; 5BFE 4C 04 5C                 L.\

; ----------------------------------------------------------------------------
L5C01:  jmp	L5A79

; ----------------------------------------------------------------------------
L5C04:  jsr     sub_37AD
	lda     $A0                             ; 5C07 A5 A0                    ..
	lbeq	L5C0F
	rts                                     ; 5C0E 60                       `

; ----------------------------------------------------------------------------
L5C0F:  lda     L2E10                           ; 5C0F AD 10 2E                 ...
	eor     #$01                            ; 5C12 49 01                    I.
	lbne	L5C1A
	rts                                     ; 5C19 60                       `

; ----------------------------------------------------------------------------
L5C1A:  lda     #$7D                            ; 5C1A A9 7D                    .}
	jsr     sub_31C7
	jmp     L5C3B                           ; 5C1F 4C 3B 5C                 L;\

; ----------------------------------------------------------------------------
L5C22:	.byte	$18," "
	Inverse	" Press OPTION for menu "

; ----------------------------------------------------------------------------
L5C3B:  lda     #>L5C22
	sta     $A3                             ; 5C3D 85 A3                    ..
	ldy     #<L5C22
	ldx     #$00                            ; 5C41 A2 00                    ..
	lda     #$07                            ; 5C43 A9 07                    ..
	jsr     sub_3BEB
	jmp     L5C66                           ; 5C48 4C 66 5C                 Lf\

; ----------------------------------------------------------------------------
L5C4B:	.byte   $1A," "
	Inverse	" Press START to continue "

L5C66:  lda     #>L5C4B
	sta     $A3                             ; 5C68 85 A3                    ..
	ldy     #<L5C4B
	ldx     #$0A                            ; 5C6C A2 0A                    ..
	lda     #$07                            ; 5C6E A9 07                    ..
	jsr     sub_3BEB
L5C73:  lda     $D01F                           ; 5C73 AD 1F D0                 ...
	and     #$01                            ; 5C76 29 01                    ).
	sta     L2CED                           ; 5C78 8D ED 2C                 ..,
	jsr     sub_37AD
	lda     $A0                             ; 5C7E A5 A0                    ..
	lbeq	L5C88
L5C85:  jmp     L5C90                           ; 5C85 4C 90 5C                 L.\

; ----------------------------------------------------------------------------
L5C88:  lda     L2CED                           ; 5C88 AD ED 2C                 ..,
	lbne	L5C73
L5C90:  rts                                     ; 5C90 60                       `

; ----------------------------------------------------------------------------
	inc     $082C                           ; 5C91 EE 2C 08                 .,.
	brk                                     ; 5C94 00                       .
	brk                                     ; 5C95 00                       .
	brk                                     ; 5C96 00                       .
	brk                                     ; 5C97 00                       .
	brk                                     ; 5C98 00                       .
	brk                                     ; 5C99 00                       .
	brk                                     ; 5C9A 00                       .
	brk                                     ; 5C9B 00                       .
	brk                                     ; 5C9C 00                       .

; ----------------------------------------------------------------------------
sub_5C9D:  
	prolog
	lda     #$00                            ; 5CA0 A9 00                    ..
	jsr     sub_38D6
	yldi	$52, $00
	ldi	L2E12, $00
	ldi	L2E30, $00
	ldi	L2E4E, $00
	ldi	L2E6C, $00
	ldi	L2E8A, $00
	rts                                     ; 5CC2 60                       `

; ----------------------------------------------------------------------------
L5CC3:	.byte	10,"D:INIT.MAC"
L5CCE:  .addr   L5CC3
	.byte	$00
	.byte	$00
L5CD2:	.byte	$00
L5CD3:	.byte   $0B,"ATARI-V1.06"
L5CDF:  .addr	L5CD3


; ----------------------------------------------------------------------------
sub_5CE1:
	prolog
	jmp     L5CEA                           ; 5CE4 4C EA 5C                 L.\

; ----------------------------------------------------------------------------
L5CE7:	.byte   $02,"K:"

; ----------------------------------------------------------------------------
L5CEA:	dldi	$A3, $0004
	ldy     #>L5CE7                         ; 5CF2 A0 5C                    .\
	ldx     #<L5CE7                         ; 5CF4 A2 E7                    ..
	lda     #$07                            ; 5CF6 A9 07                    ..
	jsr     sub_3127
	lda     $10                             ; 5CFB A5 10                    ..
	and     #$7F                            ; 5CFD 29 7F                    ).
	sta     $10                             ; 5CFF 85 10                    ..
	jsr     sub_37E0
	lda     $A0                             ; 5D04 A5 A0                    ..
	lbne	:+
	jsr     sub_38FE
:	jsr	sub_5C9D
	lda     #$05                            ; 5D11 A9 05                    ..
	jsr     sub_315E
	yldi	L347C, $00
	add16i	$A1, L5CCE, $0001
	dmv	$Ac, L5CCE
	ldi	$A4, $00
	lda     ($AC),y                         ; 5D38 B1 AC                    ..
	sta     $A3                             ; 5D3A 85 A3                    ..
	dldi	$A5, $0403
	ldi	$A7, $00
	ldy     $A2                             ; 5D48 A4 A2                    ..
	ldx     $A1                             ; 5D4A A6 A1                    ..
	lda     #$05                            ; 5D4C A9 05                    ..
	jsr     L347D                           ; 5D4E 20 7D 34                  }4
	ldi	$05C5, $00
	lda     L347C                           ; 5D56 AD 7C 34                 .|4
	cmp     #$80                            ; 5D59 C9 80                    ..
	lbcc	L5DA9
	jmp     L5D78                           ; 5D60 4C 78 5D                 Lx]

; ----------------------------------------------------------------------------
L5D63:	.byte   $14,"D:INIT.MAC not found"

; ----------------------------------------------------------------------------
L5D78:	ldxai	L5D63
	jsr     sub_3151
	jmp     L5D9F                           ; 5D7F 4C 9F 5D                 L.]

; ----------------------------------------------------------------------------
L5D82:	.byte   $1C,"Call GCP, Inc for assistance"

; ----------------------------------------------------------------------------
L5D9F:	ldxai	L5D82
	jsr     sub_3151
	jsr     sub_38FE
L5DA9:  jsr     sub_4F19
	jsr     sub_3C90
	lda     $A0                             ; 5DAF A5 A0                    ..
	lbne	L5DDF
	jmp	L5DCF

; ----------------------------------------------------------------------------
L5DB9:	.byte	$15
	Inverse	" No R: Handler found "

; ----------------------------------------------------------------------------
L5DCF:	lda     #>L5DB9
	sta     $A3                             ; 5DD1 85 A3                    ..
	ldy     #<L5DB9
	ldx     #$0A                            ; 5DD5 A2 0A                    ..
	lda     #$08                            ; 5DD7 A9 08                    ..
	jsr     sub_3BEB
	jsr	sub_38FE
L5DDF:  ldy     #$00                            ; 5DDF A0 00                    ..
	sty     L2CF2                           ; 5DE1 8C F2 2C                 ..,
	jsr     sub_5513
	lda     $A0                             ; 5DE7 A5 A0                    ..
	sta     L5CD2                           ; 5DE9 8D D2 5C                 ..\
	lda     L5CD2                           ; 5DEC AD D2 5C                 ..\
	eor     #$01                            ; 5DEF 49 01                    I.
	lbne	L5DFC
	jsr     sub_4961
	jmp     L5E09                           ; 5DF9 4C 09 5E                 L.^

; ----------------------------------------------------------------------------
L5DFC:  lda     L5CD2                           ; 5DFC AD D2 5C                 ..\
	eor     #$02                            ; 5DFF 49 02                    I.
	beq     L5E06                           ; 5E01 F0 03                    ..
	jmp     L5E09                           ; 5E03 4C 09 5E                 L.^

; ----------------------------------------------------------------------------
L5E06:  jsr     L5A67                           ; 5E06 20 67 5A                  gZ
L5E09:  lda     #$00                            ; 5E09 A9 00                    ..
	jsr     sub_38D6                        ; 5E0B 20 D6 38                  .8
	lda     L2CF2                           ; 5E0E AD F2 2C                 ..,
	beq     L5E16                           ; 5E11 F0 03                    ..
	jmp     L5DDF                           ; 5E13 4C DF 5D                 L.]

; ----------------------------------------------------------------------------
L5E16:  jsr     sub_3DEC
	lda     #$7D                            ; 5E19 A9 7D                    .}
	jsr     sub_31C7
	jmp     L5E37                           ; 5E1E 4C 37 5E                 L7^

; ----------------------------------------------------------------------------
L5E21:	.byte	$15," "
	Inverse	" Accessing GCP, Inc "

; ----------------------------------------------------------------------------
L5E37:  lda     #>L5E21
	sta     $A3                             ; 5E39 85 A3                    ..
	ldy     #<L5E21
	ldx     #$0A                            ; 5E3D A2 0A                    ..
	lda     #$08                            ; 5E3F A9 08                    ..
	jsr     sub_3BEB
	ldy     #$0F                            ; 5E44 A0 0F                    ..
	ldx     #$00                            ; 5E46 A2 00                    ..
	lda     #$00                            ; 5E48 A9 00                    ..
	jsr     sub_3405
	jsr     sub_483A
	jmp     L5E56                           ; 5E50 4C 56 5E                 LV^

; ----------------------------------------------------------------------------
L5E53:	.byte   $02,"Cs"

; ----------------------------------------------------------------------------
L5E56:	ldi	$A3, $00
	dmv	off_AE, L5CDF
	ldi	$A5, $00
	ldp8	$A4
	add16i	$A6, L5CDF, $0001
	ldy     #$6C                            ; 5E7D A0 6C                    .l
	ldxai	L5E53
	jsr     PutPkt
	jsr     sub_47DB
	lda     #$7D                            ; 5E89 A9 7D                    .}
	jsr     sub_31C7 			; writechr
	jmp     L5EAB                           ; 5E8E 4C AB 5E                 L.^

; ----------------------------------------------------------------------------
L5E91:	.byte	$19
	Inverse	" Booting in Main Program "

; ----------------------------------------------------------------------------
L5EAB:	ldi	$A3, >L5E91
	ldy     #<L5E91
	ldx     #$0A                            ; 5EB1 A2 0A                    ..
	lda     #$06                            ; 5EB3 A9 06                    ..
	jsr     sub_3BEB
	jsr     sub_3C80
	jmp     L5ECA                           ; 5EBB 4C CA 5E                 L.^

; ----------------------------------------------------------------------------
L5EBE:	.byte	$0B,"D1:TERM.COM"

; ----------------------------------------------------------------------------
L5ECA:  ldx     #>L5EBE
	lda     #<L5EBE
	jsr     sub_3545
	jsr     sub_38FE
	rts                                     ; 5ED4 60                       `

; ----------------------------------------------------------------------------
	rts                                     ; 5ED5 60                       `

; ----------------------------------------------------------------------------

	.segment "HDR01"

	.addr	$02E2
	.addr	$02E3

	.segment "SEG01"

	.addr	sub_5CE1

; vim: set syntax=
