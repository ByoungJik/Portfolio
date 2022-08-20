<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 


	<script>
	
	$("#options input[type=checkbox]").change(function() {
		let fvalue = "";
		<c:forEach items="${list}" var="dto">
			fvalue = $(this).parents("label").html().split(">");
			if ($(this).is(":checked") == true || fvalue[1] != '${dto.fvalue}' ) {
				$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
			} else {
				$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
			}
		
		</c:forEach>
	});
	
	$(".all").click(function() {
		$("#options input[type=checkbox]").change(function() {
			let fvalue = "";
			<c:forEach items="${list}" var="dto">
				fvalue = $(this).parents("label").html().split(">");
				if ($(this).is(":checked") == false && fvalue[1] == '${dto.fvalue}' ) {
					$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
				} else {
					$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
				}
			
			</c:forEach>
		});
		$("input[type=checkbox]").each(function() {
			this.checked = true;
			$(".homelist").removeClass("hide").addClass("show");
		})
	}); 
	
	
	
	
	$(".light").click(function() {
		<c:forEach items="${list}" var="dto">
		if ('${dto.ctvalue}' == '경차') {
			$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
		} else {
			$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
		}
		</c:forEach>
		$("#options input[type=checkbox]").change(function() {
			let fvalue = "";
			<c:forEach items="${list}" var="dto">
				fvalue = $(this).parents("label").html().split(">");
				if ('${dto.ctvalue}' != '경차' || $(this).is(":checked") == false && fvalue[1] == '${dto.fvalue}') {
					$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
				} else if ('${dto.ctvalue}' == '경차'){
					$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
				}
			</c:forEach>
		});
	});

	
	
	$(".small").click(function() {
		<c:forEach items="${list}" var="dto">
		if ('${dto.ctvalue}' == '소형') {
			$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
		} else {
			$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
		}
		</c:forEach>
		$("#options input[type=checkbox]").change(function() {
			let fvalue = "";
			<c:forEach items="${list}" var="dto">
				fvalue = $(this).parents("label").html().split(">");
				if ('${dto.ctvalue}' != '소형' || $(this).is(":checked") == false && fvalue[1] == '${dto.fvalue}') {
					$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
				} else if ('${dto.ctvalue}' == '소형'){
					$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
				}
			</c:forEach>
		});
	});
	
	$(".subcompact").click(function() {
		<c:forEach items="${list}" var="dto">
		if ('${dto.ctvalue}' == '준중형') {
			$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
		} else {
			$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
		}
		</c:forEach>
		$("#options input[type=checkbox]").change(function() {
			let fvalue = "";
			<c:forEach items="${list}" var="dto">
				fvalue = $(this).parents("label").html().split(">");
				if ('${dto.ctvalue}' != '준중형' || $(this).is(":checked") == false && fvalue[1] == '${dto.fvalue}') {
					$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
				} else if ('${dto.ctvalue}' == '준중형'){
					$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
				}
			</c:forEach>
		});
	});
	
	$(".mid").click(function() {
		<c:forEach items="${list}" var="dto">
		if ('${dto.ctvalue}' == '중형') {
			$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
		} else {
			$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
		}
		</c:forEach>
		$("#options input[type=checkbox]").change(function() {
			let fvalue = "";
			<c:forEach items="${list}" var="dto">
				fvalue = $(this).parents("label").html().split(">");
				if ('${dto.ctvalue}' != '중형' || $(this).is(":checked") == false && fvalue[1] == '${dto.fvalue}') {
					$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
				} else if ('${dto.ctvalue}' == '중형'){
					$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
				}
			</c:forEach>
		});
	});
	
	$(".top").click(function() {
		<c:forEach items="${list}" var="dto">
		if ('${dto.ctvalue}' == '고급') {
			$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
		} else {
			$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
		}
		</c:forEach>
		$("#options input[type=checkbox]").change(function() {
			let fvalue = "";
			<c:forEach items="${list}" var="dto">
				fvalue = $(this).parents("label").html().split(">");
				if ('${dto.ctvalue}' != '고급' || $(this).is(":checked") == false && fvalue[1] == '${dto.fvalue}') {
					$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
				} else if ('${dto.ctvalue}' == '고급'){
					$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
				}
			</c:forEach>
		});
	});
	
	$(".suv").click(function() {
		<c:forEach items="${list}" var="dto">
		if ('${dto.ctvalue}' == 'SUV') {
			$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
		} else {
			$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
		}
		</c:forEach>
		$("#options input[type=checkbox]").change(function() {
			let fvalue = "";
			<c:forEach items="${list}" var="dto">
				fvalue = $(this).parents("label").html().split(">");
				if ('${dto.ctvalue}' != 'SUV' || $(this).is(":checked") == false && fvalue[1] == '${dto.fvalue}') {
					$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
				} else if ('${dto.ctvalue}' == 'SUV'){
					$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
				}
			</c:forEach>
		});
	});
	
	$(".van").click(function() {
		<c:forEach items="${list}" var="dto">
		if ('${dto.ctvalue}' == '승합') {
			$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
		} else {
			$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
		}
		</c:forEach>
		$("#options input[type=checkbox]").change(function() {
			let fvalue = "";
			<c:forEach items="${list}" var="dto">
				fvalue = $(this).parents("label").html().split(">");
				if ('${dto.ctvalue}' != '승합' || $(this).is(":checked") == false && fvalue[1] == '${dto.fvalue}') {
					$(".homelist.${dto.seq}").removeClass("show").addClass("hide");
				} else if ('${dto.ctvalue}' == '승합'){
					$(".homelist.${dto.seq}").removeClass("hide").addClass("show");
				}
			</c:forEach>
		});
	});
	
	
	
	
	
	
	
	</script>


</body>
</html>






























