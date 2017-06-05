package ar.carmenSanDiego.app

import org.uqbar.xtrest.api.XTRest
import ar.carmenSanDiego.rest.CarmenSanDiegoRestAPI
import ar.carmenSanDiego.model.Villano
import ar.carmenSanDiego.model.Pais
import ar.carmenSanDiego.model.Expedientes
import ar.carmenSanDiego.model.Mapamundi
import ar.carmenSanDiego.model.Caso
import ar.carmenSanDiego.model.lugaresDeInteres.LugarDeInteres

class CarmenSanDiegoApp {
	
		def static void main(String[] args) {
		var villanos = new Expedientes
		villanos.setVillano(new Villano(1, "Carlos","Masculino"))
		villanos.setVillano(new Villano(2, "El Aleph","Masculino"))
		villanos.setVillano(new Villano(3, "Carmen San Diego","Femenino"))
		villanos.setVillano(new Villano(4, "Igor Brodie","Masculino"))
		villanos.setVillano(new Villano(5, "Juan Perez","Masculino"))
		
		var paises = new Mapamundi
		var argentina = new Pais(1, "Argentina")
		argentina.agregarLugarDeInteres(new LugarDeInteres("Embajada"))
		argentina.agregarLugarDeInteres(new LugarDeInteres("Club"))
		argentina.agregarLugarDeInteres(new LugarDeInteres("Biblioteca"))
		var peru = new Pais(2, "Peru")
		peru.agregarLugarDeInteres(new LugarDeInteres("Embajada"))
		peru.agregarLugarDeInteres(new LugarDeInteres("Banco"))
		peru.agregarLugarDeInteres(new LugarDeInteres("Biblioteca"))
		var españa = new Pais(3, "España")
		var bolivia = new Pais(4, "Bolivia")
		var francia = new Pais(5, "Francia")
		francia.agregarLugarDeInteres(new LugarDeInteres("Embajada"))
		francia.agregarLugarDeInteres(new LugarDeInteres("Club"))
		francia.agregarLugarDeInteres(new LugarDeInteres("Biblioteca"))
		argentina.agregarPaisConexion(peru)
		argentina.agregarPaisConexion(francia)
		paises.setPais(argentina)
		paises.setPais(peru)
		paises.setPais(españa)
		paises.setPais(bolivia)
		paises.setPais(francia)
		
		var caso1 = new Caso(5,argentina)
		var carmenRestAPI= new CarmenSanDiegoRestAPI(villanos,paises )
		carmenRestAPI.agregarCaso(caso1) 
        XTRest.startInstance(carmenRestAPI, 9001)
    }}