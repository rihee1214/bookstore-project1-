/**
 * 
 */
 let updatenum=-1;
 const subnum=$("#subnum").val();
 $(document).ready(function(){
	$('#content').summernote({
			lang:"ko-KR",
			height: 200,
			mingheight: 200,
			maxheight: 200,
			disableResizeEditor: true,
			placeholder: '글 작성',
	});
	$('.note-statusbar').hide();
	$('.note-toolbar').hide();
	getList();
});


$("#comment").on("click", ".commentdelete",function(){
	const resnum = $(this).siblings("input").val();
	$.ajax({
		type: "get",
		url: "./response/responseDelete",
		data:{resnum:resnum, subnum:subnum},
		success:function(result){
			result=result.trim();
			if(result>0){
				getList();
			}else{
				alert('이미 삭제된 글이거나, 삭제할 수 없습니다.');
				getList();
			}
		}
	});
});

$("#comment").on("click", ".commentupdate",function(){
	if(updatenum!=-1){
		const preupdate = $("input[value='"+updatenum+"']").parents("td[colspan='3']");
		const reservetext = preupdate.find("div.commentcontent").html();
		preupdate.empty();
		preupdate.append("<div class=\"commentcontent\">"+reservetext+"</div>");
	}
	const resnum = $(this).siblings("input").val();
	const content = $(this).parents("tr").siblings("tr").find("td");
	const comment = content.html();
	content.append("<br><input id=\"forupdate\" type=\"hidden\" readonly=\"readonly\" value=\""+resnum+"\">");
	content.append("<textarea id=\"rewrite\"></textarea>");
	$("#rewrite").summernote();
	$('.note-statusbar').hide();
	$('.note-toolbar').hide();
	$("#rewrite").summernote('code',comment);
	$('#rewrite').val(comment);
	content.append("<br><button id=\"transrewrite\" class=\"btn btn-danger\">작성</button>");
	updatenum=resnum;
});

$("#comment").on("click", "#transrewrite",function(){
	const resnum = parseInt($("#forupdate").val());
	const content = $("#rewrite").val();
	$.ajax({
		method: "post",
		url: "./response/responseUpdate",
		data:{
			resnum:resnum, 
			content:content
			},
		success:function(result){
			result=result.trim();
			if(result>0){
				getList();
			}else{
				alert("갱신실패");
			}
		}
	});
});


function getList(){
	$.get("./response/responseList?subnum="+subnum, function(data){
		$("#comment").html(data.trim());
	});
};

$("#write").click(function(){
	let id = $("#id").val();
	let content = $("#content").val();
	
	$.post("./response/responseInsert", 
	{
		subnum:subnum,
		id:id,
		content:content
	}, 
	function(data){
		data = data.trim();
		if(data==1){
			$("#content").val('');
			$('#content').summernote('reset');
			getList();
		}else {
			alert('등록 실패');
		}
	});
});
