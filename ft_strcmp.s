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

compare:
			mov			al, BYTE [rsi + rcx]
			cmp			BYTE [rdi + rcx], al
			jne			check_last
			inc			rcx
check_last:
			xor			rax, rax
			mov			al, BYTE [rdi + rcx]
			cmp			al, 0
			jz			zero
			jg			greater
			jl			smallest
zero:
			mov			rax, 0
			ret
greater:
			mov			rax, 1
			ret
smallest:
			mov			rax, 1
			ret