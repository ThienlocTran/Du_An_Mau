/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package poly.cafe.ui.controller;

import poly.cafe.util.XDialog;

/**
 *
 * @author Asus
 */
public interface LoginController {
    void open();
    void login();
    
    default void exit(){
        if (XDialog.confirm("Bạn muốn kết thúc?")) {
            System.exit(0);
        }
    }
}
