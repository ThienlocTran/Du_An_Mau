/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package poly.cafe.dao.impl;

import java.util.List;
import poly.cafe.dao.DrinkDAO;
import poly.cafe.entity.Drink;
import poly.cafe.util.XJdbc;
import poly.cafe.util.XQuery;

/**
 *
 * @author Asus
 */
public class DrinkDAOImpl implements DrinkDAO { 
    String createSql = "INSERT INTO Drinks(Id, name, image, unitPrice, discount, available, categoryId) VALUES(?, ?, ?, ?, ?, ?, ?)"; 
    String updateSql = "UPDATE Drinks SET name=?, image=?, unitPrice=?, discount=?, available=?, categoryId= ? WHERE Id=?"; 
    String deleteSql = "DELETE FROM Drinks WHERE Id=?"; 
    String findAllSql = "SELECT Id, Name, Image, UnitPrice, Discount, Available, CategoryId FROM Drinks"; 
    String findByIdSql = "SELECT Id, Name, Image, UnitPrice, Discount, Available, CategoryId FROM Drinks WHERE Id=?"; 
    String findByCategoryIdSql = "SELECT Id, Name, Image, UnitPrice, Discount, Available, CategoryId FROM Drinks WHERE categoryId=?"; 
    
    @Override 
    public Drink create(Drink entity) { 
        Object[] values = { 
            entity.getId(),
            entity.getName(),
            entity.getImage(),
            entity.getUnitPrice(),
            entity.getDiscount(),
            entity.isAvailable(),
            entity.getCategoryId()
        }; 
        XJdbc.executeUpdate(createSql, values); 
        return entity; 
    } 
    @Override 
    public void update(Drink entity) { 
        Object[] values = { 
            entity.getName(),
            entity.getImage(),
            entity.getUnitPrice(),
            entity.getDiscount(),
            entity.isAvailable(),
            entity.getCategoryId(),
            entity.getId(),
        }; 
        XJdbc.executeUpdate(updateSql, values); 
    } 
    @Override 
    public void deleteById(String id) { 
        XJdbc.executeUpdate(deleteSql, id); 
    } 
    @Override 
    public List<Drink> findAll() { 
        return XQuery.getBeanList(Drink.class, findAllSql); 
    } 
    @Override 
    public Drink findById(String id) { 
        return XQuery.getSingleBean(Drink.class, findByIdSql, id); 
    }  
    
    @Override 
    public List<Drink> findByCategoryId(String categoryId) { 
        return XQuery.getBeanList(Drink.class, findByCategoryIdSql, categoryId); 
    }  
} 

