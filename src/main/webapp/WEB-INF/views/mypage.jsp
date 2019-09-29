<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-ua-compatible" content="IE=edge">
<title>dokky-�ҽ��ڵ��������Ʈ</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-theme.css">
<link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../resources/css/WebCss.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function deleteCodeOnclick(cId){
	if (confirm("���� �����Ͻðڽ��ϱ�??") == true){    //Ȯ��
		var stdCid = String(cId);
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/code/deleteCode?cId="+stdCid,
			success : function() {
				alert("�����Ǿ����ϴ�.");
				window.location.reload();
			}
		});
		
	}else{   //���
	    return;
	}
}

function deleteReplyOnclick(rId){
	if (confirm("���� �����Ͻðڽ��ϱ�??") == true){    //Ȯ��
		var stdRid = String(rId);
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/reply/deleteReply?rId="+stdRid,
			success : function() {
				alert("�����Ǿ����ϴ�.");
				window.location.reload();
			}
		});
		
	}else{   //���
	    return;
	}
}
	
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" id="middle-side">

			<header class="bg-info"> 
			<jsp:include page="header.jsp"></jsp:include>
			</header>
			<!-- ---------------------header---------------------------- -->


			<div class="page-header">
				<h3>����������</h3>
			</div>
			<h4>
				<strong>���� ����</strong>
			</h4>
			<h5>���̵� : ${mdto.mId}</h5>
			<h5>�̸��� : ${mdto.mEmail}</h5>
			<h5>�г��� : ${mdto.mName}</h5>
			<h5>������ : ${mdto.mDate}</h5>
			<h5>�������� : ${mdto.mCoin}</h5>
			</br>


			<h4>
				<strong>���� ���ε��� �ڵ�</strong>
			</h4>

			<!-- ���� �ڵ� ����Ʈ -->
			<table class="table">
				<thead>
					<tr>
						<th>�ڵ�id</th>
						<th>����</th>
						<th>�ۼ��Ͻ�</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${cdtos}" var="cdto">
					<tr>
						<td>${cdto.cId }</td>
						<td id="titleHover" style="cursor: pointer; width:60%"  onclick="location.href='../code/view_code?cId=${cdto.cId}'">${cdto.cTitle}</td>
						<td>${cdto.cDate}</td>
						<td><p id="deleteBtn" style="cursor: pointer" onclick="deleteCodeOnclick(${cdto.cId})">����</p></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

			<h4>
				<strong>���� �ۼ��� ���</strong>
			</h4>

			<!-- ���� ��� ����Ʈ -->
			
			<table class="table" >
				<thead>
					<tr>
						<th>���id</th>
						<th>�ڵ�id</th>
						<th>��۳���</th>
						<th>�ۼ��Ͻ�</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${rdtos}" var="rdto">
					<tr >
						<td>${rdto.rId }</td>
						<td>${rdto.cId }</td>
						<td id="titleHover" style="cursor: pointer;width:55%" onclick="location.href='../code/view_code?cId=${rdto.cId}'">${rdto.rContent }</td>
						<td>${rdto.rDate }</td>
						<td><p id="deleteBtn" style="cursor:pointer" onclick="deleteReplyOnclick(${rdto.rId })">����</p></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<h4>
				<strong>���� ������ �ڵ�</strong>
			</h4>
			<table class="table" >
				<thead>
					<tr>
						<th>���Ź�ȣ</th>
						<th>�ڵ��ȣ</th>
						<th>�ڵ�����</th>
						<th>�����Ͻ�</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${pdtos}" var="pdto">
					<tr >
						<td>${pdto.pId }</td>
						<td>${pdto.cId }</td>
						<td id="titleHover" style="cursor: pointer;width:55%" onclick="location.href='../code/view_code?cId=${pdto.cId}'">${pdto.cTitle }</td>
						<td>${pdto.pDate }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

			</br> </br>

			<footer>
			<div style="text-align: center; background: #7f7f7f; color: white">
				</br>
				<h5>������ : �ּ���</h5>
				<h5>Email : tjddud117@naver.com</h5>
				</br>
			</div>
			</footer>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>