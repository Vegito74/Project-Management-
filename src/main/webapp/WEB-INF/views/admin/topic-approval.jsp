<%--
  Created by IntelliJ IDEA.
  User: Trọng Nguyễn
  Date: 5/16/2025
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>

<%@include file="/common/taglib.jsp" %>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Duyệt đề tài đồ án</title>
</head>
<body>
<!-- Main Content Wrapper -->
<main class="main-content w-full px-[var(--margin-x)] pb-8">
    <div class="flex flex-col items-center justify-between space-y-4 py-5 sm:flex-row sm:space-y-0 lg:py-6">
        <div class="flex items-center space-x-1">
            <svg xmlns="http://www.w3.org/2000/svg" class="size-6" fill="none" viewbox="0 0 24 24"
                 stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
            </svg>
            <h2 class="text-xl font-medium text-slate-700 line-clamp-1 dark:text-navy-50">
                Thông tin đề tài
            </h2>
        </div>
        <div class="flex justify-center space-x-2">
            <a href="/admin/class${student.classEntity.id}-manage" type="button" class="btn min-w-[7rem] border border-slate-300 font-medium text-slate-700 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-100 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90">
                Trở lại
            </a>
        </div>
    </div>
    <div class="grid grid-cols-12 gap-4 sm:gap-5 lg:gap-6">
        <div class="col-span-12 lg:col-span-8">
            <div class="card">
                <div class="tabs flex flex-col">
                    <div class="is-scrollbar-hidden overflow-x-auto">
                        <div class="border-b-2 border-slate-150 dark:border-navy-500">
                            <div class="tabs-list -mb-0.5 flex">
                                <button class="btn h-14 shrink-0 space-x-2 rounded-none border-b-2 border-primary px-4 font-medium text-primary dark:border-accent dark:text-accent-light sm:px-5">
                                    <i class="fa-solid fa-layer-group text-base"></i>
                                    <span>${topic.status.name()}</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content p-4 sm:p-5">
                        <div class="space-y-5">
                            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                                <label class="block">
                                    <span class="font-medium text-slate-600 dark:text-navy-100">Họ và tên</span>
                                    <input disabled
                                           class="border-success form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                           placeholder="" value="${student.user.fullName}" type="text">
                                </label>
                                <label class="block">
                                    <span class="font-medium text-slate-600 dark:text-navy-100">Mã sinh viên</span>
                                    <input class="form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                           placeholder="" type="text"
                                           value="${student.studentCode}"
                                           disabled>
                                </label>
                            </div>
                            <label class="block">
                                <span class="font-medium text-slate-600 dark:text-navy-100">Tên đề tài đăng ký</span>
                                <input class="form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                       placeholder="" type="text"
                                       value="${topic.title}"
                                       disabled
                                >
                            </label>
                            <label class="block">
                                <span class="font-medium text-slate-600 dark:text-navy-100">Loại đề tài</span>
                                <input class="form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                       placeholder="" type="text"
                                       value="${topic.category}"
                                       disabled
                                >
                            </label>
                            <label class="block">
                                <span class="font-medium text-slate-600 dark:text-navy-100">Các công nghệ sử dụng</span>
                                <input class="form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                       placeholder="" type="text"
                                       value="${topic.technologies}"
                                       disabled>
                            </label>
                            <label class="block">
                                <span class="font-medium text-slate-600 dark:text-navy-100">Mô tả về đề tài</span>
                                <input class="form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                       placeholder="" type="text"
                                       value="${topic.description}"
                                       disabled>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-span-12 lg:col-span-4">
            <div class="card space-y-5 p-4 sm:p-5">
                <div class="is-scrollbar-hidden overflow-x-auto">
                    <div class="border-b-2 border-slate-150 dark:border-navy-500">
                        <div class="tabs-list -mb-0.5 flex justify-center">
                            <button class="btn h-14 shrink-0 space-x-2 rounded-none border-b-2 border-primary px-4 font-medium text-primary dark:border-accent dark:text-accent-light sm:px-5">
                                <i class="fa-solid fa-layer-group text-base"></i>
                                <span>Phiếu duyệt</span>
                            </button>
                        </div>
                    </div>
                </div>
                <form:form id="form-update" method="get">
                <div class="space-y-2">
                    <input type="hidden" value="${topic.id}" name="id"/>
                    <input type="hidden" value="${student.id}" name="studentId"/>
                    <label class="block">
                        <span class="ml-1 font-medium text-slate-600 dark:text-navy-100">Kết quả duyệt:</span>
                        <select name="status" class="mt-1.5 w-full"
                                x-init="$el._x_tom = new Tom($el,{create: false,sortField: {field: 'text',direction: 'asc'}})">

                            <option value="Accepted">Đề tài đạt yêu cầu</option>
                            <option value="Rejected">Từ chối</option>
                        </select>
                    </label>
                    <label class="block">
                        <span class="ml-1 font-medium text-slate-600 dark:text-navy-100">Comment:</span>
                        <textarea rows="4" placeholder=" Enter Text" name="comment"
                                  class="mt-1 form-textarea w-full resize-none rounded-lg bg-slate-150 p-2.5 placeholder:text-slate-400 dark:bg-navy-900 dark:placeholder:text-navy-300"
                        ></textarea>
                    </label>
                    <div class="flex justify-center space-x-2">
                        <button onclick="updateTopicStudent()" type="button"
                                class=" mt-4 btn min-w-[7rem] bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                            Save
                        </button>
                    </div>
</div>
                </form:form>
            </div>
        </div>
    </div>
    <div class="grid grid-cols-12 gap-4 sm:mt-5 sm:gap-5 lg:mt-6 lg:gap-6">
        <div class=" lg:col-span-8 xl:col-span-8">
            <div class="flex items-center justify-between mt-5 ">
                <h2 class="text-base font-medium tracking-wide text-slate-700 line-clamp-1 dark:text-navy-100">
                    Tìm kiếm đề tài
                </h2>
                <div class="flex">
                    <div class="flex items-center" x-data="{isInputActive:false}">
                        <label class="block">
                            <input id="searchInput"
                                   x-effect="isInputActive === true &amp;&amp; $nextTick(() => { $el.focus()});"
                                   :class="isInputActive ? 'w-64 lg:w-120' : 'w-0'"
                                   class="form-input bg-transparent px-1 text-right transition-all duration-100 placeholder:text-slate-500 dark:placeholder:text-navy-200 w-0"
                                   placeholder="Search here..." type="text">
                        </label>
                        <button @click="isInputActive = !isInputActive"
                                class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                            <svg xmlns="http://www.w3.org/2000/svg" class="size-4.5" fill="none" viewBox="0 0 24 24"
                                 stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                            </svg>
                        </button>
                    </div>
                    <div x-data="usePopper({placement:'bottom-end',offset:4})"
                         @click.outside="isShowPopper &amp;&amp; (isShowPopper = false)" class="inline-flex">
                        <button x-ref="popperRef" @click="isShowPopper = !isShowPopper"
                                class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                            <svg xmlns="http://www.w3.org/2000/svg" class="size-4.5" fill="none" viewBox="0 0 24 24"
                                 stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--    Bảng thông tin --%>
    <div class="grid grid-cols-12 gap-4 sm:mt-5 sm:gap-5 lg:mt-6 lg:gap-6">
        <div class="card mt-3 lg:col-span-8 xl:col-span-8">
            <div class="is-scrollbar-hidden min-w-full overflow-x-auto overflow-y-auto max-h-96">
                <table id="myTable" class=" display is-hoverable w-full text-left min-w-full table-auto ">
                    <thead class="sticky top-0  z-10">
                    <tr>
                        <th class="whitespace-nowrap rounded-tl-lg bg-slate-200 px-6 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                            #
                        </th>
                        <th class="whitespace-nowrap rounded-tl-lg bg-slate-200 px-6 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                            Tên đề tài
                        </th>
                        <th style="width: 10%"
                            class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                            Sinh viên thực hiện
                        </th>
                        <th style="width: 10%"
                            class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                            Người duyệt
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${topicsApproved}" varStatus="status">
                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                            <td class="whitespace-nowrap px-4 py-3 font-medium text-slate-600 dark:text-navy-100 sm:px-5">
                                    ${status.index +1}
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                    ${item.title}
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 font-medium text-slate-600 dark:text-navy-100 sm:px-5">
                                    ${item.studentName}
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 font-medium text-slate-600 dark:text-navy-100 sm:px-5">
                                    ${item.modifiedBy}
                            </td>
                        </tr>
                    </c:forEach>
                    <!-- Dòng thông báo khi không tìm thấy -->
                    <tr id="noResultsRow" style="display: none;">
                        <td colspan="4" class="text-center text-slate-500">Không tìm thấy kết quả</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>
<script>
    document.getElementById('searchInput').addEventListener('keyup', function () {
        let filter = this.value.toLowerCase();
        let rows = document.querySelectorAll('#myTable tbody tr');
        let hasVisibleRow = false;

        rows.forEach(function (row) {
            // Bỏ qua dòng "Không tìm thấy kết quả"
            if (row.id === 'noResultsRow') return;

            let text = row.textContent.toLowerCase();
            let match = text.includes(filter);
            row.style.display = match ? '' : 'none';
            if (match) hasVisibleRow = true;
        });

        // Hiện hoặc ẩn dòng "Không tìm thấy kết quả"
        document.getElementById('noResultsRow').style.display = hasVisibleRow ? 'none' : '';
    });

    function updateTopicStudent() {
        var data = {};
        var formData = $('#form-update').serializeArray();
        $.each(formData, function (index, value) {
            data["" + value.name + ""] = value.value;
        });
        //Call api
        $.ajax({
            type: "POST",
            url: "/api/topic/topicStatus",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function () {
                // Hiển thị thông báo thành công với Toastr
                toastr.success("Lưu thành công!", 'Success', {
                    closeButton: true,   // Thêm nút đóng thông báo
                    progressBar: true,   // Hiển thị thanh tiến trình
                    timeOut: 1500,
                });
                // Sau khi thông báo thành công, tải lại trang sau 3 giây
                setTimeout(function () {
                    window.location.href = '/admin/class${student.classEntity.id}-manage'; // Điều hướng đến URL cụ thể
                }, 2000);
            },
            error: function (response) {
                // Chuyển đổi dấu xuống dòng \n thành <br> trong thông báo
                var errorMessage = response.responseJSON.message.replace(/\n/g, '<br>');
                toastr.warning(errorMessage, 'Xảy ra lỗi', {
                    positionClass: 'toast-top-center',
                    timeOut: 10000,
                    closeButton: true, // Hiển thị nút đóng
                    progressBar: true, // Hiển thị thanh tiến trình
                    newestOnTop: true // Các thông báo mới sẽ hiển thị ở trên cùng
                });
                console.log(response.responseJSON);
            }
        });
    }
</script>
</body>
</html>
