object knightRider {
	
	method peso() = 500
	
	method peligrosidad() = 10
}

object bumblebee {
	var property estaTransformado
	
	method peso() = 800
	
	method peligrosidad() {
		if (estaTransformado) {
			return 15
		} else {
			return 30
		}
	}
	
	method transformar() {
		estaTransformado = not estaTransformado
	}
}

object paqueteLadrillos{
	var property cantLadrillos
	
	method peso() = cantLadrillos * 2
	
	method peligrosidad() = 2
}


object arena {
	var property peso
	
	method peligrosidad() = 1
}

object bateriaAntiaerea {
	var property estaCargada
	
	method peso() {
		if (estaCargada) {
			return 300
		} else {
			return 200
		}
	}
	
	method peligrosidad() {
		if (estaCargada) {
			return 100
		} else {
			return 0
		}
	}
	
	method cambiarCargaMisiles() {
		estaCargada = not estaCargada
	}
}

object contenedorPortuario {
	var contenido = []
	
	method peso() = 100 + self.pesoDeContenido()
	
	method peligrosidad() {
		if (contenido.isEmpty()) {
			return 0
		} else {
			return self.objetoMasPeligroso().peligrosidad()
		}
	}
	
	method pesoDeContenido() = contenido.sum( { c => c.peso() } )
	
	method objetoMasPeligroso() = contenido.max( { c => c.peligrosidad() } )
	
	method cargarContenido(cosa) {
		contenido.add(cosa)
	}
	
	method descargarContenido(cosa) {
		contenido.remove(cosa)
	}
}

object residuosRadioactivos {
	var property peso
	
	method peligrosidad() = 200
}

object embalajeSeguridad {
	var property objetoEmbalado
	
	method peso() = objetoEmbalado.peso()
	
	method peligrosidad() = objetoEmbalado.peligrosidad() * 0.5
}




