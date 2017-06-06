

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
	this.paisDondeEstoy = null;
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
		self.paisDondeEstoy = self.caso.pais
	}
	this.selectedVillanoAArrestar = null;
	this.pistaRequest= null;
	this.lugarVisitado = null;
	
	this.viajar = function(){
		console.log("Listo para viajar " + this.paisAViajar.nombrePais );
		
		Viajar.viajar(this.paisAViajar.id,function(data) {
       	self.caso = data;
        });
		//this.paisDondeEstoy = this.paisAViajar;
	}
	
	this.volver = function(){
		console.log("Listo para regresar " + this.paisDondeEstoy.nombrePais );
		//como obtengo el id del ultimo pais??
		Viajar.viajar(this.paisDondeEstoy.id,function(data) {
       	self.caso = data;
        });
	}
	
	this.generearOrdenDeArresto = function(){
		console.log("Listo para arrestar a " + self.selectedVillanoAArrestar.nombre );
		//self.villanoAArrestar = self.selectedVillanoAArrestar;
			OrdenDeArresto.emitirOrden(this.selectedVillanoAArrestar.id,function() {
				self.villanoAArrestar = self.selectedVillanoAArrestar
	        });
	}
	
	this.devolverPista = function(lugar){
		console.log("pista a "+ lugar);
		//self.villanoAArrestar = self.selectedVillanoAArrestar;
			Pista.retornarPista(this.lugarVisitado,function(data) {
				self.pistaRequest = data
				console.log("pista: "+ data.pista);
	        });
			self.lugarVisitado= lugar
	}
});