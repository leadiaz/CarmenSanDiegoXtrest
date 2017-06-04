/*'use strict';*/
										/*em esta lista*/						
carmenSanDiegoApp.controller('TodosLosVillanosCtrl', function (/*$scope*/$resource, $timeout, Villanos) {
	'use strict';
	/*this.villanos = [{"id":1,"nombre": "CarmenSanDiego", "sexo":"Femenino",
					"senhias":["pelo rojo","ojos bordo"],"hobbies":["juega al golf","mira porno"]},
	                 {"id":2,"nombre": "Igor Cratov", "sexo":"Masculino",
					"senhias":["pelo rojo","ojos bordo"],"hobbies":["ve anime"," se va de putas"]}, 
	                 {"id":3,"nombre": "Fernando Torres", "sexo":"Masculino",
					"senhias":["pelo rojo","ojos bordo"],"hobbies":["pelo rojo","ojos bordo"]}, 
	                 {"id":4,"nombre": "Alexander Patrov", "sexo":"Masculino",
					"senhias":["pelo rojo","ojos bordo"],"hobbies":["fuma opio","se injecta heroina"]}];*/
	var self = this;
	self.villanos = [];
	console.log("Inicializando");
	
    this.actualizarLista = function() {
    	Villanos.query(function(data) {
            self.villanos = data;
        });
    };
    this.actualizarLista();

	this.seleccionarVillano = function(villano) {
		console.log("Seleccionando " + villano);
		this.villanoSeleccionado = villano;		
	};
	this.agregarsenhia = function() {
		console.log("Seleccionando " + this.senhiaAAgregar );
		this.villanoSeleccionado.senhasParticulares.push(this.senhiaAAgregar);
	};
	this.agregarhobbie = function() {
		console.log("Seleccionando " + this.hobbieAagregar );
		this.villanoSeleccionado.hobbies.push(this.hobbieAagregar);
	};
	
	this.deleteSenhia =function(senhia){
		console.log("Seleccionando para borrar" + senhia );
		this.villanoSeleccionado.senhasParticulares =this.villanoSeleccionado.senhasParticulares.filter(
			function(it) {
				return it!=senhia;
			})	
	}
	
	this.deleteHobbie =function(hobbie){
		console.log("Seleccionando para borrar" + hobbie );
		this.villanoSeleccionado.hobbies =this.villanoSeleccionado.hobbies.filter(
			function(it) {
				return it!=hobbie;
			})	
	}
	
	this.deleteVillano =function(villano){
		/*console.log("Seleccionando para borrar" + villano.nombre );
		this.villanos =this.villanos.filter(
			function(it) {
				return it.id!=villano.id;
			})*/
        var mensaje = "¿Está seguro de eliminar: '" + villano.nombre + "'?";
        bootbox.confirm(mensaje, function(confirma) {
            if (confirma) {
                Villanos.remove(villano, function() {
                    self.actualizarLista();
                });
            }
        });
	}
	this.nuevo = function(){
        var mensaje = "en el panel lateral carge al nuevo villano";

		/*this.villanoSeleccionado = {"id":this.villanos.length + 1,"nombre":"","senhias":[],"hobbies":[]};*/
	}
		

	
	this.aceptar = function(){
		var villanoFind = this.villanos.find(
				function(it) {
					return it.id == self.villanoSeleccionado.id;
					});
		if(villanoFind==  null){
			console.log("Seleccionando es nuevo" );
			/*this.villanos.push(this.villanoSeleccionado);*/
			Villanos.save(this.villanoSeleccionado, function(data) {
	            self.actualizarLista();
	            self.villanoSeleccionado = null;
	            alert("Guardado Re piola wachin")
	        });
		}else{
			Villanos.update(this.villanoSeleccionado,function() {
            self.actualizarLista();
            self.villanoSeleccionado = null;
            });	
			console.log("Seleccionando ya existe" );
			alert("Guardado Re piola wachin") }
	}
	
	/*this.senhia = function(){
		this.senhiaAAgregar;
	}*/
	this.villanoSeleccionado = null;
	this.senhiaAAgregar = '';
	this.hobbieAagregar = '';
});