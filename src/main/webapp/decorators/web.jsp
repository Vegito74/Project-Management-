<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><dec:title default="Trang chủ" /></title>

	<!-- Meta tags  -->
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

	<link rel="icon" type="image/png" href="images/favicon.png">
	<!-- CSS Assets -->
	<link rel="stylesheet" href="css/app.css">
	<!-- Javascript Assets -->
	<script src="js/app.js" defer=""></script>
	<!-- Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
	<link href="css2?family=Inter:wght@400;500;600;700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
	<script>
		/**
		 * THIS SCRIPT REQUIRED FOR PREVENT FLICKERING IN SOME BROWSERS
		 */
		localStorage.getItem("_x_darkMode_on") === "true" &&
		document.documentElement.classList.add("dark");
	</script>
</head>
<body x-data="" class="is-header-blur" x-bind="$store.global.documentBody">
<!-- App preloader-->
<div class="app-preloader fixed z-50 grid h-full w-full place-content-center bg-slate-50 dark:bg-navy-900">
	<div class="app-preloader-inner relative inline-block size-48"></div>
</div>
<!-- Page Wrapper -->
<div id="root" class="min-h-100vh flex grow bg-slate-50 dark:bg-navy-900" x-cloak="">
	<!-- Navigation -->
	<%@ include file="/common/web/header.jsp" %>
	<%@ include file="/common/web/sidebar.jsp" %>
	<dec:body/>


</div>
<!--
    This is a place for Alpine.js Teleport feature
    @see https://alpinejs.dev/directives/teleport
  -->
<div id="x-teleport-target"></div>
<script>
	window.addEventListener("DOMContentLoaded", () => Alpine.start());
</script>
</body>
</html>