.include "m328def.inc"

.def tmp = r16
.def ledArray = r20

.equ START_BTN_INT = INT0
.equ STOP_BTN_INT = INT1

.org 0x00
                jmp Reset

Reset:          ldi tmp, low(RAMEND)
                out SPL, tmp
                ldi tmp, high(RAMEND)
                out SPH, tmp

                ser tmp
                out DDRB, tmp

MainLoop:       ldi tmp, 0b00000001
                out PORTB, tmp
                rcall Delay500ms
                
                clr tmp
                out PORTB, tmp
                rcall Delay500ms

                ldi tmp, 0b00000001
                out PORTB, tmp
                rcall Delay100ms

                clr tmp
                out PORTB, tmp
                rcall Delay100ms

                rjmp MainLoop

Delay500ms:     ldi r19, 100
Dec0:           ldi r17, 106
Dec1:           ldi r18, 249
Dec2:           dec r18
                brne Dec2
                dec r17
                brne Dec1
                dec r19
                brne Dec0
                ret

Delay100ms:     ldi r19, 128
Dec0_:          ldi r17, 16
Dec1_:          ldi r18, 255
Dec2_:          dec r18
                brne Dec2_
                dec r17
                brne Dec1_
                dec r19
                brne Dec0_
                ret

