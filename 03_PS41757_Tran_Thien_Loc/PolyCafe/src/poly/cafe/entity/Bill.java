/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package poly.cafe.entity;

import java.util.*;
import lombok.*;

/**
 *
 * @author Asus
 */
@NoArgsConstructor 
@AllArgsConstructor 
@Builder 
@Data 
public class Bill { 
    public static final int STATUS_SERVICING = 0;
    public static final int STATUS_COMPLETED = 1;
    public static final int STATUS_CANCELED = 2;
    private Long id; 
    private String username; 
    private Integer cardId; 
    @Builder.Default 
    private Date checkin = new Date(); 
    private Date checkout; 
    private int status; 
} 
