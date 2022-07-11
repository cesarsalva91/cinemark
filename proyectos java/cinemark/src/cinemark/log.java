package cinemark;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class log {
	public static boolean estaRegistrado(String usuario, String pass) {
		String tabla = "usuario";
    	boolean ban = false;
    	
		try {
			ResultSet rs = verTabla.verDb(tabla);
			
			while((rs.next())&&(ban = false)) {
				
				String usuariodb = rs.getString(5);//columna usuario
				String passdb = rs.getString(6);//columna pass
				if ((usuario == usuariodb)&&(pass == passdb)) {
					ban = true;
				}
					
				}
		
		} catch (SQLException e) {
			System.out.println("Error al validar usuario");
		}
		return true;
	}
	public void nuevoUsuario() {
		String tabla = "usuario";
    	boolean ban = false;
    	Connection cn = null;
		try {
			ResultSet rs = verTabla.verDb(tabla);
			Scanner entrada = new Scanner(System.in);
			String usuario = entrada.nextLine();
			
			while((rs.next())&&(ban = false)) {
				
				String usuariodb = rs.getString(5);//columna usuario
				if ((usuario == usuariodb)) {
					ban = true;
					System.out.println("Nombre de usuario existente");
				}
					
				}
			if (ban == false) {
                System.out.println("Ingrese hasta 12 digitos para la clave");
				
				String pass = entrada.nextLine();
				
				System.out.println("Ingrese nombre");
				
				String nombre = entrada.nextLine();
				
                 System.out.println("Ingrese apellido");
				
				String apellido = entrada.nextLine();
                
				System.out.println("Ingrese dni");
				
				String dni = entrada.nextLine();
				
                System.out.println("Ingrese mail");
				
				String mail = entrada.nextLine();
				
                System.out.println("Ingrese telefono");
				
				String tel = entrada.nextLine();
				String query = "INSERT INTO usuario (nombre,apellido,dni,nomUsuario,pass,email,telefono) values('"+nombre+"','"+apellido+"','"+dni+"','"+usuario+"','"+pass+"','"+mail+"','"+tel+"')";
				
				Statement stmt = cn.createStatement();
				stmt.executeUpdate(query); 
				
			}
			
		
		} catch (SQLException e) {
			System.out.println("Error al validar usuario");
		}
	   
	}
		
	/*public static void main(String[] args) {
		System.out.println(estaRegistrado("CesarSalva","545454"));
	}	*/
	

}
