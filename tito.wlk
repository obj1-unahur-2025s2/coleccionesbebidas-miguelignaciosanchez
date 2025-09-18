object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}
/*Nuevas bebidas*/
object licuado {
    var nutrientes = [10,20,15]   
    method agregarNutriente(unValor) {
        nutrientes.add(unValor)
    }
    method rendimiento(cantidad) {
        return nutrientes.sum() * (cantidad / 1000)
    }
}
object aguaSaborizada {
    var parteBebida = 0 
    var base = wisky   
    method acompañado(unaBebida) {
        base = unaBebida
    }
    method rendimiento(cantidad) {
        parteBebida = cantidad * 0.25
        return 1 + base.rendimiento(parteBebida)
    }
}
object coctel {
    var componentes = [terere, aguaSaborizada] 
    var porcion = 0
    method agregarBebida(unaBebida) {
        componentes.add(unaBebida)
    }
    method limpiar() {
        componentes = []   
    }
    method rendimiento(cantidad) {
        porcion = cantidad / componentes.size()
        return componentes
        .map {unaBebida => unaBebida.rendimiento(porcion)}
        .reduce { acc, valor => acc * valor}
    }
}