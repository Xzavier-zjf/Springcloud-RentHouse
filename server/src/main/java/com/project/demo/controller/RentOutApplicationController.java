package com.project.demo.controller;

import com.project.demo.entity.RentOutApplication;
import com.project.demo.service.RentOutApplicationService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;


/**
 * 退租申请：(RentOutApplication)表控制层
 *
 */
@RestController
@RequestMapping("/rent_out_application")
public class RentOutApplicationController extends BaseController<RentOutApplication, RentOutApplicationService> {

    /**
     * 退租申请对象
     */
    @Autowired
    public RentOutApplicationController(RentOutApplicationService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        Map<String, String> mapcontract_no = new HashMap<>();
        mapcontract_no.put("contract_no",String.valueOf(paramMap.get("contract_no")));
        List listcontract_no = service.select(mapcontract_no, new HashMap<>()).getResultList();
        if (listcontract_no.size()>0){
            return error(30000, "字段合同号内容不能重复");
        }
        this.addMap(paramMap);
        return success(1);
    }

}
