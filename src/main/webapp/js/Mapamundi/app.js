	'use strict';

var app = angular.module('mapamundiApp', []);

app.controller('TodosLospaisesCtrl', function ($scope) {
	this.paises = [{"id":1,"nombre": "Argentina", "caracteristicas":["Toman mate", "Hablan espagnol"],
					"conexiones":["Bolviia", "Peru"], "lugares":["Embajada","Club","Biblioteca"]},
	               {"id":2,"nombre": "Peru","caracteristicas": ["Hablan espagnol"],
					"conexiones":["Corea", "Peru"], "lugares":["Banco","Club","Biblioteca"]},
	               {"id":3,"nombre": "Brasil","caracteristicas": ["Les gusta el futbol","Hablan protugues" ],
					"conexiones":["Ecuador", "Peru"], "lugares":["Embajada","Banco","Biblioteca"]},
	               {"id":4,"nombre": "Chile","caracteristicas":["Hablan espagnol","Su moneda es el peso chileno"],
					"conexiones":["Francia", "Peru"], "lugares":["Embajada","Club","Banco"]}];
	this.lugaresDeInteresDisponibles =[{"id":1,"nombre":"Embajada" },{"id":2,"nombre":"Biblioteca"},
	                                   {"id":3,"nombre":"Club"},{"id":4,"nombre":"Banco"}];
	console.log("Inicializando");
	var self = this;
	this.paisSeleccionado = null;
	this.caracteristicaAagregar = '';
	this.selectedPaisConexion= null;
	this.selectedLugarDeInteres= null;
	
	this.seleccionarPais = function(pais) {
		console.log("Seleccionando " + pais);
		this.paisSeleccionado = pais;	
	};
	
	this.agregarCaracteristica = function() {
		console.log("Seleccionando " + this.caracteristicaAagregar );
		this.paisSeleccionado.caracteristicas.push(this.caracteristicaAagregar);
	};
	
	this.agregarPaisConexion = function() {
		console.log("Seleccionando " + this.selectedPaisConexion.nombre );
		this.paisSeleccionado.conexiones.push(this.selectedPaisConexion.nombre);
	};
	
	this.agregarLugarDeInteres = function() {
		console.log("Seleccionando " + this.selectedLugarDeInteres.nombre );
		this.paisSeleccionado.lugares.push(this.selectedLugarDeInteres.nombre);
	};
	
	this.nuevo = function(){
		console.log("Seleccionando Nuevo Pais " );
		this.paisSeleccionado = {"id":this.paises.length + 1,"nombre":"","caracteristicas":[],"conexiones":[], "lugares":[]};
	}
	
	this.aceptar = function(){
		var paisFind = this.paises.find(
				function(it) {
					return it.id == self.paisSeleccionado.id;
					});
		if(paisFind ==null)/*this.paisSeleccionado.id ==  null*/{
			console.log("Seleccionando es nuevo" );
			this.paises.push(this.paisSeleccionado);
		}else{console.log("Seleccionando ya existe" ); }
	}
	
	this.deleteCaracteristica =function(caracteristica){
		console.log("Seleccionando para borrar " + caracteristica );
		this.paisSeleccionado.caracteristicas =this.paisSeleccionado.caracteristicas.filter(
			function(it) {
				return it!=caracteristica;
			})	
	}
	
	this.deletePais =function(pais){
		console.log("Seleccionando para borrar " + pais.nombre );
		this.paises =this.paises.filter(
			function(it) {
				return it.id!=pais.id;
			})	
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

