/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package poly.cafe.entity;

import lombok.*;

/**
 *
 * @author Asus
 */
@NoArgsConstructor 
@AllArgsConstructor 
@Builder 
@Data 
public class BillDetail { 
    private Long id; 
    private Long billId; 
    private String drinkId; 
    private double unitPrice; 
    private double discount; 
    private int quantity; 
    private String drinkName;
} 
