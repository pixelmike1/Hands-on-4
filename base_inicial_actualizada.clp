
(deftemplate smartphone
    (slot marca)
    (slot modelo)
    (slot color)
    (slot precio))

(deftemplate computadora
    (slot marca)
    (slot modelo)
    (slot color)
    (slot precio))

(deftemplate accesorio
    (slot tipo)
    (slot modelo)
    (slot precio)
    (slot descuento))

(deftemplate cliente
    (slot id)
    (slot nombre)
    (slot tipo) ; Menudista o Mayorista
    (slot historial-compra))

(deftemplate orden
    (slot tipo) ; smartphone, computadora, etc.
    (slot marca)
    (slot modelo)
    (slot qty)
    (slot total))

(deftemplate tarjetacred
    (slot banco)
    (slot grupo)
    (slot exp-date))

(deftemplate vale
    (slot id)
    (slot valor))

(deftemplate stock-actualizado
    (slot tipo)
    (slot marca)
    (slot modelo)
    (slot qty))

(deffacts base-inicial
    (smartphone (marca apple) (modelo iphone16) (color rojo) (precio 27000))
    (smartphone (marca samsung) (modelo note21) (color negro) (precio 22000))
    (computadora (marca apple) (modelo macbookpro) (color gris) (precio 47000))
    (computadora (marca apple) (modelo macbookair) (color plata) (precio 35000))
    (accesorio (tipo funda) (modelo iphone16) (precio 500) (descuento 15))
    (accesorio (tipo mica) (modelo iphone16) (precio 300) (descuento 15))
    (tarjetacred (banco bbva) (grupo visa) (exp-date 01-12-23))
    (tarjetacred (banco banamex) (grupo oro) (exp-date 01-12-25))
    (tarjetacred (banco liverpool) (grupo visa) (exp-date 01-10-24))
    (cliente (id 1) (nombre "Carlos") (tipo menudista) (historial-compra 5))
    (cliente (id 2) (nombre "Empresa XYZ") (tipo mayorista) (historial-compra 50)))
