<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session == null || session.getAttribute("user") == null) {
	response.sendRedirect("index.jsp");
	return;
}
%>
<jsp:useBean id="user" type="com.wanhive.iot.bean.User" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><jsp:include page="include/title.jsp">
		<jsp:param name="pageTitle" value="Domains" />
	</jsp:include></title>
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/navigation.css">
<link rel="stylesheet" type="text/css" href="css/domainpage.css">
<link rel="stylesheet" type="text/css"
	href="widget/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" type="text/css"
	href="widget/fontawesome/css/all.min.css">
<script type="text/javascript" src="widget/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="widget/jquery.timeago.js"></script>
<script type="text/javascript" src="widget/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	var authorizationToken = '<jsp:getProperty name="user" property="token" />';
</script>
<script type="text/javascript" src="js/navbar.js"></script>
<script type="text/javascript" src="js/domain.js"></script>
</head>
<body>
	<div id="wait-veil">
		<i class="fa fa-spinner fa-spin"
			style="font-size: 64px; color: #330000; margin-top: 100px"></i>
		<h2>Loading....</h2>
	</div>
	<div id="add-form" title="Create new domain">
		<p class="validateTips">All form fields are required.</p>

		<form>
			<fieldset>
				<label for="name">Name</label> <input type="text" name="name"
					id="newName" placeholder="Domain name"
					class="text ui-widget-content ui-corner-all" required="required">
				<label for="description">Description</label>
				<textarea name="description" id="newDescription"
					placeholder="Description for domain name"
					class="text ui-widget-content ui-corner-all" required="required"></textarea>
				<input type="hidden" name="domainUid" id="domainUid">
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>

	<div id="dialog-confirm" title="Delete the selected domain">
		<p>
			<span class="ui-icon ui-icon-alert"
				style="float: left; margin: 12px 12px 20px 0;"></span> Selected
			domain(s) and all the associated records will be permanently deleted
			and cannot be recovered. Are you sure?
		</p>
	</div>

	<!-- TOP NAVIGATION -->
	<div class="topnav" id="topnav">
		<jsp:include page="include/navbar.jsp"></jsp:include>
	</div>
	<!-- HEADER -->
	<header>
		<h1>Domains</h1>
	</header>
	<!-- SECTION -->
	<section style="overflow: auto">
		<nav class="left">
			<jsp:include page="include/domain-leftnav.jsp"></jsp:include>
		</nav>

		<article class="main">
			<div style="width: 100%">
				<button class="btn-refresh" title="Refresh the list"
					id="reload-data">
					<i class="fa fa-redo"></i>&nbsp;Refresh
				</button>
				<button class="btn-addnew" title="Create new domain"
					id="create-domain">
					<i class="fa fa-plus-circle"></i>&nbsp;Create
				</button>
				<label for="limit">&nbsp;|&nbsp;Limit&nbsp;<select
					name="limit" id="limit">
						<option value="10">10</option>
						<option value="50">50</option>
						<option value="100">100</option>
						<option value="200">200</option>
				</select></label> <label for="searchKeyword">&nbsp;|&nbsp;<input type="text"
					name="searchKeyword" id="searchKeyword" placeholder="Keyword"
					size="12">&nbsp;
					<button class="btn-search" title="Search" id="search-domain">
						<i class="fa fa-search"></i>&nbsp;Search
					</button></label>
			</div>
			<table id="dataTable" class="ui-widget ui-widget-content auto-index">
				<thead>
					<tr class="ui-widget-header">
						<th width="5%">SN</th>
						<th width="18%" id="uidCol" style="cursor: pointer;">Identifier&nbsp;<i
							class="order-caret fa fa-caret-down"></i></th>
						<th width="20%" id="nameCol" style="cursor: pointer;">Name&nbsp;<i
							class="order-caret fa"></i></th>
						<th width="35%">Description</th>
						<th width="12%" id="createdOnCol" style="cursor: pointer;">Created&nbsp;<i
							class="order-caret fa"></i></th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4"><span id="offsetFrom"></span>&nbsp;to&nbsp;<span
							id="offsetTo"></span>&nbsp;of&nbsp;<span id="totalRecords"></span>
						</td>
						<td colspan="2"><span style="white-space: nowrap;"><a
								id="previousPage" style="font-weight: bold; cursor: pointer;">Previous</a>
								&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a id="nextPage"
								style="font-weight: bold; cursor: pointer;">Next</a></span>
							&nbsp;&nbsp;&nbsp; <input type="number" id="pageCounter"
							value="1"></td>
					</tr>
				</tfoot>
			</table>
			<p>&nbsp;</p>
		</article>

		<aside class="right">
			<h2><jsp:getProperty name="user" property="alias" /></h2>
			<p>
				<em><jsp:getProperty name="user" property="email" /></em>
			</p>
			<p>
				<strong>Domains limit:</strong> no limit
			</p>
		</aside>
	</section>
	<p>&nbsp;</p>
	<!-- FOOTER -->
	<footer class="footer"><jsp:include page="include/footer.jsp"></jsp:include></footer>
</body>
</html>