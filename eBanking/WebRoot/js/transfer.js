


function getFormQueryString(frmID) //frmID是表单的ID号，请在表单form中先命名一个ID号
{
    var frmID = document.getElementById(frmID);
    var i, queryString = "", and = "";
    var item;
    var itemValue;
    for (i = 0; i < frmID.length; i++) {
        item = frmID[i];
        if (item.name != '') {
            if (item.type == 'select-one') {
                itemValue = item.options[item.selectedIndex].value;
            }
            else 
                if (item.type == 'checkbox' || item.type == 'radio') {
                    if (item.checked == false) {
                        continue;
                    }
                    itemValue = item.value;
                }
                else 
                    if (item.type == 'button' || item.type == 'submit' || item.type == 'reset' || item.type == 'image') {
                        continue;
                    }
                    else {
                        itemValue = item.value;
                    }
            itemValue = escape(itemValue);
            queryString += and + item.name + '=' + itemValue;
            and = "&";
        }
    }
    return queryString;
}


function getFormJson(frmID) //frmID是表单的ID号，请在表单form中先命名一个ID号
{
    var frmID = document.getElementById(frmID);
    var i, queryString = "{";
    var item;
    var itemValue;
    for (i = 0; i < frmID.length; i++) {
        item = frmID[i];
        if (item.name != '') {
            if (item.type == 'select-one') {
                itemValue = item.options[item.selectedIndex].value;
            }
            else 
                if (item.type == 'checkbox' || item.type == 'radio') {
                    if (item.checked == false) {
                        continue;
                    }
                    itemValue = item.value;
                }
                else 
                    if (item.type == 'button' || item.type == 'submit' || item.type == 'reset' || item.type == 'image') {
                        continue;
                    }
                    else {
                        itemValue = item.value;
                    }
            //itemValue = escape(itemValue);
			
			if (itemValue != "") {
				queryString += '"' + item.name + '"' + ':' + itemValue + ",";
			}
           
        }
		
    }
	 queryString=queryString.substr(0,queryString.length-1 );
	 queryString +="}";
    return queryString;
}




function sendAjax()
{
	//表单验证
	 if($("#inName").val().trim()=="")
			 {
			 alert("收款人姓名不能为空");
			 return false;
			 }
	 if($("#accInNo").val().trim()=="")
			 {
			 alert("收款人账号不能为空");
			 return false;
			 }
		 if($("#inBankNo").val().trim()=="")
			 {
			 alert("收款银行不能为空");
			 return false;
			 }
		 if($("#tranAmount").val().trim()=="")
			 {
			 alert("转账金额不能为空");
			 return false;
			 }
			 
		if(!$("#tranAmount").val().match(/^\d+(\.\d+)?$/))
			 {
			 alert("请输入正确的金额");
			 return false;
			 }	
		
			if (!$("#noticeEmail").val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)&& $("#noticeEmail").val().trim()!="") { 
				alert("邮箱格式不正确"); 
				 
				$("#email").focus(); 
				return false; 
				} 	
	
	
	 
	 
	 
	 
	 
	 var validCodeBox=$("#d1").ligerTextBox();
	 var selectAccOutNo=$("#selectAccOutNo").val();
	 $("#accOutNo").val(selectAccOutNo);
	 var query=getFormQueryString("transferForm");
	 //alert(query);
	 
	 //发送验证信息
	 $.get("/eBanking/transfer/sendValidMsg.do?"+query, function(result)
										{
											if (result.status != true) 
											{											
												alert(result.msg);
											}
											else
											{
												 dialog=$.ligerDialog.open({
	 	                            
					                                    target:$("#pop"),
					                                    buttons: [  { text: '提交', onclick: function (i, d)
														 {
															var validCode=validCodeBox.get('value');
															$("#validCode").val(validCode);
															dialog.hide();
															var updateQuery=getFormQueryString("transferForm");
															//alert(updateQuery);
															var action=$("#transferForm").attr("action");
															
															
															$.get(action+"?"+updateQuery, function(result)
															{
										                         alert(result.msg);
															
									                        });
															
															
															//$("#transferForm").submit();
															
															
														}},
					                                               
					                                        ]                                  
					                               });
											}
				                        });
	 
                 
	
	
	/** $.ajax({
             url: "transfer/getValidCode.do",
             dataType: "json",
             type: "post",
             //data: jsonData, //要传递的数据 
             success: function (json) {
			 	 dlgedit=$.ligerDialog.open({
                                    target:$("#pop"),
                                    buttons: [  { text: '保存', onclick: function (i, d) {
										var validCode=$("#validCodePop").val();
										alert(validCode);
										$("#validCodePop").val(validCode);
										//alert("submit");
									}},
                                               
                                        ]                                  
                               });
				
				}
				
		}); 
		**/
	
   
}

