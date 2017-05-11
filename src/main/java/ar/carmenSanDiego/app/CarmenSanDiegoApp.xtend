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

class CarmenSanDiegoApp {
	
		def static void main(String[] args) {
		var expediente = new ExpedientesRest
		expediente.setVillano(new Villano(5, "Carlos","Masculino"))
		expediente.setVillano(new Villano(7, "El Aleph","Masculino"))
		expediente.setVillano(new Villano(11, "Carmen San Diego","Femenino"))
		expediente.setVillano(new Villano(13, "Igor Brodie","Masculino"))
		expediente.setVillano(new Villano(17, "Juan Perez","Masculino"))
		
		var mapamundi = new MapamundiRest
		var argentina = new Pais("Argentina", 5)
		argentina.agregarLugarDeInteres(new Embajada)
		argentina.agregarLugarDeInteres(new Club)
		argentina.agregarLugarDeInteres(new Biblioteca)
		var peru = new Pais("Peru",9)
		var españa = new Pais("España", 11)
		var bolivia = new Pais("Bolivia",13)
		var francia = new Pais("Francia",15)
		mapamundi.setPais(argentina)
		mapamundi.setPais(peru)
		mapamundi.setPais(españa)
		mapamundi.setPais(bolivia)
		mapamundi.setPais(francia)
		
		var caso1 = new CasoRest(5,argentina)
		var carmenRestAPI= new CarmenSanDiegoRestAPI(expediente,mapamundi)
		carmenRestAPI.agregarCaso(caso1) 
        XTRest.startInstance(carmenRestAPI, 9001)
    }}