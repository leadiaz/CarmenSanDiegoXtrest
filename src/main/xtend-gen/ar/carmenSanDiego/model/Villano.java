package ar.carmenSanDiego.model;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Villano {
  private int id;
  
  private String nombre;
  
  private String sexo;
  
  private List<String> señasParticulares = new ArrayList<String>();
  
  private List<String> hobbies = new ArrayList<String>();
  
  public Villano(final int ids, final String n, final String s) {
    this.id = ids;
    this.nombre = n;
    this.sexo = s;
  }
  
  public void agregarSeña(final String seña) {
    this.señasParticulares.add(seña);
  }
  
  public void sacarSeña(final String seña) {
    this.señasParticulares.remove(seña);
  }
  
  public void agregarHobbie(final String h) {
    this.hobbies.add(h);
  }
  
  public boolean sacarHobbie(final String h) {
    return this.hobbies.remove(h);
  }
  
  @Pure
  public int getId() {
    return this.id;
  }
  
  public void setId(final int id) {
    this.id = id;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public String getSexo() {
    return this.sexo;
  }
  
  public void setSexo(final String sexo) {
    this.sexo = sexo;
  }
  
  @Pure
  public List<String> getSeñasParticulares() {
    return this.señasParticulares;
  }
  
  public void setSeñasParticulares(final List<String> señasParticulares) {
    this.señasParticulares = señasParticulares;
  }
  
  @Pure
  public List<String> getHobbies() {
    return this.hobbies;
  }
  
  public void setHobbies(final List<String> hobbies) {
    this.hobbies = hobbies;
  }
}
