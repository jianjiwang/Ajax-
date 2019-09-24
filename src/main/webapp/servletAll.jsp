<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="application/javascript">
        function selectAll() {
            //发送异步请求 获取所有数据
            //创建异步请求对象
            var xhr;
            if(window.ActiveXObject){
                xhr=new ActiveXObject("Microsoft.XMLHTTP")
            }else {
                xhr=new XMLHttpRequest();
            }
            //打开异步请求
            xhr.open("GET","${pageContext.request.contextPath}/user/selectAll")
            //发送异步请求
            xhr.send(null);
            //监听响应
            xhr.onreadystatechange=function () {
                //响应正确完成
                if(xhr.readyState==4&&xhr.status==200){
                    var jsonString=xhr.responseText;
                    //把json协议串转换为JavaScript中的集合
                    var users=JSON.parse(jsonString);
                    //获取table标签对象
                    var table=document.getElementById("table");
                    //遍历通过DOM编程渲染数据
                    for(var i=0;i<users.length;i++){
                        //创建行 放置单元格
                        var tr=document.createElement("tr");
                        //创建文本节点id
                        var id=document.createTextNode(users[i].id);
                        //创建单元格 把id放入单元格中
                        var td=document.createElement("td");
                        td.append(id);
                        tr.append(td);

                        //创建文本节点username
                        var username=document.createTextNode(users[i].username);
                        //创建单元格 把username放入单元格中
                        var td1=document.createElement("td");
                        td1.append(username);
                        tr.append(td1);

                        //创建文本节点password
                        var password=document.createTextNode(users[i].password);
                        //创建单元格 把password放入单元格中
                        var td2=document.createElement("td");
                        td2.append(password);
                        tr.append(td2);

                        //创建文本节点age
                        var age=document.createTextNode(users[i].age);
                        //创建单元格 把age放入单元格中
                        var td3=document.createElement("td");
                        td3.append(age);
                        tr.append(td3);
                        //把装满数据的tr放在table中
                        table.append(tr);
                    }
                }
            }
        }
    </script>
</head>
<body onload="selectAll()">
<table id="table" cellspacing="0px" cellpadding="0px" border="1px" align="center" width="80%">
    <tr bgcolor="green">
        <th>用户ID</th>
        <th>用户名</th>
        <th>密码</th>
        <th>年龄</th>
    </tr>
</table>
</body>

</html>