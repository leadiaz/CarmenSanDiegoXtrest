carmenSanDiegoApp.controller('TodosLospaisesCtrl', function (/*$scope*/$resource, $timeout, Paises,Pais) {
	'use strict';
	/*this.paises = [{"id":1,"nombre": "Argentina", "caracteristicas":["Toman mate", "Hablan espagnol"],
					"conexiones":["Bolviia", "Peru"], "lugares":["Embajada","Club","Biblioteca"]},
	               {"id":2,"nombre": "Peru","caracteristicas": ["Hablan espagnol"],
					"conexiones":["Corea", "Peru"], "lugares":["Banco","Club","Biblioteca"]},
	               {"id":3,"nombre": "Brasil","caracteristicas": ["Les gusta el futbol","Hablan protugues" ],
					"conexiones":["Ecuador", "Peru"], "lugares":["Embajada","Banco","Biblioteca"]},
	               {"id":4,"nombre": "Chile","caracteristicas":["Hablan espagnol","Su moneda es el peso chileno"],
					"conexiones":["Francia", "Peru"], "lugares":["Embajada","Club","Banco"]}];*/
	this.lugaresDeInteresDisponibles =[{"nombre":"Embajada" },{"nombre":"Biblioteca"},
	                                   {"nombre":"Club"},{"nombre":"Banco"}];
	console.log("Inicializando");
	var self = this;
	self.paises = [];
	this.paisSeleccionado = null;
	this.caracteristicaAagregar = '';
	this.selectedPaisConexion= null;
	this.selectedLugarDeInteres= null;
    this.actualizarLista = function() {
    	Paises.query(function(data) {
            self.paises = data;
        });
    };
    this.actualizarLista();
	
	this.seleccionarPais = function(pais) {
		console.log("Seleccionando " + pais);
		this.paisSeleccionado = pais;	
	};
	
	this.agregarCaracteristica = function() {
		console.log("Seleccionando " + this.caracteristicaAagregar );
		this.paisSeleccionado.caracteristicasDelPaisRest.push(this.caracteristicaAagregar);
	};
	
	this.agregarPaisConexion = function() {
		console.log(this.selectedPaisConexion );
		var pais = Pais.get({id: this.selectedPaisConexion.id});
		console.log(pais)
		this.paisSeleccionado.conexiones.push(pais);
	};
	
	this.agregarLugarDeInteres = function() {
		console.log("Seleccionando " + this.selectedLugarDeInteres.nombre );
		this.paisSeleccionado.lugares.push(this.selectedLugarDeInteres);
	};
	
	this.aceptar = function(){
			console.log(this.paisSeleccionado)
			Pais.update(this.paisSeleccionado)
			this.paisSeleccionado = null;
			self.actualizarLista();
			alert("Guardado Re piola wachin");
			}
	
    this.agregarPais = function() {
    	console.log("pais a agregar" );
        Pais.save(this.nuevoPais, function() {
            self.actualizarLista();
            self.nuevoPais = null;
        });
        alert("Guardado Nuevo Pais")
    }
    
	this.deleteCaracteristica =function(caracteristica){
		console.log("Seleccionando para borrar " + caracteristica );
		this.paisSeleccionado.caracteristicasDelPaisRest = this.paisSeleccionado.caracteristicasDelPaisRest.filter(
			function(it) {
				return it!=caracteristica;
			})	
	}
	
	this.deletePais =function(pais){
		console.log("Seleccionando para borrar " + pais.nombre );
		var mensaje = "¿Está seguro de eliminar: '" + pais.nombre + "'?";
        bootbox.confirm(mensaje, function(confirma) {
            if (confirma) {
                Pais.remove(pais, function() {
                    self.actualizarLista();
                });
            }
        });	
	}
	
	this.deleteConexion =function(conexion){
		console.log("Seleccionando para borrar " + conexion );
		this.paisSeleccionado.conexiones =this.paisSeleccionado.conexiones.filter(
			function(it) {
				return it!=conexion;
			})	
	}
	
	this.deletelugar =function(lugarDeInteres){
		console.log("Seleccionando para borrar " + lugarDeInteres );
		this.paisSeleccionado.lugares =this.paisSeleccionado.lugares.filter(
			function(it) {
				return it!=lugarDeInteres;
			})	
	}
});

