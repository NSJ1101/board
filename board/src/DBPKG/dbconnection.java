package DBPKG;

import java.sql.*;

public class dbconnection {
public static Connection getConnection() throws ClassNotFoundException,SQLException {
	Class.forName("oracle.jdbc.OracleDriver");
	return DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
}

public static ResultSet sendQuery(String query) throws ClassNotFoundException,SQLException{
	return getConnection().prepareStatement(query).executeQuery();
	}
}


