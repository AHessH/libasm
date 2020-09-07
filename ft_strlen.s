			global	ft_strlen
			section	.text

ft_strlen:
			xor			rax, rax			; i = 0
			jmp short	compare
increment:
			inc			rax					; i++
compare:
			cmp			BYTE [rdi + rax], 0	; str[i] == 0
			jne			increment
done:
			ret	