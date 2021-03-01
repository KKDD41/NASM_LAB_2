                    global Positivity
                    global CheckOverflow
                    global Function
                    global IsInCircle
                    global TwoIntegers
                    global CountNumbers
                    global Switch
                    global MagicMetric

                    section .data
str1               db "Yeah) It's positive :D", 0
len1               equ $ - str1
str2               db "Ohh.. so much negative :(", 0
len2               equ $ - str2
str3               db "That's bad", 0
len3               equ $ - str3
str4               db "No comments.", 0
len4               equ $ - str4
str5               db "Not bad...", 0
len5               equ $ - str5
str6               db "Nice :)", 0
len6               equ $ - str6
str7               db "Perfecto!!!", 0
len7               equ $ - str7
str8               db "Ooops", 0
len8               equ $ - str8

                    section .text

Positivity:         mov rax, 0
                    add rcx, 0
                    jz .else
                    js .else
                    jmp .elseif
.else:              mov rax, str2
                    ret
.elseif:            mov rax, str1
                    ret

CheckOverflow:      mov rax, 0
                    mov r10, 0
                    mov r11, 8
                    add r10, rcx
                    add r10, rdx
                    jz .elseif
                    ;
                    imul rcx, rcx
                    jo .else
                    imul rcx, rcx
                    jo .else
                    ;
                    add r11, rcx
                    jo .else
                    imul rdx, rdx
                    jo .else
                    ;
                    sub r11, rdx
                    jo .else
                    imul r10, r10
                    jmp .else
.else:              seto al
                    ret
.elseif:            setz al
                    ret
        
Function:           cmp rcx, -1
                    js .else
                    cmp rcx, 18
                    js .elseif
                    mov rax, rcx
                    imul rax, rcx
                    imul rax, rcx
                    neg rax
                    sub rax, 2
                    ret
.else:              imul rcx, rcx
                    imul rcx, 2
                    sub rcx, 3
                    mov rax, rcx
                    ret
.elseif:            mov r10, rcx
                    imul r10, -3
                    add r10, 10
                    mov rax, rcx
                    imul rax, rcx
                    neg rax
                    add rax, 36
                    ;
                    mov r11, rax
                    cqo
                    idiv r10
                    imul rax, r10
                    ;
                    cmp rax, r11
                    jne .else1
                    cqo
                    idiv r10
                    ret
.else1:             mov rax, r11
                    cqo
                    idiv r10
                    add rax, 1
                    ret
        
IsInCircle:         imul rcx, rcx
                    imul rdx, rdx
                    mov rax, rcx
                    add rax, rdx
                    imul rax, 4
                    mov r10, r8
                    imul r10, r10
                    jo .true
                    cmp r10, rax
                    js .false
                    jmp .true
.true:              mov rax, 1
                    ret
.false:             mov rax, 0
                    ret
        
TwoIntegers:        ; Expect true, when x = 0 and y = 0.
                    mov r10, rdx
                    cmp rcx, 0
                    je .true
                    cmp r10, 0
                    je .true
                    ;
                    ; Check if y | x
                    ;
                    mov rax, rcx
                    cqo
                    idiv r10
                    imul rax, r10
                    cmp rcx, rax
                    je .true
                    ;
                    ; Check if x | y
                    ;
                    mov rax, r10
                    cqo
                    idiv rcx
                    imul rax, rcx
                    cmp rax, r10
                    je .true
                    jmp .false
.true:              mov rax, 1
                    ret
.false:             mov rax, 0
                    ret

CountNumbers:       mov r10, r8
                    cmp rcx, r10
                    js .change_min
                    jmp .continue
.change_min:        xchg r10, rcx
                    jmp .continue
.continue:          xchg rdx, rcx
                    cmp rcx, r10
                    js .change_min
                    ;
                    ; Here min(a, b, c) lies in r10
                    ;
                    mov r11, rdx
                    mov rax, r11
                    cqo
                    idiv r10
                    imul rax, r10
                    sub r11, rax
                    ;
                    ; The reminder & counter lies in r11
                    ;
                    and r11, 1
                    ;
                    mov rax, rcx
                    cqo
                    idiv r10
                    imul rax, r10
                    sub rcx, rax
                    ;
                    and rcx, 1
                    ;
                    add r11, rcx
                    mov rax, r11
                    ret

Switch:             cmp rcx, 0
                    je .case1
                    cmp rcx, 1
                    je .case1
                    cmp rcx, 2
                    je .case1
                    cmp rcx, 5
                    je .case1
                    ;
                    cmp rcx, 4
                    je .case2
                    cmp rcx, 42
                    je .case2
                    cmp rcx, 43
                    je .case2
                    ;
                    cmp rcx, 13
                    je .case3
                    ;
                    cmp rcx, -99
                    je .case4
                    cmp rcx, -100
                    je .case4
                    ;
                    cmp rcx, 10
                    je .case5
                    cmp rcx, 100
                    je .case5
                    cmp rcx, 1000
                    je .case5
                    ;
                    mov rax, str8
                    ret
.case1:             mov rax, str3
                    ret
.case2:             mov rax, str4
                    ret
.case3:             mov rax, str5
                    ret
.case4:             mov rax, str6
                    ret
.case5:             mov rax, str7
                    ret

MagicMetric:        cmp rcx, 10000000
                    js .else
                    cmp rcx, 100000000
                    jns .else
                    jmp .elseif
.else:              mov rax, 0
                    ret
.elseif:            ; K has 8 digits.
                    mov rax, rcx
                    mov rcx, 0
                    mov r11, 0
                    ;
                    mov r10, 10
                    cqo
                    idiv r10
                    mov r11, rdx
                    cqo
                    idiv r10
                    shl r11, 8
                    add r11, rdx
                    cqo
                    idiv r10
                    shl r11, 8
                    add r11, rdx
                    cqo
                    idiv r10
                    shl r11, 8
                    add r11, rdx
                    cqo
                    idiv r10
                    shl r11, 8
                    add r11, rdx
                    cqo
                    idiv r10
                    shl r11, 8
                    add r11, rdx
                    cqo
                    idiv r10
                    shl r11, 8
                    add r11, rdx
                    cqo
                    idiv r10
                    shl r11, 8
                    add r11, rdx
                    ;
                    ; Bytes of digits lies in r11
                    ; like a0_a1_a2_a3_a4_a5_a6_a7.
                    ; Counter lies in cl.
                    ;
                    mov r10, 0
                    mov r10b, r11b
                    shl r10, 8
                    shr r11, 8
                    mov r10b, r11b
                    shl r10, 8
                    shr r11, 8
                    mov r10b, r11b
                    shl r10, 8
                    shr r11, 8
                    mov r10b, r11b
                    shl r10, 8
                    shr r11, 8
                    mov r10b, r11b
                    shl r10, 8
                    shr r11, 8
                    mov r10b, r11b
                    shl r10, 8
                    shr r11, 8
                    mov r10b, r11b
                    shl r10, 8
                    shr r11, 8
                    mov r10b, r11b
                    mov r11, r10
                    ;
                    ; Now they lies in r11 like
                    ; a7_a6_a5_a4_a3_a2_a1_a0 :)
                    ;
                    mov r10, 0
                    mov rcx, 0
                    ;
.condition1:        mov rax, r11
                    cmp al, 2
                    je .edit_counter1
                    cmp ah, 2
                    je .edit_counter1
                    shr rax, 16
                    cmp al, 2
                    je .edit_counter1
                    cmp ah, 2
                    je .edit_counter1
                    jmp .condition2
.edit_counter1:     add cl, 1
                    jmp .condition2
                    ;
.condition2:        mov rax, r11
                    shr rax, 16
                    mov r10, 0
                    mov r10b, al
                    shr rax, 32
                    cmp r10b, al
                    je .edit_counter2
                    jmp .condition3
.edit_counter2:     add cl, 1
                    jmp .condition3
                    ;
.condition3:        mov rax, r11
                    mov r10, 0
                    shr rax, 40
                    mov r10b, al
                    shr rax, 16
                    add r10, rax
                    cmp r10, 6
                    js .condition4
                    jmp .edit_counter3
.edit_counter3:     add cl, 1
                    jmp .condition4
                    ;
                    ; ploho scitaet
                    ;
.condition4:        mov r10, 0
                    ;
                    mov rax, r11
                    shr rax, 32
                    mov r10b, al
                    shl r10, 8
                    shr rax, 8
                    mov r10b, al
                    shl r10, 8
                    shr rax, 8
                    mov r10b, al
                    shl r10, 8
                    shr rax, 8
                    mov r10b, al
                    ;
                    cmp r10d, r11d
                    je .edit_counter4
                    mov rax, 0
                    mov al, cl
                    ret
.edit_counter4:     add cl, 1
                    mov rax, 0
                    mov al, cl
                    ret






