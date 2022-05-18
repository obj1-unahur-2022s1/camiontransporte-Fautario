/*
 * Revisar algunos comentarios que te deje en el codigo.
 */

import cosas.*

object camion {
	var carga = []
	var tara = 1000
	var pesoMaximo = 2000
	
	method cargar(cosa) { 
		cosa.esCargado()
		carga.add(cosa)
	}
	
	method descargar(cosa) { carga.remove(cosa) }
	
	method todoPesoPar() = carga.all( { c => c.peso().even() } )
	
	method hayAlgunoQuePesa(peso) = carga.any( { c => c.peso() == peso } )
	
	/* Ojo que findOrElse debería retornar siempre una cosa, no un String por el else */
	method elDeNivel(nivel) {
		return carga.findOrElse( { c => c.peligrosidad() == nivel} , { "No hay elemento de esa peligrosidad" } )
	}
	
	method pesoTotal() = tara + self.pesoDeCarga()
	
	method pesoDeCarga() = carga.sum( { c => c.peso() } )
	
	method excedidoDePeso() = self.pesoTotal() > pesoMaximo
	
	method objetosQueSuperanPeligrosidad(nivel) = carga.filter( { c => c.peligrosidad() > nivel } )
	
	/*Acá podias reutilizar el método objetosQueSuperanPeligrosidad(nivel) */
	//method objetosMasPeligrososQue(cosa) = carga.filter( { c => c.peligrosidad() > cosa.peligrosidad() } )
	method objetosMasPeligrososQue(cosa) = self.objetosQueSuperanPeligrosidad(cosa.peligrosidad())
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
	
	/* Podes usar el between */
	method tieneAlgoQuePesaEntre(min, max) = carga.any( { c => c.peso() > min and c.peso() < max } )
	
	method cosaMasPesada() = carga.max( { c => c.peso() } )
	
	method pesos() = carga.map( { c => c.peso() } )
	
	method totalBultos() = carga.sum( { c => c.bulto() } )
}