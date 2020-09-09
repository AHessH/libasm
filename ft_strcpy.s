global ft_strcpy
section .text

ft_strcpy: ;str1 = rdi const str2 = rsi
			xor		rcx, rcx ; i = 0
			xor		rax, rax ; ret = 0
			cmp		rsi, 0
			jz		return
			cmp		rdi, 0
			jz		return
			jmp		cpy
increment:
			inc		rcx
cpy:
			mov		al, BYTE [rsi + rcx]
			mov		BYTE [rdi + rcx], al
			cmp		al, 0
			jnz		increment

return:
			mov		rax, rdi
			ret