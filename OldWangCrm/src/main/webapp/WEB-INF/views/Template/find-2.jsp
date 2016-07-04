<!DOCTYPE html>
<meta charset="utf-8" />
<html>
<head>
<title>老王房源管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
<link href="style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="scripts/jquery/jquery-1.4.4.min.js"></script>
<script src="scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer="defer"></script>
<script type="text/javascript" src="scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			if(validateForm()){
				checkFyFhSubmit();
			}
		});

		/*
		 * 取消
		 */
		$("#cancelbutton").click(function() {
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		});

		var result = 'null';
		if(result =='success'){
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		}
	});

	/** 检测房源房号是否存在  **/
	function checkFyFh(){
		// 分别获取小区编号、栋号、层号、房号
		var fyID = $('#fyID').val();
		var fyXqCode = $("#fyXq").val();
		var fyDh = $("#fyDh").val();
		var fyCh = $("#fyCh").val();
		var fyFh = $("#fyFh").val();
		if(fyXqCode!="" && fyDh!="" && fyCh!="" && fyFh!=""){
			// 给房屋坐落地址赋值
			$("#fyZldz").val($('#fyDh option:selected').text() + fyCh + "-" + fyFh);
			// 异步判断该房室是否存在，如果已存在，给用户已提示哦
			$.ajax({
				type:"POST",
				url:"checkFyFhIsExists.action",
				data:{"fangyuanEntity.fyID":fyID,"fangyuanEntity.fyXqCode":fyXqCode, "fangyuanEntity.fyDhCode":fyDh, "fangyuanEntity.fyCh":fyCh, "fangyuanEntity.fyFh":fyFh},
				dataType : "text",
				success:function(data){
// 					alert(data);
					// 如果返回数据不为空，更改“房源信息”
					if(data=="1"){
						 art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'该房室在系统中已经存在哦，\n请维护其他房室数据', ok:true,});
						 $("#fyFh").css("background", "#EEE");
						 $("#fyFh").focus();
						 return false;
					}
				}
			});
		}
	}

	/** 检测房源房号是否存在并提交form  **/
	function checkFyFhSubmit(){
		// 分别获取小区编号、栋号、层号、房号
		var fyID = $('#fyID').val();
		var fyXqCode = $("#fyXq").val();
		var fyDh = $("#fyDh").val();
		var fyCh = $("#fyCh").val();
		var fyFh = $("#fyFh").val();
    var fylx =$("#fylx").val();
    var fyjg = $("#fyjg").val();
    var fylb = $("#fylb").val();
    var ywy = $("#ywy").val();
    var fydq=$("#fydq").val();
		if(fyXqCode!="" && fyDh!="" && fyCh!="" && fyFh!=""){
			// 给房屋坐落地址赋值
			$("#fyZldz").val($('#fyDh option:selected').text()  + fyCh + "-" + fyFh);
			// 异步判断该房室是否存在，如果已存在，给用户已提示哦
			$.ajax({
				type:"POST",
				url:"checkFyFhIsExists.action",
				data:{"fangyuanEntity.fyID":fyID,"fangyuanEntity.fyXqCode":fyXqCode, "fangyuanEntity.fyDhCode":fyDh, "fangyuanEntity.fyCh":fyCh, "fangyuanEntity.fyFh":fyFh},
				dataType : "text",
				success:function(data){
// 					alert(data);
					// 如果返回数据不为空，更改“房源信息”
					if(data=="1"){
						 art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'该房室在系统中已经存在哦，\n请维护其他房室数据', ok:true,});
						 $("#fyFh").css("background", "#EEE");
						 $("#fyFh").focus();
						 return false;
					}else{
						$("#submitForm").attr("action", "/xngzf/archives/saveOrUpdateFangyuan.action").submit();
					}
				}
			});
		}
		return true;
	}

	/** 表单验证  **/
	function validateForm(){
		if($("#fyXqName").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源小区', ok:true,});
			return false;
		}
		if($("#fyDh").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源栋号', ok:true,});
			return false;
		}
		if($("#fyCh").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源层号', ok:true,});
			return false;
		}
		if($("#fyFh").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源房号', ok:true,});
			return false;
		}
		if($("#fyZongMj").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源面积', ok:true,});
			return false;
		}
		if($("#fyJizuMj").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写计租面积', ok:true,});
			return false;
		}
		if($("#fyZldz").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源座落地址', ok:true,});
			return false;
		}
    if ($("#fylx").val()==""){
      art.dialog({icon:'error',title:'友情提示'，drag:false,resize:false,content:'填写房源类型'，ok:true});
      return false;
    }
    if ($("#fyjg").val()=="") {
      art.dialog({icon:'error',title:'友情提示'，drag:false,resize:false,content:'填写房源价格'，ok:true});
    }
    if($("#fylb").val()==""){
      art.dialog({icon:'error',title:'友情提示'，drag:false,resize:false,content:'填写房源老板信息'，ok:true});
    }
      if ($(#"ywy").val()=="") {
        art.dialog({icon:'error',title:'友情提示'，drag：false,resize:false,content:'填写业务员信息'，ok:true});
      }
      if ($(#"fydq").val()=="") {
          art.dialog({icon:'error',title:'友情提示'，drag:false,resize:false,content:'填写房源归属区',ok:true});
      }
        if($(#"lxdh").val()==""){
          art.dialog({icon:'error',title:'友情提示',drag:false,resize:false,content:'联系电话'，ok:true});
        }
        if($(#"qk").val()==""){
          art.dialog({icon:'error',title：'友情提示'，drag:false,resize:false,content:'房源情况'，ok:true});
        }
		return true;
	}
</script>
</head>
<body>
<form id="submitForm" name="submitForm" action="/xngzf/archives/initFangyuan.action" method="post">
	<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
	<div id="container">
		<div id="nav_links">
			当前位置：房源管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">添加房源</span>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt" width="80">小区</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyXqCode" id="fyXq" class="ui_select01" onchange="getFyDhListByFyXqCode();">
                            <option value="">--请选择--</option>
                            <option value="6" selected="selected">一号小区</option>
                            <option value="77">二号小区</option>
                            <option value="83">三号小区</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_qh">所属区域</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyqhCode" id="fydq" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="16" selected="selected">天心区</option>
                            <option value="17">岳麓区</option>
                            <option value="69">芙蓉区</option>
                            <option value="72">雨花区</option>
                            <option value="73">开福区</option>
                            <option value="74">望城区</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">层号</td>
					<td class="ui_text_lt">
						<input type="text" id="fyCh" name="fangyuanEntity.fyCh" value=" "  class="ui_input_txt01"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">房号</td>
					<td class="ui_text_lt">
						<input type="text" id="fyFh" name="fangyuanEntity.fyFh"  value=" " class="ui_input_txt01" onkeyup="checkFyFh();"/>室
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">房源面积</td>
					<td class="ui_text_lt">
						<input type="text" id="fyZongMj" name="fangyuanEntity.fyZongMj"  value=""class="ui_input_txt01"/>㎡
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">计租面积</td>
					<td class="ui_text_lt">
						<input type="text" id="fyJizuMj" name="fangyuanEntity.fyJizuMj" value=" " class="ui_input_txt01"/>㎡
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">户型</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyHxCode" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="76" selected="selected">一室一厅一卫</option>
                            <option value="10">两室一厅一卫</option>
                            <option value="14">三室一厅一卫</option>
                            <option value="71">三室两厅一卫</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">房源状态</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyJianzhuJiegou" id="submitForm_fangyuanEntity_fyJianzhuJiegou" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="38" selected="selected">精装</option>
                            <option value="39" selected="selected">未装修</option>
                            <option value="40" selected="selected">普通装修</option>
                            <option value="41" selected="selected">豪华装修</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">地址</td>
					<td class="ui_text_lt">
						<input type="text" id="fyZldz" name="fangyuanEntity.fyZldz" value=" " class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">位置</td>
					<td class="ui_text_lt">
						<input type="text" id="fyPsdz" name="fangyuanEntity.fyPsdz" value=" " class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">价格</td>
					<td class="ui_text_lt">
							<input type="text" id="jiage" name="fangyuanEntity.fangyuanjiage" value=" " class="ui_input_txt01"/>

					</td>
				</tr>
        <tr>
          <td class="ui_text_lb">房源老板</td>
          <td class="ui_text_lt">
            <input type="text" id="laoban" name="fangyuanEntity.fangyuanlaoban" value=" " class="ui_input_text03"/>
          </td>
        </tr>

        <tr>
          <td class="ui_text_dh">联系电话</td>
          <td class="ui_text_lt">
            <input type="text" id="dianhua" name="fangyuanEntity.lianxidianhua" value=" " vlass="ui_input_text04"/>
          </td>
        </tr>


        <tr>
					<td class="ui_text_rt">情况</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyStatus" id="submitForm_fangyuanEntity_fyStatus" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="13" selected="selected">已配租</option>
                            <option value="12">已租赁</option>
                            <option value="24">腾退待租</option>
                            <option value="23">欠费</option>
                            <option value="27">其他</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01" href="index.html" />
						&nbsp;<input id="cancelbutton" type="button" value="取消" class="ui_input_btn01"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
</body>
</html>
