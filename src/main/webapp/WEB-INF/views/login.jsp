<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>

<body x-data="" class="is-header-blur" x-bind="$store.global.documentBody">
<!-- App preloader-->
<div class="app-preloader fixed z-50 grid h-full w-full place-content-center bg-slate-50 dark:bg-navy-900">
	<div class="app-preloader-inner relative inline-block size-48"></div>
</div>

<!-- Page Wrapper -->
<div id="root" class="min-h-100vh flex grow bg-slate-50 dark:bg-navy-900" x-cloak="">
	<main class="grid w-full grow grid-cols-1 place-items-center">
		<div class="w-full max-w-[26rem] p-4 sm:px-5">
			<div class="text-center">
				<img class="mx-auto size-24" src="images/fire-keeper-logo.png" alt="logo">
				<div class="mt-4">
					<h2 class="text-2xl font-semibold text-slate-600 dark:text-navy-100">
						Welcome Back
					</h2>
					<p class="text-slate-400 dark:text-navy-300">
						Please sign in to continue
					</p>
				</div>
			</div>

			<form action="j_spring_security_check" id="formLogin" method="post">

			<div class="card mt-5 rounded-lg p-5 lg:p-7">
				<c:if test="${param.incorrectAccount != null}">
					<div  class="alert flex rounded-lg border border-error px-4 py-4 text-error sm:px-5 text-center">
							Username hoặc password không chính xác
					</div>
				</c:if>
				<c:if test="${param.accessDenied != null}">
					<div class="alert flex rounded-lg border border-warning px-4 py-4 text-warning sm:px-5" style="text-align: center">
							You Not authorize
					</div>
				</c:if>
				<c:if test="${param.sessionTimeout != null}">
					<div class="alert alert-danger text-center" style="text-align: center; ">
							Session Timeout
					</div>
				</c:if>
				<label class="block mt-5" >
					<span>Username:</span>
					<span class="relative mt-1.5 flex">
                <input  id="userName" name="j_username" class="form-input peer w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 pl-9 placeholder:text-slate-400/70 hover:z-10 hover:border-slate-400 focus:z-10 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent" placeholder="Enter Username" type="text">
                <span class="pointer-events-none absolute flex h-full w-10 items-center justify-center text-slate-400 peer-focus:text-primary dark:text-navy-300 dark:peer-focus:text-accent">
                  <svg xmlns="http://www.w3.org/2000/svg" class="size-5 transition-colors duration-200" fill="none" viewbox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                  </svg>
                </span>
              </span>
				</label>
				<label class="mt-4 block">
					<span>Password:</span>
					<span class="relative mt-1.5 flex">
                <input id="password" name="j_password" class="form-input peer w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 pl-9 placeholder:text-slate-400/70 hover:z-10 hover:border-slate-400 focus:z-10 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent" placeholder="Enter Password" type="password">
                <span class="pointer-events-none absolute flex h-full w-10 items-center justify-center text-slate-400 peer-focus:text-primary dark:text-navy-300 dark:peer-focus:text-accent">
                  <svg xmlns="http://www.w3.org/2000/svg" class="size-5 transition-colors duration-200" fill="none" viewbox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                  </svg>
                </span>
              </span>
				</label>
				<div class="mt-4 flex items-center justify-between space-x-2">
					<label class="inline-flex items-center space-x-2">
						<input class="form-checkbox is-basic size-5 rounded border-slate-400/70 checked:border-primary checked:bg-primary hover:border-primary focus:border-primary dark:border-navy-400 dark:checked:border-accent dark:checked:bg-accent dark:hover:border-accent dark:focus:border-accent" type="checkbox">
						<span class="line-clamp-1">Remember me</span>
					</label>
					<a href="#" class="text-xs text-slate-400 transition-colors line-clamp-1 hover:text-slate-800 focus:text-slate-800 dark:text-navy-300 dark:hover:text-navy-100 dark:focus:text-navy-100">Forgot Password?</a>
				</div>
				<button type="submit" class="btn mt-5 w-full bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
					Sign In
				</button>
				<div class="mt-4 text-center text-xs+">
					<p class="line-clamp-1">
						<span>Dont have Account?</span>

						<a class="text-primary transition-colors hover:text-primary-focus dark:text-accent-light dark:hover:text-accent" href="pages-singup-1.html">Create account</a>
					</p>
				</div>
				<div class="my-7 flex items-center space-x-3">
					<div class="h-px flex-1 bg-slate-200 dark:bg-navy-500"></div>
					<p>OR</p>
					<div class="h-px flex-1 bg-slate-200 dark:bg-navy-500"></div>
				</div>
				<div class="flex space-x-4">
					<button class="btn w-full space-x-3 border border-slate-300 font-medium text-slate-800 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-50 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90">
						<img class="size-5.5" src="images/logos/google.svg" alt="logo">
						<span>Google</span>
					</button>
					<button class="btn w-full space-x-3 border border-slate-300 font-medium text-slate-800 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-50 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90">
						<img class="size-5.5" src="images/logos/github.svg" alt="logo">
						<span>Github</span>
					</button>
				</div>
			</div>
			</form>
			<div class="mt-8 flex justify-center text-xs text-slate-400 dark:text-navy-300">
				<a href="#">Privacy Notice</a>
				<div class="mx-3 my-1 w-px bg-slate-200 dark:bg-navy-500"></div>
				<a href="#">Term of service</a>
			</div>
		</div>
	</main>
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