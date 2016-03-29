#lang racket
; gui.rkt
(require
 racket/gui
 racket/draw)

; Derive a new canvas (a drawing window) class to handle events
(define my-canvas%
  (class canvas% ; The base class is canvas%
    ; Define overriding method to handle mouse events
    (define/override (on-event event)
      (send msg set-label "Canvas mouse"))
    ; Define overriding method to handle keyboard events
    (define/override (on-char event)
      (send dctxt draw-bitmap bitmap2 20 20))
    ; Call the superclass init, passing on all init args
    (super-new)))

(define frame (new frame%
                   [label "Example"]
                   [width 800]
                   [height 500]))
(define msg (new message% [parent frame]
                          [label "No events so far..."]))
(define canvas
  (new my-canvas% [parent frame]
             [paint-callback
              (lambda (canvas dc)
                (send dc set-scale 1 1)
                (send dc set-text-foreground "blue")
                (send dc draw-bitmap bitmap1 20 20))]))
(send frame show #t)

(define dctxt (send canvas get-dc))

(define bitmap1 (make-object bitmap% 24 200 200))
(send bitmap1 load-file "bitmap1.bmp")

(define bitmap2 (make-object bitmap% 24 200 200))
(send bitmap2 load-file "bitmap2.bmp")