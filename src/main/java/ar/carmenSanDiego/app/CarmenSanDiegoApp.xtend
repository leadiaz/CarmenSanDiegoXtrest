package ar.carmenSanDiego.app

import org.uqbar.xtrest.api.XTRest
import ar.carmenSanDiego.rest.CarmenSanDiegoRestAPI
import ar.carmenSanDiego.model.ExpedientesRest
import ar.gaston.carmenSanDiego.Villano
import ar.carmenSanDiego.model.MapamundiRest
import ar.gaston.carmenSanDiego.Pais
import ar.gaston.carmenSanDiego.LugarDeInteres
import ar.gaston.carmenSanDiego.Embajada
import ar.gaston.carmenSanDiego.Club
import ar.gaston.carmenSanDiego.Biblioteca
import ar.carmenSanDiego.model.CasoRest
import ar.gaston.carmenSanDiego.Caso
import Extra.DummyData
import AplicationModel.ExpedientesAppModel
import AplicationModel.Mapamundi
import ar.gaston.carmenSanDiego.Banco
import ar.carmenSanDiego.model.PaisRest

class CarmenSanDiegoApp {
	
		def static void main(String[] args) {
		var exped = new ExpedientesAppModel()
			val elAleph = new Villano(2, "El Aleph","Masculino")
			elAleph.agregarSeña( " tiene el pelo rubio")
			elAleph.agregarSeña( "tiene ojos azules")
			elAleph.agregarSeña( " usa una collar de rubies ")
			elAleph.agregarSeña( " tenia una bufanda azul")
			elAleph.agregarHobbie("jugar al futbol")
			elAleph.agregarHobbie("ver anime")
			elAleph.agregarHobbie("escuchar musica de los 80")
		exped.agregarNuevoVillano(new Villano(1, "Carlos","Masculino"))
		exped.agregarNuevoVillano(elAleph)
		exped.agregarNuevoVillano(new Villano(3, "Igor Brodie","Masculino"))
		exped.agregarNuevoVillano(new Villano(4, "Carmen San Diego","Femenino"))
		exped.agregarNuevoVillano(new Villano(5, "Juan Perez","Masculino"))
		var expediente = new ExpedientesRest(exped)
		
//		var mapa =new Mapamundi()
//		mapa.agregarNuevoPais()
		
		var mapamundi = new MapamundiRest
		/*var argentina = new Pais("Argentina", 1)
		argentina.agregarLugarDeInteres(new Embajada)
		argentina.agregarLugarDeInteres(new Club)
		argentina.agregarLugarDeInteres(new Biblioteca)
		var peru = new Pais("Peru",2)
		var españa = new Pais("España", 3)
		var bolivia = new Pais("Bolivia",4)
		var francia = new Pais("Francia",5)*/
		val Pais argentina = new Pais("Argentina",1)
		argentina.agregarCaracteristica("hablan Español")
			argentina.agregarCaracteristica("su bandera es celeste y blanca")
			argentina.agregarCaracteristica("Comen Asado")
			argentina.agregarCaracteristica("Su moneda es el Peso Argentino")
			argentina.agregarLugarDeInteres(new Embajada(argentina)=> [
					setearInformante()
					])

			argentina.agregarLugarDeInteres(new Club(argentina)=> [
					setearInformante()
					])
			argentina.agregarLugarDeInteres(new Banco(argentina)=> [
					setearInformante()
					])
		val peru = new Pais("Peru",2)
		peru.agregarLugarDeInteres(new Embajada(peru)=> [
					setearOcupante()
					])
		peru.agregarLugarDeInteres(new Banco(peru)=> [
					setearOcupante()
					])
		peru.agregarLugarDeInteres(new Biblioteca(peru)=> [
					setearOcupante(elAleph)
					])
		peru.agregarCaracteristica("hablan Español")
		peru.agregarCaracteristica("su bandera es roja y blanca")
		peru.agregarCaracteristica("Comen Palomas")
		peru.agregarCaracteristica("Su moneda es el Peso")
		val españa = new Pais( "España",3)
		val bolivia = new Pais("Bolivia",4)
		bolivia.agregarLugarDeInteres(new Embajada(bolivia))
		bolivia.agregarLugarDeInteres(new Club(bolivia))
		bolivia.agregarLugarDeInteres(new Biblioteca(bolivia))
		val francia = new Pais("Francia",5)
		francia.agregarLugarDeInteres(new Embajada(francia))
		francia.agregarLugarDeInteres(new Club(francia))
		francia.agregarLugarDeInteres(new Biblioteca(francia))
		argentina.agregarPaisConexion(peru)
		argentina.agregarPaisConexion(francia)
		argentina.agregarPaisConexion(bolivia)
		bolivia.agregarPaisConexion(argentina)
		mapamundi.setPais(argentina)
		mapamundi.setPais(peru)
		mapamundi.setPais(españa)
		mapamundi.setPais(bolivia)
		mapamundi.setPais(francia)
		
		//var caso = new DummyData().crearCaso("El gran robo", exped.getVillano(2))
		var cas= new Caso(5,"El gran robo",elAleph)
			cas.paisDelRobo = argentina
			cas.agregarPaisPlanDeEscape(argentina)
			cas.agregarPaisPlanDeEscape(peru)
			cas.agregarPaisPlanDeEscape(francia)
		//var caso1 = new CasoRest(cas)
		var carmenRestAPI= new CarmenSanDiegoRestAPI(expediente,mapamundi)
		carmenRestAPI.agregarCaso(cas) 
        XTRest.startInstance(carmenRestAPI, 9001)
    }}