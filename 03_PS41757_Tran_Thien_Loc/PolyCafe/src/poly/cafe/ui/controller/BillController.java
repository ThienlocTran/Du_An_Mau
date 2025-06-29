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
public interface BillController extends CrudController<Bill>{
    void fillBillDetails(); // tải và hiển thị chi tiết phiếu
    void selectTimeRange(); // xử lý chọn khoảng thời gian trong cboTimeRanges
    
 

}
