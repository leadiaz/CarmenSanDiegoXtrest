package ar.carmenSanDiego.app

import org.uqbar.xtrest.api.XTRest
import ar.carmenSanDiego.rest.CarmenSanDiegoRestAPI
import Extra.DummyData


class CarmenSanDiegoApp {
	
		def static void main(String[] args) {
	
	
		val dummy = new DummyData()
		var carmenRestAPI= new CarmenSanDiegoRestAPI(dummy.expediente, dummy.paises, dummy)
        XTRest.startInstance(carmenRestAPI, 9001)
    }
    
}