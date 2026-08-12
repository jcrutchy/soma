	.file "soma_types.pas"
# Begin asmlist al_begin

.section .debug_line
.Ldebug_linesection0:
.Ldebug_line0:

.section .debug_abbrev
.Ldebug_abbrevsection0:
.Ldebug_abbrev0:

.section .text.b_DEBUGSTART_$SOMA_TYPES,"x"
.globl	DEBUGSTART_$SOMA_TYPES
DEBUGSTART_$SOMA_TYPES:
# End asmlist al_begin
# Begin asmlist al_typedconsts

.section .data.n_TC_$SOMA_TYPES_$$_VALID_OPCODES,"d"
	.balign 2
.globl	TC_$SOMA_TYPES_$$_VALID_OPCODES
TC_$SOMA_TYPES_$$_VALID_OPCODES:
	.short	0,1,2,3,4,5,6,7,16,17,18,19,20,21,22,23,24,32,33,34,35,36,37,38,48,49,50,51,52,53,64,65,66,67,68,69,80,81,82,83
	.short	96,97,98,99,100,112,113,114,115,116,117,118,119,128,129,130,131,132,133,144,145,160,161,162,163
	.short	164,165
# [soma_types.pas]
# [224] NEURAL_OPCODE_COUNT = 7;

.section .data.n_TC_$SOMA_TYPES_$$_NEURAL_OPCODES,"d"
	.balign 2
.globl	TC_$SOMA_TYPES_$$_NEURAL_OPCODES
TC_$SOMA_TYPES_$$_NEURAL_OPCODES:
	.short	176,177,178,179,180,181,182
# [231] HR_NONE         = 0;
# End asmlist al_typedconsts
# Begin asmlist al_rtti

.section .rodata.n_INIT_$SOMA_TYPES_$$_TINSTRUCTION,"d"
	.balign 8
.globl	INIT_$SOMA_TYPES_$$_TINSTRUCTION
INIT_$SOMA_TYPES_$$_TINSTRUCTION:
	.byte	13,12
# [344] 
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
	.long	37184
	.quad	0,0
	.long	0

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000005,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000005
RTTI_$SOMA_TYPES_$$_def00000005:
	.byte	12,0
	.quad	256,256
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000006,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000006
RTTI_$SOMA_TYPES_$$_def00000006:
	.byte	12,0
	.quad	2048,256
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000007,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000007
RTTI_$SOMA_TYPES_$$_def00000007:
	.byte	12,0
	.quad	2048,256
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000008,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000008
RTTI_$SOMA_TYPES_$$_def00000008:
	.byte	12,0
	.quad	16,16
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
	.long	37184,11
	.quad	RTTI_$SOMA_TYPES_$$_def00000005$indirect
	.quad	0
	.quad	RTTI_$SOMA_TYPES_$$_def00000006$indirect
	.quad	256
	.quad	RTTI_$SOMA_TYPES_$$_def00000007$indirect
	.quad	2304
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.quad	4352
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.quad	4360
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.quad	4368
	.quad	RTTI_$SYSTEM_$$_QWORD$indirect
	.quad	4376
	.quad	RTTI_$SYSTEM_$$_QWORD$indirect
	.quad	4384
	.quad	RTTI_$SOMA_TYPES_$$_TGENOME$indirect
	.quad	4392
	.quad	RTTI_$SYSTEM_$$_QWORD$indirect
	.quad	37160
	.quad	RTTI_$SOMA_TYPES_$$_def00000008$indirect
	.quad	37168

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

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def0000000A,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def0000000A
RTTI_$SOMA_TYPES_$$_def0000000A:
	.byte	12,0
	.quad	64,8
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def0000000B,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def0000000B
RTTI_$SOMA_TYPES_$$_def0000000B:
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
	.quad	RTTI_$SOMA_TYPES_$$_def0000000A$indirect
	.quad	8
	.quad	RTTI_$SOMA_TYPES_$$_def0000000B$indirect
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

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000007,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000007$indirect
RTTI_$SOMA_TYPES_$$_def00000007$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_def00000007

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def00000008,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def00000008$indirect
RTTI_$SOMA_TYPES_$$_def00000008$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_def00000008

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

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def0000000A,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def0000000A$indirect
RTTI_$SOMA_TYPES_$$_def0000000A$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_def0000000A

.section .rodata.n_RTTI_$SOMA_TYPES_$$_def0000000B,"d"
	.balign 8
.globl	RTTI_$SOMA_TYPES_$$_def0000000B$indirect
RTTI_$SOMA_TYPES_$$_def0000000B$indirect:
	.quad	RTTI_$SOMA_TYPES_$$_def0000000B

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
# Begin asmlist al_dwarf_info

.section .debug_info
.Ldebug_info0:
	.long	.Ledebug_info0-.Lf2
.Lf2:
	.short	3
	.secrel32	.Ldebug_abbrev0
	.byte	8
	.uleb128	1
# [328] initialization
	.ascii	"soma_types.pas\000"
	.ascii	"Free Pascal 3.2.2 2026/06/06\000"
	.ascii	"C:/dev/soma/\000"
	.byte	9
	.byte	3
	.secrel32	.Ldebug_line0
	.quad	DEBUGSTART_$SOMA_TYPES
	.quad	DEBUGEND_$SOMA_TYPES
# Syms - Begin unit SOMA_TYPES has index 8
# Symbol SOMA_TYPES
# Symbol SYSTEM
# Symbol OBJPAS
# Symbol GENOME_SIZE
	.uleb128	2
	.ascii	"GENOME_SIZE\000"
	.long	.La1-.Ldebug_info0
	.uleb128	4096
# Symbol STACK_SIZE
	.uleb128	2
	.ascii	"STACK_SIZE\000"
	.long	.La1-.Ldebug_info0
	.uleb128	256
# Symbol STACK_GUARD_BYTES
	.uleb128	2
	.ascii	"STACK_GUARD_BYTES\000"
	.long	.La1-.Ldebug_info0
	.uleb128	256
# Symbol ISTACK_OFFSET
	.uleb128	2
	.ascii	"ISTACK_OFFSET\000"
	.long	.La1-.Ldebug_info0
	.uleb128	256
# Symbol FSTACK_OFFSET
	.uleb128	2
	.ascii	"FSTACK_OFFSET\000"
	.long	.La1-.Ldebug_info0
	.uleb128	2304
# Symbol ISP_OFFSET
	.uleb128	2
	.ascii	"ISP_OFFSET\000"
	.long	.La1-.Ldebug_info0
	.uleb128	4352
# Symbol FSP_OFFSET
	.uleb128	2
	.ascii	"FSP_OFFSET\000"
	.long	.La1-.Ldebug_info0
	.uleb128	4360
# Symbol IP_OFFSET
	.uleb128	2
	.ascii	"IP_OFFSET\000"
	.long	.La1-.Ldebug_info0
	.uleb128	4368
# Symbol RNG_OFFSET
	.uleb128	2
	.ascii	"RNG_OFFSET\000"
	.long	.La1-.Ldebug_info0
	.uleb128	4376
# Symbol HALT_REASON_OFFSET
	.uleb128	2
	.ascii	"HALT_REASON_OFFSET\000"
	.long	.La1-.Ldebug_info0
	.uleb128	4384
# Symbol GENOME_OFFSET
	.uleb128	2
	.ascii	"GENOME_OFFSET\000"
	.long	.La1-.Ldebug_info0
	.uleb128	4392
# Symbol EXEC_COUNT_OFFSET
	.uleb128	2
	.ascii	"EXEC_COUNT_OFFSET\000"
	.long	.La3-.Ldebug_info0
	.uleb128	37160
# Symbol BASE_SIZE
	.uleb128	2
	.ascii	"BASE_SIZE\000"
	.long	.La3-.Ldebug_info0
	.uleb128	37168
# Symbol N_PAD
	.uleb128	2
	.ascii	"N_PAD\000"
	.long	.La5-.Ldebug_info0
	.uleb128	16
# Symbol LAYER0_MAX
	.uleb128	2
	.ascii	"LAYER0_MAX\000"
	.long	.La7-.Ldebug_info0
	.uleb128	255
# Symbol LAYER1_BASE
	.uleb128	2
	.ascii	"LAYER1_BASE\000"
	.long	.La1-.Ldebug_info0
	.uleb128	256
# Symbol LAYER1_MAX
	.uleb128	2
	.ascii	"LAYER1_MAX\000"
	.long	.La1-.Ldebug_info0
	.uleb128	511
# Symbol LAYER2_BASE
	.uleb128	2
	.ascii	"LAYER2_BASE\000"
	.long	.La1-.Ldebug_info0
	.uleb128	512
# Symbol LAYER2_MAX
	.uleb128	2
	.ascii	"LAYER2_MAX\000"
	.long	.La1-.Ldebug_info0
	.uleb128	767
# Symbol SYS_BASE
	.uleb128	2
	.ascii	"SYS_BASE\000"
	.long	.La3-.Ldebug_info0
	.uleb128	65280
# Symbol OP_NOP
	.uleb128	2
	.ascii	"OP_NOP\000"
	.long	.La5-.Ldebug_info0
	.uleb128	0
# Symbol OP_PUSH
	.uleb128	2
	.ascii	"OP_PUSH\000"
	.long	.La5-.Ldebug_info0
	.uleb128	1
# Symbol OP_POP
	.uleb128	2
	.ascii	"OP_POP\000"
	.long	.La5-.Ldebug_info0
	.uleb128	2
# Symbol OP_DUP
	.uleb128	2
	.ascii	"OP_DUP\000"
	.long	.La5-.Ldebug_info0
	.uleb128	3
# Symbol OP_SWAP
	.uleb128	2
	.ascii	"OP_SWAP\000"
	.long	.La5-.Ldebug_info0
	.uleb128	4
# Symbol OP_OVER
	.uleb128	2
	.ascii	"OP_OVER\000"
	.long	.La5-.Ldebug_info0
	.uleb128	5
# Symbol OP_ROT
	.uleb128	2
	.ascii	"OP_ROT\000"
	.long	.La5-.Ldebug_info0
	.uleb128	6
# Symbol OP_DROP
	.uleb128	2
	.ascii	"OP_DROP\000"
	.long	.La5-.Ldebug_info0
	.uleb128	7
# Symbol OP_ADD
	.uleb128	2
	.ascii	"OP_ADD\000"
	.long	.La5-.Ldebug_info0
	.uleb128	16
# Symbol OP_SUB
	.uleb128	2
	.ascii	"OP_SUB\000"
	.long	.La5-.Ldebug_info0
	.uleb128	17
# Symbol OP_MUL
	.uleb128	2
	.ascii	"OP_MUL\000"
	.long	.La5-.Ldebug_info0
	.uleb128	18
# Symbol OP_DIV
	.uleb128	2
	.ascii	"OP_DIV\000"
	.long	.La5-.Ldebug_info0
	.uleb128	19
# Symbol OP_MOD
	.uleb128	2
	.ascii	"OP_MOD\000"
	.long	.La5-.Ldebug_info0
	.uleb128	20
# Symbol OP_NEG
	.uleb128	2
	.ascii	"OP_NEG\000"
	.long	.La5-.Ldebug_info0
	.uleb128	21
# Symbol OP_ABS
	.uleb128	2
	.ascii	"OP_ABS\000"
	.long	.La5-.Ldebug_info0
	.uleb128	22
# Symbol OP_INC
	.uleb128	2
	.ascii	"OP_INC\000"
	.long	.La5-.Ldebug_info0
	.uleb128	23
# Symbol OP_DEC
	.uleb128	2
	.ascii	"OP_DEC\000"
	.long	.La5-.Ldebug_info0
	.uleb128	24
# Symbol OP_AND
	.uleb128	2
	.ascii	"OP_AND\000"
	.long	.La5-.Ldebug_info0
	.uleb128	32
# Symbol OP_OR
	.uleb128	2
	.ascii	"OP_OR\000"
	.long	.La5-.Ldebug_info0
	.uleb128	33
# Symbol OP_XOR
	.uleb128	2
	.ascii	"OP_XOR\000"
	.long	.La5-.Ldebug_info0
	.uleb128	34
# Symbol OP_NOT
	.uleb128	2
	.ascii	"OP_NOT\000"
	.long	.La5-.Ldebug_info0
	.uleb128	35
# Symbol OP_SHL
	.uleb128	2
	.ascii	"OP_SHL\000"
	.long	.La5-.Ldebug_info0
	.uleb128	36
# Symbol OP_SHR
	.uleb128	2
	.ascii	"OP_SHR\000"
	.long	.La5-.Ldebug_info0
	.uleb128	37
# Symbol OP_SAR
	.uleb128	2
	.ascii	"OP_SAR\000"
	.long	.La5-.Ldebug_info0
	.uleb128	38
# Symbol OP_EQ
	.uleb128	2
	.ascii	"OP_EQ\000"
	.long	.La5-.Ldebug_info0
	.uleb128	48
# Symbol OP_NEQ
	.uleb128	2
	.ascii	"OP_NEQ\000"
	.long	.La5-.Ldebug_info0
	.uleb128	49
# Symbol OP_LT
	.uleb128	2
	.ascii	"OP_LT\000"
	.long	.La5-.Ldebug_info0
	.uleb128	50
# Symbol OP_GT
	.uleb128	2
	.ascii	"OP_GT\000"
	.long	.La5-.Ldebug_info0
	.uleb128	51
# Symbol OP_LTE
	.uleb128	2
	.ascii	"OP_LTE\000"
	.long	.La5-.Ldebug_info0
	.uleb128	52
# Symbol OP_GTE
	.uleb128	2
	.ascii	"OP_GTE\000"
	.long	.La5-.Ldebug_info0
	.uleb128	53
# Symbol OP_JMP
	.uleb128	2
	.ascii	"OP_JMP\000"
	.long	.La5-.Ldebug_info0
	.uleb128	64
# Symbol OP_JZ
	.uleb128	2
	.ascii	"OP_JZ\000"
	.long	.La5-.Ldebug_info0
	.uleb128	65
# Symbol OP_JNZ
	.uleb128	2
	.ascii	"OP_JNZ\000"
	.long	.La5-.Ldebug_info0
	.uleb128	66
# Symbol OP_CALL
	.uleb128	2
	.ascii	"OP_CALL\000"
	.long	.La5-.Ldebug_info0
	.uleb128	67
# Symbol OP_RET
	.uleb128	2
	.ascii	"OP_RET\000"
	.long	.La5-.Ldebug_info0
	.uleb128	68
# Symbol OP_HALT
	.uleb128	2
	.ascii	"OP_HALT\000"
	.long	.La5-.Ldebug_info0
	.uleb128	69
# Symbol OP_LOAD
	.uleb128	2
	.ascii	"OP_LOAD\000"
	.long	.La5-.Ldebug_info0
	.uleb128	80
# Symbol OP_STORE
	.uleb128	2
	.ascii	"OP_STORE\000"
	.long	.La5-.Ldebug_info0
	.uleb128	81
# Symbol OP_MLOAD
	.uleb128	2
	.ascii	"OP_MLOAD\000"
	.long	.La5-.Ldebug_info0
	.uleb128	82
# Symbol OP_MSTORE
	.uleb128	2
	.ascii	"OP_MSTORE\000"
	.long	.La5-.Ldebug_info0
	.uleb128	83
# Symbol OP_FPUSH
	.uleb128	2
	.ascii	"OP_FPUSH\000"
	.long	.La5-.Ldebug_info0
	.uleb128	96
# Symbol OP_FPOP
	.uleb128	2
	.ascii	"OP_FPOP\000"
	.long	.La5-.Ldebug_info0
	.uleb128	97
# Symbol OP_FDUP
	.uleb128	2
	.ascii	"OP_FDUP\000"
	.long	.La5-.Ldebug_info0
	.uleb128	98
# Symbol OP_FSWAP
	.uleb128	2
	.ascii	"OP_FSWAP\000"
	.long	.La5-.Ldebug_info0
	.uleb128	99
# Symbol OP_FDROP
	.uleb128	2
	.ascii	"OP_FDROP\000"
	.long	.La5-.Ldebug_info0
	.uleb128	100
# Symbol OP_FADD
	.uleb128	2
	.ascii	"OP_FADD\000"
	.long	.La5-.Ldebug_info0
	.uleb128	112
# Symbol OP_FSUB
	.uleb128	2
	.ascii	"OP_FSUB\000"
	.long	.La5-.Ldebug_info0
	.uleb128	113
# Symbol OP_FMUL
	.uleb128	2
	.ascii	"OP_FMUL\000"
	.long	.La5-.Ldebug_info0
	.uleb128	114
# Symbol OP_FDIV
	.uleb128	2
	.ascii	"OP_FDIV\000"
	.long	.La5-.Ldebug_info0
	.uleb128	115
# Symbol OP_FNEG
	.uleb128	2
	.ascii	"OP_FNEG\000"
	.long	.La5-.Ldebug_info0
	.uleb128	116
# Symbol OP_FABS
	.uleb128	2
	.ascii	"OP_FABS\000"
	.long	.La5-.Ldebug_info0
	.uleb128	117
# Symbol OP_FSQRT
	.uleb128	2
	.ascii	"OP_FSQRT\000"
	.long	.La5-.Ldebug_info0
	.uleb128	118
# Symbol OP_FMOD
	.uleb128	2
	.ascii	"OP_FMOD\000"
	.long	.La5-.Ldebug_info0
	.uleb128	119
# Symbol OP_FEQ
	.uleb128	2
	.ascii	"OP_FEQ\000"
	.long	.La7-.Ldebug_info0
	.uleb128	128
# Symbol OP_FNEQ
	.uleb128	2
	.ascii	"OP_FNEQ\000"
	.long	.La7-.Ldebug_info0
	.uleb128	129
# Symbol OP_FLT
	.uleb128	2
	.ascii	"OP_FLT\000"
	.long	.La7-.Ldebug_info0
	.uleb128	130
# Symbol OP_FGT
	.uleb128	2
	.ascii	"OP_FGT\000"
	.long	.La7-.Ldebug_info0
	.uleb128	131
# Symbol OP_FLTE
	.uleb128	2
	.ascii	"OP_FLTE\000"
	.long	.La7-.Ldebug_info0
	.uleb128	132
# Symbol OP_FGTE
	.uleb128	2
	.ascii	"OP_FGTE\000"
	.long	.La7-.Ldebug_info0
	.uleb128	133
# Symbol OP_I2F
	.uleb128	2
	.ascii	"OP_I2F\000"
	.long	.La7-.Ldebug_info0
	.uleb128	144
# Symbol OP_F2I
	.uleb128	2
	.ascii	"OP_F2I\000"
	.long	.La7-.Ldebug_info0
	.uleb128	145
# Symbol OP_RAND
	.uleb128	2
	.ascii	"OP_RAND\000"
	.long	.La7-.Ldebug_info0
	.uleb128	160
# Symbol OP_FRAND
	.uleb128	2
	.ascii	"OP_FRAND\000"
	.long	.La7-.Ldebug_info0
	.uleb128	161
# Symbol OP_PCNT
	.uleb128	2
	.ascii	"OP_PCNT\000"
	.long	.La7-.Ldebug_info0
	.uleb128	162
# Symbol OP_YIELD
	.uleb128	2
	.ascii	"OP_YIELD\000"
	.long	.La7-.Ldebug_info0
	.uleb128	163
# Symbol OP_IN
	.uleb128	2
	.ascii	"OP_IN\000"
	.long	.La7-.Ldebug_info0
	.uleb128	164
# Symbol OP_OUT
	.uleb128	2
	.ascii	"OP_OUT\000"
	.long	.La7-.Ldebug_info0
	.uleb128	165
# Symbol OP_VDOT
	.uleb128	2
	.ascii	"OP_VDOT\000"
	.long	.La7-.Ldebug_info0
	.uleb128	176
# Symbol OP_MATVEC
	.uleb128	2
	.ascii	"OP_MATVEC\000"
	.long	.La7-.Ldebug_info0
	.uleb128	177
# Symbol OP_MATINV
	.uleb128	2
	.ascii	"OP_MATINV\000"
	.long	.La7-.Ldebug_info0
	.uleb128	178
# Symbol OP_FMA
	.uleb128	2
	.ascii	"OP_FMA\000"
	.long	.La7-.Ldebug_info0
	.uleb128	179
# Symbol OP_SIGMOID
	.uleb128	2
	.ascii	"OP_SIGMOID\000"
	.long	.La7-.Ldebug_info0
	.uleb128	180
# Symbol OP_TANH
	.uleb128	2
	.ascii	"OP_TANH\000"
	.long	.La7-.Ldebug_info0
	.uleb128	181
# Symbol OP_RELU
	.uleb128	2
	.ascii	"OP_RELU\000"
	.long	.La7-.Ldebug_info0
	.uleb128	182
# Symbol VALID_OPCODE_COUNT
	.uleb128	2
	.ascii	"VALID_OPCODE_COUNT\000"
	.long	.La5-.Ldebug_info0
	.uleb128	67
# Symbol VALID_OPCODES
	.uleb128	3
	.ascii	"VALID_OPCODES\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	TC_$SOMA_TYPES_$$_VALID_OPCODES
	.long	.La9-.Ldebug_info0
# Symbol NEURAL_OPCODE_COUNT
	.uleb128	2
	.ascii	"NEURAL_OPCODE_COUNT\000"
	.long	.La5-.Ldebug_info0
	.uleb128	7
# Symbol NEURAL_OPCODES
	.uleb128	3
	.ascii	"NEURAL_OPCODES\000"
	.byte	1
	.byte	9
	.byte	3
	.quad	TC_$SOMA_TYPES_$$_NEURAL_OPCODES
	.long	.La11-.Ldebug_info0
# Symbol HR_NONE
	.uleb128	2
	.ascii	"HR_NONE\000"
	.long	.La5-.Ldebug_info0
	.uleb128	0
# Symbol HR_HALT
	.uleb128	2
	.ascii	"HR_HALT\000"
	.long	.La5-.Ldebug_info0
	.uleb128	1
# Symbol HR_YIELD
	.uleb128	2
	.ascii	"HR_YIELD\000"
	.long	.La5-.Ldebug_info0
	.uleb128	2
# Symbol HR_BOUNDS
	.uleb128	2
	.ascii	"HR_BOUNDS\000"
	.long	.La5-.Ldebug_info0
	.uleb128	3
# Symbol HR_DIV_ZERO
	.uleb128	2
	.ascii	"HR_DIV_ZERO\000"
	.long	.La5-.Ldebug_info0
	.uleb128	4
# Symbol HR_FDIV_ZERO
	.uleb128	2
	.ascii	"HR_FDIV_ZERO\000"
	.long	.La5-.Ldebug_info0
	.uleb128	5
# Symbol HR_UNUSED
	.uleb128	2
	.ascii	"HR_UNUSED\000"
	.long	.La5-.Ldebug_info0
	.uleb128	6
# Symbol HR_HIGHER_LAYER
	.uleb128	2
	.ascii	"HR_HIGHER_LAYER\000"
	.long	.La5-.Ldebug_info0
	.uleb128	7
# Symbol HR_SINGULAR_MATRIX
	.uleb128	2
	.ascii	"HR_SINGULAR_MATRIX\000"
	.long	.La5-.Ldebug_info0
	.uleb128	8
# Symbol HR_BAD_OPERAND
	.uleb128	2
	.ascii	"HR_BAD_OPERAND\000"
	.long	.La5-.Ldebug_info0
	.uleb128	9
# Symbol HR_INSUFFICIENT_STACK
	.uleb128	2
	.ascii	"HR_INSUFFICIENT_STACK\000"
	.long	.La5-.Ldebug_info0
	.uleb128	12
# Symbol HR_INT_OVERFLOW
	.uleb128	2
	.ascii	"HR_INT_OVERFLOW\000"
	.long	.La5-.Ldebug_info0
	.uleb128	11
# Symbol HR_CYCLE_LIMIT
	.uleb128	2
	.ascii	"HR_CYCLE_LIMIT\000"
	.long	.La5-.Ldebug_info0
	.uleb128	10
# Symbol MAX_NN_WIDTH
	.uleb128	2
	.ascii	"MAX_NN_WIDTH\000"
	.long	.La5-.Ldebug_info0
	.uleb128	8
# Symbol MAX_EXEC_CYCLES
	.uleb128	2
	.ascii	"MAX_EXEC_CYCLES\000"
	.long	.La13-.Ldebug_info0
	.uleb128	65536
# Symbol TINSTRUCTION
# Symbol TGENOME
# Symbol TVMSTATE
# Symbol TFITNESSRESULT
# Symbol TFITNESSFN
# Syms - End unit SOMA_TYPES has index 8
# Syms - Begin Staticsymtable
# Symbol SOMA_TYPES_$$_init$
# Symbol rttidef$INIT_$SOMA_TYPES_$$_TINSTRUCTION
# Symbol rtti_header$12
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_TINSTRUCTION
# Symbol rttidef$INIT_$SOMA_TYPES_$$_TGENOME
# Symbol rtti_normal_array$1
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_TGENOME
# Symbol rttidef$INIT_$SOMA_TYPES_$$_TVMSTATE
# Symbol rtti_header$8
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_def00000005
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_def00000006
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_def00000007
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_def00000008
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_TVMSTATE
# Symbol rttidef$INIT_$SOMA_TYPES_$$_TFITNESSRESULT
# Symbol rtti_header$14
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_def0000000A
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_def0000000B
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_TFITNESSRESULT
# Symbol rttidef$RTTI_$SOMA_TYPES_$$_TFITNESSFN
# Symbol rtti_header$10
# Symbol rtti_proc_param$6
# Symbol rtti_proc_param$11
# Syms - End Staticsymtable
# Defs - Begin unit SYSTEM has index 1
# Definition Byte
.La7:
	.uleb128	4
	.ascii	"Byte\000"
	.long	.La69-.Ldebug_info0
.La69:
	.uleb128	5
	.ascii	"Byte\000"
	.byte	7
	.byte	1
.La8:
	.uleb128	6
	.long	.La7-.Ldebug_info0
# Definition ShortInt
.La5:
	.uleb128	4
	.ascii	"ShortInt\000"
	.long	.La70-.Ldebug_info0
.La70:
	.uleb128	5
	.ascii	"ShortInt\000"
	.byte	5
	.byte	1
.La6:
	.uleb128	6
	.long	.La5-.Ldebug_info0
# Definition Word
.La3:
	.uleb128	4
	.ascii	"Word\000"
	.long	.La71-.Ldebug_info0
.La71:
	.uleb128	5
	.ascii	"Word\000"
	.byte	7
	.byte	2
.La4:
	.uleb128	6
	.long	.La3-.Ldebug_info0
# Definition SmallInt
.La1:
	.uleb128	4
	.ascii	"SmallInt\000"
	.long	.La72-.Ldebug_info0
.La72:
	.uleb128	5
	.ascii	"SmallInt\000"
	.byte	5
	.byte	2
.La2:
	.uleb128	6
	.long	.La1-.Ldebug_info0
# Definition LongInt
.La13:
	.uleb128	4
	.ascii	"LongInt\000"
	.long	.La73-.Ldebug_info0
.La73:
	.uleb128	5
	.ascii	"LongInt\000"
	.byte	5
	.byte	4
.La14:
	.uleb128	6
	.long	.La13-.Ldebug_info0
# Defs - End unit SYSTEM has index 1
# Defs - Begin unit OBJPAS has index 6
# Defs - End unit OBJPAS has index 6
# Defs - Begin unit SOMA_TYPES has index 8
# Definition Array[0..66] Of Word
.La9:
	.uleb128	7
	.uleb128	134
	.long	.La3-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.sleb128	66
	.uleb128	2
	.long	.La5-.Ldebug_info0
	.byte	0
.La10:
	.uleb128	6
	.long	.La9-.Ldebug_info0
# Definition Array[0..6] Of Word
.La11:
	.uleb128	7
	.uleb128	14
	.long	.La3-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.sleb128	6
	.uleb128	2
	.long	.La5-.Ldebug_info0
	.byte	0
.La12:
	.uleb128	6
	.long	.La11-.Ldebug_info0
# Definition TInstruction
.La15:
	.uleb128	4
	.ascii	"TInstruction\000"
	.long	.La74-.Ldebug_info0
.La74:
	.uleb128	9
	.ascii	"TINSTRUCTION\000"
	.uleb128	8
	.uleb128	10
	.ascii	"opcode\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La3-.Ldebug_info0
	.uleb128	10
	.ascii	"flags\000"
	.byte	2
	.byte	35
	.uleb128	2
	.long	.La7-.Ldebug_info0
	.uleb128	10
	.ascii	"pad\000"
	.byte	2
	.byte	35
	.uleb128	3
	.long	.La7-.Ldebug_info0
	.uleb128	10
	.ascii	"imm\000"
	.byte	2
	.byte	35
	.uleb128	4
	.long	.La13-.Ldebug_info0
	.byte	0
.La16:
	.uleb128	6
	.long	.La15-.Ldebug_info0
# Definition TGenome
.La17:
	.uleb128	4
	.ascii	"TGenome\000"
	.long	.La75-.Ldebug_info0
.La75:
	.uleb128	11
	.ascii	"TGenome\000"
	.uleb128	32768
	.long	.La15-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.sleb128	4095
	.uleb128	8
	.long	.La1-.Ldebug_info0
	.byte	0
.La18:
	.uleb128	6
	.long	.La17-.Ldebug_info0
# Definition TVMState
.La19:
	.uleb128	4
	.ascii	"TVMState\000"
	.long	.La76-.Ldebug_info0
.La76:
	.uleb128	9
	.ascii	"TVMSTATE\000"
	.uleb128	37184
	.uleb128	10
	.ascii	"guard\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La77-.Ldebug_info0
	.uleb128	10
	.ascii	"istack\000"
	.byte	3
	.byte	35
	.uleb128	256
	.long	.La79-.Ldebug_info0
	.uleb128	10
	.ascii	"fstack\000"
	.byte	3
	.byte	35
	.uleb128	2304
	.long	.La81-.Ldebug_info0
	.uleb128	10
	.ascii	"isp\000"
	.byte	3
	.byte	35
	.uleb128	4352
	.long	.La83-.Ldebug_info0
	.uleb128	10
	.ascii	"fsp\000"
	.byte	3
	.byte	35
	.uleb128	4360
	.long	.La83-.Ldebug_info0
	.uleb128	10
	.ascii	"ip\000"
	.byte	3
	.byte	35
	.uleb128	4368
	.long	.La83-.Ldebug_info0
	.uleb128	10
	.ascii	"rng_state\000"
	.byte	3
	.byte	35
	.uleb128	4376
	.long	.La85-.Ldebug_info0
	.uleb128	10
	.ascii	"halt_reason\000"
	.byte	3
	.byte	35
	.uleb128	4384
	.long	.La85-.Ldebug_info0
	.uleb128	10
	.ascii	"genome\000"
	.byte	3
	.byte	35
	.uleb128	4392
	.long	.La17-.Ldebug_info0
	.uleb128	10
	.ascii	"exec_count\000"
	.byte	4
	.byte	35
	.uleb128	37160
	.long	.La85-.Ldebug_info0
	.uleb128	10
	.ascii	"pad\000"
	.byte	4
	.byte	35
	.uleb128	37168
	.long	.La87-.Ldebug_info0
	.byte	0
.La20:
	.uleb128	6
	.long	.La19-.Ldebug_info0
# Definition TFitnessResult
.La21:
	.uleb128	4
	.ascii	"TFitnessResult\000"
	.long	.La89-.Ldebug_info0
.La89:
	.uleb128	9
	.ascii	"TFITNESSRESULT\000"
	.uleb128	112
	.uleb128	10
	.ascii	"score\000"
	.byte	2
	.byte	35
	.uleb128	0
	.long	.La90-.Ldebug_info0
	.uleb128	10
	.ascii	"metrics\000"
	.byte	2
	.byte	35
	.uleb128	8
	.long	.La92-.Ldebug_info0
	.uleb128	10
	.ascii	"tag\000"
	.byte	2
	.byte	35
	.uleb128	72
	.long	.La94-.Ldebug_info0
	.uleb128	10
	.ascii	"version\000"
	.byte	2
	.byte	35
	.uleb128	104
	.long	.La3-.Ldebug_info0
	.uleb128	10
	.ascii	"passed\000"
	.byte	2
	.byte	35
	.uleb128	106
	.long	.La96-.Ldebug_info0
	.byte	0
.La22:
	.uleb128	6
	.long	.La21-.Ldebug_info0
# Definition <procedure variable type of function(const Pointer;LongWord;out TFitnessResult):Boolean;StdCall>
.La23:
	.uleb128	4
	.ascii	"TFitnessFn\000"
	.long	.La98-.Ldebug_info0
.La98:
	.uleb128	12
	.ascii	"TFitnessFn\000"
	.byte	1
	.long	.La96-.Ldebug_info0
	.uleb128	13
	.ascii	"genome\000"
	.long	.La99-.Ldebug_info0
	.uleb128	13
	.ascii	"genome_size\000"
	.long	.La101-.Ldebug_info0
	.uleb128	13
	.ascii	"result\000"
	.long	.La21-.Ldebug_info0
	.byte	0
.La24:
	.uleb128	6
	.long	.La23-.Ldebug_info0
# Defs - End unit SOMA_TYPES has index 8
# Defs - Begin Staticsymtable
# Definition <record type>
.La25:
	.uleb128	4
	.ascii	"$rttidef$INIT_$SOMA_TYPES_$$_TINSTRUCTION\000"
	.long	.La103-.Ldebug_info0
.La103:
	.uleb128	9
	.ascii	"$RTTIDEF$INIT_$SOMA_TYPES_$$_TINSTRUCTION\000"
	.uleb128	46
	.byte	0
.La26:
	.uleb128	6
	.long	.La25-.Ldebug_info0
# Definition <record type>
.La27:
	.uleb128	4
	.ascii	"$rtti_header$12\000"
	.long	.La104-.Ldebug_info0
.La104:
	.uleb128	9
	.ascii	"$RTTI_HEADER$12\000"
	.uleb128	14
	.byte	0
.La28:
	.uleb128	6
	.long	.La27-.Ldebug_info0
# Definition <record type>
.La29:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_TINSTRUCTION\000"
	.long	.La105-.Ldebug_info0
.La105:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_TINSTRUCTION\000"
	.uleb128	94
	.byte	0
.La30:
	.uleb128	6
	.long	.La29-.Ldebug_info0
# Definition <record type>
.La31:
	.uleb128	4
	.ascii	"$rttidef$INIT_$SOMA_TYPES_$$_TGENOME\000"
	.long	.La106-.Ldebug_info0
.La106:
	.uleb128	9
	.ascii	"$RTTIDEF$INIT_$SOMA_TYPES_$$_TGENOME\000"
	.uleb128	42
	.byte	0
.La32:
	.uleb128	6
	.long	.La31-.Ldebug_info0
# Definition <record type>
.La33:
	.uleb128	4
	.ascii	"$rtti_normal_array$1\000"
	.long	.La107-.Ldebug_info0
.La107:
	.uleb128	9
	.ascii	"$RTTI_NORMAL_ARRAY$1\000"
	.uleb128	33
	.byte	0
.La34:
	.uleb128	6
	.long	.La33-.Ldebug_info0
# Definition <record type>
.La35:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_TGENOME\000"
	.long	.La108-.Ldebug_info0
.La108:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_TGENOME\000"
	.uleb128	42
	.byte	0
.La36:
	.uleb128	6
	.long	.La35-.Ldebug_info0
# Definition <record type>
.La37:
	.uleb128	4
	.ascii	"$rttidef$INIT_$SOMA_TYPES_$$_TVMSTATE\000"
	.long	.La109-.Ldebug_info0
.La109:
	.uleb128	9
	.ascii	"$RTTIDEF$INIT_$SOMA_TYPES_$$_TVMSTATE\000"
	.uleb128	42
	.byte	0
.La38:
	.uleb128	6
	.long	.La37-.Ldebug_info0
# Definition <record type>
.La39:
	.uleb128	4
	.ascii	"$rtti_header$8\000"
	.long	.La110-.Ldebug_info0
.La110:
	.uleb128	9
	.ascii	"$RTTI_HEADER$8\000"
	.uleb128	10
	.byte	0
.La40:
	.uleb128	6
	.long	.La39-.Ldebug_info0
# Definition <record type>
.La41:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_def00000005\000"
	.long	.La111-.Ldebug_info0
.La111:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_DEF00000005\000"
	.uleb128	35
	.byte	0
.La42:
	.uleb128	6
	.long	.La41-.Ldebug_info0
# Definition <record type>
.La43:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_def00000006\000"
	.long	.La112-.Ldebug_info0
.La112:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_DEF00000006\000"
	.uleb128	35
	.byte	0
.La44:
	.uleb128	6
	.long	.La43-.Ldebug_info0
# Definition <record type>
.La45:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_def00000007\000"
	.long	.La113-.Ldebug_info0
.La113:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_DEF00000007\000"
	.uleb128	35
	.byte	0
.La46:
	.uleb128	6
	.long	.La45-.Ldebug_info0
# Definition <record type>
.La47:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_def00000008\000"
	.long	.La114-.Ldebug_info0
.La114:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_DEF00000008\000"
	.uleb128	35
	.byte	0
.La48:
	.uleb128	6
	.long	.La47-.Ldebug_info0
# Definition <record type>
.La49:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_TVMSTATE\000"
	.long	.La115-.Ldebug_info0
.La115:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_TVMSTATE\000"
	.uleb128	202
	.byte	0
.La50:
	.uleb128	6
	.long	.La49-.Ldebug_info0
# Definition <record type>
.La51:
	.uleb128	4
	.ascii	"$rttidef$INIT_$SOMA_TYPES_$$_TFITNESSRESULT\000"
	.long	.La116-.Ldebug_info0
.La116:
	.uleb128	9
	.ascii	"$RTTIDEF$INIT_$SOMA_TYPES_$$_TFITNESSRESULT\000"
	.uleb128	48
	.byte	0
.La52:
	.uleb128	6
	.long	.La51-.Ldebug_info0
# Definition <record type>
.La53:
	.uleb128	4
	.ascii	"$rtti_header$14\000"
	.long	.La117-.Ldebug_info0
.La117:
	.uleb128	9
	.ascii	"$RTTI_HEADER$14\000"
	.uleb128	16
	.byte	0
.La54:
	.uleb128	6
	.long	.La53-.Ldebug_info0
# Definition <record type>
.La55:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_def0000000A\000"
	.long	.La118-.Ldebug_info0
.La118:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_DEF0000000A\000"
	.uleb128	35
	.byte	0
.La56:
	.uleb128	6
	.long	.La55-.Ldebug_info0
# Definition <record type>
.La57:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_def0000000B\000"
	.long	.La119-.Ldebug_info0
.La119:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_DEF0000000B\000"
	.uleb128	35
	.byte	0
.La58:
	.uleb128	6
	.long	.La57-.Ldebug_info0
# Definition <record type>
.La59:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_TFITNESSRESULT\000"
	.long	.La120-.Ldebug_info0
.La120:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_TFITNESSRESULT\000"
	.uleb128	112
	.byte	0
.La60:
	.uleb128	6
	.long	.La59-.Ldebug_info0
# Definition <record type>
.La61:
	.uleb128	4
	.ascii	"$rttidef$RTTI_$SOMA_TYPES_$$_TFITNESSFN\000"
	.long	.La121-.Ldebug_info0
.La121:
	.uleb128	9
	.ascii	"$RTTIDEF$RTTI_$SOMA_TYPES_$$_TFITNESSFN\000"
	.uleb128	79
	.byte	0
.La62:
	.uleb128	6
	.long	.La61-.Ldebug_info0
# Definition <record type>
.La63:
	.uleb128	4
	.ascii	"$rtti_header$10\000"
	.long	.La122-.Ldebug_info0
.La122:
	.uleb128	9
	.ascii	"$RTTI_HEADER$10\000"
	.uleb128	12
	.byte	0
.La64:
	.uleb128	6
	.long	.La63-.Ldebug_info0
# Definition <record type>
.La65:
	.uleb128	4
	.ascii	"$rtti_proc_param$6\000"
	.long	.La123-.Ldebug_info0
.La123:
	.uleb128	9
	.ascii	"$RTTI_PROC_PARAM$6\000"
	.uleb128	17
	.byte	0
.La66:
	.uleb128	6
	.long	.La65-.Ldebug_info0
# Definition <record type>
.La67:
	.uleb128	4
	.ascii	"$rtti_proc_param$11\000"
	.long	.La124-.Ldebug_info0
.La124:
	.uleb128	9
	.ascii	"$RTTI_PROC_PARAM$11\000"
	.uleb128	22
	.byte	0
.La68:
	.uleb128	6
	.long	.La67-.Ldebug_info0
# Defs - End Staticsymtable
# Definition TVMState.Array[0..255] Of Byte
.La77:
	.uleb128	7
	.uleb128	256
	.long	.La7-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.sleb128	255
	.uleb128	1
	.long	.La7-.Ldebug_info0
	.byte	0
.La78:
	.uleb128	6
	.long	.La77-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Int64
.La79:
	.uleb128	7
	.uleb128	2048
	.long	.La83-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.sleb128	255
	.uleb128	8
	.long	.La7-.Ldebug_info0
	.byte	0
.La80:
	.uleb128	6
	.long	.La79-.Ldebug_info0
# Definition TVMState.Array[0..255] Of Double
.La81:
	.uleb128	7
	.uleb128	2048
	.long	.La90-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.sleb128	255
	.uleb128	8
	.long	.La7-.Ldebug_info0
	.byte	0
.La82:
	.uleb128	6
	.long	.La81-.Ldebug_info0
# Definition Int64
.La83:
	.uleb128	4
	.ascii	"Int64\000"
	.long	.La125-.Ldebug_info0
.La125:
	.uleb128	5
	.ascii	"Int64\000"
	.byte	5
	.byte	8
.La84:
	.uleb128	6
	.long	.La83-.Ldebug_info0
# Definition QWord
.La85:
	.uleb128	4
	.ascii	"QWord\000"
	.long	.La126-.Ldebug_info0
.La126:
	.uleb128	5
	.ascii	"QWord\000"
	.byte	7
	.byte	8
.La86:
	.uleb128	6
	.long	.La85-.Ldebug_info0
# Definition TVMState.Array[0..15] Of Byte
.La87:
	.uleb128	7
	.uleb128	16
	.long	.La7-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.sleb128	15
	.uleb128	1
	.long	.La5-.Ldebug_info0
	.byte	0
.La88:
	.uleb128	6
	.long	.La87-.Ldebug_info0
# Definition Double
.La90:
	.uleb128	4
	.ascii	"Double\000"
	.long	.La127-.Ldebug_info0
.La127:
	.uleb128	5
	.ascii	"Double\000"
	.byte	4
	.byte	8
.La91:
	.uleb128	6
	.long	.La90-.Ldebug_info0
# Definition TFitnessResult.Array[0..7] Of Double
.La92:
	.uleb128	7
	.uleb128	64
	.long	.La90-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.sleb128	7
	.uleb128	8
	.long	.La5-.Ldebug_info0
	.byte	0
.La93:
	.uleb128	6
	.long	.La92-.Ldebug_info0
# Definition TFitnessResult.Array[0..31] Of Char
.La94:
	.uleb128	7
	.uleb128	32
	.long	.La128-.Ldebug_info0
	.uleb128	8
	.sleb128	0
	.sleb128	31
	.uleb128	1
	.long	.La5-.Ldebug_info0
	.byte	0
.La95:
	.uleb128	6
	.long	.La94-.Ldebug_info0
# Definition Boolean
.La96:
	.uleb128	4
	.ascii	"Boolean\000"
	.long	.La130-.Ldebug_info0
.La130:
	.uleb128	5
	.ascii	"Boolean\000"
	.byte	2
	.byte	1
.La97:
	.uleb128	6
	.long	.La96-.Ldebug_info0
# Definition Pointer
.La99:
	.uleb128	4
	.ascii	"Pointer\000"
	.long	.La131-.Ldebug_info0
.La131:
	.uleb128	14
.La100:
	.uleb128	6
	.long	.La99-.Ldebug_info0
# Definition LongWord
.La101:
	.uleb128	4
	.ascii	"LongWord\000"
	.long	.La132-.Ldebug_info0
.La132:
	.uleb128	5
	.ascii	"LongWord\000"
	.byte	7
	.byte	4
.La102:
	.uleb128	6
	.long	.La101-.Ldebug_info0
# Definition Char
.La128:
	.uleb128	4
	.ascii	"Char\000"
	.long	.La133-.Ldebug_info0
.La133:
	.uleb128	5
	.ascii	"Char\000"
	.byte	8
	.byte	1
.La129:
	.uleb128	6
	.long	.La128-.Ldebug_info0
	.byte	0
.Ledebug_info0:
# End asmlist al_dwarf_info
# Begin asmlist al_dwarf_abbrev

.section .debug_abbrev
# Abbrev 1
	.uleb128	1
	.uleb128	17
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	37
	.uleb128	8
	.uleb128	27
	.uleb128	8
	.uleb128	19
	.uleb128	11
	.uleb128	66
	.uleb128	11
	.uleb128	16
	.uleb128	6
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.byte	0
	.byte	0
# Abbrev 2
	.uleb128	2
	.uleb128	52
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.uleb128	28
	.uleb128	15
	.byte	0
	.byte	0
# Abbrev 3
	.uleb128	3
	.uleb128	52
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	63
	.uleb128	12
	.uleb128	2
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 4
	.uleb128	4
	.uleb128	22
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 5
	.uleb128	5
	.uleb128	36
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	62
	.uleb128	11
	.uleb128	11
	.uleb128	11
	.byte	0
	.byte	0
# Abbrev 6
	.uleb128	6
	.uleb128	16
	.byte	0
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 7
	.uleb128	7
	.uleb128	1
	.byte	1
	.uleb128	11
	.uleb128	15
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 8
	.uleb128	8
	.uleb128	33
	.byte	0
	.uleb128	34
	.uleb128	13
	.uleb128	47
	.uleb128	13
	.uleb128	81
	.uleb128	15
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 9
	.uleb128	9
	.uleb128	19
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	15
	.byte	0
	.byte	0
# Abbrev 10
	.uleb128	10
	.uleb128	13
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	56
	.uleb128	10
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 11
	.uleb128	11
	.uleb128	1
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	15
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 12
	.uleb128	12
	.uleb128	21
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	39
	.uleb128	12
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 13
	.uleb128	13
	.uleb128	5
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.byte	0
	.byte	0
# Abbrev 14
	.uleb128	14
	.uleb128	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
# End asmlist al_dwarf_abbrev
# Begin asmlist al_dwarf_line

.section .debug_line
# === header start ===
	.long	.Ledebug_line0-.Lf3
.Lf3:
	.short	3
	.long	.Lehdebug_line0-.Lf4
.Lf4:
	.byte	1
	.byte	1
	.byte	1
	.byte	255
	.byte	13
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
# include_directories
	.byte	0
# file_names
	.ascii	"soma_types.pas\000"
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.byte	0
.Lehdebug_line0:
# === header end ===
	.byte	4
	.uleb128	1
	.byte	0
	.uleb128	9
	.byte	2
	.quad	0
	.byte	0
	.byte	1
	.byte	1
# ###################
.Ledebug_line0:
# End asmlist al_dwarf_line
# Begin asmlist al_dwarf_aranges

.section .debug_aranges
	.long	.Learanges0-.Lf1
.Lf1:
	.short	2
	.secrel32	.Ldebug_info0
	.byte	8
	.byte	0
	.long	0
	.quad	0
	.quad	0
.Learanges0:
# End asmlist al_dwarf_aranges
# Begin asmlist al_dwarf_ranges

.section .debug_ranges
# End asmlist al_dwarf_ranges
# Begin asmlist al_end

.section .text.z_DEBUGEND_$SOMA_TYPES,"x"
.globl	DEBUGEND_$SOMA_TYPES
DEBUGEND_$SOMA_TYPES:
# End asmlist al_end

