carmenSanDiegoApp.controller('TodosLospaisesCtrl', function (/*$scope*/$resource, $timeout, Paises) {
	'use strict';
	/*this.paises = [{"id":1,"nombre": "Argentina", "caracteristicas":["Toman mate", "Hablan espagnol"],
					"conexiones":["Bolviia", "Peru"], "lugares":["Embajada","Club","Biblioteca"]},
	               {"id":2,"nombre": "Peru","caracteristicas": ["Hablan espagnol"],
					"conexiones":["Corea", "Peru"], "lugares":["Banco","Club","Biblioteca"]},
	               {"id":3,"nombre": "Brasil","caracteristicas": ["Les gusta el futbol","Hablan protugues" ],
					"conexiones":["Ecuador", "Peru"], "lugares":["Embajada","Banco","Biblioteca"]},
	               {"id":4,"nombre": "Chile","caracteristicas":["Hablan espagnol","Su moneda es el peso chileno"],
					"conexiones":["Francia", "Peru"], "lugares":["Embajada","Club","Banco"]}];*/
	this.lugaresDeInteresDisponibles =[{"id":1,"nombre":"Embajada" },{"id":2,"nombre":"Biblioteca"},
	                                   {"id":3,"nombre":"Club"},{"id":4,"nombre":"Banco"}];
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
		this.paisSeleccionado.caracteristicasDelPais.push(this.caracteristicaAagregar);
	};
	
	this.agregarPaisConexion = function() {
		console.log("Seleccionando " + this.selectedPaisConexion.nombre );
		this.paisSeleccionado.paisConexiones.push(this.selectedPaisConexion.nombre);
	};
	
	this.agregarLugarDeInteres = function() {
		console.log("Seleccionando " + this.selectedLugarDeInteres.nombre );
		this.paisSeleccionado.lugaresDeInteres.push(this.selectedLugarDeInteres.nombre);
	};
	
	this.nuevo = function(){
		console.log("Seleccionando Nuevo Pais " );
		this.paisSeleccionado = {"id":this.paises.length + 1,"nombrePais":"","caracteristicasDelPais":[],"paisConexiones":[], "lugaresDeInteres":[]};
	}
	
	this.aceptar = function(){
		/*var paisFind = this.paises.find(
								function(it) {
									return it.id == self.paisSeleccionado.id;
					});
		if(paisFind ==null)/*this.paisSeleccionado.id ==  null{
			console.log("Seleccionando es nuevo" );
			//this.paises.push(this.paisSeleccionado);
			Paises.save(this.paisSeleccionado, function(data) {
	            self.actualizarLista();
	            self.paisSeleccionado = null;
	            alert("Guardado Re piola wachin")
	        });
		}else{*/
			Paises.update(this.paisSeleccionado,function() {
            self.actualizarLista();
            self.paisSeleccionado = null;
            });	
			
			console.log("Seleccionando ya existe" );
			alert("Guardado Re piola wachin");
			}
	
    this.agregarPais = function() {
    	console.log("pais a agregar" );
        Paises.save(this.nuevoPais, function() {
            self.actualizarLista();
            self.nuevoPais = null;
        });
        alert("Guardado Nuevo Pais")
    }
    
	this.deleteCaracteristica =function(caracteristica){
		console.log("Seleccionando para borrar " + caracteristica );
		this.paisSeleccionado.caracteristicasDelPais =this.paisSeleccionado.caracteristicasDelPais.filter(
			function(it) {
				return it!=caracteristica;
			})	
	}
	
	this.deletePais =function(pais){
		console.log("Seleccionando para borrar " + pais.nombrePais );
		var mensaje = "¿Está seguro de eliminar: '" + pais.nombrePais + "'?";
        bootbox.confirm(mensaje, function(confirma) {
            if (confirma) {
                Paises.remove(pais, function() {
                    self.actualizarLista();
                });
            }
        });	
	}
	
	this.deleteConexion =function(conexion){
		console.log("Seleccionando para borrar " + conexion );
		this.paisSeleccionado.paisConexiones =this.paisSeleccionado.paisConexiones.filter(
			function(it) {
				return it!=conexion;
			})	
	}
	
	this.deletelugar =function(lugarDeInteres){
		console.log("Seleccionando para borrar " + lugarDeInteres );
		this.paisSeleccionado.lugaresDeInteres =this.paisSeleccionado.lugaresDeInteres.filter(
			function(it) {
				return it!=lugarDeInteres;
			})	
	}
});

