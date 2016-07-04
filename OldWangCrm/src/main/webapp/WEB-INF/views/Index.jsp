<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>老王房源管理系统</title>
    <link rel="stylesheet" type="text/css" href="Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="Styles/base.css" />
    <link rel="stylesheet" type="text/css" href="Styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script type="text/javascript" src="Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="Scripts/index.js"></script>
</head>
<body>
    <div class="warp">
        <!--头部开始-->
        <div class="top_c">
            <div class="top-menu">

            </div>
            <div class="top-nav">上午好，欢迎您，老王！&nbsp;&nbsp;<a href="#">修改密码</a> | <a href="#">安全退出</a></div>
        </div>
        <!--头部结束-->
        <!--左边菜单开始-->
        <div class="left_c left">
            <h1>系统操作菜单</h1>
            <div class="acc">
                <div>
                    <a class="one">房源管理</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="Template/find-1.html">搜索房源</a></li>
                        <li><b class="tip"></b><a target="Conframe" href='${pageContext.request.contextPath }/a'>添加房源</a></li>
                    </ul>
                </div>
                <div>
                    <a class="one">客户管理</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="/a">查询客户</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="Template/Maintain-edit.html">添加客户</a></li>
                    </ul>
                </div>
                <div>
                    <a class="one">区域功能</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="Template/form-Master-slave.html">看房记录</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="Template/form-collapse.html">合同录入</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="Template/form-tabs.html">合同查询</a></li>
                    </ul>
                </div>

                <div>
                    <a class="one">业绩查询</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="Template/formstyle.html">房源录入记录</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="Template/formstyle.html">完成的合同</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="Template/formstyle.html">客户拓展</a></li>
                    </ul>
                </div>
                <div>
                    <a class="one">管理员设置</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="Template/Alert.html">图表</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--左边菜单结束-->
        <!--右边框架开始-->
        <div class="right_c">
            <div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>

        </div>
        <div class="Conframe">
            <iframe name="Conframe" id="Conframe"></iframe>
        </div>
        <!--右边框架结束-->

        <!--底部开始-->
        <div class="bottom_c" >Copyright &copy;2015-2016 长沙老王房屋租赁公司 版权所有</div>
        <!--底部结束-->
    </div>
</body>
</html>
