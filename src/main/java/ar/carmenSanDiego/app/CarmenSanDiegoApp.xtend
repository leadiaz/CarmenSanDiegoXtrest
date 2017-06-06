package ar.carmenSanDiego.app

import org.uqbar.xtrest.api.XTRest
import ar.carmenSanDiego.rest.CarmenSanDiegoRestAPI
import ar.carmenSanDiego.model.Villano
import ar.carmenSanDiego.model.Pais
import ar.carmenSanDiego.model.Expedientes
import ar.carmenSanDiego.model.Mapamundi
import ar.carmenSanDiego.model.Caso
import ar.carmenSanDiego.model.lugaresDeInteres.LugarDeInteres
import ar.carmenSanDiego.model.lugaresDeInteres.Embajada
import ar.carmenSanDiego.model.lugaresDeInteres.Club
import ar.carmenSanDiego.model.lugaresDeInteres.Biblioteca
import ar.carmenSanDiego.model.lugaresDeInteres.Banco
import ar.carmenSanDiego.model.PaisSimple

class CarmenSanDiegoApp {
	
		def static void main(String[] args) {
		var villanos = new Expedientes
		val elAleph = new Villano(2, "El Aleph","Masculino")
			elAleph.agregarSeña( " tiene el pelo rubio")
			elAleph.agregarSeña( "tiene ojos azules")
			elAleph.agregarSeña( " usa una collar de rubies ")
			elAleph.agregarSeña( " tenia una bufanda azul")
			elAleph.agregarHobbie("jugar al futbol")
			elAleph.agregarHobbie("ver anime")
			elAleph.agregarHobbie("escuchar musica de los 80")
		villanos.setVillano(new Villano(1, "Carlos","Masculino"))
		villanos.setVillano(elAleph)
		villanos.setVillano(new Villano(3, "Carmen San Diego","Femenino"))
		villanos.setVillano(new Villano(4, "Igor Brodie","Masculino"))
		villanos.setVillano(new Villano(5, "Juan Perez","Masculino"))
		
		var paises = new Mapamundi
		/*var argentina = new Pais(1, "Argentina")
		argentina.agregarLugarDeInteres(new Embajada(argentina))
		argentina.agregarLugarDeInteres(new Club(argentina))
		argentina.agregarLugarDeInteres(new Biblioteca(argentina))*/
		val Pais argentina = new Pais(1,"Argentina")
		argentina.agregarCaracteristica("hablan Español")
			argentina.agregarCaracteristica("su bandera es celeste y blanca")
			argentina.agregarCaracteristica("Comen Asado")
			argentina.agregarCaracteristica("Su moneda es el Peso Argentino")
			argentina.agregarLugarDeInteres(new Embajada(1,"Argentina","Embajada")=> [
					setearInformante()
					])

			argentina.agregarLugarDeInteres(new Club(2,"Argentina","Club")=> [
					setearInformante()
					])
			argentina.agregarLugarDeInteres(new Banco(3,"Argentina","Banco")=> [
					setearInformante()
					])
		var peru = new Pais(2, "Peru")
		peru.agregarLugarDeInteres(new Embajada(4,"Peru","Embajada")=> [
					setearOcupante()
					])
		peru.agregarLugarDeInteres(new Banco(5,"Peru","Banco")=> [
					setearOcupante()
					])
		peru.agregarLugarDeInteres(new Biblioteca(6,"Peru","Biblioteca")=> [
					setearOcupante(elAleph)
					])
		peru.agregarCaracteristica("hablan Español")
		peru.agregarCaracteristica("su bandera es roja y blanca")
		peru.agregarCaracteristica("Comen Palomas")
		peru.agregarCaracteristica("Su moneda es el Peso")
		var españa = new Pais(3, "España")
		var bolivia = new Pais(4, "Bolivia")
		var francia = new Pais(5, "Francia")
		francia.agregarLugarDeInteres(new Embajada(7,"Francia","Embajada"))
		francia.agregarLugarDeInteres(new Club(8,"Francia","Club"))
		francia.agregarLugarDeInteres(new Biblioteca(9,"Francia","Biblioteca"))
		argentina.agregarPaisConexion(peru)
		argentina.agregarPaisConexion(francia)
		paises.setPais(argentina)
		paises.setPais(peru)
		paises.setPais(españa)
		paises.setPais(bolivia)
		paises.setPais(francia)
		
		var caso1 = new Caso(5,argentina,elAleph)
			caso1.agregarPaisPlanDeEscape(new PaisSimple(argentina))
			caso1.agregarPaisPlanDeEscape(new PaisSimple(peru))
			caso1.agregarPaisPlanDeEscape(new PaisSimple(francia))
		var carmenRestAPI= new CarmenSanDiegoRestAPI(villanos,paises )
		carmenRestAPI.agregarCaso(caso1) 
        XTRest.startInstance(carmenRestAPI, 9001)
    }}