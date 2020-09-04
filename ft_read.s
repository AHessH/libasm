extern __errno_location
global ft_read
section .text

ft_read:
	mov rax, 0
	syscall
	cmp rax, 0
	jl error
	ret
error:
	mov rdx, rax
	neg rdx
	call __errno_location
	mov [rax], rdx
	mov rax, -1
return:
	ret