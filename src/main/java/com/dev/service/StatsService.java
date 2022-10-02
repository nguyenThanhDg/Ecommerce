/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface StatsService {
    List<Object[]> stats(String kw,Date fromDate, Date toDate, int id);
    List<Object[]> revenueStats(int y);
}
