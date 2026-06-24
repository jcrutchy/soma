	.file "soma_main.pas"
# Begin asmlist al_rtti

.section .rodata.n_INIT_$SOMA_MAIN_$$_TINSTRUCTION,"d"
	.balign 8
.globl	INIT_$SOMA_MAIN_$$_TINSTRUCTION
INIT_$SOMA_MAIN_$$_TINSTRUCTION:
	.byte	13,12
# [soma_main.pas]
# [53] 
	.ascii	"TInstruction"
	.quad	0
	.long	8
	.quad	0,0
	.long	0

.section .rodata.n_RTTI_$SOMA_MAIN_$$_TINSTRUCTION,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_TINSTRUCTION
RTTI_$SOMA_MAIN_$$_TINSTRUCTION:
	.byte	13,12
	.ascii	"TInstruction"
	.quad	INIT_$SOMA_MAIN_$$_TINSTRUCTION
	.long	8,4
	.quad	RTTI_$SYSTEM_$$_WORD$indirect
	.quad	0
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect
	.quad	2
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect
	.quad	3
	.quad	RTTI_$SYSTEM_$$_LONGINT$indirect
	.quad	4

.section .rodata.n_INIT_$SOMA_MAIN_$$_TGENOME,"d"
	.balign 8
.globl	INIT_$SOMA_MAIN_$$_TGENOME
INIT_$SOMA_MAIN_$$_TGENOME:
	.byte	12,7
	.ascii	"TGenome"
	.quad	8192,1024
	.quad	INIT_$SOMA_MAIN_$$_TINSTRUCTION$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SMALLINT$indirect

.section .rodata.n_RTTI_$SOMA_MAIN_$$_TGENOME,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_TGENOME
RTTI_$SOMA_MAIN_$$_TGENOME:
	.byte	12,7
	.ascii	"TGenome"
	.quad	8192,1024
	.quad	RTTI_$SOMA_MAIN_$$_TINSTRUCTION$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SMALLINT$indirect

.section .rodata.n_INIT_$SOMA_MAIN_$$_TVMSTATE,"d"
	.balign 8
.globl	INIT_$SOMA_MAIN_$$_TVMSTATE
INIT_$SOMA_MAIN_$$_TVMSTATE:
	.byte	13,8
	.ascii	"TVMState"
	.quad	0
	.long	10304
	.quad	0,0
	.long	0

.section .rodata.n_RTTI_$SOMA_MAIN_$$_def00000003,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_def00000003
RTTI_$SOMA_MAIN_$$_def00000003:
	.byte	12,0
	.quad	2048,256
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect

.section .rodata.n_RTTI_$SOMA_MAIN_$$_def00000004,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_def00000004
RTTI_$SOMA_MAIN_$$_def00000004:
	.byte	12,0
	.quad	48,48
	.quad	RTTI_$SYSTEM_$$_BYTE$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect

.section .rodata.n_RTTI_$SOMA_MAIN_$$_TVMSTATE,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_TVMSTATE
RTTI_$SOMA_MAIN_$$_TVMSTATE:
	.byte	13,8
	.ascii	"TVMState"
	.quad	INIT_$SOMA_MAIN_$$_TVMSTATE
	.long	10304,5
	.quad	RTTI_$SOMA_MAIN_$$_def00000003$indirect
	.quad	0
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.quad	2048
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
	.quad	2056
	.quad	RTTI_$SOMA_MAIN_$$_TGENOME$indirect
	.quad	2064
	.quad	RTTI_$SOMA_MAIN_$$_def00000004$indirect
	.quad	10256

.section .rodata.n_INIT_$SOMA_MAIN_$$_TFITNESSRESULT,"d"
	.balign 8
.globl	INIT_$SOMA_MAIN_$$_TFITNESSRESULT
INIT_$SOMA_MAIN_$$_TFITNESSRESULT:
	.byte	13,14
	.ascii	"TFitnessResult"
	.quad	0
	.long	112
	.quad	0,0
	.long	0

.section .rodata.n_RTTI_$SOMA_MAIN_$$_def00000006,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_def00000006
RTTI_$SOMA_MAIN_$$_def00000006:
	.byte	12,0
	.quad	64,8
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect

.section .rodata.n_RTTI_$SOMA_MAIN_$$_def00000007,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_def00000007
RTTI_$SOMA_MAIN_$$_def00000007:
	.byte	12,0
	.quad	32,32
	.quad	RTTI_$SYSTEM_$$_CHAR$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_SHORTINT$indirect

.section .rodata.n_RTTI_$SOMA_MAIN_$$_TFITNESSRESULT,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_TFITNESSRESULT
RTTI_$SOMA_MAIN_$$_TFITNESSRESULT:
	.byte	13,14
	.ascii	"TFitnessResult"
	.quad	INIT_$SOMA_MAIN_$$_TFITNESSRESULT
	.long	112,5
	.quad	RTTI_$SYSTEM_$$_DOUBLE$indirect
	.quad	0
	.quad	RTTI_$SOMA_MAIN_$$_def00000006$indirect
	.quad	8
	.quad	RTTI_$SOMA_MAIN_$$_def00000007$indirect
	.quad	72
	.quad	RTTI_$SYSTEM_$$_WORD$indirect
	.quad	104
	.quad	RTTI_$SYSTEM_$$_BOOLEAN$indirect
	.quad	106

.section .rodata.n_RTTI_$SOMA_MAIN_$$_TFITNESSFN,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_TFITNESSFN
RTTI_$SOMA_MAIN_$$_TFITNESSFN:
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
	.quad	RTTI_$SOMA_MAIN_$$_TFITNESSRESULT$indirect
	.byte	6
	.ascii	"result"
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .rodata.n_INIT_$SOMA_MAIN_$$_TINSTRUCTION,"d"
	.balign 8
.globl	INIT_$SOMA_MAIN_$$_TINSTRUCTION$indirect
INIT_$SOMA_MAIN_$$_TINSTRUCTION$indirect:
	.quad	INIT_$SOMA_MAIN_$$_TINSTRUCTION

.section .rodata.n_RTTI_$SOMA_MAIN_$$_TINSTRUCTION,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_TINSTRUCTION$indirect
RTTI_$SOMA_MAIN_$$_TINSTRUCTION$indirect:
	.quad	RTTI_$SOMA_MAIN_$$_TINSTRUCTION

.section .rodata.n_INIT_$SOMA_MAIN_$$_TGENOME,"d"
	.balign 8
.globl	INIT_$SOMA_MAIN_$$_TGENOME$indirect
INIT_$SOMA_MAIN_$$_TGENOME$indirect:
	.quad	INIT_$SOMA_MAIN_$$_TGENOME

.section .rodata.n_RTTI_$SOMA_MAIN_$$_TGENOME,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_TGENOME$indirect
RTTI_$SOMA_MAIN_$$_TGENOME$indirect:
	.quad	RTTI_$SOMA_MAIN_$$_TGENOME

.section .rodata.n_INIT_$SOMA_MAIN_$$_TVMSTATE,"d"
	.balign 8
.globl	INIT_$SOMA_MAIN_$$_TVMSTATE$indirect
INIT_$SOMA_MAIN_$$_TVMSTATE$indirect:
	.quad	INIT_$SOMA_MAIN_$$_TVMSTATE

.section .rodata.n_RTTI_$SOMA_MAIN_$$_def00000003,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_def00000003$indirect
RTTI_$SOMA_MAIN_$$_def00000003$indirect:
	.quad	RTTI_$SOMA_MAIN_$$_def00000003

.section .rodata.n_RTTI_$SOMA_MAIN_$$_def00000004,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_def00000004$indirect
RTTI_$SOMA_MAIN_$$_def00000004$indirect:
	.quad	RTTI_$SOMA_MAIN_$$_def00000004

.section .rodata.n_RTTI_$SOMA_MAIN_$$_TVMSTATE,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_TVMSTATE$indirect
RTTI_$SOMA_MAIN_$$_TVMSTATE$indirect:
	.quad	RTTI_$SOMA_MAIN_$$_TVMSTATE

.section .rodata.n_INIT_$SOMA_MAIN_$$_TFITNESSRESULT,"d"
	.balign 8
.globl	INIT_$SOMA_MAIN_$$_TFITNESSRESULT$indirect
INIT_$SOMA_MAIN_$$_TFITNESSRESULT$indirect:
	.quad	INIT_$SOMA_MAIN_$$_TFITNESSRESULT

.section .rodata.n_RTTI_$SOMA_MAIN_$$_def00000006,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_def00000006$indirect
RTTI_$SOMA_MAIN_$$_def00000006$indirect:
	.quad	RTTI_$SOMA_MAIN_$$_def00000006

.section .rodata.n_RTTI_$SOMA_MAIN_$$_def00000007,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_def00000007$indirect
RTTI_$SOMA_MAIN_$$_def00000007$indirect:
	.quad	RTTI_$SOMA_MAIN_$$_def00000007

.section .rodata.n_RTTI_$SOMA_MAIN_$$_TFITNESSRESULT,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_TFITNESSRESULT$indirect
RTTI_$SOMA_MAIN_$$_TFITNESSRESULT$indirect:
	.quad	RTTI_$SOMA_MAIN_$$_TFITNESSRESULT

.section .rodata.n_RTTI_$SOMA_MAIN_$$_TFITNESSFN,"d"
	.balign 8
.globl	RTTI_$SOMA_MAIN_$$_TFITNESSFN$indirect
RTTI_$SOMA_MAIN_$$_TFITNESSFN$indirect:
	.quad	RTTI_$SOMA_MAIN_$$_TFITNESSFN
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

