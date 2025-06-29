/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package poly.cafe.ui.controller;

import poly.cafe.entity.Bill;
import poly.cafe.util.XDialog;

/**
 *
 * @author Asus
 */
public interface RevenueController extends CrudController<Bill>{
    void open(); // hiển thị doanh thu từng loại trong ngày
    void selectTimeRange(); // hiển thị doanh thu theo khoảng thời gian được chọn
    void fillRevenue(); // hiển thị doanh thu

    
    
}
