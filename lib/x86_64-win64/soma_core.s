	.file "soma_core.pas"
# Begin asmlist al_procedures

.section .text.n_soma_core_$$_execute$tvmstate,"x"
	.balign 16,0x90
.globl	SOMA_CORE_$$_EXECUTE$TVMSTATE
SOMA_CORE_$$_EXECUTE$TVMSTATE:
.Lc1:
.seh_proc SOMA_CORE_$$_EXECUTE$TVMSTATE
# [soma_core.pas]
# [16] begin
	pushq	%rbp
.seh_pushreg %rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-16(%rsp),%rsp
.seh_stackalloc 16
.seh_endprologue
# Var State located at rbp-8, size=OS_64
	movq	%rcx,-8(%rbp)
#  CPU ATHLON64
# [19] push rbx
	pushq	%rbx
# [20] push r12
	pushq	%r12
# [21] push r13
	pushq	%r13
# [22] push r14
	pushq	%r14
# [23] push r15
	pushq	%r15
# [25] sub  rsp, 64
	subq	$64,%rsp
# [26] movdqu [rsp+$00], xmm6
	movdqu	%xmm6,(%rsp)
# [27] movdqu [rsp+$10], xmm7
	movdqu	%xmm7,16(%rsp)
# [28] movdqu [rsp+$20], xmm8
	movdqu	%xmm8,32(%rsp)
# [29] movdqu [rsp+$30], xmm9
	movdqu	%xmm9,48(%rsp)
# [33] mov rbx, rcx
	movq	%rcx,%rbx
# [38] mov r12, [rbx + IP_OFFSET]
	movq	4112(%rbx),%r12
# [39] mov r13, [rbx + ISP_OFFSET]
	movq	4096(%rbx),%r13
# [40] mov r14, [rbx + FSP_OFFSET]
	movq	4104(%rbx),%r14
# [41] lea r15, [rip + @JumpTable]
	leaq	.Lj5(%rip),%r15
# [44] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_NONE
	movq	$0,4128(%rbx)
.Lj6:
# [47] cmp r12, GENOME_SIZE
	cmpq	$4096,%r12
# [48] jge @HaltBounds
	jge	.Lj7
# [50] movzx rax, word ptr [rbx + GENOME_OFFSET + r12*8]
	movzwq	4136(%rbx,%r12,8),%rax
# [51] cmp   rax, LAYER0_MAX
	cmpq	$255,%rax
# [52] jg    @HigherLayer
	jg	.Lj8
# [53] jmp   qword ptr [r15 + rax*8]
	jmp	*(%r15,%rax,8)
.Lj5:
	.quad	.Lj9
	.quad	.Lj10
	.quad	.Lj11
	.quad	.Lj12
	.quad	.Lj13
	.quad	.Lj14
	.quad	.Lj15
	.quad	.Lj16
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj18
	.quad	.Lj19
	.quad	.Lj20
	.quad	.Lj21
	.quad	.Lj22
	.quad	.Lj23
	.quad	.Lj24
	.quad	.Lj25
	.quad	.Lj26
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj27
	.quad	.Lj28
	.quad	.Lj29
	.quad	.Lj30
	.quad	.Lj31
	.quad	.Lj32
	.quad	.Lj33
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj34
	.quad	.Lj35
	.quad	.Lj36
	.quad	.Lj37
	.quad	.Lj38
	.quad	.Lj39
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj40
	.quad	.Lj41
	.quad	.Lj42
	.quad	.Lj43
	.quad	.Lj44
	.quad	.Lj45
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj46
	.quad	.Lj47
	.quad	.Lj48
	.quad	.Lj49
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj50
	.quad	.Lj51
	.quad	.Lj52
	.quad	.Lj53
	.quad	.Lj54
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj55
	.quad	.Lj56
	.quad	.Lj57
	.quad	.Lj58
	.quad	.Lj59
	.quad	.Lj60
	.quad	.Lj61
	.quad	.Lj62
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj63
	.quad	.Lj64
	.quad	.Lj65
	.quad	.Lj66
	.quad	.Lj67
	.quad	.Lj68
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj69
	.quad	.Lj70
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj71
	.quad	.Lj72
	.quad	.Lj73
	.quad	.Lj74
	.quad	.Lj75
	.quad	.Lj76
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
	.quad	.Lj17
.Lj17:
# [142] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_UNUSED
	movq	$6,4128(%rbx)
# [143] jmp @Exit
	jmp	.Lj77
.Lj9:
# [148] inc r12
	incq	%r12
# [149] jmp @Loop
	jmp	.Lj6
.Lj10:
# [152] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4140(%rbx,%r12,8),%rax
# [153] mov    [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [154] inc    r13
	incq	%r13
# [155] inc    r12
	incq	%r12
# [156] jmp    @Loop
	jmp	.Lj6
.Lj11:
# [159] dec r13
	decq	%r13
# [160] inc r12
	incq	%r12
# [161] jmp @Loop
	jmp	.Lj6
.Lj12:
# [164] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [165] mov [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [166] inc r13
	incq	%r13
# [167] inc r12
	incq	%r12
# [168] jmp @Loop
	jmp	.Lj6
.Lj13:
# [171] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [172] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rcx
# [173] mov [rbx + ISTACK_OFFSET + r13*8 - 8],  rcx
	movq	%rcx,-8(%rbx,%r13,8)
# [174] mov [rbx + ISTACK_OFFSET + r13*8 - 16], rax
	movq	%rax,-16(%rbx,%r13,8)
# [175] inc r12
	incq	%r12
# [176] jmp @Loop
	jmp	.Lj6
.Lj14:
# [179] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [180] mov [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [181] inc r13
	incq	%r13
# [182] inc r12
	incq	%r12
# [183] jmp @Loop
	jmp	.Lj6
.Lj15:
# [186] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 24]
	movq	-24(%rbx,%r13,8),%rax
# [187] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rcx
# [188] mov rdx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rdx
# [189] mov [rbx + ISTACK_OFFSET + r13*8 - 24], rcx
	movq	%rcx,-24(%rbx,%r13,8)
# [190] mov [rbx + ISTACK_OFFSET + r13*8 - 16], rdx
	movq	%rdx,-16(%rbx,%r13,8)
# [191] mov [rbx + ISTACK_OFFSET + r13*8 - 8],  rax
	movq	%rax,-8(%rbx,%r13,8)
# [192] inc r12
	incq	%r12
# [193] jmp @Loop
	jmp	.Lj6
.Lj16:
# [196] dec r13
	decq	%r13
# [197] inc r12
	incq	%r12
# [198] jmp @Loop
	jmp	.Lj6
.Lj18:
# [203] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [204] add rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	addq	-16(%rbx,%r13,8),%rax
# [205] dec r13
	decq	%r13
# [206] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [207] inc r12
	incq	%r12
# [208] jmp @Loop
	jmp	.Lj6
.Lj19:
# [211] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [212] sub rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	subq	-8(%rbx,%r13,8),%rax
# [213] dec r13
	decq	%r13
# [214] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [215] inc r12
	incq	%r12
# [216] jmp @Loop
	jmp	.Lj6
.Lj20:
# [219] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [220] imul rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	imulq	-16(%rbx,%r13,8),%rax
# [221] dec  r13
	decq	%r13
# [222] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [223] inc  r12
	incq	%r12
# [224] jmp  @Loop
	jmp	.Lj6
.Lj21:
# [227] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [228] mov  rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rcx
# [229] test rcx, rcx
	testq	%rcx,%rcx
# [230] jz   @HaltDivZero
	jz	.Lj78
# [231] cqo
	cqto
# [232] idiv rcx
	idivq	%rcx
# [233] dec  r13
	decq	%r13
# [234] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [235] inc  r12
	incq	%r12
# [236] jmp  @Loop
	jmp	.Lj6
.Lj22:
# [239] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [240] mov  rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rcx
# [241] test rcx, rcx
	testq	%rcx,%rcx
# [242] jz   @HaltDivZero
	jz	.Lj78
# [243] cqo
	cqto
# [244] idiv rcx
	idivq	%rcx
# [245] dec  r13
	decq	%r13
# [246] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rdx
	movq	%rdx,-8(%rbx,%r13,8)
# [247] inc  r12
	incq	%r12
# [248] jmp  @Loop
	jmp	.Lj6
.Lj23:
# [251] neg qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	negq	-8(%rbx,%r13,8)
# [252] inc r12
	incq	%r12
# [253] jmp @Loop
	jmp	.Lj6
.Lj24:
# [256] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [257] mov  rcx, rax
	movq	%rax,%rcx
# [258] neg  rcx
	negq	%rcx
# [259] cmovl rax, rcx
	cmovlq	%rcx,%rax
# [260] mov  [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [261] inc  r12
	incq	%r12
# [262] jmp  @Loop
	jmp	.Lj6
.Lj25:
# [265] inc qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	incq	-8(%rbx,%r13,8)
# [266] inc r12
	incq	%r12
# [267] jmp @Loop
	jmp	.Lj6
.Lj26:
# [270] dec qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	decq	-8(%rbx,%r13,8)
# [271] inc r12
	incq	%r12
# [272] jmp @Loop
	jmp	.Lj6
.Lj27:
# [277] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [278] and rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	andq	-16(%rbx,%r13,8),%rax
# [279] dec r13
	decq	%r13
# [280] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [281] inc r12
	incq	%r12
# [282] jmp @Loop
	jmp	.Lj6
.Lj28:
# [285] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [286] or  rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	orq	-16(%rbx,%r13,8),%rax
# [287] dec r13
	decq	%r13
# [288] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [289] inc r12
	incq	%r12
# [290] jmp @Loop
	jmp	.Lj6
.Lj29:
# [293] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [294] xor rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	xorq	-16(%rbx,%r13,8),%rax
# [295] dec r13
	decq	%r13
# [296] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [297] inc r12
	incq	%r12
# [298] jmp @Loop
	jmp	.Lj6
.Lj30:
# [301] not qword ptr [rbx + ISTACK_OFFSET + r13*8 - 8]
	notq	-8(%rbx,%r13,8)
# [302] inc r12
	incq	%r12
# [303] jmp @Loop
	jmp	.Lj6
.Lj31:
# [306] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rcx
# [307] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [308] shl rax, cl
	shlq	%cl,%rax
# [309] dec r13
	decq	%r13
# [310] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [311] inc r12
	incq	%r12
# [312] jmp @Loop
	jmp	.Lj6
.Lj32:
# [315] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rcx
# [316] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [317] shr rax, cl
	shrq	%cl,%rax
# [318] dec r13
	decq	%r13
# [319] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [320] inc r12
	incq	%r12
# [321] jmp @Loop
	jmp	.Lj6
.Lj33:
# [324] mov rcx, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rcx
# [325] mov rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [326] sar rax, cl
	sarq	%cl,%rax
# [327] dec r13
	decq	%r13
# [328] mov [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [329] inc r12
	incq	%r12
# [330] jmp @Loop
	jmp	.Lj6
.Lj34:
# [335] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [336] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	-8(%rbx,%r13,8),%rax
# [337] sete  al
	seteb	%al
# [338] movzx rax, al
	movzbq	%al,%rax
# [339] dec   r13
	decq	%r13
# [340] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [341] inc   r12
	incq	%r12
# [342] jmp   @Loop
	jmp	.Lj6
.Lj35:
# [345] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [346] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	-8(%rbx,%r13,8),%rax
# [347] setne al
	setneb	%al
# [348] movzx rax, al
	movzbq	%al,%rax
# [349] dec   r13
	decq	%r13
# [350] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [351] inc   r12
	incq	%r12
# [352] jmp   @Loop
	jmp	.Lj6
.Lj36:
# [355] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [356] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	-8(%rbx,%r13,8),%rax
# [357] setl  al
	setlb	%al
# [358] movzx rax, al
	movzbq	%al,%rax
# [359] dec   r13
	decq	%r13
# [360] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [361] inc   r12
	incq	%r12
# [362] jmp   @Loop
	jmp	.Lj6
.Lj37:
# [365] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [366] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	-8(%rbx,%r13,8),%rax
# [367] setg  al
	setgb	%al
# [368] movzx rax, al
	movzbq	%al,%rax
# [369] dec   r13
	decq	%r13
# [370] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [371] inc   r12
	incq	%r12
# [372] jmp   @Loop
	jmp	.Lj6
.Lj38:
# [375] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [376] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	-8(%rbx,%r13,8),%rax
# [377] setle al
	setleb	%al
# [378] movzx rax, al
	movzbq	%al,%rax
# [379] dec   r13
	decq	%r13
# [380] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [381] inc   r12
	incq	%r12
# [382] jmp   @Loop
	jmp	.Lj6
.Lj39:
# [385] mov   rax, [rbx + ISTACK_OFFSET + r13*8 - 16]
	movq	-16(%rbx,%r13,8),%rax
# [386] cmp   rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	cmpq	-8(%rbx,%r13,8),%rax
# [387] setge al
	setgeb	%al
# [388] movzx rax, al
	movzbq	%al,%rax
# [389] dec   r13
	decq	%r13
# [390] mov   [rbx + ISTACK_OFFSET + r13*8 - 8], rax
	movq	%rax,-8(%rbx,%r13,8)
# [391] inc   r12
	incq	%r12
# [392] jmp   @Loop
	jmp	.Lj6
.Lj40:
# [397] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4140(%rbx,%r12,8),%rax
# [398] add    r12, rax
	addq	%rax,%r12
# [399] jmp    @Loop
	jmp	.Lj6
.Lj41:
# [402] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [403] dec  r13
	decq	%r13
# [404] test rax, rax
	testq	%rax,%rax
# [405] jnz  @JZ_Skip
	jnz	.Lj79
# [406] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4140(%rbx,%r12,8),%rax
# [407] add    r12, rax
	addq	%rax,%r12
# [408] jmp    @Loop
	jmp	.Lj6
.Lj79:
# [410] inc r12
	incq	%r12
# [411] jmp @Loop
	jmp	.Lj6
.Lj42:
# [414] mov  rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [415] dec  r13
	decq	%r13
# [416] test rax, rax
	testq	%rax,%rax
# [417] jz   @JNZ_Skip
	jz	.Lj80
# [418] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4140(%rbx,%r12,8),%rax
# [419] add    r12, rax
	addq	%rax,%r12
# [420] jmp    @Loop
	jmp	.Lj6
.Lj80:
# [422] inc r12
	incq	%r12
# [423] jmp @Loop
	jmp	.Lj6
.Lj43:
# [426] lea  rax, [r12 + 1]
	leaq	1(%r12),%rax
# [427] mov  [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [428] inc  r13
	incq	%r13
# [429] movsxd rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4140(%rbx,%r12,8),%rax
# [430] add    r12, rax
	addq	%rax,%r12
# [431] jmp    @Loop
	jmp	.Lj6
.Lj44:
# [434] dec r13
	decq	%r13
# [435] mov r12, [rbx + ISTACK_OFFSET + r13*8]
	movq	(%rbx,%r13,8),%r12
# [436] jmp @Loop
	jmp	.Lj6
.Lj45:
# [439] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_HALT
	movq	$1,4128(%rbx)
# [440] jmp @Exit
	jmp	.Lj77
.Lj46:
.Lj47:
.Lj48:
.Lj49:
# [448] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_UNUSED
	movq	$6,4128(%rbx)
# [449] jmp @Exit
	jmp	.Lj77
.Lj50:
# [454] movsxd   rax, dword ptr [rbx + GENOME_OFFSET + r12*8 + 4]
	movslq	4140(%rbx,%r12,8),%rax
# [455] cvtsi2sd xmm0, rax
	cvtsi2sdq	%rax,%xmm0
# [456] movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2048(%rbx,%r14,8)
# [457] inc      r14
	incq	%r14
# [458] inc      r12
	incq	%r12
# [459] jmp      @Loop
	jmp	.Lj6
.Lj51:
# [462] dec r14
	decq	%r14
# [463] inc r12
	incq	%r12
# [464] jmp @Loop
	jmp	.Lj6
.Lj52:
# [467] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2040(%rbx,%r14,8),%xmm0
# [468] movsd [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2048(%rbx,%r14,8)
# [469] inc   r14
	incq	%r14
# [470] inc   r12
	incq	%r12
# [471] jmp   @Loop
	jmp	.Lj6
.Lj53:
# [474] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2040(%rbx,%r14,8),%xmm0
# [475] movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm1
# [476] movsd [rbx + FSTACK_OFFSET + r14*8 - 8],  xmm1
	movsd	%xmm1,2040(%rbx,%r14,8)
# [477] movsd [rbx + FSTACK_OFFSET + r14*8 - 16], xmm0
	movsd	%xmm0,2032(%rbx,%r14,8)
# [478] inc   r12
	incq	%r12
# [479] jmp   @Loop
	jmp	.Lj6
.Lj54:
# [482] dec r14
	decq	%r14
# [483] inc r12
	incq	%r12
# [484] jmp @Loop
	jmp	.Lj6
.Lj55:
# [489] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [490] addsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	addsd	2040(%rbx,%r14,8),%xmm0
# [491] dec   r14
	decq	%r14
# [492] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2040(%rbx,%r14,8)
# [493] inc   r12
	incq	%r12
# [494] jmp   @Loop
	jmp	.Lj6
.Lj56:
# [497] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [498] subsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	subsd	2040(%rbx,%r14,8),%xmm0
# [499] dec   r14
	decq	%r14
# [500] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2040(%rbx,%r14,8)
# [501] inc   r12
	incq	%r12
# [502] jmp   @Loop
	jmp	.Lj6
.Lj57:
# [505] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [506] mulsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	mulsd	2040(%rbx,%r14,8),%xmm0
# [507] dec   r14
	decq	%r14
# [508] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2040(%rbx,%r14,8)
# [509] inc   r12
	incq	%r12
# [510] jmp   @Loop
	jmp	.Lj6
.Lj58:
# [513] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [514] movsd   xmm1, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2040(%rbx,%r14,8),%xmm1
# [515] xorpd   xmm2, xmm2
	xorpd	%xmm2,%xmm2
# [516] ucomisd xmm1, xmm2
	ucomisd	%xmm2,%xmm1
# [517] je      @HaltFDivZero
	je	.Lj81
# [518] divsd   xmm0, xmm1
	divsd	%xmm1,%xmm0
# [519] dec     r14
	decq	%r14
# [520] movsd   [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2040(%rbx,%r14,8)
# [521] inc     r12
	incq	%r12
# [522] jmp     @Loop
	jmp	.Lj6
.Lj59:
# [525] movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2040(%rbx,%r14,8),%xmm0
# [526] mov    rax,  $8000000000000000
	movq	$-9223372036854775808,%rax
# [527] movq   xmm1, rax
	movq	%rax,%xmm1
# [528] xorpd  xmm0, xmm1
	xorpd	%xmm1,%xmm0
# [529] movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2040(%rbx,%r14,8)
# [530] inc    r12
	incq	%r12
# [531] jmp    @Loop
	jmp	.Lj6
.Lj60:
# [534] movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2040(%rbx,%r14,8),%xmm0
# [535] mov    rax,  $7FFFFFFFFFFFFFFF
	movq	$9223372036854775807,%rax
# [536] movq   xmm1, rax
	movq	%rax,%xmm1
# [537] andpd  xmm0, xmm1
	andpd	%xmm1,%xmm0
# [538] movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2040(%rbx,%r14,8)
# [539] inc    r12
	incq	%r12
# [540] jmp    @Loop
	jmp	.Lj6
.Lj61:
# [543] movsd  xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2040(%rbx,%r14,8),%xmm0
# [544] sqrtsd xmm0, xmm0
	sqrtsd	%xmm0,%xmm0
# [545] movsd  [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2040(%rbx,%r14,8)
# [546] inc    r12
	incq	%r12
# [547] jmp    @Loop
	jmp	.Lj6
.Lj62:
# [550] movsd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [551] movsd xmm1, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2040(%rbx,%r14,8),%xmm1
# [552] sub   rsp, 16
	subq	$16,%rsp
# [553] movsd [rsp],   xmm1
	movsd	%xmm1,(%rsp)
# [554] movsd [rsp+8], xmm0
	movsd	%xmm0,8(%rsp)
# [555] fld   qword ptr [rsp]
	fldl	(%rsp)
# [556] fld   qword ptr [rsp+8]
	fldl	8(%rsp)
# [557] fprem
	fprem
# [558] fstp  qword ptr [rsp+8]
	fstpl	8(%rsp)
# [559] fstp  qword ptr [rsp]
	fstpl	(%rsp)
# [560] movsd xmm0, [rsp+8]
	movsd	8(%rsp),%xmm0
# [561] add   rsp, 16
	addq	$16,%rsp
# [562] dec   r14
	decq	%r14
# [563] movsd [rbx + FSTACK_OFFSET + r14*8 - 8], xmm0
	movsd	%xmm0,2040(%rbx,%r14,8)
# [564] inc   r12
	incq	%r12
# [565] jmp   @Loop
	jmp	.Lj6
.Lj63:
# [570] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [571] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2040(%rbx,%r14,8),%xmm0
# [572] sete    al
	seteb	%al
# [573] movzx   rax, al
	movzbq	%al,%rax
# [574] dec     r14
	decq	%r14
# [575] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [576] inc     r13
	incq	%r13
# [577] inc     r12
	incq	%r12
# [578] jmp     @Loop
	jmp	.Lj6
.Lj64:
# [581] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [582] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2040(%rbx,%r14,8),%xmm0
# [583] setne   al
	setneb	%al
# [584] movzx   rax, al
	movzbq	%al,%rax
# [585] dec     r14
	decq	%r14
# [586] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [587] inc     r13
	incq	%r13
# [588] inc     r12
	incq	%r12
# [589] jmp     @Loop
	jmp	.Lj6
.Lj65:
# [592] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [593] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2040(%rbx,%r14,8),%xmm0
# [594] setb    al
	setbb	%al
# [595] movzx   rax, al
	movzbq	%al,%rax
# [596] dec     r14
	decq	%r14
# [597] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [598] inc     r13
	incq	%r13
# [599] inc     r12
	incq	%r12
# [600] jmp     @Loop
	jmp	.Lj6
.Lj66:
# [603] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [604] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2040(%rbx,%r14,8),%xmm0
# [605] seta    al
	setab	%al
# [606] movzx   rax, al
	movzbq	%al,%rax
# [607] dec     r14
	decq	%r14
# [608] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [609] inc     r13
	incq	%r13
# [610] inc     r12
	incq	%r12
# [611] jmp     @Loop
	jmp	.Lj6
.Lj67:
# [614] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [615] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2040(%rbx,%r14,8),%xmm0
# [616] setbe   al
	setbeb	%al
# [617] movzx   rax, al
	movzbq	%al,%rax
# [618] dec     r14
	decq	%r14
# [619] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [620] inc     r13
	incq	%r13
# [621] inc     r12
	incq	%r12
# [622] jmp     @Loop
	jmp	.Lj6
.Lj68:
# [625] movsd   xmm0, [rbx + FSTACK_OFFSET + r14*8 - 16]
	movsd	2032(%rbx,%r14,8),%xmm0
# [626] ucomisd xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	ucomisd	2040(%rbx,%r14,8),%xmm0
# [627] setae   al
	setaeb	%al
# [628] movzx   rax, al
	movzbq	%al,%rax
# [629] dec     r14
	decq	%r14
# [630] mov     [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [631] inc     r13
	incq	%r13
# [632] inc     r12
	incq	%r12
# [633] jmp     @Loop
	jmp	.Lj6
.Lj69:
# [638] mov      rax, [rbx + ISTACK_OFFSET + r13*8 - 8]
	movq	-8(%rbx,%r13,8),%rax
# [639] dec      r13
	decq	%r13
# [640] cvtsi2sd xmm0, rax
	cvtsi2sdq	%rax,%xmm0
# [641] movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2048(%rbx,%r14,8)
# [642] inc      r14
	incq	%r14
# [643] inc      r12
	incq	%r12
# [644] jmp      @Loop
	jmp	.Lj6
.Lj70:
# [647] movsd     xmm0, [rbx + FSTACK_OFFSET + r14*8 - 8]
	movsd	2040(%rbx,%r14,8),%xmm0
# [648] dec       r14
	decq	%r14
# [649] cvttsd2si rax, xmm0
	cvttsd2siq	%xmm0,%rax
# [650] mov       [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [651] inc       r13
	incq	%r13
# [652] inc       r12
	incq	%r12
# [653] jmp       @Loop
	jmp	.Lj6
.Lj71:
# [658] mov rcx, [rbx + RNG_OFFSET]
	movq	4120(%rbx),%rcx
# [659] mov rax, rcx
	movq	%rcx,%rax
# [660] shl rax, 13
	shlq	$13,%rax
# [661] xor rcx, rax
	xorq	%rax,%rcx
# [662] mov rax, rcx
	movq	%rcx,%rax
# [663] shr rax, 7
	shrq	$7,%rax
# [664] xor rcx, rax
	xorq	%rax,%rcx
# [665] mov rax, rcx
	movq	%rcx,%rax
# [666] shl rax, 17
	shlq	$17,%rax
# [667] xor rcx, rax
	xorq	%rax,%rcx
# [668] mov [rbx + RNG_OFFSET], rcx
	movq	%rcx,4120(%rbx)
# [669] mov [rbx + ISTACK_OFFSET + r13*8], rcx
	movq	%rcx,(%rbx,%r13,8)
# [670] inc r13
	incq	%r13
# [671] inc r12
	incq	%r12
# [672] jmp @Loop
	jmp	.Lj6
.Lj72:
# [675] mov rcx, [rbx + RNG_OFFSET]
	movq	4120(%rbx),%rcx
# [676] mov rax, rcx
	movq	%rcx,%rax
# [677] shl rax, 13
	shlq	$13,%rax
# [678] xor rcx, rax
	xorq	%rax,%rcx
# [679] mov rax, rcx
	movq	%rcx,%rax
# [680] shr rax, 7
	shrq	$7,%rax
# [681] xor rcx, rax
	xorq	%rax,%rcx
# [682] mov rax, rcx
	movq	%rcx,%rax
# [683] shl rax, 17
	shlq	$17,%rax
# [684] xor rcx, rax
	xorq	%rax,%rcx
# [685] mov [rbx + RNG_OFFSET], rcx
	movq	%rcx,4120(%rbx)
# [686] shr rcx, 11
	shrq	$11,%rcx
# [687] cvtsi2sd xmm0, rcx
	cvtsi2sdq	%rcx,%xmm0
# [688] mov      rax,  $3CA0000000000000
	movq	$4368491638549381120,%rax
# [689] movq     xmm1, rax
	movq	%rax,%xmm1
# [690] mulsd    xmm0, xmm1
	mulsd	%xmm1,%xmm0
# [691] movsd    [rbx + FSTACK_OFFSET + r14*8], xmm0
	movsd	%xmm0,2048(%rbx,%r14,8)
# [692] inc      r14
	incq	%r14
# [693] inc      r12
	incq	%r12
# [694] jmp      @Loop
	jmp	.Lj6
.Lj73:
# [697] rdtsc
	rdtsc
# [698] shl rdx, 32
	shlq	$32,%rdx
# [699] or  rax, rdx
	orq	%rdx,%rax
# [700] mov [rbx + ISTACK_OFFSET + r13*8], rax
	movq	%rax,(%rbx,%r13,8)
# [701] inc r13
	incq	%r13
# [702] inc r12
	incq	%r12
# [703] jmp @Loop
	jmp	.Lj6
.Lj74:
# [706] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_YIELD
	movq	$2,4128(%rbx)
# [707] inc r12
	incq	%r12
# [708] jmp @Exit
	jmp	.Lj77
.Lj75:
.Lj76:
# [712] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_UNUSED
	movq	$6,4128(%rbx)
# [713] jmp @Exit
	jmp	.Lj77
.Lj7:
# [718] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_BOUNDS
	movq	$3,4128(%rbx)
# [719] jmp @Exit
	jmp	.Lj77
.Lj78:
# [722] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_DIV_ZERO
	movq	$4,4128(%rbx)
# [723] jmp @Exit
	jmp	.Lj77
.Lj81:
# [726] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_FDIV_ZERO
	movq	$5,4128(%rbx)
# [727] jmp @Exit
	jmp	.Lj77
.Lj8:
# [732] mov qword ptr [rbx + HALT_REASON_OFFSET], HR_HIGHER_LAYER
	movq	$7,4128(%rbx)
# [733] mov [rbx + IP_OFFSET],  r12
	movq	%r12,4112(%rbx)
# [734] mov [rbx + ISP_OFFSET], r13
	movq	%r13,4096(%rbx)
# [735] mov [rbx + FSP_OFFSET], r14
	movq	%r14,4104(%rbx)
# [736] jmp @ExitNoSave
	jmp	.Lj82
.Lj77:
# [741] mov [rbx + IP_OFFSET],  r12
	movq	%r12,4112(%rbx)
# [742] mov [rbx + ISP_OFFSET], r13
	movq	%r13,4096(%rbx)
# [743] mov [rbx + FSP_OFFSET], r14
	movq	%r14,4104(%rbx)
.Lj82:
# [747] movdqu xmm6, [rsp+$00]
	movdqu	(%rsp),%xmm6
# [748] movdqu xmm7, [rsp+$10]
	movdqu	16(%rsp),%xmm7
# [749] movdqu xmm8, [rsp+$20]
	movdqu	32(%rsp),%xmm8
# [750] movdqu xmm9, [rsp+$30]
	movdqu	48(%rsp),%xmm9
# [751] add    rsp, 64
	addq	$64,%rsp
# [753] pop r15
	popq	%r15
# [754] pop r14
	popq	%r14
# [755] pop r13
	popq	%r13
# [756] pop r12
	popq	%r12
# [757] pop rbx
	popq	%rbx
#  CPU ATHLON64
# [759] end;
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
.seh_endproc
.Lc2:
# End asmlist al_procedures
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc6:
	.long	.Lc8-.Lc7
.Lc7:
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
.Lc8:
	.long	.Lc10-.Lc9
.Lc9:
	.secrel32	.Lc6
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc4-.Lc3
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc5-.Lc4
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc10:
# End asmlist al_dwarf_frame

