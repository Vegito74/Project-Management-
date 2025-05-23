<%--
  Created by IntelliJ IDEA.
  User: Trọng Nguyễn
  Date: 3/12/2025
  Time: 2:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Trang chủ</title>
</head>
<body>
<!-- Main Content Wrapper -->
<main class="main-content w-full place-items-center px-[var(--margin-x)] pb-12">
    <div class="py-5 text-center lg:py-6">
        <p class="text-sm uppercase"> Welcome! Bạn đã đăng nhập với role STUDENT</p>
        <h3 class="mt-1 text-xl font-semibold text-slate-600 dark:text-navy-100">
            Hãy hoàn tất các công việc dưới đây!
        </h3>
    </div>
    <div class="grid max-w-4xl grid-cols-1 gap-4 sm:grid-cols-3 sm:gap-5 lg:gap-6">
        <div class="card">
            <div class="flex justify-center p-5">
                <img class="w-9/12" src="images/illustrations/creativedesign.svg" alt="image">
            </div>
            <div class="px-4 pb-8 text-center sm:px-5">
                <h4 class="text-lg font-semibold text-slate-700 dark:text-navy-100">
                    Chọn giảng viên hướng dẫn
                </h4>
                <p class="pt-3 m">
                    Sinh viên đăng ký lớp học để thực hiện các nội dung đồ án. Lưu ý: Giảng viên cũng có thể từ chối đơn đăng ký
                </p>
                <a href="/student/lecturer-list"
                        class="btn mt-8 bg-primary font-medium text-white shadow-lg shadow-primary/50 hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:shadow-accent/50 dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                    Bắt đầu
                </a>
            </div>
        </div>
        <div class="card">
            <div class="flex justify-center p-5">
                <img class="w-9/12" src="images/illustrations/responsive.svg" alt="image">
            </div>
            <div class="px-4 pb-8 text-center sm:px-5">
                <h4 class="text-lg font-semibold text-slate-700 dark:text-navy-100">
                    Đăng ký đề tài
                </h4>
                <p class="pt-3">
                    Hãy đăng ký đề tài cho đồ án! có thể đăng ký đề tài mới hoặc chọn đề tài có sẵn được đề xuất
                </p>
                <a href="/student/topic-registration"
                        class="btn mt-8 bg-primary font-medium text-white shadow-lg shadow-primary/50 hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:shadow-accent/50 dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                    Bắt đầu
                </a>
            </div>
        </div>
        <div class="card">
            <div class="flex justify-center p-5">
                <img class="w-9/12" src="images/illustrations/performance.svg" alt="image">
            </div>
            <div class="px-4 pb-8 text-center sm:px-5">
                <h4 class="text-lg font-semibold text-slate-700 dark:text-navy-100">
                    Hoàn tất hồ sơ tài khoản
                </h4>
                <p class="pt-3">
                    Hãy hoàn tất đầy đủ thông tin tài khoản để thuận lợi cho việc theo dõi và liên lạc.
                </p>
                <button class="btn mt-8 bg-primary font-medium text-white shadow-lg shadow-primary/50 hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:shadow-accent/50 dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                    Bắt đầu
                </button>
            </div>
        </div>
    </div>
</main>
</body>
</html>
