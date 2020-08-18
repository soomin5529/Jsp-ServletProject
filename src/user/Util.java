package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Util {
public static void close(Connection con, PreparedStatement pstmt) {
	try {
		con.close();
		pstmt.close();

	}
	catch(SQLException e) {
		e.printStackTrace();
	}
}
public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
	try {
		con.close();
		pstmt.close();
		rs.close();

	}
	catch(SQLException e) {
		e.printStackTrace();
	}
}
}
