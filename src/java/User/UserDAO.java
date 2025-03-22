/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

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
public class UserDAO {

    private static final String SEARCHALL = "SELECT * FROM tblUsers";
    private static final String SEARCHNAME = "SELECT * FROM tblUsers WHERE fullName like ?";
    private static final String SEARCHID = "SELECT * FROM tblUsers WHERE userID like ?";
    private static final String LOGIN = "SELECT * FROM tblUsers WHERE userID=? AND Password=? ";
    private static final String CHECK_DUPLICATE = "SELECT userID FROM tblUsers WHERE userID=?  ";
    private static final String INSERT = "INSERT INTO tblUsers(userID, fullName, Password, roleID,Phone,Gmail, Address) "
            + "                         VALUES(?,?,?,?,?,?,?)";
    private static final String UPDATE = "UPDATE tblUsers SET fullName=?,Password=?,roleID=?,Phone=?,Gmail=?,Address=? WHERE userID=?";
    private static final String DELETE = "DELETE tblUsers WHERE userID=?";

    public List<UserDTO> getListUserByName(String name) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCHNAME);
                ptm.setString(1, "%" + name + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String Password = rs.getString("Password");
                    String roleID = rs.getString("roleID");
                    String Phone = rs.getString("Phone");
                    String Gmail = rs.getString("Gmail");
                    String Address = rs.getString("Address");
                    list.add(new UserDTO(userID, fullName, Password, roleID, Phone, Gmail, Address));
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

    public List<UserDTO> getListUserByID(String ID) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCHID);
                ptm.setString(1, ID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String Password = rs.getString("Password");
                    String roleID = rs.getString("roleID");
                    String Phone = rs.getString("Phone");
                    String Gmail = rs.getString("Gmail");
                    String Address = rs.getString("Address");
                    list.add(new UserDTO(userID, fullName, Password, roleID, Phone, Gmail, Address));
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

    public List<UserDTO> getListUser() throws SQLException {
        List<UserDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pst = conn.prepareStatement(SEARCHALL);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String Password = rs.getString("Password");
                    String roleID = rs.getString("roleID");
                    String Phone = rs.getString("Phone");
                    String Gmail = rs.getString("Gmail");
                    String Address = rs.getString("Address");
                    UserDTO b = new UserDTO(userID, fullName, Password, roleID, Phone, Gmail, Address);
                    list.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String Phone = rs.getString("Phone");
                    String Gmail = rs.getString("Gmail");
                    String Address = rs.getString("Address");
                    user = new UserDTO(userID, fullName, "***", roleID, Phone, Gmail, Address);
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
        return user;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
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

    public boolean insertV2(UserDTO user) throws ClassNotFoundException, SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getPassword());
                ptm.setString(4, user.getRoleID());
                ptm.setString(5, user.getPhone());
                ptm.setString(6, user.getGmail());
                ptm.setString(7, user.getAddress());

                checkInsert = ptm.executeUpdate() > 0 ? true : false;
            }
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

    public boolean update(UserDTO user) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getPassword());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getPhone());
                ptm.setString(5, user.getGmail());
                ptm.setString(6, user.getAddress());
                ptm.setString(7, user.getUserID());
                checkUpdate = ptm.executeUpdate() > 0 ? true : false;
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
        return checkUpdate;
    }

    public boolean delete(String userID) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
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
