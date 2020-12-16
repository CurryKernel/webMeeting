package Service;

import DAO.CheckInfoRespository;

import DAO.impl.CheckInfoImpl;

import VO.CheckInfo;
import VO.User;

import java.util.ArrayList;
import java.util.List;

public class CheckInfoService {
    private CheckInfoRespository CheckInfo= new CheckInfoImpl();
    public List<CheckInfo> findByUserId(String userId){
        return CheckInfo.findByUserId(userId);
    }
    public List<CheckInfo> findAll(){
        return CheckInfo.findAll();
    }
    public  int deleteByUserId(String userId){ return CheckInfo.deleteByUserId(userId); }
    public List<CheckInfo> selets(CheckInfo t) {
        List<CheckInfo> list = new ArrayList<CheckInfo>();
        list = CheckInfo.selets(t);
        return list;
    }
    }
