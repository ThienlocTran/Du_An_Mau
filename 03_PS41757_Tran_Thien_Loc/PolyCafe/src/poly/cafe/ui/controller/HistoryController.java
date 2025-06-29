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
public interface HistoryController {

    void open(); // hiển thị bill theo khoảng thời gian Hôm nay
    void fillBills() ; // tải và hiển thị bill theo khoảng thời gian lọc
    void showBillJDialog(); // mở cửa số phiếu bán hàng
    void selectTimeRange(); // chọn khoảng thời gian


}
