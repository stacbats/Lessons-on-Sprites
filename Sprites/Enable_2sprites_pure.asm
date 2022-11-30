BasicUpstart2(main)

main:
    lda #%00000011  // Enabling sprite 0 (1st bit)
    sta $d015       // Enable Sprite Address

    lda #%00000010  // Enabling sprite 1 (1st bit)
    sta $d010       // Enable Sprite Address

//  ***             SPRITE 0
    lda #25         // Screen Position for X
    sta $d000       // Sprite0 X Address

    lda #51         // Screen Position for Y
    sta $d001       // Sprite0 Y Address


//  ***             SPRITE 1
    lda #62         // Screen Position for X
    sta $d002       // Sprite1 X Address

    lda #51         // Screen Position for Y
    sta $d003       // Sprite1 Y Address
    rts

