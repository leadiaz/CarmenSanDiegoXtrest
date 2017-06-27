package ar.carmenSanDiego.rest

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body

import org.uqbar.commons.model.UserException
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import ar.carmenSanDiego.model.PistaResponse
import ar.carmenSanDiego.model.RandomExamples
import ar.carmenSanDiego.model.EmitirOrdenRequest
import ar.carmenSanDiego.model.ViajeRequest
import ar.carmenSanDiego.model.CasoRest
import ar.gaston.carmenSanDiego.Villano
import ar.gaston.carmenSanDiego.Pais
import ar.carmenSanDiego.model.PaisRest
import ar.carmenSanDiego.model.PaisCompletoRest
import org.uqbar.xtrest.api.annotation.Put
import ar.gaston.carmenSanDiego.Caso
import ar.carmenSanDiego.model.PaisCompletoRestConLugares
import java.util.List
import java.util.ArrayList
import AplicationModel.ExpedientesAppModel
import AplicationModel.Mapamundi
import Extra.DummyData

@Controller
class CarmenSanDiegoRestAPI {
	 extension JSONUtils = new JSONUtils
	 
	 ExpedientesAppModel villanos
	 Mapamundi paises
	 DummyData dummy
	 Caso casoElegidoRandom // se elige a IniciarElJuego
//	 ArrayList<EmitirOrdenRequest> OrdenDeArrestos = new ArrayList
//	 CasoRest casoRestElegido;
	
	 
	 new(ExpedientesAppModel vil, Mapamundi p, DummyData dummy) {
        this.villanos = vil
        this.paises = p
        this.dummy = dummy
    } 
    //////////////////////////// EXPEDIENTES ///////////////////////////
        /**
     * Permite buscar villanos que contengan cierto string en su nombre, u obtener todos los villanos.
     *  
     * Atiende requests de la forma GET /villanos y GET /villanos?string=xxx.
     */
    @Get("/villanos")
    def getVillano(String string) {
        response.contentType = ContentType.APPLICATION_JSON
       	ok(this.villanos.searchVillanos(string).toJson)
    }
    
    
    /**
     * Permite obtener un Villano por su id.
     * 
     * Atiende requests de la forma GET /Villanos/17.
     */
    @Get("/villanos/:id")
    def getVillanoById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {        	
            var villano = this.villanos.getVillano(Integer.valueOf(id))
            if (villano == null) {
            	notFound(getErrorJson("No existe villano con ese id"))
            } else {
            	ok(villano.toJson)
            }
        }
        catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }
    }
    
        /**
     * Permite eliminar un villano por su id.
     * 
     * Atiende requests de la forma DELETE /villanos/7.
     */
    @Delete('/villanos/:id')
    def deleteVillanoById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            this.villanos.eliminarVillano(Integer.valueOf(id))
            ok()
        }
        catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }
    }
    
     /**
     * Permite crear o modificar un Villano.
     * 
     * Atiende requests de la forma POST /villanos con un villano en el body (en formato JSON).
     */
    @Post("/villanos")
    def createVillano(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val Villano vil = body.fromJson(Villano)
	        try {
				this.villanos.agregarNuevoVillano(vil)
				ok()	        	
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Villano"))
        }
    }
    @Put("/villanos/:id")
    def modificarVillano(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val Villano vil = body.fromJson(Villano)
	        if (Integer.parseInt(id) != vil.id) {
			 badRequest('{ "error" : "Id en URL distinto del cuerpo" }');
			 }
		
	        try {
				this.villanos.actualizarVillano(vil)
				ok()	        	
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        
        }
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Villano"))
        	}
    	}
        
        
    
    private def getErrorJson(String message) {
        '{ "error": "' + message + '" }'
    }
    
  //////////////////////////////////////   MAPAMUNDI /////////////////////////////////////////////
  
          /**
     * Permite buscar paises que contengan cierto string en su nombrePais, u obtener todos los paises.
     *  
     * Atiende requests de la forma GET /paises y GET /paises?string=xxx.
     */
    @Get("/paises")
    def getPais(String string) {
        response.contentType = ContentType.APPLICATION_JSON
        var res = this.paises.searchPaises(string).map[new PaisCompletoRestConLugares(it)]
       	ok(res.toJson)
    }
    
        /**
     * Permite obtener un Pais por su id.
     * 
     * Atiende requests de la forma GET /paises/17.
     */
    @Get("/paises/:id")
    def getPaisById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {        	
            var pais = this.paises.getPais(Integer.valueOf(id))
            if (pais == null) {
            	notFound(getErrorJson("No existe Pais con ese id"))
            } else {
            	ok(new PaisRest(pais).toJson)
            }
        }
        catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }
    }
    
            /**
     * Permite eliminar un pais por su id.
     * 
     * Atiende requests de la forma DELETE /paises/7.
     */
    @Delete('/paises/:id')
    def deletePaisById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            this.paises.eliminarPais(Integer.valueOf(id))
            ok()
        }
        catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }
    }
    
         /**
     * Permite crear o modificar un Pais.
     * 
     * Atiende requests de la forma POST /paises con un pais en el body (en formato JSON).
     */
    @Post("/paises")
    def createPais(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val Pais p = body.fromJson(Pais)
	        try {
				this.paises.agregarNuevoPais(p)
				ok()	        	
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Pais"))
        }
    }

    @Put("/paises/:id")
    def updatePais(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val PaisCompletoRestConLugares p = body.fromJson(PaisCompletoRestConLugares)
	       	 if (Integer.parseInt(id) != p.id) {
			 badRequest('{ "error" : "Id en URL distinto del cuerpo" }');
			 }
	        try {
	        	val lugares = p.lugares.map[it.nombre]
	        	val conexiones= p.conexiones.map[it.id]
	        	paises.actualizarPais(p.id, p.caracteristicasDelPaisRest, lugares, conexiones)				
				ok()	        	
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Pais"))
        }
    } 
    
   /////////////////////////////////////////////////////////////////////////
   
//   	def getcaso(int id) {
//		casos.findFirst[ it.getId == id ]
//	}
//	def actualizarLugaresDeInteres(PaisCompletoRestConLugares pais) {
//		var ArrayList<LugarDeInteres> result = new ArrayList<LugarDeInteres>
//		for(LugarDeInteresSimpleRest p : pais.lugares)
//		{
//			result.add(this.chearLugarDeInteresPorNombre(p.nombre))
//		}return result 
//	}
	
//	def chearLugarDeInteresPorNombre(String lugar) {
//	if(lugar == "Embajada"){
//			return new Embajada()
//		}else{if(lugar == "Club"){
//			     return new Club()
//				}else{ if(lugar == "Biblioteca"){
//							return new Biblioteca()
//						 }else{ return new Banco()}
//					   
//					}
//			}
//	}
	def actualizarPaisConexion(PaisCompletoRestConLugares pais) {
		var ArrayList<Pais> result = new ArrayList<Pais>
		for(PaisRest p : pais.conexiones)
		{
			result.add(paises.getPais(p.id))
		}return result 
	}
	
	///pistaDelLugar/?id=xxx?lugar=xxx"
    @Get("/pistaDelLugar")
    def getPistaByIdCasoYlugar( String lugar) {
        response.contentType = ContentType.APPLICATION_JSON
    //    try {        	
            //var caso = this.getcaso(Integer.valueOf(id))
            if (casoElegidoRandom == null) {
            	notFound(getErrorJson("No se inicio el juego,ejecute iniciarJuego"))
            } else {
            	val pais = (casoElegidoRandom.paisDondeEstoy)
//            	val String pistaDada = pais.procesarLugar(lugar)
//            	val PistaResponse pista = new PistaResponse(pistaDada)
            	 
            	ok(pais.procesarLugar(lugar).toJson)
            }
        }
      /*   catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }
    }*/
    
     @Post("/iniciarJuego")
    def iniciarJuego() {
        response.contentType = ContentType.APPLICATION_JSON
	        try {
//				 var random = new RandomExamples()
//				 casoElegidoRandom = random.randomIn(this.casos)
				 casoElegidoRandom = dummy.caso
				 
				 paises.setearCasoALugares(casoElegidoRandom);
				 
				ok(new CasoRest(casoElegidoRandom).toJson)	        	
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        }
        
     @Post("/emitirOrdenPara")
    def emitirOrden(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val EmitirOrdenRequest orden = body.fromJson(EmitirOrdenRequest)
	        try {
//	        	 OrdenDeArrestos.add(orden)	
	        	 casoElegidoRandom.setearOrdenDeArrestoAlVillano(villanos.getVillano(orden.villanoId));
	        	 paises.setearCasoALugares(casoElegidoRandom);
//	        	 casoRestElegido.actualizarPista(paises.getPais(casoRestElegido.pais.id))
				 ok(new PaisCompletoRest(casoElegidoRandom.paisDondeEstoy).toJson)        	
	           } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        	   }
           } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un OrdenRequest"))
        }
    }
    
    @Post("/viajar")
    def viajarAUnPais(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val ViajeRequest paisAViajar = body.fromJson(ViajeRequest)
	        try {
	        	if (casoElegidoRandom == null) {
            	notFound(getErrorJson("No se inicio el juego,ejecute iniciarJuego"))
            } else {
            		var Pais p = paises.getPais(paisAViajar.getDestinoId)
            		 //var caso = new CasoRest(casoElegidoRandom)
					casoElegidoRandom.paisDondeEstoy = p
//					casoRestElegido.actualizarPista(paises.getPais(casoRestElegido.pais.id))
					ok(new CasoRest(casoElegidoRandom).toJson)
				    }	        	
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un OrdenRequest"))
        }
    }  
 }
