global ft_strdup
section .text
extern malloc

ft_strdup:									; str = rdi
			xor			rax, rax			; len = 0
len:
			jmp short	compare
increment_len:
			inc			rax					; len++
compare:
			cmp			BYTE [rdi + rax], 0	; str[len] == 0
			jne			increment_len
dup:
			inc			rax
			push		rdi
			mov			rdi, rax
			call		malloc
			pop			rdi
			test		rax, rax
			jz			fail_exit
			xor			rcx, rcx
			xor			rdx, rdx
			jmp			cpy
increment_cpy:
			inc		rcx
cpy: ;str = rdi newstr = rax
			mov		dl, BYTE [rdi + rcx]
			mov		BYTE [rax + rcx], dl
			cmp		dl, 0
			jnz		increment_cpy
return:
			ret
fail_exit:
			mov		rax, 0
			ret