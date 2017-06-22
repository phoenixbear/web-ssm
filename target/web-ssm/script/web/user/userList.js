$(function(){
	
	/*
	*给全选添加click事件
	*/
	$("#selectAll").click(function(){
		/*
		*获取全选的状态
		*/
		var bool=$("#selectAll").attr("checked");
		if(bool==true){
			$(":checkbox[name=checkboxBtn]").attr("checked", true);
		}else{
			$(":checkbox[name=checkboxBtn]").attr("checked", false);
		}
	});
	/*
	给所有条目的复选框添加click事件
	*/
	$(":checkbox[name=checkboxBtn]").click(function() {
		var all = $(":checkbox[name=checkboxBtn]").length;//所有条目的个数
		var select = $(":checkbox[name=checkboxBtn][checked=true]").length;//获取所有被选择条目的个数
		
		if(all == select) {//全都选中了
			$("#selectAll").attr("checked", true);//勾选全选复选框
		} else if(select == 0) {//谁都没有选中
			$("#selectAll").attr("checked", false);//取消全选
		} else {
			$("#selectAll").attr("checked", false);//取消全选
		}
	});
	
	$(".cancel").click(function(){
		$(".tip").css("display","none");
	});
	
	//添加用户
	$("#add").click(function(){
		JUI("#addDiv").dialog({
			width:400,
			height:300,
			modal:true,
			autoOpen:true,
			buttons:{
				'提交':function(){
					var form=$("#addForm");
					$.ajax({
						type:'post',
						url:form.attr('action'),
						data:$('#addForm').serialize(),
						dataType:'json',
						success : function(response) {
							JUI("#addDiv").dialog("close");
							alert(response.message);
							location.reload();
						},
						error:function(){
							JUI("#addDiv").dialog("close");
							alert("用户添加失败！");
						}
						
					});
					
				},
				'取消':function(){
					JUI(this).dialog("close");
				},
			}
		});
	});
	//查看
	$(".tablelink1").each(function(){//遍历每个
		$(this).click(function(){
			var u=$(this).attr("href");
			
			$.ajax({
				type:'post',
				url:u,
				dataType:'json',
				success :function(response){
					$("#userName").text("用户名："+response.userName);
					$("#createTime").html("创建时间："+"<fmt:formatDate value="+response.createTime+" pattern='yyyy-MM-dd HH:mm:ss'/>");
					$("#description").text("用户描述："+response.description);
				},
				error:function(response){
					alert(response.message);
				}
			});
			JUI("#seeDiv").dialog({
				width:240,
				height:200,
				modal:true,
				buttons:{
					'确定':function(){
						JUI(this).dialog("close");
					},
				}
			});
		});
	});
	
	//修改
	$(".tablelink2").each(function(){//遍历每个
		$(this).click(function(){
			var u=$(this).attr("href");
			var id=u.substring(u.indexOf("=")+1,u.length);
			$.ajax({
				type:'post',
				url:u,
				dataType:'json',
				success :function(response){
					$("#userName1").val(response.userName);
					$("#password1").val(response.password);
					$("#description1").val(response.description);
				},
				error:function(response){
					alert(response.message);
				}
			});
			JUI("#editDiv").dialog({
				width:420,
				height:350,
				modal:true,
				buttons:{
					'确定':function(){
						var u1=$("#editdivForm").attr("action");
						$("#editdivForm").attr("action",u1+"?id="+id);
						var u2=$("#editdivForm").attr("action");
						$.ajax({
							type:'post',
							url:u2,
							dataType:'json',
							success:function(response){
								alert(response.message);
								location.reload();
							},
							error:function(response){
								alert(response.message);
							}
						});
						JUI(this).dialog("close");
					},
					'取消':function(){
						JUI(this).dialog("close");
					}
				}
			});
		});
	});
	
	//删除(单个)
	$(".tablelink3").each(function(){//遍历每个
		$(this).click(function(){
			$(".tip").css("display","block");
			var u=$(this).attr("href");
			$(".sure").click(function(){
				$(".tip").css("display","none");
				$.ajax({
					type:'post',
					url:u,
					dataType:'json',
					success :function(response){
						alert(response.message);
						location.reload();
					},
					error:function(response){
						alert(response.message);
					}
				});
			});
		});
	});
	
	//删除（批量）
	$("#delete").click(function(){
		var ids="";
		$("input[name='checkboxBtn']").each(function(){
			 if(this.checked == true){
			ids+=$(this).val();
			ids+=",";
			} 
		});
		if(ids == null || ids == ""){
			alert("请选择文件!");
		}else{
			$(".tip").css("display","block");
			$(".sure").click(function(){
				$(".tip").css("display","none");
				$.ajax({
					type:'post',
					url : "user/batchDeleteUser.action?ids="+ids,
					dataType:'json',
					success :function(response){
						alert(response.message);
						location.reload();
					},
					error:function(response){
						alert(response.message);
					}
				});
			});
		}
	});
	
	
})