#lang racket
 (require racket/gui/base)
(define frame (new frame%
                   [label "Example"]
                   [width 800]
                   [height 600]))
(define msg (new message% [parent frame]
                          [label "No events so far..."]))
 
; Make a button in the frame
(new button% [parent frame]
             [label "Click Me"]
             ; Callback procedure for a button click:
             [callback (lambda (button event)
                         (send msg set-label "Button click"))])

(define my-canvas%
  (class canvas% ; The base class is canvas%
    ; Define overriding method to handle mouse events
    (define/override (on-event event)
      (send msg set-label "Canvas mouse"))
    ; Define overriding method to handle keyboard events
    (define/override (on-char event)
      (send msg set-label "Canvas keyboard"))
    ; Call the superclass init, passing on all init args
    (super-new)))
; Make a canvas that handles events in the frame
(define mycanvas (new my-canvas%
     [parent frame]
     [paint-callback
              (lambda (canvas dc)
                (send dc set-scale 3 3)
                (send dc set-text-foreground "blue")
                (send dc draw-text "Don't Panic!" 0 0)
                (send dc draw-rectangle 0 0 100 30)
                ;(make-object color% 0 0 255 [180]))
                )]))
(send mycanvas set-canvas-background (make-object color% 0 0 155 .99))
(send frame show #t)