/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package poly.cafe.dao.impl;

import java.util.List;
import poly.cafe.dao.NhaCungCapDAO;
import poly.cafe.dao.NhaCungCapDAO;
import poly.cafe.entity.NhaCungCap;
import poly.cafe.entity.NhaCungCap;
import poly.cafe.util.XJdbc;
import poly.cafe.util.XQuery;

/**
 *
 * @author Asus
 */
public class NhaCungCapDAOImpl implements NhaCungCapDAO {

    String createSql = "INSERT INTO NhaCungCap(Username, Numberphone, Address) VALUES(?, ?, ?)";
    String updateSql = "UPDATE NhaCungCap SET numberphone=?, address=? WHERE username=?";
    String deleteSql = "DELETE FROM NhaCungCap WHERE Username=?";
    String findAllSql = "SELECT Username, Numberphone, Address FROM NhaCungCap";
    String findByIdSql = "SELECT Numberphone, Address FROM NhaCungCap WHERE Username=?";

    @Override
    public NhaCungCap create(NhaCungCap entity) {
        Object[] values = {
            entity.getUsername(),
            entity.getNumberPhone(),
            entity.getAddress(),};
        XJdbc.executeUpdate(createSql, values);
        return entity;
    }

    @Override
    public void update(NhaCungCap entity) {
        Object[] values = {
           
            entity.getNumberPhone(),
            entity.getAddress(),};
        XJdbc.executeUpdate(updateSql, values);
    }

    @Override
    public void deleteById(String username) {
        XJdbc.executeUpdate(deleteSql, username);
    }

    @Override
    public List<NhaCungCap> findAll() {
        return XQuery.getBeanList(NhaCungCap.class, findAllSql);
    }

    @Override
    public NhaCungCap findById(String username) {
        return XQuery.getSingleBean(NhaCungCap.class, findByIdSql, username);
    }
}
