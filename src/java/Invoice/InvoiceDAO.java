/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Invoice;

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
public class InvoiceDAO {

    private static final String INSERT = "INSERT INTO tblInvoice(userID,fullName,Phone,Gmail,Address,methodPayment,totalBill,Date,Time) "
            + "                         VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String SEARCH = "SELECT * FROM tblInvoice";

    public List<InvoiceDTO> getListInvoice() throws SQLException {
        List<InvoiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int invoiceID = rs.getInt("invoiceID");
                    String userID =rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String Phone =rs.getString("Phone");
                    String Gmail = rs.getString("Gmail");
                    String Address = rs.getString("Address");
                    String methodPayment = rs.getString("methodPayment");
                    float totalBill = rs.getFloat("totalBill");
                    String Date = rs.getString("Date");
                    String Time = rs.getString("Time");
                    list.add(new InvoiceDTO(invoiceID,userID, fullName,Phone,Gmail, Address, methodPayment, totalBill, Date, Time));
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
    

    public boolean insert(InvoiceDTO invoice) throws SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, invoice.getUserID());
                ptm.setString(2, invoice.getFullName());
                ptm.setString(3, invoice.getPhone());
                ptm.setString(4, invoice.getGmail());
                ptm.setString(5, invoice.getAddress());
                ptm.setString(6, invoice.getMethodPayment());
                ptm.setFloat(7, invoice.getTotalBill());
                ptm.setString(8, invoice.getDate());
                ptm.setString(9, invoice.getTime());
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
