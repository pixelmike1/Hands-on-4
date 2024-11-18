
(defrule oferta-iphone16-banamex
    ?orden <- (orden (tipo smartphone) (marca apple) (modelo iphone16))
    (tarjetacred (banco banamex))
    =>
    (printout t "Oferta: 24 meses sin intereses al pagar con tarjeta Banamex." crlf))

(defrule oferta-note21-liverpool
    ?orden <- (orden (tipo smartphone) (marca samsung) (modelo note21))
    (tarjetacred (banco liverpool) (grupo visa))
    =>
    (printout t "Oferta: 12 meses sin intereses al pagar con tarjeta Liverpool VISA." crlf))

(defrule oferta-combo-macbookair-iphone16
    (orden (tipo smartphone) (marca apple) (modelo iphone16))
    (orden (tipo computadora) (marca apple) (modelo macbookair))
    =>
    (bind ?total (+ (* 27000 1) (* 35000 1))) ; Calcular el total
    (bind ?vales (/ ?total 1000)) ; 100 pesos por cada 1000
    (printout t "Oferta: Se entregan " ?vales " pesos en vales por la compra." crlf))

(defrule descuento-accesorios-smartphone
    ?orden <- (orden (tipo smartphone))
    =>
    (printout t "Descuento: 15% en fundas y micas para smartphones." crlf))

(defrule categorizar-menudista
    ?orden <- (orden (tipo ?tipo) (qty ?qty))
    (test (< ?qty 10))
    =>
    (printout t "El cliente es categorizado como Menudista por la compra de " ?qty " " ?tipo "." crlf))

(defrule categorizar-mayorista
    ?orden <- (orden (tipo ?tipo) (qty ?qty))
    (test (>= ?qty 10))
    =>
    (printout t "El cliente es categorizado como Mayorista por la compra de " ?qty " " ?tipo "." crlf))

(defrule actualizar-stock
    ?orden <- (orden (tipo ?tipo) (marca ?marca) (modelo ?modelo) (qty ?qty) (total nil))
    (smartphone (marca ?marca) (modelo ?modelo) (precio ?precio))
    =>
    (bind ?total (* ?precio ?qty)) ; Calcular el total
    (retract ?orden)
    (assert (orden (tipo ?tipo) (marca ?marca) (modelo ?modelo) (qty ?qty) (total ?total)))
    (assert (stock-actualizado (tipo ?tipo) (marca ?marca) (modelo ?modelo) (qty (- 100 ?qty))))
    (printout t "Stock actualizado para " ?tipo " " ?marca " " ?modelo ". Total: $" ?total crlf))
