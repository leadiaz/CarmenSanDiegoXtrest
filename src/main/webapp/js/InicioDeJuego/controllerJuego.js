

carmenSanDiegoApp.controller('TodosLospaisesConexionesYVillanosCtrl', function (Caso,Viajar,Villanos,OrdenDeArresto,Pista) {
	'use strict';
	/*this.paisesConexiones = [{"nombre": "Argentina"}, {"nombre": "Peru"}, {"nombre": "Bolivia"}, 
	                 {"nombre": "Brazil"}];
	
	this.paisesfallidos = [{"nombre": "Espanha"}, {"nombre": "Colombia"}];
	this.villanos = [{"id":1,"nombre": "CarmenSanDiego"}, {"id":2,"nombre": "Igor Cratov"}, {"id":3,"nombre": "Fernando Torres"}, 
	                 {"id":4,"nombre": "Alexander Patrov"}];
	$scope.paisDondeEstoy = {"nombre": "Egipto"};*/
	this.caso= null;
	this.villanos = [];
	//this.paisDondeEstoy = null;
	this.paisAViajar = null;
	this.villanoAArrestar = null;
	var self = this;
    this.actualizarLista = function() {
    	Villanos.query(function(data) {
            self.villanos = data;
        });
    };
    this.actualizarLista();
	this.empezarJuego = function(){
		Caso.iniciarJuego(function(data) {
       	self.caso = data;
        });
	}
	this.empezarJuego();
	this.eligirPaisAViajar = function(pais){
		console.log("Seleccionando pais para viajar " + pais.nombrePais );
		self.paisAViajar= pais;	
	}
	this.selectedVillanoAArrestar = null;
	this.pistaRequest= null;
	this.lugarVisitado = null;
	
	this.viajar = function(){
		console.log("Listo para viajar " + this.paisAViajar.nombre );
		
		Viajar.viajar(this.paisAViajar.id,function(data) {
       	self.caso = data;
        });
		//this.paisDondeEstoy = this.paisAViajar;
		this.paisAViajar = null
		this.lugarVisitado= null
	}
	
	this.generearOrdenDeArresto = function(){
		console.log("Listo para arrestar a " + self.selectedVillanoAArrestar.nombre );
		//self.villanoAArrestar = self.selectedVillanoAArrestar;
			OrdenDeArresto.emitirOrden(this.selectedVillanoAArrestar.id,function(data) {
				self.villanoAArrestar = self.selectedVillanoAArrestar
				self.caso.pais =  data
	        });
	}
	
	this.devolverPista = function(lugar){
		console.log("pista a "+ lugar.nombre);
		console.log("pista a "+ lugar.pista);
		//self.villanoAArrestar = self.selectedVillanoAArrestar;
		if(lugar.cuidador){
			//if(self.caso.paisesFallidos.)
			this.caso.paisesFallidos.push(this.caso.pais.nombre)
			console.log("pais Fallido  "+ self.caso.pais.nombre);
			console.log("pais Fallido  "+ self.caso.paisesFallidos);
		}
		if(lugar.informante ){
			this.caso.paisesVisitados.push(this.caso.pais.nombre)
			console.log("pais Visita  "+ self.caso.pais.nombre);
			console.log("pais Visitado  "+ self.caso.paisesVisitados);
		}
			Pista.retornarPista({"lugar":lugar.nombre },function(data) {
				self.pistaRequest = data.pista
				console.log("pista: "+ data.pista);
	        });
			self.lugarVisitado= lugar
	}
});