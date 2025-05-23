<%--
  Created by IntelliJ IDEA.
  User: Trọng Nguyễn
  Date: 5/20/2025
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Nhiệm vụ</title>
</head>
<body>
<!-- Main Content Wrapper -->
<main class="main-content w-full px-[var(--margin-x)] pb-8">
    <div class="flex items-center space-x-4 py-5 lg:py-6">
        <h2 class="text-xl font-medium text-slate-800 dark:text-navy-50 lg:text-2xl">
            Assignment Single Page
        </h2>
        <div class="hidden h-full py-1 sm:flex">
            <div class="h-full w-px bg-slate-300 dark:bg-navy-600"></div>
        </div>
        <ul class="hidden flex-wrap items-center space-x-2 sm:flex">
            <li class="flex items-center space-x-2">
                <a class="text-primary transition-colors hover:text-primary-focus dark:text-accent-light dark:hover:text-accent"
                   href="#">Assignment List</a>
                <svg x-ignore="" xmlns="http://www.w3.org/2000/svg" class="size-4" fill="none" viewbox="0 0 24 24"
                     stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                </svg>
            </li>
            <li>Assignment Single</li>
        </ul>
    </div>

    <div class="grid grid-cols-12 gap-4 sm:gap-5 lg:gap-6">
        <div class="col-span-12 grid lg:col-span-4 lg:place-items-center">
            <div>
                <ol class="steps is-vertical line-space [--size:2.75rem] [--line:.5rem]">
                    <li class="step space-x-4 pb-12 before:bg-slate-200 dark:before:bg-navy-500">
                        <div class="step-header mask is-hexagon bg-primary text-white dark:bg-accent">
                            <i class="fa-solid fa-layer-group text-base"></i>
                        </div>
                        <div class="text-left">
                            <p class="text-xs text-slate-400 dark:text-navy-300">
                                Step 1
                            </p>
                            <h3 class="text-base font-medium text-primary dark:text-accent-light">
                                Sinh viên nộp bài tập
                            </h3>
                        </div>
                    </li>
                    <li class="step space-x-4 pb-12 before:bg-slate-200 dark:before:bg-navy-500">
                        <div class="step-header mask is-hexagon bg-slate-200 text-slate-500 dark:bg-navy-500 dark:text-navy-100">
                            <i class="fa-solid fa-list text-base"></i>
                        </div>
                        <div class="text-left">
                            <p class="text-xs text-slate-400 dark:text-navy-300">
                                Step 2
                            </p>
                            <h3 class="text-base font-medium">Hệ thống lưu bài trên Cloud</h3>
                        </div>
                    </li>
                    <li class="step space-x-4 pb-12 before:bg-slate-200 dark:before:bg-navy-500">
                        <div class="step-header mask is-hexagon bg-slate-200 text-slate-500 dark:bg-navy-500 dark:text-navy-100">
                            <i class="fa-solid fa-truck-fast text-base"></i>
                        </div>
                        <div class="text-left">
                            <p class="text-xs text-slate-400 dark:text-navy-300">
                                Step 3
                            </p>
                            <h3 class="text-base font-medium">Giảng viên xem bài nộp</h3>
                        </div>
                    </li>
                    <li class="step space-x-4 before:bg-slate-200 dark:before:bg-navy-500">
                        <div class="step-header mask is-hexagon bg-slate-200 text-slate-500 dark:bg-navy-500 dark:text-navy-100">
                            <i class="fa-solid fa-check text-base"></i>
                        </div>
                        <div class="text-left">
                            <p class="text-xs text-slate-400 dark:text-navy-300">
                                Step 4
                            </p>
                            <h3 class="text-base font-medium">Giảng viên chấm điểm và nhận xét</h3>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
        <div class="col-span-12 lg:col-span-8">
            <div class="card">
                <div class="card p-3">
                    <div class="flex items-center space-x-3">
                        <img class="size-10 rounded-lg object-cover object-center" src="images/illustrations/lms-ui.svg"
                             alt="image">
                        <div class="flex-1">
                            <div class="flex justify-between">
                                <p class="font-medium text-slate-700 dark:text-navy-100">
                                    ${AssignmentEntity.title}
                                </p>
                            </div>
                            <div class="mt-0.5 flex text-xs text-slate-400 dark:text-navy-300">
                                <p>Thời gian tạo: <fmt:formatDate value="${AssignmentEntity.createdDate}"
                                                                  pattern="yyyy-MM-dd HH-mm"></fmt:formatDate></p>
                                <div class="mx-2 my-1 hidden w-px bg-slate-200 dark:bg-navy-500 sm:flex"></div>

                                <p class="hidden sm:flex">Deadline: <fmt:formatDate value="${AssignmentEntity.dueDate}"
                                                                                    pattern="yyyy-MM-dd HH-mm"></fmt:formatDate></p>
                            </div>
                        </div>
                    </div>
                    <p class="-mt-3 text-right text-xs font-medium text-primary dark:text-accent-light">
                        ${AssignmentEntity.percent}
                    </p>
                    <div class="progress mt-2 h-1.5 bg-slate-150 dark:bg-navy-500">
                        <div class="is-active relative w-${AssignmentEntity.submittedCount} overflow-hidden rounded-full bg-primary dark:bg-accent"></div>
                    </div>
                </div>
                <div class="flex flex-col items-center space-y-4 border-b border-slate-200 p-4 dark:border-navy-500 sm:flex-row sm:justify-between sm:space-y-0 sm:px-5">
                    <%-- <h2 class="text-lg font-medium tracking-wide text-slate-700 dark:text-navy-100">
                         Account Setting
                     </h2>
                     <div class="flex justify-center space-x-2">
                         <button class="btn min-w-[7rem] rounded-full border border-slate-300 font-medium text-slate-700 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-100 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90">
                             Cancel
                         </button>
                         <button class="btn min-w-[7rem] rounded-full bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                             Save
                         </button>
                     </div>--%>
                </div>
                <div class="p-4 sm:p-5">
                    <div class="flex flex-col">
                        <span class="text-base font-medium text-slate-600 dark:text-navy-100">Danh sách sinh viên</span>
                    </div>
                    <div class="card mt-3">
                        <div class="is-scrollbar-hidden min-w-full overflow-x-auto rounded-lg border border-slate-200 dark:border-navy-500">
                            <table class="is-hoverable w-full text-left">
                                <thead>
                                <tr>
                                    <th class="whitespace-nowrap rounded-tl-lg bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5"
                                        style="width: 120px;">
                                        &nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Full Name
                                    </th>
                                    <th class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                        Mã SV
                                    </th>
                                    <th class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                        Status
                                    </th>
                                    <th class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                        File
                                    </th>
                                    <th class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                        Score
                                    </th>
                                    <th class="whitespace-nowrap rounded-tr-lg bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                        Comment
                                    </th>
                                    <th class="whitespace-nowrap rounded-tr-lg bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                        Action
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${StudentList}">
                                    <tr class="text-xs+ border border-transparent border-b-slate-200 dark:border-b-navy-500">
                                        <td class=" whitespace-nowrap px-4 py-3 sm:px-5">
                                            <div class="flex items-center space-x-4">
                                                <div class="avatar">
                                                    <img class="rounded-full" src="images/fire-keeper.jpg" alt="avatar">
                                                </div>
                                                <span class="">${item.user.fullName}</span>
                                            </div>
                                        </td>

                                        <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                            <a href="#" class="hover:underline focus:underline">
                                                    ${item.studentCode}
                                            </a>
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                            <c:choose>
                                                <c:when test="${item.gradeEntity == null}">
                                                    <button class="badge bg-error/10 text-error dark:bg-error/15">
                                                        Chưa chấm điểm
                                                    </button>
                                                </c:when>
                                                <c:when test="${item.gradeEntity != null}">
                                                    <button class="badge bg-info/10 text-info dark:bg-info/15">
                                                        Đã chấm điểm
                                                    </button>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-3 sm:px-5">


                                            <c:choose>
                                                <c:when test="${item.submissionEntity == null}">
                                                    <button class="badge bg-error/10 text-error dark:bg-error/15">
                                                        Chưa nộp
                                                    </button>
                                                </c:when>
                                                <c:when test="${item.submissionEntity != null}">
                                                    <a href="${item.submissionEntity.fileUrl}" target="_blank">
                                                        <div class="badge space-x-2  bg-info text-white">
                                                            <svg xmlns="http://www.w3.org/2000/svg" class="size-4"
                                                                 viewBox="0 0 20 20" fill="currentColor">
                                                                <path d="M5.5 16a3.5 3.5 0 01-.369-6.98 4 4 0 117.753-1.977A4.5 4.5 0 1113.5 16h-8z"
                                                                ></path>
                                                            </svg>
                                                            <span>${item.submissionEntity.fileName}</span>
                                                        </div>
                                                    </a>
                                                </c:when>
                                            </c:choose>

                                        </td>
                                        <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                ${item.gradeEntity.score}
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                ${item.gradeEntity.comments}
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                <%--Modal--%>
                                            <div x-data="{showModal:false}">
                                                <button
                                                        @click="showModal = true"
                                                        class="btn bg-slate-150 font-medium text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90"
                                                >
                                                    Mark
                                                </button>

                                                <template x-teleport="#x-teleport-target">

                                                    <div
                                                            class="fixed inset-0 z-[100] flex flex-col items-center justify-center overflow-hidden px-4 py-6 sm:px-5"
                                                            x-show="showModal"
                                                            role="dialog"
                                                            @keydown.window.escape="showModal = false"
                                                    >
                                                        <div
                                                                class="absolute inset-0 bg-slate-900/60 transition-opacity duration-300"
                                                                @click="showModal = false"
                                                                x-show="showModal"
                                                                x-transition:enter="ease-out"
                                                                x-transition:enter-start="opacity-0"
                                                                x-transition:enter-end="opacity-100"
                                                                x-transition:leave="ease-in"
                                                                x-transition:leave-start="opacity-100"
                                                                x-transition:leave-end="opacity-0"
                                                        ></div>
                                                        <div
                                                                class="relative w-full max-w-lg origin-top rounded-lg bg-white transition-all duration-300 dark:bg-navy-700"
                                                                x-show="showModal"
                                                                x-transition:enter="easy-out"
                                                                x-transition:enter-start="opacity-0 scale-95"
                                                                x-transition:enter-end="opacity-100 scale-100"
                                                                x-transition:leave="easy-in"
                                                                x-transition:leave-start="opacity-100 scale-100"
                                                                x-transition:leave-end="opacity-0 scale-95"
                                                        >
                                                            <div class="flex justify-between rounded-t-lg bg-slate-200 px-4 py-3 dark:bg-navy-800 sm:px-5">
                                                                <h3 class="text-base font-medium text-slate-700 dark:text-navy-100">
                                                                    Sinh viên: ${item.user.fullName}
                                                                </h3>
                                                                <button @click="showModal = !showModal"
                                                                        class="btn -mr-1.5 size-7 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                                                    <svg xmlns="http://www.w3.org/2000/svg"
                                                                         class="size-4.5"
                                                                         fill="none"
                                                                         viewBox="0 0 24 24"
                                                                         stroke="currentColor"
                                                                         stroke-width="2">
                                                                        <path stroke-linecap="round"
                                                                              stroke-linejoin="round"
                                                                              d="M6 18L18 6M6 6l12 12"
                                                                        ></path>
                                                                    </svg>
                                                                </button>
                                                            </div>
                                                            <div class="px-4 py-4 sm:px-5">
                                                                <form:form modelAttribute="model" id="form-add-${item.id}"
                                                                           method="GET">
                                                                    <input name="id" value="${item.gradeEntity.id}"
                                                                           hidden="hidden">
                                                                    <input name="submissionId"
                                                                           value="${item.submissionEntity.id}"
                                                                           hidden="hidden">
                                                                    <div class="mt-4 space-y-4">

                                                                        <label class="block">
                                                                            <span>Điểm số:</span>
                                                                            <input name="score"
                                                                                   class="form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                                                                   placeholder="Tối đa 10 điểm"
                                                                                   type="number"
                                                                                   min="0"
                                                                                   max="10"
                                                                                   oninput="if (this.value > 10) this.value = 10; else if (this.value < 0) this.value = 0;"/>
                                                                        </label>
                                                                        <label class="block">
                                                                            <span>Comment:</span>
                                                                            <textarea name="comments" id="comment"
                                                                                      rows="4"
                                                                                      placeholder=" Enter Text"
                                                                                      class="form-textarea mt-1.5 w-full resize-none rounded-lg border border-slate-300 bg-transparent p-2.5 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                                                            ></textarea>
                                                                        </label>
                                                                        <div class="space-x-2 text-right">
                                                                            <button
                                                                                    @click="showModal = false"
                                                                                    class="btn min-w-[7rem] rounded-full border border-slate-300 font-medium text-slate-800 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-50 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90"
                                                                            >
                                                                                Cancel
                                                                            </button>
                                                                            <button type="button"
                                                                                    onclick="addScore(${item.id})"
                                                                                      @click="showModal = false"
                                                                                    class="btn min-w-[7rem] rounded-full bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                                                                                Apply
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </form:form>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </template>

                                            </div>
                                                <%--Modal end--%>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="my-7 h-px bg-slate-200 dark:bg-navy-500"></div>
                    <%--<div>
                        <h3 class="text-base font-medium text-slate-600 dark:text-navy-100">
                            Linked Accounts
                        </h3>
                        <p class="text-xs+ text-slate-400 dark:text-navy-300">
                            Lorem ipsum dolor sit amet consectetur.
                        </p>
                        <div class="flex items-center justify-between pt-4">
                            <div class="flex items-center space-x-4">
                                <div class="size-12">
                                    <img src="images/logos/google.svg" alt="logo">
                                </div>
                                <p class="font-medium line-clamp-1">
                                    Sign In with Google
                                </p>
                            </div>
                            <button class="btn h-8 rounded-full border border-slate-200 px-3 text-xs+ font-medium text-primary hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-500 dark:text-accent-light dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90">
                                Connect
                            </button>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    function addScore(id) {
        var data = {};
        var formData = $('#form-add-'+id).serializeArray();
        console.log("FormData:", formData);

        $.each(formData, function (index, value) {
            data[value.name] = value.value;
        });

        console.log("Final Data:", data);
        //Call api
        $.ajax({
            type: "POST",
            url: "/api/grade",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function () {
                // Hiển thị thông báo thành công với Toastr
                toastr.success("Thêm điểm thành công!", 'Success', {
                    closeButton: true,   // Thêm nút đóng thông báo
                    progressBar: true,   // Hiển thị thanh tiến trình
                    positionClass: 'toast-top-center',
                    timeOut: 1500,
                });
                // Sau khi thông báo thành công, tải lại trang sau 3 giây
                setTimeout(function () {
                    window.location.reload(); // Tải lại trang
                }, 2000);
            },
            error: function (response) {
                // Chuyển đổi dấu xuống dòng \n thành <br> trong thông báo
                var errorMessage = response.responseJSON.message.replace(/\n/g, '<br>');
                toastr.warning(errorMessage, 'Xảy ra lỗi', {
                    positionClass: 'toast-top-right',
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
