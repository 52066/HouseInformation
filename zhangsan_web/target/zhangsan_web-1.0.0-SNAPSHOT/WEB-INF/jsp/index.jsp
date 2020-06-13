<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="layui/css/layui.css"/>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">房源信息</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">


        </ul>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
<%--                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">--%>
                    ${user.userName}
                </a>

            </li>
            <li class="layui-nav-item"><a href="user/logou.do">退出</a></li>
        </ul>
    </div>
    <%--        <table content="center" width="100%">--%>

    <%--            <tr>--%>
    <%--                <td content="center" >--%>
<%--    <form  action="${pageContext.request.contextPath}/addHouse.do">--%>
    <div class="layui-form-item">
        <label class="layui-form-label">查询方式</label>
        <div class="layui-input-block" style="height: 38px;">
            <select style="height: 38px;width: 110px;" id="distinction" lay-verify="required">
                <%--                                <option value=""></option>--%>
                <option selected="selected" value="3">查看所有</option>
                <option value="1">项目人</option>
                <option value="2">大小</option>
                <option value="0">项目名称</option>

            </select>
            <input style="height: 38px;" type="text" id="content" placeholder="输入想查询的信息"> <a class="layui-btn"
                                                                                             onclick="selectAll()">搜索</a>

        </div>
    </div>

    <%--                </td>--%>
    <%--            </tr>--%>
    <%--        </table>--%>
    <table id="hotelTable" lay-filter="aaa"></table>


    <script type="text/html" id="operBar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">添加房源信息</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="upd">修改</a>
    </script>

    <script type="text/javascript" src="layui/layui.js"></script>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script>
        layui.use('table', function () {
            var table = layui.table;

            table.render({
                elem: "#hotelTable"
                , url: "houses/houseList.do"   //{page:1,limit:3}
                , cols: [[
                    {field: 'id', title: '编号', width: 80}
                    , {field: 'houseProjec', title: '项目名称', width: 140}
                    , {field: 'possessor', title: '项目拥有人', width: 140}
                    , {field: 'identity', title: "身份证号", width: 150}
                    , {field: 'housesTypes', title: "房源类型", width: 110}
                    , {field: 'area', title: "大小", width: 120}
                    , {field: 'housesTime', title: "创建时间", width: 120}
                    , {fixed: 'right', title: "操作", toolbar: "#operBar"}
                ]]
                , page: true
                , limit: 3
                , limits: [1, 2, 3, 4, 10]
            });

            //table.on表示侦听数据表格的事件
            //      tool表示行事件
            //      toolbar表示表格事件
            table.on("tool(aaa)", function (obj) {
                console.log("~~~~~~~~~~~~~~~" + obj.event);
                console.log(obj.data)
                if (obj.event == "del") {
                    var id = obj.data.id;
                    console.log(id)
                    layer.confirm('你确定要删除这个酒店信息吗？', function (index) {
                        //ajax将hotelId传递到后端，进行删除
                        $.post("houses/deleteHouse.do", {"houseId": id}, function (res) {
                            console.log(res);
                            if (res.code == 1) {
                                obj.del();
                                layer.msg("删除成功！");
                            } else {
                                layer.msg("删除失败！");
                            }
                        }, "json");
                        //从数据表格中将这条数据（点击删除按钮对应的数据）删除

                    });
                } else if (obj.event == "upd") {
                    // var userId = obj.data.userId;
                    // console.log(userId);

                    var house = obj.data;

                    $("#id").val(house.id);
                    $("#houseProjec1").val(house.houseProjec);
                    $("#possessor1").val(house.possessor);
                    $("#identity1").val(house.identity);
                    $("#housesTypes1").val(house.housesTypes);
                    $("#area1").val(house.area);
                    $("#housesTime1").val(house.housesTime);
                    console.log("ssss");
                    layer.open({
                        type: 1
                        , content: $("#updateDiv1")
                        , area: ['400px', '500px']
                    });

                } else if (obj.event == "edit") {
                    console.log("ssss");
                    layer.open({
                        type: 1
                        , content: $("#updateDiv")
                        , area: ['400px', '500px']
                    })
                }
            });
        });

        function selectAll() {
            var distinction = $("#distinction").val();
            var content1 = $("#content").val();
            console.log(content1);
            console.log(distinction);

            layui.use('table', function () {
                var table = layui.table;

                table.render({
                    elem: "#hotelTable"
                    , url: "houses/selectByConter.do?distinction="+distinction+"&content="+content1   //{page:1,limit:3}
                    , cols: [[
                        {field: 'id', title: '编号', width: 80}
                        , {field: 'houseProjec', title: '项目名称', width: 140}
                        , {field: 'possessor', title: '项目拥有人', width: 140}
                        , {field: 'identity', title: "身份证号", width: 150}
                        , {field: 'housesTypes', title: "房源类型", width: 110}
                        , {field: 'area', title: "大小", width: 120}
                        , {field: 'housesTime', title: "创建时间", width: 120}
                        , {fixed: 'right', title: "操作", toolbar: "#operBar"}
                    ]]
                    , page: true
                    , limit: 3
                    , limits: [1, 2, 3, 4, 10]
                });
            });
            // $.post("houses/selectByConter.do", {"distinction": distinction, "content": content1}, function (data) {
            //     console.log(data);
            //     if (data.code == 1) {
            //     var houses = data.data;
            //     console.log(houses);
            //     for (i=0;i<houses.length;i++){
            //        var house = houses[i];
            //         $("#id1").val(house.id);
            //        console.log(house)
            //         layer.open({
            //             type: 1
            //             , content: $("#updateDiv3")
            //             , area: ['1000px', '500px']
            //         })
            //     }
            //     //根据校验结果进行页面跳转
            //
            //
            //     } else {
            //         //登录失败
            //         layer.msg(data.msg);
            //     }
            // }, "json");
        }

        function checkInfo() {
            var houseProjec = $("#houseProjec").val();
            var possessor = $("#possessor").val();
            var identity = $("#identity").val();
            var housesTypes = $("#housesTypes").val();
            var area = $("#area").val();
            var housesTime = $("#housesTime").val();

            console.log(houseProjec);
            $.post("houses/insertHouses.do", {
                "houseProjec": houseProjec,
                "possessor": possessor,
                "identity": identity,
                "housesTypes": housesTypes,
                "area": area,
                "housesTime": housesTime
            }, function (data) {
                console.log(data);
                //根据校验结果进行页面跳转
                if (data.code == 1) {
                    var flag = confirm(data.msg);
                    if (flag) {
                        location.href = "index.do";
                    }
                } else {
                    //登录失败
                    layer.msg(data.msg);
                }
            }, "json");
        }

        function updete() {
            var id = $("#id").val();
            var houseProjec = $("#houseProjec1").val();
            var possessor = $("#possessor1").val();
            var identity = $("#identity1").val();
            var housesTypes = $("#housesTypes1").val();
            var area = $("#area1").val();
            var housesTime = $("#housesTime1").val();

            console.log(houseProjec);
            $.post("houses/updateHouse.do", {
                "id": id,
                "houseProjec": houseProjec,
                "possessor": possessor,
                "identity": identity,
                "housesTypes": housesTypes,
                "area": area,
                "housesTime": housesTime
            }, function (data) {
                console.log(data);
                //根据校验结果进行页面跳转
                if (data.code == 1) {
                    var flag = confirm(data.msg);
                    if (flag) {
                        window.location.reload();
                    }
                } else {
                    //登录失败
                    layer.msg(data.msg);
                }
            }, "json");
        }


    </script>

    <div id="updateDiv3" style="padding: 15px; display: none">
        <table class="layui-table">
            <thead>
            <tr>
                <th>编号</th>
                <th>项目名称</th>
                <th>拥有人</th>
                <th>身份证号</th>
                <th>房间类型</th>
                <th>房间大小</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="text" id="id1">
                </td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
                <td>贤心</td>
                <td>2016-11-29</td>
            </tr>
            </tbody>
        </table>
    </div>

    <div id="updateDiv" style="padding: 15px; display: none">
        <div class="layui-form-item layui-form-text">

            <label class="layui-form-label">项目名称：</label>

            <div class="layui-input-block">
                <input type="text" id="houseProjec"/>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">拥有人：</label>

            <div class="layui-input-block">
                <input type="text" id="possessor"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">身份证号：</label>

            <div class="layui-input-block">
                <input type="text" id="identity"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">房间类型：</label>

            <div class="layui-input-block">
                <input type="text" id="housesTypes"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">房间大小：</label>

            <div class="layui-input-block">
                <input type="text" id="area"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">创建时间：</label>

            <div class="layui-input-block">
                <input type="text" id="housesTime"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <input class="layui-btn" onclick="checkInfo()" value="提交">
        </div>

    </div>


    <div id="updateDiv1" style="padding: 15px; display: none">
        <div class="layui-form-item layui-form-text">

            <label class="layui-form-label">项目编号：</label>

            <div class="layui-input-block">
                <input type="text" id="id"/>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">

            <label class="layui-form-label">项目名称：</label>

            <div class="layui-input-block">
                <input type="text" id="houseProjec1"/>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">拥有人：</label>

            <div class="layui-input-block">
                <input type="text" id="possessor1"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">身份证号：</label>

            <div class="layui-input-block">
                <input type="text" id="identity1"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">房间类型：</label>

            <div class="layui-input-block">
                <input type="text" id="housesTypes1"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">房间大小：</label>

            <div class="layui-input-block">
                <input type="text" id="area1"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">创建时间：</label>

            <div class="layui-input-block">
                <input type="text" id="housesTime1"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <input class="layui-btn" onclick="updete()" value="提交">
        </div>

    </div>


</div>
</body>
</html>