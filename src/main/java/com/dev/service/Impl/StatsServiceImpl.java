/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service.Impl;


import com.dev.pojo.User;
import com.dev.repository.StatsRepository;
import com.dev.service.StatsService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class StatsServiceImpl implements StatsService{
    
    @Autowired
    private StatsRepository statsRepository;

    @Override
    public List<Object[]> stats(String kw,Date fromDate, Date toDate, int id) {
        return this.statsRepository.stats(kw,fromDate, toDate, id);
    }

    @Override
    public List<Object[]> revenueStats(int y, User seller) {
        return this.statsRepository.revenueStats(y, seller);
    }
    
}
