/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cart;

import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lienm
 */
public class WhistListDAO {

    private static final String INSERT = "INSERT INTO tblWhistList(idGlasses,userID,Brand,Name,Description,Type,Image,Price) "
            + "                         VALUES(?,?,?,?,?,?,?,?)";
    private static final String CHECK_DUPLICATE = "SELECT idGlasses FROM tblWhistList WHERE idGlasses=?  ";
    private static final String DELETE = "DELETE tblWhistList WHERE idGlasses=?";
    private static final String SEARCH = "SELECT * FROM tblWhistList where userID=?";

    public List<WhistListDTO> getListProductByID(String ID) throws SQLException {
        List<WhistListDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, ID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String idGlasses = rs.getString("idGlasses");
                    String Brand = rs.getString("Brand");
                    String Name = rs.getString("Name");
                    String Description = rs.getString("Description");
                    String Type = rs.getString("Type");
                    String Image = rs.getString("Image");
                    float Price = rs.getFloat("Price");
                    list.add(new WhistListDTO(idGlasses, ID, Brand, Name, Description, Type, Image, Price));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean insert(WhistListDTO whistList) throws SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, whistList.getIdGlasses());
                ptm.setString(2, whistList.getUserID());
                ptm.setString(3, whistList.getBrand());
                ptm.setString(4, whistList.getName());
                ptm.setString(5, whistList.getDescription());
                ptm.setString(6, whistList.getType());
                ptm.setString(7, whistList.getImage());
                ptm.setFloat(8, whistList.getPrice());
                checkInsert = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkInsert;
    }

    public boolean checkDuplicate(String idGlasses) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, idGlasses);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean delete(String idGlasses) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, idGlasses);
                checkDelete = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkDelete;
    }
}
