<%--
  Created by IntelliJ IDEA.
  User: Trọng Nguyễn
  Date: 3/17/2025
  Time: 10:57 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>

<head>
    <title>Nhiệm vụ</title>
</head>
<body>


<!-- Main Content Wrapper -->
<main class="main-content w-full px-[var(--margin-x)] pb-8">
    <div x-data="{showModal:false}">
        <div class="mt-6 flex flex-col items-center justify-between space-y-2 text-center sm:flex-row sm:space-y-0 sm:text-left">
            <div>
                <h3 class="text-xl font-semibold text-slate-700 dark:text-navy-100">
                    Lớp: DCCNTT12.10.2
                </h3>
                <p class="mt-1 hidden sm:block">Công việc cần làm của lớp DCCNTT12.10.2</p>
            </div>
            <button @click="showModal = true"
                    class="btn space-x-2 bg-primary font-medium text-white shadow-lg shadow-primary/50 hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:shadow-accent/50 dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                <svg xmlns="http://www.w3.org/2000/svg" class="size-5 text-indigo-50" fill="none" viewbox="0 0 24 24"
                     stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                </svg>
                <span> New Task </span>
            </button>
        </div>
        <template x-teleport="#x-teleport-target">
            <div
                    class="fixed inset-0 z-[100] flex flex-col items-center justify-center overflow-hidden px-4 py-6 sm:px-5"
                    x-show="showModal"
                    role="dialog"
                    @keydown.window.escape="showModal = false">
                <div class="absolute inset-0 bg-slate-900/60 transition-opacity duration-300"
                     @click="showModal = false"
                     x-show="showModal"
                     x-transition:enter="ease-out"
                     x-transition:enter-start="opacity-0"
                     x-transition:enter-end="opacity-100"
                     x-transition:leave="ease-in"
                     x-transition:leave-start="opacity-100"
                     x-transition:leave-end="opacity-0"></div>
                <div class="relative w-full max-w-lg origin-top rounded-lg bg-white transition-all duration-300 dark:bg-navy-700"
                     x-show="showModal"
                     x-transition:enter="easy-out"
                     x-transition:enter-start="opacity-0 scale-95"
                     x-transition:enter-end="opacity-100 scale-100"
                     x-transition:leave="easy-in"
                     x-transition:leave-start="opacity-100 scale-100"
                     x-transition:leave-end="opacity-0 scale-95">
                    <form:form modelAttribute="model" id="form-add" method="GET">
                    <div class="flex justify-between rounded-t-lg bg-slate-200 px-4 py-3 dark:bg-navy-800 sm:px-5">
                        <h3 class="text-base font-medium text-slate-700 dark:text-navy-100">
                            Thêm công việc cần làm
                        </h3>
                        <button
                                @click="showModal = !showModal" type="button"
                                class="btn -mr-1.5 size-7 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25"
                        >
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    class="size-4.5"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke="currentColor"
                                    stroke-width="2"
                            >
                                <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="M6 18L18 6M6 6l12 12"
                                ></path>
                            </svg>
                        </button>
                    </div>
                    <!-- Hidden input để lưu id giảng viên -->
                    <input type="hidden" id="classId" name="classId" value="${classId}"/>
                    <div class="px-4 py-4 sm:px-5">
                        <p>
                            Công việc sẽ được giao cho tất cả các sinh viên trong lớp
                        </p>
                        <div class="mt-4 space-y-4">
                            <label class="block">
                                <span>Tên công việc</span>
                                <input name="title" id="title"
                                       class="form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                       placeholder="Nhập tên công việc"
                                       type="text"
                                />
                            </label>
                            <label class="block">
                                <span>Loại công việc:</span>
                                <form:select
                                        class="form-select mt-1.5 w-full rounded-lg border border-slate-300 bg-white px-3 py-2 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:bg-navy-700 dark:hover:border-navy-400 dark:focus:border-accent"
                                        path="type">
                                    <form:options items="${AssignmentType}" itemValue="name" itemLabel="name"/>
                                </form:select>
                            </label>
                            <label class="block">
                                <span>Description:</span>
                                <textarea
                                        name="description"
                                        id="description"
                                        rows="4"
                                        placeholder=" Enter Text"
                                        class="form-textarea mt-1.5 w-full resize-none rounded-lg border border-slate-300 bg-transparent p-2.5 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                ></textarea>
                            </label>
                            <label class="block">
                                <span>Hạn nộp đến:</span>
                                <label class="relative flex">
                                    <input
                                            id="dueDate" name="dueDate"
                                            x-init="$el._x_flatpickr = flatpickr($el,{enableTime: true})"
                                            class="form-input peer w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 pl-9 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                            placeholder="Choose datetime..."
                                            type="text"
                                    />
                                    <span class="pointer-events-none absolute flex h-full w-10 items-center justify-center text-slate-400 peer-focus:text-primary dark:text-navy-300 dark:peer-focus:text-accent">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         class="size-5"
                                         fill="none"
                                         viewBox="0 0 24 24"
                                         stroke="currentColor"
                                         stroke-width="1.5">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                    </svg>
                                 </span>

                                </label>
                            </label>
                            </form:form>
                            <div class="space-x-2 text-right">
                                <button
                                        @click="showModal = false"
                                        type="button"
                                        class="btn min-w-[7rem] rounded-full border border-slate-300 font-medium text-slate-800 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-50 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90"
                                >
                                    Cancel
                                </button>
                                <button
                                        type="button"
                                        @click="showModal = false"
                                        onclick="addAssignment()"
                                        class="btn min-w-[7rem] rounded-full bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90"
                                >
                                    Apply
                                </button>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </template>
    </div>
    <div class="mt-8 grid grid-cols-1 gap-4 sm:grid-cols-2 sm:gap-5 lg:grid-cols-3 lg:gap-6 xl:grid-cols-4">
        <c:forEach var="item" items="${assignmentList}">
            <div class="card shadow-none">
                <div class="flex flex-1 flex-col justify-between rounded-lg bg-info/15 p-4 dark:bg-transparent sm:p-5">
                    <div>
                        <div class="flex items-start justify-between">
                            <img class="size-12 rounded-lg object-cover object-center"
                                 src="images/others/design-sm.jpg" alt="image">
                            <p class="text-xs+">   <fmt:formatDate value="${item.createdDate}" pattern="yyyy-MM-dd HH:mm"/></p>
                        </div>
                        <h3 class="mt-3 font-medium text-slate-700 line-clamp-2 dark:text-navy-100">
                            Báo cáo tiến độ lần 3
                        </h3>
                        <p class="text-xs+">${item.description}</p>
                    </div>
                    <div>
                        <div class="mt-4">
                            <p class="text-xs+ text-slate-700 dark:text-navy-100">
                                Đã hoàn thành
                            </p>
                            <div class="progress my-2 h-1.5 bg-info/15 dark:bg-info/25">
                                <div class="w-${item.submittedCount} rounded-full bg-info"></div>
                            </div>
                            <p class="text-right text-xs+ font-medium text-info">${item.percent}</p>
                        </div>
                        <div class="mt-5 flex flex-wrap -space-x-3">
                            <p class="text-xs+ text-slate-700 dark:text-navy-100">
                                Thành viên đã nộp bài: ${item.submittedCount}
                            </p>
                        </div>

                        <div class="mt-4 flex items-center justify-between space-x-2">
                            <div class="flex items-start">
                                <p class="mr-1 text-xs+ text-slate-700 dark:text-navy-100">
                                    Hạn nộp bài đến:
                                </p>
                                <div class="badge h-5.5 rounded-full bg-info px-2 text-xs+ text-white">
                                    <fmt:formatDate value="${item.dueDate}" pattern="yyyy-MM-dd HH:mm"/>
                                </div>
                            </div>
                            <div>
                                <div x-data="{showModal:false}">
                                    <a type="button" href="/admin/assignment-single-${item.id}" class="btn -mr-1.5 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none"
                                             viewbox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                        </svg>
                                    </a>

                                    <button @click="showModal = true"
                                            class="btn size-9 p-0 font-medium text-error hover:bg-error/20 focus:bg-error/20 active:bg-error/25">
                                        <svg xmlns="http://www.w3.org/2000/svg"
                                             class="size-5"
                                             fill="none"
                                             viewBox="0 0 24 24"
                                             stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                        </svg>
                                    </button>
                                    <template x-teleport="#x-teleport-target">
                                        <div
                                                class="fixed inset-0 z-[100] flex flex-col items-center justify-center overflow-hidden px-4 py-6 sm:px-5"
                                                x-show="showModal"
                                                role="dialog"
                                                @keydown.window.escape="showModal = false"
                                        >
                                            <div
                                                    class="absolute inset-0 bg-slate-900/60 backdrop-blur transition-opacity duration-300"
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
                                                    class="relative max-w-lg rounded-lg bg-white px-4 py-10 text-center transition-opacity duration-300 dark:bg-navy-700 sm:px-5"
                                                    x-show="showModal"
                                                    x-transition:enter="ease-out"
                                                    x-transition:enter-start="opacity-0"
                                                    x-transition:enter-end="opacity-100"
                                                    x-transition:leave="ease-in"
                                                    x-transition:leave-start="opacity-100"
                                                    x-transition:leave-end="opacity-0"
                                            >
                                                <svg
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        class="inline size-28 text-success"
                                                        fill="none"
                                                        viewBox="0 0 24 24"
                                                        stroke="currentColor"
                                                >
                                                    <path
                                                            stroke-linecap="round"
                                                            stroke-linejoin="round"
                                                            stroke-width="2"
                                                            d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                                                    ></path>
                                                </svg>

                                                <div class="mt-4">
                                                    <h2 class="text-2xl text-slate-700 dark:text-navy-100">
                                                        Bạn có chắc chắn muốn xoá nhiệm vụ "${item.title}" không?
                                                    </h2>
                                                    <p class="mt-2">
                                                        Nếu xoá toàn bộ dữ liệu liên quan sẽ biến mất.
                                                    </p>
                                                    <button @click="showModal = false"
                                                            class="btn bg-slate-150 font-medium text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90"

                                                    >
                                                        Huỷ thao tác
                                                    </button>
                                                    <button onclick="deleteAssignment(${item.id})"
                                                            @click="showModal = false"
                                                            class="ml-4 btn mt-6 bg-success font-medium text-white hover:bg-success-focus focus:bg-success-focus active:bg-success-focus/90">
                                                        Xoá
                                                    </button>

                                                </div>
                                            </div>
                                        </div>
                                    </template>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>


</main>
<script>


    function addAssignment() {
        var data = {};
        var formData = $('#form-add').serializeArray();
        $.each(formData, function (index, value) {
            data["" + value.name + ""] = value.value;
        });
        //Call api
        $.ajax({
            type: "POST",
            url: "/api/assignment",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function () {
                // Hiển thị thông báo thành công với Toastr
                toastr.success("Thêm thành công", 'Success', {
                    closeButton: true,   // Thêm nút đóng thông báo
                    progressBar: true,   // Hiển thị thanh tiến trình
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


    //// xoá class
    function deleteAssignment(id) {
        $.ajax({
            type: "DELETE",
            url: "/api/assignment/" + id + "/delete",
            data: JSON.stringify(id),
            contentType: "application/JSON",
            dataType: "JSON",

            success: function (respond) {
                console.log(respond.message);
                console.log("Success!");
                toastr.success('Xoá thành công! ', 'Success');
                setTimeout(function () {
                    window.location.reload(); // Tải lại trang
                }, 2000);
            },
            error: function (respond) {
                console.log("Failed!");
                console.log(respond);

            }

        });
    }

</script>
</body>