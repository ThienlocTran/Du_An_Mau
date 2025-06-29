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
public interface SalesController {

    void open(); // tải và hiển thị thẻ lên cửa sổ bán hàng

    void showBillJDialog(int cardId); // hiển thị cửa sổ chứa phiếu bán hàng hàng của 1 thẻ

}
