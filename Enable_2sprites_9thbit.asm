
.const VIC2 = $d000                 // Vic address constant

.namespace sprites {                // Creating namespace
    .label positions = VIC2         // Create a label to refer back too
    .label position_highbit_x = VIC2 +16
    .label enable_bits = VIC2 +21   // As above = enable sprite
    
}                                   // Ending namespace

BasicUpstart2(main)

main:
    lda #%00000011
    sta sprites.enable_bits             // $d015 enable sprites. Using namespace  

    lda #%00000010                      // $
    sta sprites.position_highbit_x

    .var x = 25         // Giving Variable for X position of sprite
    .var y = 51         // As above but for Y

//      Sprite 0
    lda #x                      // Load X variable
    sta sprites.positions +0    // Insert to namespace ($d000)

    lda #y                      // Load Y variable 
    sta sprites.positions +1    // Insert to namespace ($d001)

//      Sprite 1
    lda #x+37                   // Load X variable
    sta sprites.positions +2    // Insert to namespace ($d000)

    lda #y                      // Load Y variable 
    sta sprites.positions +3    // Insert to namespace ($d001)
    rts 