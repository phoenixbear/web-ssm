$(function(){


	//新增商品信息
	$("#createItem").each(function(){
		$(this).click(function(){
			var url = $(this).attr("name");
			$.ajax({
				type:'post',
				url:url,
				dataType:'json',
				success:function(response){
					$("#userName1").val(response.userName);
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
						var Name1 = $("#Name1").val();
						var price1 = $("#price1").val();
						var pic1 = $("#pic1").val();
						var detail1 = $("#detail1").val();
						$.ajax({
							type:'post',
							url:u1,
							data:{name:Name1,price:price1,pic:pic1,detail:detail1},
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
	
	
	//修改商品信息
	$(".tablelink1").each(function(){
		$(this).click(function(){
			var u=$(this).attr("href");
			var id=u.substring(u.indexOf("=")+1,u.length);
			$.ajax({
				type:'post',
				url:u,
				dataType:'json',
				success:function(response){
					$("#Name1").val(response.name);
					$("#price1").val(response.price);
					$("#pic1").val(response.pic);
					$("#userName1").val(response.userName);
					$("#detail1").val(response.detail);
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
						var Name1 = $("#Name1").val();
						var price1 = $("#price1").val();
						var pic1 = $("#pic1").val();
						var detail1 = $("#detail1").val();
						$.ajax({
							type:'post',
							url:u1,
							data:{name:Name1,price:price1,pic:pic1,detail:detail1,id:id},
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
	
	
	//获取选中的checkbox值
	$("#deleteItemsBatch").click(function(){//输出选中的值 
		if(confirm("确认删除？")){
			var str = ""; 
			$("[name='checkboxBtn'][checked]").each(function(){ 
				str += $(this).val()+",";
			});
			alert("str=" + str);
			if(str != "") {
				//删除
				var delName = $("#deleteItemsBatch").attr("name");
				$.ajax({
					type:'post',
					url:delName,
					data:{ids:str},
					dataType:'json',
					success:function(response){
						alert(response.message);
						location.reload();
					},
					error:function(response){
						alert(response.message);
					}
				});
			} else {
				alert("请先选择商品！");
			}
		}
	}); 
	

	//单条删除
	$(".deleteItemsById").click(function(){//输出选中的值 
		if(confirm("确认删除？")){
			var url =  $(this).attr("href");
			$.ajax({
				type:'post',
				url:url,
				dataType:'json',
				success:function(response){
					alert(response.message);
					location.reload();
				},
				error:function(response){
					alert(response.message);
				}
			});
		}
	});

    //获取选中的checkbox值
    $("#deleteItemsBatch2").click(function(){//输出选中的值
        if(confirm("确认删除？")){

        }
    });

});