
BasicUpstart2(main)

main:
    lda #%00000001  // Enabling sprite 0 (1st bit)
    sta $d015       // Enable Sprite Address


    lda #25         // position for X
    sta $d000       // Sprite X Address

    lda #51         // position for Y
    sta $d001       // Sprite Y Address

    rts

