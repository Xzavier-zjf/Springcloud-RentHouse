package com.project.demo.controller;

import com.project.demo.entity.HousingEvaluation;
import com.project.demo.service.HousingEvaluationService;
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
 * 房屋评价：(HousingEvaluation)表控制层
 *
 */
@RestController
@RequestMapping("/housing_evaluation")
public class HousingEvaluationController extends BaseController<HousingEvaluation, HousingEvaluationService> {

    /**
     * 房屋评价对象
     */
    @Autowired
    public HousingEvaluationController(HousingEvaluationService service) {
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
