.model small
.data
    n db 20                                                          ; Number of elements to add
    A db 0, 1, 1, 2, 3, 3, 4, 4, 5, -1, 1, 2, 2, 2, 3, 3, 4, 4, 0, 1 ; Matrix A
    B db 1, 1, 2, 2, 2, 3, 3, 4, 4, 0, 1, 1, 2, 3, 3, 4, 4, 5, 1, 1  ; Matrix B
    C db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ; Matrix C to store the result
    newline db 13, 10, '$'                                           ; Newline characters for printing

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cl, n         ; Set loop counter to the number of elements
    mov si, 0         ; Index for accessing elements

jumlah:
    mov al, [A + si]     ; Load A[si] into AL
    add al, [B + si]     ; Add B[si]
    mov [C + si], al     ; Store result in C[si]
    inc si            ; Increment index
    loop jumlah       ; Loop until CX is 0

    ; Print the C array
    mov cl, 0
    mov cl, n            ; Set loop counter to the number of elements
    mov si, 0            ; Index for accessing elements

print_C:
    mov al, [C + si]     ; Load C[si] into AL
    add al, 30h          ; Convert to ASCII (assuming values are 0-9)
    mov dl, al           ; Move ASCII value to DL for printing
    mov ah, 02h          ; DOS interrupt to print character
    int 21h              ; Print character
    inc si               ; Increment index
    loop print_C         ; Loop until CX is 0

    ; Print newline
    lea dx, newline      ; Load address of newline characters
    mov ah, 09h          ; DOS interrupt to print string
    int 21h              ; Print newline

    ; Exit program
    mov ax, 4C00h
    int 21h
main endp
end main