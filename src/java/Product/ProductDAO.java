/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

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
public class ProductDAO {

    private static final String SEARCHALL = "SELECT * FROM tblGlasses";
    private static final String SEARCHNAME = "SELECT * FROM tblGlasses WHERE Name like ?";
    private static final String SEARCHBRAND = "SELECT * FROM tblGlasses WHERE Brand like ?";
    private static final String SEARCHID = "SELECT * FROM tblGlasses WHERE idGlasses like ?";
    private static final String SEARCHMINMAX = "SELECT * FROM tblGlasses WHERE Price BETWEEN ? AND ?";
    private static final String DELETE = "DELETE tblGlasses where idGlasses=?";
    private static final String UPDATE = "UPDATE tblGlasses SET Brand=?,Name=?,Description=?,Type=?,Image=?,Quantity=?,Price=?,Status=? WHERE idGlasses=?";
    private static final String INSERT = "INSERT INTO tblGlasses(idGlasses,Brand,Name,Description,Type,Image,Quantity,Price,Status) "
            + "                         VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String CHECK_DUPLICATE = "SELECT idGlasses FROM tblGlasses WHERE idGlasses=?  ";

    public List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pst = conn.prepareStatement(SEARCHALL);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String idGlasses = rs.getString("idGlasses");
                    String Brand = rs.getString("Brand");
                    String Name = rs.getString("Name");
                    String Description = rs.getString("Description");
                    String Type = rs.getString("Type");
                    String Image = rs.getString("Image");
                    float Price = rs.getFloat("Price");
                    int Quantity = rs.getInt("Quantity");
                    int Status = rs.getInt("Status");
                    ProductDTO b = new ProductDTO(idGlasses, Brand, Name, Description, Type, Image, Quantity, Price, Status);
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

    public List<ProductDTO> getListProductByName(String name) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
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
                    String idGlasses = rs.getString("idGlasses");
                    String Brand = rs.getString("Brand");
                    String Name = rs.getString("Name");
                    String Description = rs.getString("Description");
                    String Type = rs.getString("Type");
                    String Image = rs.getString("Image");
                    float Price = rs.getFloat("Price");
                    int Quantity = rs.getInt("Quantity");
                    int Status = rs.getInt("Status");
                    list.add(new ProductDTO(idGlasses, Brand, Name, Description, Type, Image, Quantity, Price, Status));
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

    public List<ProductDTO> getListProductByBrand(String brand) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCHBRAND);
                ptm.setString(1, "%" + brand + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String idGlasses = rs.getString("idGlasses");
                    String Brand = rs.getString("Brand");
                    String Name = rs.getString("Name");
                    String Description = rs.getString("Description");
                    String Type = rs.getString("Type");
                    String Image = rs.getString("Image");
                    float Price = rs.getFloat("Price");
                    int Quantity = rs.getInt("Quantity");
                    int Status = rs.getInt("Status");
                    list.add(new ProductDTO(idGlasses, Brand, Name, Description, Type, Image, Quantity, Price, Status));
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

    public List<ProductDTO> getListProductByID(String ID) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
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
                    String idGlasses = rs.getString("idGlasses");
                    String Brand = rs.getString("Brand");
                    String Name = rs.getString("Name");
                    String Description = rs.getString("Description");
                    String Type = rs.getString("Type");
                    String Image = rs.getString("Image");
                    float Price = rs.getFloat("Price");
                    int Quantity = rs.getInt("Quantity");
                    int Status = rs.getInt("Status");
                    list.add(new ProductDTO(idGlasses, Brand, Name, Description, Type, Image, Quantity, Price, Status));
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

    public List<ProductDTO> getListProductByPriceMinMax(float min, float max) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCHMINMAX);
                ptm.setFloat(1, min);
                ptm.setFloat(2, max);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String idGlasses = rs.getString("idGlasses");
                    String Brand = rs.getString("Brand");
                    String Name = rs.getString("Name");
                    String Description = rs.getString("Description");
                    String Type = rs.getString("Type");
                    String Image = rs.getString("Image");
                    float Price = rs.getFloat("Price");
                    int Quantity = rs.getInt("Quantity");
                    int Status = rs.getInt("Status");
                    list.add(new ProductDTO(idGlasses, Brand, Name, Description, Type, Image, Quantity, Price, Status));
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

   public boolean delete(String idGlasses) {
    boolean checkDelete = false;
    Connection conn = null;
    PreparedStatement checkStmt = null;
    PreparedStatement deleteStmt = null;
    ResultSet rs = null;

    try {
        conn = DBUtils.getConnection();
        if (conn != null) {
            // Kiểm tra xem sản phẩm có tồn tại không
            String checkSQL = "SELECT idGlasses FROM tblGlasses WHERE idGlasses = ?";
            checkStmt = conn.prepareStatement(checkSQL);
            checkStmt.setString(1, idGlasses);
            rs = checkStmt.executeQuery();

            if (!rs.next()) {
                System.err.println("Product not found: " + idGlasses);
                return false;
            }

            // Nếu tồn tại, thực hiện xóa
            deleteStmt = conn.prepareStatement(DELETE);
            deleteStmt.setString(1, idGlasses);
            checkDelete = deleteStmt.executeUpdate() > 0;
        }
    } catch (ClassNotFoundException | SQLException e) {
        System.err.println("Error deleting product: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (checkStmt != null) checkStmt.close();
            if (deleteStmt != null) deleteStmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            System.err.println("Error closing resources: " + e.getMessage());
        }
    }
    return checkDelete;
}


    public boolean update(ProductDTO product) {
    boolean checkUpdate = false;
    Connection conn = null;
    PreparedStatement ptm = null;
    try {
        conn = DBUtils.getConnection();
        if (conn != null) {
            ptm = conn.prepareStatement(UPDATE);
            ptm.setString(1, product.getBrand());
            ptm.setString(2, product.getName());
            ptm.setString(3, product.getDescription());
            ptm.setString(4, product.getType());
            ptm.setString(5, product.getImage());
            ptm.setFloat(6, product.getPrice());
            ptm.setInt(7, product.getQuantity());
            ptm.setInt(8, product.getStatus());
            ptm.setString(9, product.getIdGlasses());

            checkUpdate = ptm.executeUpdate() > 0;
        }
    } catch (ClassNotFoundException | SQLException e) {
        System.err.println("Error updating product: " + e.getMessage());
    } finally {
        try {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            System.err.println("Error closing resources: " + e.getMessage());
        }
    }
    return checkUpdate;
}

    public boolean insert(ProductDTO product) throws SQLException, ClassNotFoundException {
    boolean checkInsert = false;
    Connection conn = null;
    PreparedStatement ptm = null;
    try {
        conn = DBUtils.getConnection();
        if (conn != null) {
            ptm = conn.prepareStatement(INSERT);
            ptm.setString(1, product.getIdGlasses());
            ptm.setString(2, product.getBrand());
            ptm.setString(3, product.getName());
            ptm.setString(4, product.getDescription());
            ptm.setString(5, product.getType());
            ptm.setString(6, product.getImage());
            ptm.setInt(7, product.getQuantity());
            ptm.setFloat(8, product.getPrice());
            ptm.setInt(9, product.getStatus());
            
            checkInsert = ptm.executeUpdate() > 0;
        }
    } catch (SQLException e) {
        System.err.println("Error inserting product: " + e.getMessage());
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
