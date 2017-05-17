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
import java.util.ArrayList
import ar.carmenSanDiego.model.PistaResponse
import ar.carmenSanDiego.model.RandomExamples
import ar.carmenSanDiego.model.EmitirOrdenRequest
import ar.carmenSanDiego.model.ViajeRequest
import ar.carmenSanDiego.model.ExpedientesRest
import ar.carmenSanDiego.model.MapamundiRest
import ar.carmenSanDiego.model.CasoRest
import ar.carmenSanDiego.model.VillanoRest
import ar.gaston.carmenSanDiego.Villano
import ar.gaston.carmenSanDiego.Pais
import ar.carmenSanDiego.model.PaisRest
import ar.carmenSanDiego.model.PaisCompletoRest

@Controller
class CarmenSanDiegoRestAPI {
	 extension JSONUtils = new JSONUtils
	 
	 ExpedientesRest villanos
	 MapamundiRest paises
	 ArrayList<CasoRest> casos = new ArrayList
	 CasoRest casoElegidoRandom // se elige a IniciarElJuego
	 ArrayList<EmitirOrdenRequest> OrdenDeArrestos = new ArrayList
	
	 
	 new(ExpedientesRest vil, MapamundiRest p) {
        this.villanos = vil
        this.paises = p
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
				this.villanos.setVillano(vil)
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
       	ok(this.paises.searchPaises(string).toJson)
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
            var pais = this.paises.getPaisSimple(Integer.valueOf(id))
            if (pais == null) {
            	notFound(getErrorJson("No existe Pais con ese id"))
            } else {
            	ok(pais.toJson)
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
				this.paises.setPais(p)
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
   
   	def getcaso(int id) {
		casos.findFirst[ it.getId == id ]
	}
	
	def agregarCaso(CasoRest cas){
		casos.add(cas)
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
            	val pais = new PaisCompletoRest(paises.getPais(casoElegidoRandom.pais.id))
            	val String pistaDada = pais.procesarLugar(lugar)
            	 
            	ok(pistaDada.toJson)
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
				 var random = new RandomExamples()
				 casoElegidoRandom = random.randomIn(this.casos)
				ok(casoElegidoRandom.toJson)	        	
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
	        	 OrdenDeArrestos.add(orden)	
				 ok()        	
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
					this.casoElegidoRandom.setearPaisNuevo(p)
					ok(casoElegidoRandom.toJson)
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
