package ar.carmenSanDiego.rest;

import ar.carmenSanDiego.model.Villanos;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.jetty.server.Request;
import org.eclipse.xtext.xbase.lib.Extension;
import org.uqbar.xtrest.api.Result;
import org.uqbar.xtrest.api.annotation.Controller;
import org.uqbar.xtrest.api.annotation.Get;
import org.uqbar.xtrest.json.JSONUtils;
import org.uqbar.xtrest.result.ResultFactory;

@Controller
@SuppressWarnings("all")
public class CarmenSanDiegoRestAPI extends ResultFactory {
  @Extension
  private JSONUtils _jSONUtils = new JSONUtils();
  
  private Villanos villanos;
  
  public CarmenSanDiegoRestAPI(final Villanos vil) {
    this.villanos = vil;
  }
  
  /**
   * Permite buscar libros que contengan cierto string en su título, u obtener todos los libros.
   * 
   * Atiende requests de la forma GET /libros y GET /libros?string=xxx.
   */
  @Get("/villanos")
  public Result getLibros(final String string, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    throw new Error("Unresolved compilation problems:"
      + "\ntoJson cannot be resolved");
  }
  
  public void handle(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {
    {
    	Matcher matcher = 
    		Pattern.compile("/villanos").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Get") && matcher.matches()) {
    		// take parameters from request
    		String string = request.getParameter("string");
    		
    		// take variables from url
    		
    		
    	    Result result = getLibros(string, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    this.pageNotFound(baseRequest, request, response);
  }
  
  public void pageNotFound(final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {
    response.getWriter().write(
    	"<html><head><title>XtRest - Page Not Found!</title></head>" 
    	+ "<body>"
    	+ "	<h1>Page Not Found !</h1>"
    	+ "	Supported resources:"
    	+ "	<table>"
    	+ "		<thead><tr><th>Verb</th><th>URL</th><th>Parameters</th></tr></thead>"
    	+ "		<tbody>"
    	+ "			<tr>"
    	+ "				<td>GET</td>"
    	+ "				<td>/villanos</td>"
    	+ "				<td>string</td>"
    	+ "			</tr>"
    	+ "		</tbody>"
    	+ "	</table>"
    	+ "</body>"
    );
    response.setStatus(404);
    baseRequest.setHandled(true);
  }
}
