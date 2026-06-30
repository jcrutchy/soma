	.file "soma_types.pas"
# Begin asmlist al_typedconsts

.section .data.n_TC_$SOMA_TYPES_$$_VALID_OPCODES,"d"
	.balign 2
.globl	TC_$SOMA_TYPES_$$_VALID_OPCODES
TC_$SOMA_TYPES_$$_VALID_OPCODES:
	.short	0,1,2,3,4,5,6,7,16,17,18,19,20,21,22,23,24,32,33,34,35,36,37,38,48,49,50,51,52,53,64,65,66,67,68,69,80,81,82,83
	.short	96,97,98,99,100,112,113,114,115,116,117,118,119,128,129,130,131,132,133,144,145,160,161,162,163
	.short	164,165
# [soma_types.pas]
# [182] HR_NONE         = 0;
# End asmlist al_typedconsts
# Begin asmlist al_rtti

.section .rodata.n_INIT_$SOMA_TYPES_$$_TINSTRUCTION,"d"
	.balign 8
.globl	INIT_$SOMA_TYPES_$$_TINSTRUCTION
INIT_$SOMA_TYPES_$$_TINSTRUCTION:
	.byte	13,12
# [246] 
	.ascii	"TInstruction"
	.quad	0
	.long	8
	.quad	0,0
	.long	0

.section .rodata.n_RTTI_$SOMA_TYPES_$$_TINSTRUCTION,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_TINSTRUCTION
RTTI_$SOMA_TYPES_$$_TINSTRUCTION:
	.byte	13,12
	.ascii	"TInstruction"
	.quad	INIT_$SOMA_TYPES_$$_TINSTRUCTION
	.long	8,4
	.quad	RTTI_$SYSTEM_$$_WORD$indirect
	.quad	0
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect
	.quad	2
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect
	.quad	3
	.quad	RTTI_$SYSTEM_$$_LONGINT$indirect
	.quad	4

.section .rodata.n_INIT_$SOMA_TYPES_$$_TGENOME,"d"
	.balign 8
.globl	INIT_$SOMA_TYPES_$$_TGENOME
INIT_$SOMA_TYPES_$$_TGENOME:
	.byte	12,7
	.ascii	"TGenome"
	.quad	32768,4096
	.quad	INIT_$SOMA_TYPES_$$_TINSTRUCTION$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SMALLINT$indirect

.section .rodata.n_RTTI_$SOMA_TYPES_$$_TGENOME,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_TGENOME
RTTI_$SOMA_TYPES_$$_TGENOME:
	.byte	12,7
	.ascii	"TGenome"
	.quad	32768,4096
	.quad	RTTI_$SOMA_TYPES_$$_TINSTRUCTION$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SMALLINT$indirect

.section .rodata.n_INIT_$SOMA_TYPES_$$_TVMSTATE,"d"
	.balign 8
.globl	INIT_$SOMA_TYPES_$$_TVMSTATE
INIT_$SOMA_TYPES_$$_TVMSTATE:
	.byte	13,8
	.ascii	"TVMState"
	.quad	0
	.long	36928
	.quad	0,0
	.long	0

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000004,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000004
RTTI_$SOMA_TYPES_$$_def00000004:
	.byte	12,0
	.quad	2048,256
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000005,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000005
RTTI_$SOMA_TYPES_$$_def00000005:
	.byte	12,0
	.quad	2048,256
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000006,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000006
RTTI_$SOMA_TYPES_$$_def00000006:
	.byte	12,0
	.quad	24,24
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect

.section .rodata.n_RTTI_$SOMA_TYPES_$$_TVMSTATE,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_TVMSTATE
RTTI_$SOMA_TYPES_$$_TVMSTATE:
	.byte	13,8
	.ascii	"TVMState"
	.quad	INIT_$SOMA_TYPES_$$_TVMSTATE
	.long	36928,9
	.quad	RTTI_$SOMA_TYPES_$$_def00000004$indirect
	.quad	0
	.quad	RTTI_$SOMA_TYPES_$$_def00000005$indirect
	.quad	2048
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.quad	4096
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.quad	4104
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.quad	4112
	.quad	RTTI_$SYSTEM_$$_QWORD$indirect
	.quad	4120
	.quad	RTTI_$SYSTEM_$$_QWORD$indirect
	.quad	4128
	.quad	RTTI_$SOMA_TYPES_$$_TGENOME$indirect
	.quad	4136
	.quad	RTTI_$SOMA_TYPES_$$_def00000006$indirect
	.quad	36904

.section .rodata.n_INIT_$SOMA_TYPES_$$_TFITNESSRESULT,"d"
	.balign 8
.globl	INIT_$SOMA_TYPES_$$_TFITNESSRESULT
INIT_$SOMA_TYPES_$$_TFITNESSRESULT:
	.byte	13,14
	.ascii	"TFitnessResult"
	.quad	0
	.long	112
	.quad	0,0
	.long	0

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000008,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000008
RTTI_$SOMA_TYPES_$$_def00000008:
	.byte	12,0
	.quad	64,8
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000009,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000009
RTTI_$SOMA_TYPES_$$_def00000009:
	.byte	12,0
	.quad	32,32
	.quad	RTTI_$SYSTEM_$$_CHAR$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect

.section .rodata.n_RTTI_$SOMA_TYPES_$$_TFITNESSRESULT,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_TFITNESSRESULT
RTTI_$SOMA_TYPES_$$_TFITNESSRESULT:
	.byte	13,14
	.ascii	"TFitnessResult"
	.quad	INIT_$SOMA_TYPES_$$_TFITNESSRESULT
	.long	112,5
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.quad	0
	.quad	RTTI_$SOMA_TYPES_$$_def00000008$indirect
	.quad	8
	.quad	RTTI_$SOMA_TYPES_$$_def00000009$indirect
	.quad	72
	.quad	RTTI_$SYSTEM_$$_WORD$indirect
	.quad	104
	.quad	RTTI_$SYSTEM_$$_BOOLEAN$indirect
	.quad	106

.section .rodata.n_RTTI_$SOMA_TYPES_$$_TFITNESSFN,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_TFITNESSFN
RTTI_$SOMA_TYPES_$$_TFITNESSFN:
	.byte	23,10
	.ascii	"TFitnessFn"
	.byte	0,3
	.quad	RTTI_$SYSTEM_$$_BOOLEAN$indirect
	.byte	3
	.short	2
	.quad	RTTI_$SYSTEM_$$_POINTER$indirect
	.byte	6
	.ascii	"genome"
	.short	0
	.quad	RTTI_$SYSTEM_$$_LONGWORD$indirect
	.byte	11
	.ascii	"genome_size"
	.short	32
	.quad	RTTI_$SOMA_TYPES_$$_TFITNESSRESULT$indirect
	.byte	6
	.ascii	"result"
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .rodata.n_INIT_$SOMA_TYPES_$$_TINSTRUCTION,"d"
	.balign 8
.globl	INIT_$SOMA_TYPES_$$_TINSTRUCTION$indirect
INIT_$SOMA_TYPES_$$_TINSTRUCTION$indirect:
	.quad	INIT_$SOMA_TYPES_$$_TINSTRUCTION

.section .rodata.n_RTTI_$SOMA_TYPES_$$_TINSTRUCTION,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_TINSTRUCTION$indirect
RTTI_$SOMA_TYPES_$$_TINSTRUCTION$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_TINSTRUCTION

.section .rodata.n_INIT_$SOMA_TYPES_$$_TGENOME,"d"
	.balign 8
.globl	INIT_$SOMA_TYPES_$$_TGENOME$indirect
INIT_$SOMA_TYPES_$$_TGENOME$indirect:
	.quad	INIT_$SOMA_TYPES_$$_TGENOME

.section .rodata.n_RTTI_$SOMA_TYPES_$$_TGENOME,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_TGENOME$indirect
RTTI_$SOMA_TYPES_$$_TGENOME$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_TGENOME

.section .rodata.n_INIT_$SOMA_TYPES_$$_TVMSTATE,"d"
	.balign 8
.globl	INIT_$SOMA_TYPES_$$_TVMSTATE$indirect
INIT_$SOMA_TYPES_$$_TVMSTATE$indirect:
	.quad	INIT_$SOMA_TYPES_$$_TVMSTATE

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000004,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000004$indirect
RTTI_$SOMA_TYPES_$$_def00000004$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_def00000004

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000005,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000005$indirect
RTTI_$SOMA_TYPES_$$_def00000005$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_def00000005

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000006,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000006$indirect
RTTI_$SOMA_TYPES_$$_def00000006$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_def00000006

.section .rodata.n_RTTI_$SOMA_TYPES_$$_TVMSTATE,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_TVMSTATE$indirect
RTTI_$SOMA_TYPES_$$_TVMSTATE$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_TVMSTATE

.section .rodata.n_INIT_$SOMA_TYPES_$$_TFITNESSRESULT,"d"
	.balign 8
.globl	INIT_$SOMA_TYPES_$$_TFITNESSRESULT$indirect
INIT_$SOMA_TYPES_$$_TFITNESSRESULT$indirect:
	.quad	INIT_$SOMA_TYPES_$$_TFITNESSRESULT

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000008,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000008$indirect
RTTI_$SOMA_TYPES_$$_def00000008$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_def00000008

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000009,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000009$indirect
RTTI_$SOMA_TYPES_$$_def00000009$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_def00000009

.section .rodata.n_RTTI_$SOMA_TYPES_$$_TFITNESSRESULT,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_TFITNESSRESULT$indirect
RTTI_$SOMA_TYPES_$$_TFITNESSRESULT$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_TFITNESSRESULT

.section .rodata.n_RTTI_$SOMA_TYPES_$$_TFITNESSFN,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_TFITNESSFN$indirect
RTTI_$SOMA_TYPES_$$_TFITNESSFN$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_TFITNESSFN
# End asmlist al_indirectglobals
# Begin asmlist al_dwarf_frame

.section .debug_frame
	.long	.Lc3-.Lc2
.Lc2:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	16
	.byte	12
	.uleb128	7
	.uleb128	8
	.byte	5
	.uleb128	16
	.uleb128	2
	.balign 4,0
.Lc3:
# End asmlist al_dwarf_frame

