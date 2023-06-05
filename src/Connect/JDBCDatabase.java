/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connect;

import java.sql.*;

/**
 *
 * @author ThinkPad
 */
public class JDBCDatabase {
    
    public static Connection getConnection(){
        try{
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/manager", "root", "Nvanlinh1!@#");
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null; 
    }
}
