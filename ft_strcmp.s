global ft_strcmp
section .text

ft_strcmp:	;str1 = rdi, str2 = rsi
			xor			rax, rax			; ret = 0
			xor			rcx, rcx			; i = 0;
			cmp			rdi, 0
			jz			empty_string
			cmp			rsi, 0
			jz			empty_string
			jmp			compare

empty_string:
			cmp			rdi, rsi
			jz			zero
			jg			greater
			jl			smallest
increment:
			inc			rcx
compare:
			cmp			BYTE [rdi + rcx], 0
			je			check_last
			cmp			BYTE [rsi + rcx], 0
			je			check_last
			mov			al, BYTE [rsi + rcx]
			cmp			BYTE [rdi + rcx], al
			jne			check_last
			jmp			increment

check_last:
			mov			al, BYTE [rdi + rcx]
			sub			al, BYTE [rsi + rcx]
			cmp			al, 0
			jz			zero
			jl			smallest
			jmp			greater
zero:
			mov			rax, 0
			ret
greater:
			mov			rax, 1
			ret
smallest:
			mov			rax, -1
			ret