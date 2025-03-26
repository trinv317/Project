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
public class OrderDAO {

    private static final String INSERT = "INSERT INTO tblOrder(userID,idGlasses,Type,Quantity,methodPayment,totalPrice,Date) "
            + "                         VALUES(?,?,?,?,?,?,?)";
    private static final String DELETE = "DELETE tblOrder where orderID=?";
    private static final String SEARCH = "SELECT * FROM tblOrder where userID=?";

    public List<OrderDTO> getListProductByID(String ID) throws SQLException {
        List<OrderDTO> list = new ArrayList<>();
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
                    int orderID = rs.getInt("orderID");
                    String idGlasses = rs.getString("idGlasses");
                    String Type = rs.getString("Type");
                    int Quantity = rs.getInt("Quantity");
                    String methodPayment = rs.getString("methodPayment");
                    float totalPrice = rs.getFloat("totalPrice");
                    String Date = rs.getString("Date");
                    list.add(new OrderDTO(orderID,ID, idGlasses, Type, Quantity, methodPayment, totalPrice, Date));
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

    public boolean delete(int orderID) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, orderID);
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
    public boolean insert(OrderDTO order) throws SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, order.getUserID());
                ptm.setString(2, order.getIdGlasses());
                ptm.setString(3, order.getType());
                ptm.setInt(4, order.getQuantity());
                ptm.setString(5, order.getMethodPayment());
                ptm.setFloat(6, order.getTotalPrice());
                ptm.setString(7, order.getDate());
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

}
