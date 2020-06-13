package com.cct.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Houses {
    private int id;
    private String houseProjec; //项目名称
    private String possessor; // 项目拥有人
    private String identity;// 身份证号
    private String housesTypes; // 房源类型
    private String area;// 房源大小
    private String housesTime; // 房源建筑时间
}
