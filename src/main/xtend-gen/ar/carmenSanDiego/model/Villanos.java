package ar.carmenSanDiego.model;

import ar.carmenSanDiego.model.Villano;
import java.util.ArrayList;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Villanos {
  private ArrayList<Villano> villanos = new ArrayList<Villano>();
  
  public Object searchVillanos(final String string) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field StringUtils is undefined"
      + "\nThe method or field substring is undefined"
      + "\nThe method or field libros is undefined for the type Villanos"
      + "\nThe method or field libros is undefined for the type Villanos"
      + "\nThe method or field titulo is undefined for the type Object"
      + "\nThe method or field substring is undefined"
      + "\nisBlank cannot be resolved"
      + "\nfilter cannot be resolved"
      + "\ntoLowerCase cannot be resolved"
      + "\ncontains cannot be resolved"
      + "\ntoLowerCase cannot be resolved"
      + "\ntoList cannot be resolved");
  }
  
  @Pure
  public ArrayList<Villano> getVillanos() {
    return this.villanos;
  }
  
  public void setVillanos(final ArrayList<Villano> villanos) {
    this.villanos = villanos;
  }
}
