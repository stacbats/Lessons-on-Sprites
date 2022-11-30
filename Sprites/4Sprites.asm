
.const VIC2 = $d000                             // Vic address constant

.namespace sprites {                            // Creating namespace

    .label positions            = VIC2          // Create a label to refer back too
    .label position_highbit_x   = VIC2 +16      // Enable the 9th bit to go past 250 on screen
    .label enable_bits          = VIC2 +21      // Enable sprite
    .label colours              = VIC2 +29      // Sprite colour
    .label vertical_bit         = VIC2 +23      // Stretch sprite vertically
    .label horizontal_bit       = VIC2 +29      // Stretch sprite horizontally
    
}                                               // Ending namespace

BasicUpstart2(main)

main:
    lda #%00001111
    sta sprites.enable_bits             // $d015 enable sprites. Using namespace  

    lda #%00000010                      // Enables selected sprites to pass 9th bit
    sta sprites.position_highbit_x

    .var x = 25         // Giving Variable for X position of sprite
    .var y = 51         // As above but for Y

//  ************************    Sprite 0
    lda #x                      // Load X variable
    sta sprites.positions +0    // Insert to namespace ($d000)

    lda #y                      // Load Y variable 
    sta sprites.positions +1    // Insert to namespace ($d001)

//  ************************    Sprite 1
    lda #x+37                   // Load X variable
    sta sprites.positions +2    // Insert to namespace ($d002)

    lda #y                      // Load Y variable 
    sta sprites.positions +3    // Insert to namespace ($d003)

//  ************************    STretch the sprite vertically
    
    lda #%00000100
    sta sprites.vertical_bit
//  ************************    Sprite 2
    lda #x+150                      // Load X variable
    sta sprites.positions +4    // Insert to namespace ($d004)

    lda #y+50                      // Load Y variable 
    sta sprites.positions +5    // Insert to namespace ($d005)


    lda #%00001000
    sta sprites.horizontal_bit
//  ************************    Sprite 3
    lda #x+100                   // Load X variable
    sta sprites.positions +6    // Insert to namespace ($d006)

    lda #y+150                      // Load Y variable 
    sta sprites.positions +7    // Insert to namespace ($d007)

    
    rts 