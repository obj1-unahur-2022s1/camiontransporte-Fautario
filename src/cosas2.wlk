/*
 * Revisar: solo 1 comentario. Recordá que podes usar el between.
 * El reto esto todo ok
 */

object knightRider {
	
	method peso() = 500
	
	method peligrosidad() = 10
	
	method bulto() = 1
	
	method esCargado() {}
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
	
	method bulto() = 2
	
	method esCargado() { self.estaTransformado(false) }
}

object paqueteLadrillos{
	var property cantLadrillos
	
	method peso() = cantLadrillos * 2
	
	method peligrosidad() = 2
	
	method bulto() {
		if (cantLadrillos >= 1 and cantLadrillos <= 100) {
			return 1
		/*Recorda que podes usar el between */
		} else if(cantLadrillos > 100 and cantLadrillos <= 300) {
			return 2
		} else {
			return 3
		}
	}
	
	method esCargado() {cantLadrillos += 12}
}


object arena {
	var property peso
	
	method peligrosidad() = 1
	
	method bulto() = 1
	
	method esCargado() { peso += 20 }
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
	
	method bulto() {
		if (estaCargada) {
			return 2
		} else {
			return 1
		}
	}
	
	method esCargado() { estaCargada = true }
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
	
	method bulto() = 1 + self.bultoDeContenido()
	
	method bultoDeContenido() = contenido.sum( { c => c.bulto() } )
	
	method esCargado() {contenido.forEach( { c => c.esCargado() } ) }
}

object residuosRadioactivos {
	var property peso
	
	method peligrosidad() = 200
	
	method bulto() = 1
	
	method esCargado() { peso += 15 }
}

object embalajeSeguridad {
	var property objetoEmbalado
	
	method peso() = objetoEmbalado.peso()
	
	method peligrosidad() = objetoEmbalado.peligrosidad() * 0.5
	
	method bulto() = 2
	
	method esCargado() {}
}




