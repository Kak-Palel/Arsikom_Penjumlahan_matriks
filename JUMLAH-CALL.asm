.model small
.data
    n db 20                                                         ; Number of elements to add
    A db 20 dup (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0); Matrix A, maximum size 20
    B db 20 dup (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0); Matrix B, maximum size 20
    C db 20 dup (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0); Matrix C to store the result
    newline db 13, 10, '$'                                          ; Newline characters for printing

.code
; Subroutine to input matrix A
input_A proc
    mov cx, 0               ; Clear high byte of CX
    mov cl, n               ; Set loop counter to the number of elements
    mov si, 0               ; Index for accessing elements

input_A_loop:
    ; Prompt for input A[si]
    mov ah, 01h             ; DOS interrupt to read a character
    int 21h                 ; Read character into AL
    sub al, 30h             ; Convert ASCII to numeric value (assuming input is 0-9)
    mov [A + si], al        ; Store input in A[si]
    inc si                  ; Increment index
    loop input_A_loop       ; Loop until CX is 0

    ; Print newline
    lea dx, newline         ; Load address of newline characters
    mov ah, 09h             ; DOS interrupt to print string
    int 21h                 ; Print newline

    ret
input_A endp

; Subroutine to input matrix B
input_B proc
    mov cx, 0               ; Clear high byte of CX
    mov cl, n               ; Set loop counter to the number of elements
    mov si, 0               ; Index for accessing elements

input_B_loop:
    ; Prompt for input B[si]
    mov ah, 01h             ; DOS interrupt to read a character
    int 21h                 ; Read character into AL
    sub al, 30h             ; Convert ASCII to numeric value (assuming input is 0-9)
    mov [B + si], al        ; Store input in B[si]
    inc si                  ; Increment index
    loop input_B_loop       ; Loop until CX is 0
    
    ; Print newline
    lea dx, newline         ; Load address of newline characters
    mov ah, 09h             ; DOS interrupt to print string
    int 21h                 ; Print newline
    
    ret
input_B endp

; Subroutine to add matrices A and B
add_matrices proc
    mov cx, 0               ; Clear high byte of CX
    mov cl, n               ; Set loop counter to the number of elements
    mov si, 0               ; Index for accessing elements

jumlah:
    mov al, [A + si]        ; Load A[si] into AL
    add al, [B + si]        ; Add B[si]
    mov [C + si], al        ; Store result in C[si]
    inc si                  ; Increment index
    loop jumlah             ; Loop until CX is 0
    ret
add_matrices endp

main proc
    mov ax, @data           ; Initialize DS
    mov ds, ax

    mov ah, 01h
    int 21h       ; AL now contains ASCII of user key
    sub al, '0'   ; now AL = numeric value (e.g., '5' → 5)
    mov dl, 10
    mul dl        ; multiply by 10 to prepare for next digit
    mov n, al     ; store it in variable n
    mov ah, 01h
    int 21h       ; AL now contains ASCII of user key
    sub al, '0'   ; now AL = numeric value (e.g., '5' → 5)
    ADD n, al     ; store it in variable n

    ; Print newline
    lea dx, newline         ; Load address of newline characters
    mov ah, 09h             ; DOS interrupt to print string
    int 21h                 ; Print newline

    ; Input matrix A
    call input_A

    ; Input matrix B
    call input_B

    ; Add matrices A and B
    call add_matrices

    ; Print the C array
    mov cx, 0
    mov cl, n               ; Set loop counter to the number of elements
    mov si, 0               ; Index for accessing elements

print_C:
    mov al, [C + si]        ; Load C[si] into AL
    add al, 30h             ; Convert to ASCII (assuming values are 0-9)
    mov dl, al              ; Move ASCII value to DL for printing
    mov ah, 02h             ; DOS interrupt to print character
    int 21h                 ; Print character
    inc si                  ; Increment index
    loop print_C            ; Loop until CX is 0

    ; Print newline
    lea dx, newline         ; Load address of newline characters
    mov ah, 09h             ; DOS interrupt to print string
    int 21h                 ; Print newline

    ; Exit program
    mov ax, 4C00h
    int 21h
main endp

end main
