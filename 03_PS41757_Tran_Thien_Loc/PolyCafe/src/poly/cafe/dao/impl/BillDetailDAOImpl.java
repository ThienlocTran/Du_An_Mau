/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package poly.cafe.dao.impl;

import java.util.List;
import poly.cafe.dao.BillDetailDAO;
import poly.cafe.entity.BillDetail;
import poly.cafe.util.XJdbc;
import poly.cafe.util.XQuery;

/**
 *
 * @author Asus
 */
public class BillDetailDAOImpl implements BillDetailDAO {

    String createSql = "INSERT INTO BillDetails(billId, drinkId, unitPrice, discount, quantity) VALUES(?, ?, ?, ?, ?)";
    String updateSql = "UPDATE BillDetails SET billId=?, drinkId=?, unitPrice=?, discount=?, quantity= ? WHERE id=?";
    String deleteSql = "DELETE FROM BillDetails WHERE id=?";
    String findAllSql = "SELECT Id, BillId, DrinkId, UnitPrice, Discount, Quantity FROM BillDetails";
    String findByIdSql = "SELECT Id, BillId, DrinkId, UnitPrice, Discount, Quantity FROM BillDetails WHERE id=?";
    String findByBillIdSql = "SELECT d.*, dr.name AS drinkName "
                                + "FROM BillDetails d "
                                + "JOIN Drinks dr ON d.drinkId = dr.id "
                                + "WHERE d.billId = ?";
    String findByDrinkIdSql = "SELECT Id, BillId, DrinkId, UnitPrice, Discount, Quantity FROM BillDetails WHERE drinkId = ?";

    @Override
    public BillDetail create(BillDetail entity) {
        Object[] values = {
            entity.getBillId(),
            entity.getDrinkId(),
            entity.getUnitPrice(),
            entity.getDiscount(),
            entity.getQuantity(),};
        XJdbc.executeUpdate(createSql, values);
        return entity;
    }

    @Override
    public void update(BillDetail entity) {
        Object[] values = {
            entity.getBillId(),
            entity.getDrinkId(),
            entity.getUnitPrice(),
            entity.getDiscount(),
            entity.getQuantity(),
            entity.getId(),};
        XJdbc.executeUpdate(updateSql, values);
    }

    @Override
    public void deleteById(Long id) {
        XJdbc.executeUpdate(deleteSql, id);
    }

    @Override
    public List<BillDetail> findAll() {
        return XQuery.getBeanList(BillDetail.class, findAllSql);
    }

    @Override
    public BillDetail findById(Long id) {   
        return XQuery.getSingleBean(BillDetail.class, findByIdSql, id);
    }

    @Override
    public List<BillDetail> findByBillId(Long billId) {
        return XQuery.getBeanList(BillDetail.class, findByBillIdSql, billId);
    }

    @Override
    public List<BillDetail> findByDrinkId(String drinkId) {
        return XQuery.getBeanList(BillDetail.class, findByDrinkIdSql, drinkId);
    }
}
