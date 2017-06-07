carmenSanDiegoApp.controller('TodosLosVillanosCtrl', function ($resource, $timeout, Villanos, Villano) {
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
    
    this.limpiarCampos=function(){
    	this.villanoSeleccionado = null;
    	this.senhiaAAgregar = '';
    	this.hobbieAagregar = '';
    }
    
	this.seleccionarVillano = function(villano) {
		console.log(villano);
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
        var mensaje = "¿Está seguro de eliminar: '" + villano.nombre + "'?";
        bootbox.confirm(mensaje, function(confirma) {
            if (confirma) {
                Villanos.remove(villano, function() {
                    self.actualizarLista();
                });
            }
        });
	}

	
	this.aceptar = function(){
			console.log(this.villanoSeleccionado );
			Villano.update(this.villanoSeleccionado)
            self.actualizarLista();
			self.limpiarCampos();	
			alert("Guardado Re piola wachin") }
	
	//this.nuevoVillano =  {}  
	// AGREGAR
    this.agregarVillano = function() {
        Villano.save(this.nuevoVillano, function() {
            self.actualizarLista();
            self.nuevoVillano = null;
        });
        alert("Guardado Nuevo Villano")
    };
	
	/*this.senhia = function(){
		this.senhiaAAgregar;
	}*/
	this.villanoSeleccionado = null;
	this.senhiaAAgregar = '';
	this.hobbieAagregar = '';
});