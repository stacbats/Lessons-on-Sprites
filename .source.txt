
.const VIC2 = $d000                 // Vic address constant

.namespace sprites {                // Creating namespace
    .label positions = VIC2         // Create a label to refer back too
    .label enable_bits = VIC2 +21   // As above = enable sprite
    
}                                   // Ending namespace

BasicUpstart2(main)

main:
    lda #%00000001
    sta sprites.enable_bits     // $d015 enable sprites. Using namespace  

    .var x = 25         // Giving Variable for X position of sprite
    .var y = 51         // As above but for Y

    lda #x                      // Load X variable
    sta sprites.positions +0    // Insert to namespace ($d000)

    lda #y                      // Load Y variable 
    sta sprites.positions +1    // Insert to namespace ($d001)

    rts 