<%--
  Created by IntelliJ IDEA.
  User: Trọng Nguyễn
  Date: 3/25/2025
  Time: 9:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Quản lý lớp học</title>
</head>
<body>
<!-- Main Content Wrapper -->
<main class="main-content w-full px-[var(--margin-x)] pb-8">
    <div class="mt-4 grid grid-cols-12 gap-4 sm:mt-5 sm:gap-5 lg:mt-6 lg:gap-6">
        <div class="col-span-12 space-y-4 sm:space-y-5 lg:col-span-8 lg:space-y-6">
            <div class="grid grid-cols-1 gap-4 sm:grid-cols-3 sm:gap-5 lg:gap-6">
                <div class="card flex-row overflow-hidden">
                    <div class="h-full w-1 bg-gradient-to-b from-blue-500 to-purple-600"></div>
                    <div class="flex flex-1 flex-col justify-between p-4 sm:px-5">
                        <div>
                            <img class="size-12 rounded-lg object-cover object-center"
                                 src="images/others/testing-sm.jpg" alt="image">
                            <h3 class="mt-3 font-medium text-slate-700 line-clamp-2 dark:text-navy-100">
                                ${classInfo.className} - Khoá: ${classInfo.semester}
                            </h3>
                            <p class="text-xs+">Số lượng sinh viên: ${countStudents}</p>
                            <div class="mt-2 flex space-x-1.5">
                                <p class="text-xs+">Trạng thái: </p>
                                <a href="#"
                                   class="tag bg-primary py-1 px-1.5 text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                                    ${classInfo.status}
                                </a>
                            </div>
                        </div>
                        <div class="mt-10 flex justify-between">
                            <div class="flex -space-x-2">
                                <p class="text-xs+">Người quản lý:<a href="#"
                                                                        class="ml-1 tag bg-primary py-1 px-1.5 text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                                    ${classInfo.lecturer.user.fullName}
                                </a> </p>

                            </div>
                            <button  class="btn size-7 rounded-full bg-slate-150 p-0 font-medium text-slate-800 hover:bg-slate-200 hover:shadow-lg hover:shadow-slate-200/50 focus:bg-slate-200 focus:shadow-lg focus:shadow-slate-200/50 active:bg-slate-200/80 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:hover:shadow-navy-450/50 dark:focus:bg-navy-450 dark:focus:shadow-navy-450/50 dark:active:bg-navy-450/90">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5 rotate-45" fill="none"
                                     viewbox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M7 11l5-5m0 0l5 5m-5-5v12"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 gap-4 sm:col-span-2 sm:grid-cols-2 sm:gap-5 lg:gap-6">
                    <div class="card justify-center p-4.5">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-base font-semibold text-slate-700 dark:text-navy-100">
                                    ${countAssignments}
                                </p>
                                <p class="text-xs+ line-clamp-1">Nhiệm vụ</p>
                            </div>
                            <div class="mask is-star flex size-10 shrink-0 items-center justify-center bg-success">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5 text-white" fill="none"
                                     viewbox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                          d="M7 12l3-3 3 3 4-4M8 21l4-4 4 4M3 4h18M4 4h16v12a1 1 0 01-1 1H5a1 1 0 01-1-1V4z"></path>
                                </svg>
                            </div>
                        </div>
                        <div>
                            <div class="badge mt-2 space-x-1 bg-success/10 py-1 px-1.5 text-success dark:bg-success/15">
                                <span>10%</span>
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-3.5" viewbox="0 0 20 20"
                                     fill="currentColor">
                                    <path fill-rule="evenodd"
                                          d="M12 7a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0V8.414l-4.293 4.293a1 1 0 01-1.414 0L8 10.414l-4.293 4.293a1 1 0 01-1.414-1.414l5-5a1 1 0 011.414 0L11 10.586 14.586 7H12z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <div class="card justify-center p-4.5">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-base font-semibold text-slate-700 dark:text-navy-100">
                                    ${countRequests}
                                </p>
                                <p class="text-xs+ line-clamp-1">Yêu cầu gia nhập mới</p>
                            </div>
                            <div class="mask is-star flex size-10 shrink-0 items-center justify-center bg-info">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5 text-white" fill="none"
                                     viewbox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                          d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                            </div>
                        </div>
                        <div>
                            <div class="badge mt-2 space-x-1 bg-success/10 py-1 px-1.5 text-success dark:bg-success/15">
                                <span>6%</span>
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-3.5" viewbox="0 0 20 20"
                                     fill="currentColor">
                                    <path fill-rule="evenodd"
                                          d="M12 7a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0V8.414l-4.293 4.293a1 1 0 01-1.414 0L8 10.414l-4.293 4.293a1 1 0 01-1.414-1.414l5-5a1 1 0 011.414 0L11 10.586 14.586 7H12z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <div class="card justify-center p-4.5">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-base font-semibold text-slate-700 dark:text-navy-100">
                                    ${countStudents}
                                </p>
                                <p class="text-xs+ line-clamp-1">Sinh viên</p>
                            </div>
                            <div class="mask is-star flex size-10 shrink-0 items-center justify-center bg-secondary">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5 text-white" fill="none"
                                     viewbox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M18.364 5.636l-3.536 3.536m0 5.656l3.536 3.536M9.172 9.172L5.636 5.636m3.536 9.192l-3.536 3.536M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-5 0a4 4 0 11-8 0 4 4 0 018 0z"></path>
                                </svg>
                            </div>
                        </div>
                        <div>
                            <div class="badge mt-2 space-x-1 bg-success/10 py-1 px-1.5 text-success dark:bg-success/15">
                                <span>9%</span>
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-3.5" viewbox="0 0 20 20"
                                     fill="currentColor">
                                    <path fill-rule="evenodd"
                                          d="M12 7a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0V8.414l-4.293 4.293a1 1 0 01-1.414 0L8 10.414l-4.293 4.293a1 1 0 01-1.414-1.414l5-5a1 1 0 011.414 0L11 10.586 14.586 7H12z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <div class="card justify-center p-4.5">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-base font-semibold text-slate-700 dark:text-navy-100">
                                    ${countTopicsPending}
                                </p>
                                <p class="text-xs+ line-clamp-1">Đề tài đợi duyệt</p>
                            </div>
                            <div class="mask is-star flex size-10 shrink-0 items-center justify-center bg-warning">
                                <svg class="size-5 text-white" viewbox="0 0 24 24" fill="none" stroke="currentColor"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12.5293 18L20.9999 8.40002" stroke-width="1.5" stroke-linecap="round"
                                          stroke-linejoin="round"></path>
                                    <path d="M3 13.2L7.23529 18L17.8235 6" stroke-width="1.5" stroke-linecap="round"
                                          stroke-linejoin="round"></path>
                                </svg>
                            </div>
                        </div>
                        <div>
                            <div class="badge mt-2 space-x-1 bg-error/10 py-1 px-1.5 text-error dark:bg-error/15">
                                <span>6%</span>
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-3.5" viewbox="0 0 20 20"
                                     fill="currentColor">
                                    <path fill-rule="evenodd"
                                          d="M12 7a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0V8.414l-4.293 4.293a1 1 0 01-1.414 0L8 10.414l-4.293 4.293a1 1 0 01-1.414-1.414l5-5a1 1 0 011.414 0L11 10.586 14.586 7H12z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Users Table -->
            <div>
                <div class="flex items-center justify-between">
                    <h2 class="text-base font-medium tracking-wide text-slate-700 line-clamp-1 dark:text-navy-100">
                        Danh sách sinh viên
                    </h2>
                    <div class="flex">
                        <div class="flex items-center" x-data="{isInputActive:false}">
                            <label class="block">
                                <input x-effect="isInputActive === true && $nextTick(() => { $el.focus()});"
                                       :class="isInputActive ? 'w-32 lg:w-48' : 'w-0'"
                                       class="form-input bg-transparent px-1 text-right transition-all duration-100 placeholder:text-slate-500 dark:placeholder:text-navy-200"
                                       placeholder="Search here..." type="text">
                            </label>
                            <button @click="isInputActive = !isInputActive"
                                    class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-4.5" fill="none" viewbox="0 0 24 24"
                                     stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                          d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                </svg>
                            </button>
                        </div>
                        <div x-data="usePopper({placement:'bottom-end',offset:4})"
                             @click.outside="isShowPopper && (isShowPopper = false)" class="inline-flex">
                            <button x-ref="popperRef" @click="isShowPopper = !isShowPopper"
                                    class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-4.5" fill="none" viewbox="0 0 24 24"
                                     stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                            <div x-ref="popperRoot" class="popper-root" :class="isShowPopper && 'show'">
                                <div class="popper-box rounded-md border border-slate-150 bg-white py-1.5 font-inter dark:border-navy-500 dark:bg-navy-700">
                                    <ul>
                                        <li>
                                            <a href="#"
                                               class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Action</a>
                                        </li>
                                        <li>
                                            <a href="#"
                                               class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Another
                                                Action</a>
                                        </li>
                                        <li>
                                            <a href="#"
                                               class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Something
                                                else</a>
                                        </li>
                                    </ul>
                                    <div class="my-1 h-px bg-slate-150 dark:bg-navy-500"></div>
                                    <ul>
                                        <li>
                                            <a href="#"
                                               class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Separated
                                                Link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                    Đề tài
                                </th>
                                <th class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                    Công việc
                                </th>


                                <th class="whitespace-nowrap rounded-tr-lg bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${classStudents}">
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
                                            <c:when test="${item.topicEntitie == null}">
                                                <button class="badge bg-info/10 text-info dark:bg-info/15">Chưa có đề
                                                    tài
                                                </button>
                                            </c:when>
                                            <c:when test="${item.topicEntitie.status.name() == 'Accepted'}">
                                                ${item.topicEntitie.title}
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                            ${item.complete}
                                    </td>
                                    <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                            <%--  Modal --%>
                                        <div x-data="{showModal:false}">
                                            <button @click="showModal = true"
                                                    class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none"
                                                     viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                          d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                                </svg>
                                            </button>
                                            <template x-teleport="#x-teleport-target" style="min-width: 600px">
                                                <div class="fixed inset-0 z-[100] flex flex-col items-center justify-center overflow-hidden px-4 py-6 sm:px-5"
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
                                                    <div class="relative max-w-sm rounded-lg bg-white px-4 pb-4 transition-all duration-300 dark:bg-navy-700 sm:px-5"
                                                         x-show="showModal"
                                                         x-transition:enter="easy-out"
                                                         x-transition:enter-start="opacity-0 [transform:translate3d(0,-1rem,0)]"
                                                         x-transition:enter-end="opacity-100 [transform:translate3d(0,0,0)]"
                                                         x-transition:leave="easy-in"
                                                         x-transition:leave-start="opacity-100 [transform:translate3d(0,0,0)]"
                                                         x-transition:leave-end="opacity-0 [transform:translate3d(0,-1rem,0)]">
                                                        <div class="my-3 flex h-8 items-center justify-between">
                                                            <h2 class="font-medium tracking-wide text-slate-700 line-clamp-1 dark:text-navy-100 lg:text-base">
                                                                Xem chi tiết
                                                            </h2>
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
                                                                    />
                                                                </svg>
                                                            </button>
                                                        </div>
                                                            <%--    Tab--%>
                                                        <div x-data="{activeTab:'tabHome'}"
                                                             class="tabs flex flex-col">
                                                            <div class="is-scrollbar-hidden overflow-x-auto">
                                                                <div class="border-b-2 border-slate-150 dark:border-navy-500">
                                                                    <div class="tabs-list -mb-0.5 flex">
                                                                        <button @click="activeTab = 'tabHome'"
                                                                                :class="activeTab === 'tabHome' ? 'border-primary dark:border-accent text-primary dark:text-accent-light' : 'border-transparent hover:text-slate-800 focus:text-slate-800 dark:hover:text-navy-100 dark:focus:text-navy-100'"
                                                                                class="btn shrink-0 space-x-2 rounded-none border-b-2 px-3 py-2 font-medium">
                                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                                 class="size-4.5"
                                                                                 fill="none"
                                                                                 viewBox="0 0 24 24"
                                                                                 stroke="currentColor"
                                                                                 stroke-width="1.5">
                                                                                <path stroke-linecap="round"
                                                                                      stroke-linejoin="round"
                                                                                      d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
                                                                                />
                                                                            </svg>
                                                                            <span>Profile</span>
                                                                        </button>
                                                                        <button @click="activeTab = 'tabProfile'"
                                                                                :class="activeTab === 'tabProfile' ? 'border-primary dark:border-accent text-primary dark:text-accent-light' : 'border-transparent hover:text-slate-800 focus:text-slate-800 dark:hover:text-navy-100 dark:focus:text-navy-100'"
                                                                                class="btn shrink-0 space-x-2 rounded-none border-b-2 px-3 py-2 font-medium">
                                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                                 class="size-4.5"
                                                                                 fill="none"
                                                                                 viewBox="0 0 24 24"
                                                                                 stroke="currentColor"
                                                                                 stroke-width="1.5">
                                                                                <path stroke-linecap="round"
                                                                                      stroke-linejoin="round"
                                                                                      d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                                                                            </svg>
                                                                            <span>Thông tin đồ án</span>
                                                                        </button>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tab-content pt-4">
                                                                <div x-show="activeTab === 'tabHome'"
                                                                     x-transition:enter="transition-all duration-500 easy-in-out"
                                                                     x-transition:enter-start="opacity-0 [transform:translate3d(1rem,0,0)]"
                                                                     x-transition:enter-end="opacity-100 [transform:translate3d(0,0,0)]">

                                                                    <div class="space-y-4">
                                                                        <div class="flex justify-between">
                                                                            <div class="avatar size-16">
                                                                                <img class="rounded-full"
                                                                                     src="images/avatar/avatar-20.jpg"
                                                                                     alt="image">
                                                                            </div>
                                                                            <div>
                                                                                <p>Tiến độ công việc</p>
                                                                                <p class="text-xl font-medium text-slate-700 dark:text-navy-100">
                                                                                        ${item.complete}
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                        <div>
                                                                            <h3 style="min-width: 500px;"
                                                                                class="text-lg font-medium text-slate-700 dark:text-navy-100">
                                                                                    ${item.user.fullName}
                                                                            </h3>
                                                                            <p class="text-xs text-slate-400 dark:text-navy-300">
                                                                                    ${item.user.role}
                                                                            </p>
                                                                        </div>
                                                                        <div class="space-y-3 text-xs+">
                                                                            <div class="flex justify-between">
                                                                                <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                                    Mã sinh viên:
                                                                                </p>
                                                                                <p class="text-right">${item.studentCode}</p>
                                                                            </div>
                                                                            <div class="flex justify-between">
                                                                                <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                                    Lớp hành chính:
                                                                                </p>
                                                                                <p class="text-right">${item.classCode}</p>
                                                                            </div>
                                                                            <div class="flex justify-between">
                                                                                <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                                    Email:
                                                                                </p>
                                                                                <p class="text-right">${item.user.email}</p>
                                                                            </div>

                                                                            <div class="flex justify-between">
                                                                                <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                                    Ngày gia nhập:
                                                                                </p>
                                                                                <p class="text-right"><fmt:formatDate
                                                                                        value="${item.modifiedDate}"
                                                                                        pattern="yyyy-MM-dd HH:mm"/></p>
                                                                            </div>

                                                                            <div class="flex justify-between">
                                                                                <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                                    Đề tài thực hiện:
                                                                                </p>
                                                                                <c:choose>
                                                                                    <c:when test="${item.topicEntitie == null}">
                                                                                        <button class="text-right badge bg-error/10 text-error dark:bg-error/15">
                                                                                            Chưa có đề tài
                                                                                        </button>
                                                                                    </c:when>
                                                                                    <c:when test="${item.topicEntitie.status.name() == 'Accepted'}">
                                                                                        <button class="text-right badge bg-info/10 text-info dark:bg-info/15">
                                                                                                ${item.topicEntitie.title}
                                                                                        </button>

                                                                                    </c:when>
                                                                                </c:choose>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div x-show="activeTab === 'tabProfile'"
                                                                     x-transition:enter="transition-all duration-500 easy-in-out"
                                                                     x-transition:enter-start="opacity-0 [transform:translate3d(1rem,0,0)]"
                                                                     x-transition:enter-end="opacity-100 [transform:translate3d(0,0,0)]">
                                                                        <%--    card--%>
                                                                    <c:if test="${item.topicEntitie == null }">
                                                                    <div class="space-y-4">
                                                                        <p style="min-width: 400px"
                                                                           class=" text-xs text-slate-400 dark:text-navy-300">
                                                                            Trạng thái:
                                                                        </p>
                                                                        <div class=" ml-4 mt-1 badge bg-error/10 text-error dark:bg-error/15">
                                                                            Chưa có đề tài!
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                </c:if>
                                                                <c:if test="${item.topicEntitie != null }">
                                                                    <div class="space-y-4">
                                                                        <div>
                                                                            <p style="min-width: 500px"
                                                                               class="text-xs text-slate-400 dark:text-navy-300">
                                                                                Topic Name:
                                                                            </p>
                                                                            <h3 class="badge bg-info/10 text-info dark:bg-info/15   text-lg font-medium text-slate-700 dark:text-navy-100">
                                                                                    ${item.topicEntitie.title}
                                                                            </h3>

                                                                        </div>
                                                                        <div class="space-y-3 text-xs+">
                                                                            <div class="flex justify-between">
                                                                                <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                                    Công nghệ sử dụng:
                                                                                </p>
                                                                                <p class="ml-4 text-right">${item.topicEntitie.technologies}</p>
                                                                            </div>
                                                                            <div class="flex justify-between">
                                                                                <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                                    Loại đề tài:
                                                                                </p>
                                                                                <p class="text-right">${item.topicEntitie.category}</p>
                                                                            </div>
                                                                            <div class="flex justify-between">
                                                                                <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                                    Register Date:
                                                                                </p>
                                                                                <p class="pb-4 text-right">
                                                                                    <fmt:formatDate
                                                                                            value="${item.topicEntitie.modifiedDate}"
                                                                                            pattern="yyyy-MM-dd HH:mm"/></p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                        <div class="mt-4 text-right">
                                                            <button @click="showModal = false"
                                                                    class="btn h-8 rounded-full bg-primary text-xs+ font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                                                                Cancel
                                                            </button>
                                                        </div>
                                                    </div>

                                                        <%--                                            end tab --%>
                                                </div>
                                            </template>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <%--<div class="grid grid-cols-1 gap-4 sm:grid-cols-2 sm:gap-5 lg:gap-6">
                <div class="card px-4 pb-4 sm:px-5">
                    <div class="my-3 flex h-8 items-center justify-between">
                        <h2 class="font-medium tracking-wide text-slate-700 line-clamp-1 dark:text-navy-100">
                            Contact List
                        </h2>

                        <div x-data="usePopper({placement:'bottom-end',offset:4})"
                             @click.outside="isShowPopper && (isShowPopper = false)" class="inline-flex">
                            <button x-ref="popperRef" @click="isShowPopper = !isShowPopper"
                                    class="btn -mr-1.5 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24"
                                     stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                </svg>
                            </button>

                            <div x-ref="popperRoot" class="popper-root" :class="isShowPopper && 'show'">
                                <div class="popper-box rounded-md border border-slate-150 bg-white py-1.5 font-inter dark:border-navy-500 dark:bg-navy-700">
                                    <ul>
                                        <li>
                                            <a href="#"
                                               class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Action</a>
                                        </li>
                                        <li>
                                            <a href="#"
                                               class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Another
                                                Action</a>
                                        </li>
                                        <li>
                                            <a href="#"
                                               class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Something
                                                else</a>
                                        </li>
                                    </ul>
                                    <div class="my-1 h-px bg-slate-150 dark:bg-navy-500"></div>
                                    <ul>
                                        <li>
                                            <a href="#"
                                               class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Separated
                                                Link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="space-y-3.5" x-data="{expandedItem:'item-1'}">
                        <div x-data="accordionItem('item-1')">
                            <div class="flex items-center justify-between">
                                <div class="flex space-x-4">
                                    <div class="avatar size-10">
                                        <img class="rounded-full" src="images/avatar/avatar-12.jpg" alt="avatar">
                                    </div>
                                    <div>
                                        <h3 class="font-medium text-slate-700 line-clamp-1 dark:text-navy-100">
                                            Konnor Guzman
                                        </h3>
                                        <p class="mt-0.5 text-xs line-clamp-1">
                                            (01) 22 888 4444
                                        </p>
                                    </div>
                                </div>
                                <button @click="expanded = !expanded"
                                        class="btn size-7 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <i :class="expanded && '-rotate-180'"
                                       class="fas fa-chevron-down transition-transform"></i>
                                </button>
                            </div>
                            <div x-show="expanded" x-collapse="">
                                <div class="flex justify-between pt-4">
                                    <button class="btn size-7 rounded-full bg-success/10 p-0 text-success hover:bg-success/20 focus:bg-success/20 active:bg-success/25">
                                        <i class="fa-solid fa-phone text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-warning/10 p-0 text-warning hover:bg-warning/20 focus:bg-warning/20 active:bg-warning/25">
                                        <i class="fa-solid fa-video text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-secondary/10 p-0 text-secondary hover:bg-secondary/20 focus:bg-secondary/20 active:bg-secondary/25 dark:bg-secondary-light/10 dark:text-secondary-light dark:hover:bg-secondary-light/20 dark:focus:bg-secondary-light/20 dark:active:bg-secondary-light/25">
                                        <i class="fa-regular fa-comment text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-info/10 p-0 text-info hover:bg-info/20 focus:bg-info/20 active:bg-info/25">
                                        <i class="fa-regular fa-envelope text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-slate-150 p-0 text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90">
                                        <i class="fa-solid fa-ellipsis"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div x-data="accordionItem('item-2')">
                            <div class="flex items-center justify-between">
                                <div class="flex space-x-4">
                                    <div class="avatar size-10">
                                        <img class="rounded-full" src="images/avatar/avatar-6.jpg" alt="avatar">
                                    </div>
                                    <div>
                                        <h3 class="font-medium text-slate-700 line-clamp-1 dark:text-navy-100">
                                            Alfredo Elliott
                                        </h3>
                                        <p class="mt-0.5 text-xs line-clamp-1">
                                            (095)-800-8313
                                        </p>
                                    </div>
                                </div>
                                <button @click="expanded = !expanded"
                                        class="btn size-7 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <i :class="expanded && '-rotate-180'"
                                       class="fas fa-chevron-down transition-transform"></i>
                                </button>
                            </div>
                            <div x-show="expanded" x-collapse="">
                                <div class="flex justify-between pt-4">
                                    <button class="btn size-7 rounded-full bg-success/10 p-0 text-success hover:bg-success/20 focus:bg-success/20 active:bg-success/25">
                                        <i class="fa-solid fa-phone text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-warning/10 p-0 text-warning hover:bg-warning/20 focus:bg-warning/20 active:bg-warning/25">
                                        <i class="fa-solid fa-video text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-secondary/10 p-0 text-secondary hover:bg-secondary/20 focus:bg-secondary/20 active:bg-secondary/25 dark:bg-secondary-light/10 dark:text-secondary-light dark:hover:bg-secondary-light/20 dark:focus:bg-secondary-light/20 dark:active:bg-secondary-light/25">
                                        <i class="fa-regular fa-comment text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-info/10 p-0 text-info hover:bg-info/20 focus:bg-info/20 active:bg-info/25">
                                        <i class="fa-regular fa-envelope text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-slate-150 p-0 text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90">
                                        <i class="fa-solid fa-ellipsis"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div x-data="accordionItem('item-3')">
                            <div class="flex items-center justify-between">
                                <div class="flex space-x-4">
                                    <div class="avatar size-10">
                                        <div class="is-initial rounded-full bg-info text-sm+ uppercase text-white">
                                            ds
                                        </div>
                                    </div>
                                    <div>
                                        <h3 class="font-medium text-slate-700 line-clamp-1 dark:text-navy-100">
                                            Derrick Simmons
                                        </h3>
                                        <p class="mt-0.5 text-xs line-clamp-1">
                                            (350)-813-3861
                                        </p>
                                    </div>
                                </div>
                                <button @click="expanded = !expanded"
                                        class="btn size-7 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <i :class="expanded && '-rotate-180'"
                                       class="fas fa-chevron-down transition-transform"></i>
                                </button>
                            </div>
                            <div x-show="expanded" x-collapse="">
                                <div class="flex justify-between pt-4">
                                    <button class="btn size-7 rounded-full bg-success/10 p-0 text-success hover:bg-success/20 focus:bg-success/20 active:bg-success/25">
                                        <i class="fa-solid fa-phone text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-warning/10 p-0 text-warning hover:bg-warning/20 focus:bg-warning/20 active:bg-warning/25">
                                        <i class="fa-solid fa-video text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-secondary/10 p-0 text-secondary hover:bg-secondary/20 focus:bg-secondary/20 active:bg-secondary/25 dark:bg-secondary-light/10 dark:text-secondary-light dark:hover:bg-secondary-light/20 dark:focus:bg-secondary-light/20 dark:active:bg-secondary-light/25">
                                        <i class="fa-regular fa-comment text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-info/10 p-0 text-info hover:bg-info/20 focus:bg-info/20 active:bg-info/25">
                                        <i class="fa-regular fa-envelope text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-slate-150 p-0 text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90">
                                        <i class="fa-solid fa-ellipsis"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div x-data="accordionItem('item-4')">
                            <div class="flex items-center justify-between">
                                <div class="flex space-x-4">
                                    <div class="avatar size-10">
                                        <img class="rounded-full" src="images/avatar/avatar-3.jpg" alt="avatar">
                                    </div>
                                    <div>
                                        <h3 class="font-medium text-slate-700 line-clamp-1 dark:text-navy-100">
                                            Henry Curtis
                                        </h3>
                                        <p class="mt-0.5 text-xs line-clamp-1">
                                            (675)-975-0083
                                        </p>
                                    </div>
                                </div>
                                <button @click="expanded = !expanded"
                                        class="btn size-7 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <i :class="expanded && '-rotate-180'"
                                       class="fas fa-chevron-down transition-transform"></i>
                                </button>
                            </div>
                            <div x-show="expanded" x-collapse="">
                                <div class="flex justify-between pt-4">
                                    <button class="btn size-7 rounded-full bg-success/10 p-0 text-success hover:bg-success/20 focus:bg-success/20 active:bg-success/25">
                                        <i class="fa-solid fa-phone text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-warning/10 p-0 text-warning hover:bg-warning/20 focus:bg-warning/20 active:bg-warning/25">
                                        <i class="fa-solid fa-video text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-secondary/10 p-0 text-secondary hover:bg-secondary/20 focus:bg-secondary/20 active:bg-secondary/25 dark:bg-secondary-light/10 dark:text-secondary-light dark:hover:bg-secondary-light/20 dark:focus:bg-secondary-light/20 dark:active:bg-secondary-light/25">
                                        <i class="fa-regular fa-comment text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-info/10 p-0 text-info hover:bg-info/20 focus:bg-info/20 active:bg-info/25">
                                        <i class="fa-regular fa-envelope text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-slate-150 p-0 text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90">
                                        <i class="fa-solid fa-ellipsis"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div x-data="accordionItem('item-5')">
                            <div class="flex items-center justify-between">
                                <div class="flex space-x-4">
                                    <div class="avatar size-10">
                                        <img class="rounded-full" src="images/avatar/avatar-20.jpg" alt="avatar">
                                    </div>
                                    <div>
                                        <h3 class="font-medium text-slate-700 line-clamp-1 dark:text-navy-100">
                                            John Doe
                                        </h3>
                                        <p class="mt-0.5 text-xs line-clamp-1">
                                            (727)-810-3880
                                        </p>
                                    </div>
                                </div>
                                <button @click="expanded = !expanded"
                                        class="btn size-7 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <i :class="expanded && '-rotate-180'"
                                       class="fas fa-chevron-down transition-transform"></i>
                                </button>
                            </div>
                            <div x-show="expanded" x-collapse="">
                                <div class="flex justify-between pt-4">
                                    <button class="btn size-7 rounded-full bg-success/10 p-0 text-success hover:bg-success/20 focus:bg-success/20 active:bg-success/25">
                                        <i class="fa-solid fa-phone text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-warning/10 p-0 text-warning hover:bg-warning/20 focus:bg-warning/20 active:bg-warning/25">
                                        <i class="fa-solid fa-video text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-secondary/10 p-0 text-secondary hover:bg-secondary/20 focus:bg-secondary/20 active:bg-secondary/25 dark:bg-secondary-light/10 dark:text-secondary-light dark:hover:bg-secondary-light/20 dark:focus:bg-secondary-light/20 dark:active:bg-secondary-light/25">
                                        <i class="fa-regular fa-comment text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-info/10 p-0 text-info hover:bg-info/20 focus:bg-info/20 active:bg-info/25">
                                        <i class="fa-regular fa-envelope text-xs"></i>
                                    </button>
                                    <button class="btn size-7 rounded-full bg-slate-150 p-0 text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90">
                                        <i class="fa-solid fa-ellipsis"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card px-4 pb-4 sm:px-5">
                    <div class="my-3 flex h-8 items-center justify-between">
                        <h2 class="font-medium tracking-wide text-slate-700 dark:text-navy-100">
                            Recent Payments
                        </h2>
                        <a href="#"
                           class="border-b border-dotted border-current pb-0.5 text-xs+ font-medium text-primary outline-none transition-colors duration-300 hover:text-primary/70 focus:text-primary/70 dark:text-accent-light dark:hover:text-accent-light/70 dark:focus:text-accent-light/70">View
                            All</a>
                    </div>
                    <div class="space-y-3.5">
                        <div class="flex cursor-pointer items-center justify-between">
                            <div class="flex items-center space-x-3.5">
                                <div class="avatar">
                                    <img class="rounded-full" src="images/avatar/avatar-20.jpg" alt="avatar">
                                </div>
                                <div>
                                    <p class="font-medium text-slate-700 dark:text-navy-100">
                                        Konnor Guzman
                                    </p>
                                    <p class="text-xs text-slate-400 line-clamp-1 dark:text-navy-300">
                                        Dec 21, 2021 - 08:05
                                    </p>
                                </div>
                            </div>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                $660.22
                            </p>
                        </div>
                        <div class="flex cursor-pointer items-center justify-between">
                            <div class="flex items-center space-x-3.5">
                                <div class="avatar">
                                    <img class="rounded-full" src="images/avatar/avatar-5.jpg" alt="avatar">
                                </div>
                                <div>
                                    <p class="font-medium text-slate-700 dark:text-navy-100">
                                        Henry Curtis
                                    </p>
                                    <p class="text-xs text-slate-400 line-clamp-1 dark:text-navy-300">
                                        Dec 19, 2021 - 11:55
                                    </p>
                                </div>
                            </div>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                $33.63
                            </p>
                        </div>
                        <div class="flex cursor-pointer items-center justify-between">
                            <div class="flex items-center space-x-3.5">
                                <div class="avatar">
                                    <img class="rounded-full" src="images/avatar/avatar-18.jpg" alt="avatar">
                                </div>
                                <div>
                                    <p class="font-medium text-slate-700 dark:text-navy-100">
                                        Derrick Simmons
                                    </p>
                                    <p class="text-xs text-slate-400 line-clamp-1 dark:text-navy-300">
                                        Dec 16, 2021 - 14:45
                                    </p>
                                </div>
                            </div>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                $674.63
                            </p>
                        </div>
                        <div class="flex cursor-pointer items-center justify-between">
                            <div class="flex items-center space-x-3.5">
                                <div class="avatar">
                                    <img class="rounded-full" src="images/avatar/avatar-7.jpg" alt="avatar">
                                </div>
                                <div>
                                    <p class="font-medium text-slate-700 dark:text-navy-100">
                                        Kartina West
                                    </p>
                                    <p class="text-xs text-slate-400 line-clamp-1 dark:text-navy-300">
                                        Dec 13, 2021 - 11:30
                                    </p>
                                </div>
                            </div>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                $547.63
                            </p>
                        </div>
                        <div class="flex cursor-pointer items-center justify-between">
                            <div class="flex items-center space-x-3.5">
                                <div class="avatar">
                                    <img class="rounded-full" src="images/avatar/avatar-11.jpg" alt="avatar">
                                </div>
                                <div>
                                    <p class="font-medium text-slate-700 dark:text-navy-100">
                                        Samantha Shelton
                                    </p>
                                    <p class="text-xs text-slate-400 line-clamp-1 dark:text-navy-300">
                                        Dec 10, 2021 - 09:41
                                    </p>
                                </div>
                            </div>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                $736.24
                            </p>
                        </div>
                        <div class="flex cursor-pointer items-center justify-between">
                            <div class="flex items-center space-x-3.5">
                                <div class="avatar">
                                    <img class="rounded-full" src="images/avatar/avatar-19.jpg" alt="avatar">
                                </div>
                                <div>
                                    <p class="font-medium text-slate-700 dark:text-navy-100">
                                        Joe Perkins
                                    </p>
                                    <p class="text-xs text-slate-400 line-clamp-1 dark:text-navy-300">
                                        Dec 06, 2021 - 11:41
                                    </p>
                                </div>
                            </div>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                $736.24
                            </p>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
        <div class="col-span-12 lg:col-span-4">
            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 sm:gap-5 lg:grid-cols-1 lg:gap-6">
                <%--<div class="card p-4">
                    <div class="space-y-1 text-center font-inter text-xs+">
                        <div class="flex items-center justify-between px-2 pb-4">
                            <p class="font-medium text-slate-700 dark:text-navy-100">
                                January 2022
                            </p>
                            <div class="-mr-1.5 flex space-x-2">
                                <button class="btn size-7 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none"
                                         viewbox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                              d="M15 19l-7-7 7-7"></path>
                                    </svg>
                                </button>
                                <button class="btn size-7 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none"
                                         viewbox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                              d="M9 5l7 7-7 7"></path>
                                    </svg>
                                </button>
                            </div>
                        </div>
                        <div class="grid grid-cols-7 pb-2">
                            <div class="text-tiny+ font-semibold text-primary dark:text-accent-light">
                                SUN
                            </div>
                            <div class="text-tiny+ font-semibold text-primary dark:text-accent-light">
                                MON
                            </div>
                            <div class="text-tiny+ font-semibold text-primary dark:text-accent-light">
                                TUE
                            </div>
                            <div class="text-tiny+ font-semibold text-primary dark:text-accent-light">
                                WED
                            </div>
                            <div class="text-tiny+ font-semibold text-primary dark:text-accent-light">
                                THU
                            </div>
                            <div class="text-tiny+ font-semibold text-primary dark:text-accent-light">
                                FRY
                            </div>
                            <div class="text-tiny+ font-semibold text-primary dark:text-accent-light">
                                SAT
                            </div>
                        </div>
                        <div class="grid grid-cols-7 place-items-center">
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-400 hover:bg-primary/10 hover:text-primary dark:text-navy-300 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                29
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-400 hover:bg-primary/10 hover:text-primary dark:text-navy-300 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                30
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-400 hover:bg-primary/10 hover:text-primary dark:text-navy-300 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                31
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                1
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                2
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                3
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                4
                            </button>
                        </div>
                        <div class="grid grid-cols-7 place-items-center">
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                5
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                6
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                7
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                8
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                9
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                10
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                11
                            </button>
                        </div>
                        <div class="grid grid-cols-7 place-items-center">
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                12
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                13
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl font-medium text-primary hover:bg-primary/10 hover:text-primary dark:text-accent-light dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                14
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                15
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                16
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                17
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                18
                            </button>
                        </div>
                        <div class="grid grid-cols-7 place-items-center">
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                19
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                20
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                21
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                22
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                23
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                24
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                25
                            </button>
                        </div>
                        <div class="grid grid-cols-7 place-items-center">
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                26
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                27
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                28
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                29
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-900 hover:bg-primary/10 hover:text-primary dark:text-navy-100 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                30
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-400 hover:bg-primary/10 hover:text-primary dark:text-navy-300 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                1
                            </button>
                            <button class="flex h-7 w-9 items-center justify-center rounded-xl text-slate-400 hover:bg-primary/10 hover:text-primary dark:text-navy-300 dark:hover:bg-accent-light/10 dark:hover:text-accent-light">
                                2
                            </button>
                        </div>
                    </div>
                </div>--%>
                <div class="card px-4 pb-4 sm:px-5" style="min-height: 500px">
                    <div class="mt-2 flex h-8 items-center justify-between">
                        <h2 class="font-medium tracking-wide text-slate-700 line-clamp-1 dark:text-navy-100">
                            Thông báo
                        </h2>
                    </div>
                    <%-- Tab yêu cầu gia nhập và xử lý đề tài--%>
                    <div x-data="{activeTab:'tabHome'}" class="tabs flex flex-col">
                        <div class="is-scrollbar-hidden overflow-x-auto">
                            <div class="border-b-2 border-slate-150 dark:border-navy-500">
                                <div class="pt-1 tabs-list -mb-0.5 flex">
                                    <div class="relative cursor-pointer">
                                        <button @click="activeTab = 'tabHome'"
                                                :class="activeTab === 'tabHome' ? 'border-primary dark:border-accent text-primary dark:text-accent-light' : 'border-transparent hover:text-slate-800 focus:text-slate-800 dark:hover:text-navy-100 dark:focus:text-navy-100'"
                                                class="btn shrink-0 space-x-2 rounded-none border-b-2 px-3 py-2 font-medium">
                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                 class="size-4.5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                                 stroke-width="1.5">
                                                <path stroke-linecap="round"
                                                      stroke-linejoin="round"
                                                      d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
                                            </svg>
                                            <div class="absolute top-0 right-0 -m-1 flex h-4 min-w-[1rem] items-center justify-center rounded-full bg-primary px-1 text-tiny font-medium leading-none text-white dark:bg-accent">
                                                ${countRequests}
                                            </div>
                                            <span>Yêu cầu gia nhập</span>
                                        </button>
                                    </div>
                                    <div class="relative cursor-pointer">
                                        <button @click="activeTab = 'tabMessages'"
                                                :class="activeTab === 'tabMessages' ? 'border-primary dark:border-accent text-primary dark:text-accent-light' : 'border-transparent hover:text-slate-800 focus:text-slate-800 dark:hover:text-navy-100 dark:focus:text-navy-100'"
                                                class="btn shrink-0 space-x-2 rounded-none border-b-2 px-3 py-2 font-medium">

                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                 class="size-4.5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                                 stroke-width="1.5">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                      d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                                            </svg>
                                            <div class="absolute top-0 right-0 -m-1 flex h-4 min-w-[1rem] items-center justify-center rounded-full bg-primary px-1 text-tiny font-medium leading-none text-white dark:bg-accent">
                                                ${countTopicsPending}
                                            </div>
                                            <span> Đề tài </span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content pt-4">
                            <div x-show="activeTab === 'tabHome'"
                                 x-transition:enter="transition-all duration-500 easy-in-out"
                                 x-transition:enter-start="opacity-0 [transform:translate3d(1rem,0,0)]"
                                 x-transition:enter-end="opacity-100 [transform:translate3d(0,0,0)]">
                                <div>
                                    <div class="flex cursor-pointer items-center justify-between space-x-2">
                                        <div class="flex items-center space-x-3">
                                            <div class="avatar">
                                                <img class="rounded-full" src="images/avatar/avatar-20.jpg"
                                                     alt="avatar">
                                            </div>
                                            <div>
                                                <div class="flex items-center space-x-2">
                                                    <p class="font-medium text-slate-700 dark:text-navy-100">
                                                        Nguyễn Văn Trọng
                                                    </p>
                                                    <div class="flex h-4.5 min-w-[1.125rem] items-center justify-center rounded-full bg-slate-200 px-1.5 text-tiny+ font-medium leading-none text-slate-800 dark:bg-navy-450 dark:text-white">
                                                        Pending
                                                    </div>
                                                </div>
                                                <p class="text-xs text-slate-400 line-clamp-1 dark:text-navy-300">
                                                    Sinh viên Nguyễn Văn Trọng muốn yêu cầu tham gia lớp học!
                                                </p>
                                            </div>
                                        </div>
                                        <a href="#"
                                           class="hover:text-primary focus:text-primary dark:hover:text-accent-light dark:focus:text-accent-light">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none"
                                                 viewbox="0 0 24 24"
                                                 stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                      d="M9 5l7 7-7 7"></path>
                                            </svg>
                                        </a>
                                    </div>
                                    <c:forEach var="item" items="${classRequest}">
                                        <div x-data="{showModal:false}">
                                            <div class="flex cursor-pointer items-center justify-between space-x-2">
                                                <div class="flex items-center space-x-3">
                                                    <div class="avatar">
                                                        <img class="rounded-full" src="images/avatar/avatar-20.jpg"
                                                             alt="avatar">
                                                    </div>
                                                    <div>
                                                        <div class="flex items-center space-x-2">
                                                            <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                    ${item.student.user.fullName}
                                                            </p>
                                                            <div class="flex h-4.5 min-w-[1.125rem] items-center justify-center rounded-full bg-slate-200 px-1.5 text-tiny+ font-medium leading-none text-slate-800 dark:bg-navy-450 dark:text-white">
                                                                    ${item.status.name()}
                                                            </div>
                                                        </div>
                                                        <p class="text-xs text-slate-400 line-clamp-1 dark:text-navy-300">
                                                                ${item.message}
                                                        </p>
                                                    </div>
                                                </div>
                                                <a type="button" @click="showModal = true"
                                                   class="hover:text-primary focus:text-primary dark:hover:text-accent-light dark:focus:text-accent-light">
                                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none"
                                                         viewbox="0 0 24 24"
                                                         stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              stroke-width="2"
                                                              d="M9 5l7 7-7 7"></path>
                                                    </svg>
                                                </a>
                                            </div>

                                                <%--                             Modal                       --%>

                                            <template x-teleport="#x-teleport-target">
                                                <div class=" fixed inset-0 z-[100] flex flex-col items-center justify-center overflow-hidden px-4 py-6 sm:px-5"
                                                     x-show="showModal"
                                                     role="dialog"
                                                     @keydown.window.escape="showModal = false">
                                                    <div class="absolute inset-0 bg-slate-900/60 transition-opacity duration-300"
                                                         @click="showModal = false"
                                                         x-show="showModal" x-transition:enter="ease-out"
                                                         x-transition:enter-start="opacity-0"
                                                         x-transition:enter-end="opacity-100"
                                                         x-transition:leave="ease-in"
                                                         x-transition:leave-start="opacity-100"
                                                         x-transition:leave-end="opacity-0"></div>
                                                    <div class="relative max-w-md rounded-lg bg-white pt-10 pb-4 text-center transition-all duration-300 dark:bg-navy-700"
                                                         x-show="showModal" x-transition:enter="easy-out"
                                                         x-transition:enter-start="opacity-0 [transform:translate3d(0,1rem,0)]"
                                                         x-transition:enter-end="opacity-100 [transform:translate3d(0,0,0)]"
                                                         x-transition:leave="easy-in"
                                                         x-transition:leave-start="opacity-100 [transform:translate3d(0,0,0)]"
                                                         x-transition:leave-end="opacity-0 [transform:translate3d(0,1rem,0)]">
                                                        <div class="avatar size-20">
                                                            <img class="rounded-full"
                                                                 src="images/avatar/avatar-8.jpg"
                                                                 alt="avatar"/>
                                                            <div class="absolute right-0 m-1 size-4 rounded-full border-2 border-white bg-primary dark:border-navy-700 dark:bg-accent"></div>
                                                        </div>
                                                            <%-- Thông tin của sinh viên  --%>
                                                        <div class="mt-4 px-4 sm:px-12">
                                                            <h3 class="text-lg text-slate-800 dark:text-navy-50">
                                                                    ${item.student.user.fullName}
                                                            </h3>
                                                            <p class="mt-1 text-slate-500 dark:text-navy-200">
                                                                Sinh viên ${item.student.user.fullName} yêu cầu tham gia
                                                                lớp học!
                                                            </p>
                                                            <div class="my-4 h-px w-full bg-slate-200 dark:bg-navy-500"></div>
                                                                <%--   Thông tin cá nhân--%>
                                                            <div class="grow space-y-4 ">
                                                                <div class="flex items-center space-x-4">
                                                                    <div class="flex h-7 w-7 items-center rounded-lg bg-primary/10 p-2 text-primary dark:bg-accent-light/10 dark:text-accent-light">
                                                                        <i class="fa fa-phone text-xs"></i>
                                                                    </div>
                                                                    <p>${item.student.studentCode}</p>


                                                                </div>
                                                                <div class="flex items-center space-x-4">
                                                                    <div class="flex h-7 w-7 items-center rounded-lg bg-primary/10 p-2 text-primary dark:bg-accent-light/10 dark:text-accent-light">
                                                                        <i class="fa fa-envelope text-xs"></i>
                                                                    </div>
                                                                    <p>${item.student.user.email}</p>
                                                                </div>
                                                                <div class="flex items-center space-x-4">
                                                                    <div class="flex h-7 w-7 items-center rounded-lg bg-primary/10 p-2 text-primary dark:bg-accent-light/10 dark:text-accent-light">
                                                                        <i class="fa fa-link text-xs"></i>
                                                                    </div>
                                                                    <p>${item.student.user.role}</p>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="my-4 mt-10 h-px bg-slate-200 dark:bg-navy-500"></div>
                                                        <div class="space-x-3">
                                                            <button type="button"
                                                                    onclick="reject(${item.id})"
                                                                    @click="showModal = false"
                                                                    class="btn border border-error/30 bg-error/10 font-medium text-error hover:bg-error/20 focus:bg-error/20 active:bg-error/25"
                                                            >
                                                                x Từ chối x
                                                            </button>
                                                            <button type="button"
                                                                    onclick="approve(${item.id})"
                                                                    @click="showModal = false"
                                                                    class="btn border border-success/30 bg-success/10 font-medium text-success hover:bg-success/20 focus:bg-success/20 active:bg-success/25">
                                                                > Đồng ý <
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </template>
                                        </div>
                                        <%--                             Modal End                       --%>
                                    </c:forEach>
                                </div>
                            </div>
                            <div x-show="activeTab === 'tabMessages'"
                                 x-transition:enter="transition-all duration-500 easy-in-out"
                                 x-transition:enter-start="opacity-0 [transform:translate3d(1rem,0,0)]"
                                 x-transition:enter-end="opacity-100 [transform:translate3d(0,0,0)]">
                                <div>
                                    <div class="flex cursor-pointer items-center justify-between space-x-2">
                                        <div class="flex items-center space-x-3">
                                            <div class="avatar">
                                                <img class="rounded-full" src="images/avatar/avatar-20.jpg"
                                                     alt="avatar">
                                            </div>
                                            <div>
                                                <div class="flex items-center space-x-2">
                                                    <p class="font-medium text-slate-700 dark:text-navy-100">
                                                        Nguyễn Văn Trọng
                                                    </p>
                                                    <div class="flex h-4.5 min-w-[1.125rem] items-center justify-center badge bg-success/10 text-success dark:bg-success/15">
                                                        Chờ duyệt
                                                    </div>
                                                </div>
                                                <p class="mt-1 text-xs text-slate-400 line-clamp-1 dark:text-navy-300">
                                                    2025-05-17 10:04
                                                </p>
                                                <p class="text-x text-slate-400 line-clamp-1 dark:text-navy-300">
                                                    Sinh viên Nguyễn Văn Trọng đã gửi đơn đăng ký đề tài!
                                                </p>
                                            </div>
                                        </div>
                                        <a href="#"
                                           class="hover:text-primary focus:text-primary dark:hover:text-accent-light dark:focus:text-accent-light">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none"
                                                 viewbox="0 0 24 24"
                                                 stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                      d="M9 5l7 7-7 7"></path>
                                            </svg>
                                        </a>
                                    </div>
                                    <c:forEach var="item" items="${topicPending}">

                                        <div class="mt-3 flex cursor-pointer items-center justify-between space-x-2">
                                            <div class="flex items-center space-x-3">
                                                <div class="avatar">
                                                    <img class="rounded-full" src="images/avatar/avatar-20.jpg"
                                                         alt="avatar">
                                                </div>
                                                <div>
                                                    <div class="flex items-center space-x-2">
                                                        <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                ${item.student.user.fullName}
                                                        </p>
                                                        <div class="flex h-4.5 min-w-[1.125rem] items-center justify-center badge bg-success/10 text-success dark:bg-success/15">
                                                            Chờ duyệt
                                                        </div>
                                                    </div>
                                                    <p class="mt-1 text-xs text-slate-400 line-clamp-1 dark:text-navy-300">
                                                        <fmt:formatDate value="${item.createdDate}"
                                                                        pattern="yyyy-MM-dd HH:mm"/>
                                                    </p>
                                                    <p class="text-xs+ text-slate-400 line-clamp-1 dark:text-navy-300">
                                                        Sinh viên ${item.student.user.fullName} đã gửi đơn đăng ký đề
                                                        tài!
                                                    </p>
                                                </div>
                                            </div>
                                            <a type="button" href="/admin/topic_approval-${item.student.id}"
                                               class="hover:text-primary focus:text-primary dark:hover:text-accent-light dark:focus:text-accent-light">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none"
                                                     viewbox="0 0 24 24"
                                                     stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-width="2"
                                                          d="M9 5l7 7-7 7"></path>
                                                </svg>
                                            </a>
                                        </div>

                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End tab--%>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    //// xoá class
    function approve(id) {
        $.ajax({
            type: "PUT",
            url: "/api/class/" + id + "/approve",
            data: JSON.stringify(id),
            contentType: "application/JSON",
            dataType: "JSON",

            success: function (respond) {
                console.log(respond.message);
                console.log("Success!");
                toastr.success('Đã cho phép sinh viên gia nhập! ', 'Success');
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

    //// xoá class
    function reject(id) {
        $.ajax({
            type: "PUT",
            url: "/api/class/" + id + "/reject",
            data: JSON.stringify(id),
            contentType: "application/JSON",
            dataType: "JSON",

            success: function (respond) {
                console.log(respond.message);
                console.log("Success!");
                toastr.success('Đã từ chối đơn! ', 'Success');
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

</html>
