<%--
  Created by IntelliJ IDEA.
  User: Trọng Nguyễn
  Date: 3/17/2025
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<!-- Main Content Wrapper -->
<head>
    <title>Danh sách giảng viên</title>
</head>
<main class="main-content w-full px-[var(--margin-x)] pb-8">
    <div class="flex items-center justify-between py-5 lg:py-6">
        <div class="flex items-center space-x-1">
            <h2 class="text-xl font-medium text-slate-700 line-clamp-1 dark:text-navy-50 lg:text-2xl">
                Danh sách giảng viên
            </h2>
            <div x-data="usePopper({placement:'bottom-start',offset:4})"
                 @click.outside="isShowPopper && (isShowPopper = false)" class="inline-flex">
                <button x-ref="popperRef" @click="isShowPopper = !isShowPopper"
                        class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                    <i class="fas fa-chevron-down"></i>
                </button>

                <%--                <div x-ref="popperRoot" class="popper-root" :class="isShowPopper && 'show'">--%>
                <%--                    <div class="popper-box rounded-md border border-slate-150 bg-white py-1.5 font-inter dark:border-navy-500 dark:bg-navy-700">--%>
                <%--                        <ul>--%>
                <%--                            <li>--%>
                <%--                                <a href="#"--%>
                <%--                                   class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">--%>
                <%--                                    <svg xmlns="http://www.w3.org/2000/svg" class="mt-px size-4.5" fill="none"--%>
                <%--                                         viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">--%>
                <%--                                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"></path>--%>
                <%--                                    </svg>--%>
                <%--                                    <span> New User</span></a>--%>
                <%--                            </li>--%>
                <%--                            <li>--%>
                <%--                                <a href="#"--%>
                <%--                                   class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">--%>
                <%--                                    <svg xmlns="http://www.w3.org/2000/svg" class="mt-px size-4.5" fill="none"--%>
                <%--                                         viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">--%>
                <%--                                        <path stroke-linecap="round" stroke-linejoin="round"--%>
                <%--                                              d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path>--%>
                <%--                                    </svg>--%>
                <%--                                    <span>Export Users</span></a>--%>
                <%--                            </li>--%>
                <%--                            <li>--%>
                <%--                                <a href="#"--%>
                <%--                                   class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">--%>
                <%--                                    <svg xmlns="http://www.w3.org/2000/svg" class="mt-px size-4.5" fill="none"--%>
                <%--                                         viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">--%>
                <%--                                        <path stroke-linecap="round" stroke-linejoin="round"--%>
                <%--                                              d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>--%>
                <%--                                        <path stroke-linecap="round" stroke-linejoin="round"--%>
                <%--                                              d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>--%>
                <%--                                    </svg>--%>
                <%--                                    <span>Setting</span></a>--%>
                <%--                            </li>--%>
                <%--                        </ul>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </div>


        <div class="flex items-center space-x-2">
            <label class="relative hidden sm:flex">
                <input class="form-input peer h-9 w-full rounded-full border border-slate-300 bg-transparent px-3 py-2 pl-9 text-xs+ placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                       placeholder="Search users..." type="text">
                <span class="pointer-events-none absolute flex h-full w-10 items-center justify-center text-slate-400 peer-focus:text-primary dark:text-navy-300 dark:peer-focus:text-accent">
                <svg xmlns="http://www.w3.org/2000/svg" class="size-4 transition-colors duration-200"
                     fill="currentColor" viewbox="0 0 24 24">
                  <path d="M3.316 13.781l.73-.171-.73.171zm0-5.457l.73.171-.73-.171zm15.473 0l.73-.171-.73.171zm0 5.457l.73.171-.73-.171zm-5.008 5.008l-.171-.73.171.73zm-5.457 0l-.171.73.171-.73zm0-15.473l-.171-.73.171.73zm5.457 0l.171-.73-.171.73zM20.47 21.53a.75.75 0 101.06-1.06l-1.06 1.06zM4.046 13.61a11.198 11.198 0 010-5.115l-1.46-.342a12.698 12.698 0 000 5.8l1.46-.343zm14.013-5.115a11.196 11.196 0 010 5.115l1.46.342a12.698 12.698 0 000-5.8l-1.46.343zm-4.45 9.564a11.196 11.196 0 01-5.114 0l-.342 1.46c1.907.448 3.892.448 5.8 0l-.343-1.46zM8.496 4.046a11.198 11.198 0 015.115 0l.342-1.46a12.698 12.698 0 00-5.8 0l.343 1.46zm0 14.013a5.97 5.97 0 01-4.45-4.45l-1.46.343a7.47 7.47 0 005.568 5.568l.342-1.46zm5.457 1.46a7.47 7.47 0 005.568-5.567l-1.46-.342a5.97 5.97 0 01-4.45 4.45l.342 1.46zM13.61 4.046a5.97 5.97 0 014.45 4.45l1.46-.343a7.47 7.47 0 00-5.568-5.567l-.342 1.46zm-5.457-1.46a7.47 7.47 0 00-5.567 5.567l1.46.342a5.97 5.97 0 014.45-4.45l-.343-1.46zm8.652 15.28l3.665 3.664 1.06-1.06-3.665-3.665-1.06 1.06z"></path>
                </svg>
              </span>
            </label>

            <div class="flex">
                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25 sm:hidden sm:h-9 sm:w-9">
                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" stroke="currentColor" fill="none"
                         viewbox="0 0 24 24">
                        <circle cx="10.2" cy="10.2" r="7.2" stroke-width="1.5"></circle>
                        <path stroke-width="1.5" stroke-linecap="round" d="M21 21l-3.6-3.6"></path>
                    </svg>
                </button>
                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25 sm:h-9 sm:w-9">
                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24">
                        <path fill="currentColor"
                              d="M3 5.109C3 4.496 3.47 4 4.05 4h16.79c.58 0 1.049.496 1.049 1.109 0 .612-.47 1.108-1.05 1.108H4.05C3.47 6.217 3 5.721 3 5.11zM5.798 12.5c0-.612.47-1.109 1.05-1.109H18.04c.58 0 1.05.497 1.05 1.109s-.47 1.109-1.05 1.109H6.848c-.58 0-1.05-.497-1.05-1.109zM9.646 18.783c-.58 0-1.05.496-1.05 1.108 0 .613.47 1.109 1.05 1.109h5.597c.58 0 1.05-.496 1.05-1.109 0-.612-.47-1.108-1.05-1.108H9.646z"></path>
                    </svg>
                </button>
                <%--        Modal--%>
                <div x-data="{showModal:false}">
                    <button @click="showModal = true"
                            class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25 sm:h-9 sm:w-9">
                        <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24"
                             stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                  d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                        </svg>
                    </button>

                    <template x-teleport="#x-teleport-target">
                        <div class="fixed inset-0 z-[100] flex flex-col items-center justify-center overflow-hidden px-4 py-6 sm:px-5"
                             x-show="showModal"
                             role="dialog"
                             @keydown.window.escape="showModal = false">
                            <div class="absolute inset-0 bg-slate-900/60 transition-opacity duration-300"
                                 @click="showModal = false" x-show="showModal" x-transition:enter="ease-out"
                                 x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
                                 x-transition:leave="ease-in" x-transition:leave-start="opacity-100"
                                 x-transition:leave-end="opacity-0"
                            ></div>
                            <div style="min-width: 800px "
                                 class="relative w-full max-w-2xl origin-bottom rounded-lg bg-white pb-4 transition-all duration-300 dark:bg-navy-700"
                                 x-show="showModal" x-transition:enter="easy-out"
                                 x-transition:enter-start="opacity-0 scale-95"
                                 x-transition:enter-end="opacity-100 scale-100" x-transition:leave="easy-in"
                                 x-transition:leave-start="opacity-100 scale-100"
                                 x-transition:leave-end="opacity-0 scale-95">
                                <div class="flex justify-between rounded-t-lg bg-slate-200 px-4 py-3 dark:bg-navy-800 sm:px-5"
                                >
                                    <h3 class="text-base font-medium text-slate-700 dark:text-navy-100">
                                        Lịch sử đăng ký
                                    </h3>
                                    <button
                                            @click="showModal = !showModal"
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
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M6 18L18 6M6 6l12 12"
                                            ></path>
                                        </svg>
                                    </button>
                                </div>
                                <div class="is-scrollbar-hidden min-w-full overflow-x-auto">
                                    <table class="w-full text-left">
                                        <thead>
                                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                                            <th class="whitespace-nowrap px-3 py-3 font-semibold uppercase text-slate-800 dark:text-navy-100 lg:px-5">
                                                Giảng viên
                                            </th>
                                            <th class="whitespace-nowrap px-3 py-3 font-semibold uppercase text-slate-800 dark:text-navy-100 lg:px-5">
                                                Lớp đăng ký
                                            </th>
                                            <th class="whitespace-nowrap px-3 py-3 font-semibold uppercase text-slate-800 dark:text-navy-100 lg:px-5">
                                                Thời gian đăng ký
                                            </th>
                                            <th class="whitespace-nowrap px-3 py-3 font-semibold uppercase text-slate-800 dark:text-navy-100 lg:px-5">
                                                Status
                                            </th>
                                            <th class="whitespace-nowrap px-3 py-3 font-semibold uppercase text-slate-800 dark:text-navy-100 lg:px-5">
                                                #
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${studentRequest}" var="item">
                                            <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                                                <td class="whitespace-nowrap px-4 py-3 sm:px-5">${item.classEntity.lecturer.user.fullName}</td>
                                                <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                        ${item.classEntity.className}
                                                </td>
                                                <td class="whitespace-nowrap px-4 py-3 sm:px-5"><fmt:formatDate
                                                        value="${item.createdDate}" pattern="yyyy-MM-dd HH:mm"/></td>

                                                <c:choose>
                                                    <c:when test="${item.status.name() == 'Pending'}">
                                                        <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                            <div class="badge space-x-2.5 rounded-full bg-primary/10 text-primary dark:bg-accent-light/15 dark:text-accent-light">
                                                                <div class="size-2 rounded-full bg-current"></div>
                                                                <span>${item.status.name()}</span>
                                                            </div>
                                                        </td>
                                                        <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                        <div x-data="{showModal:false}">
                                                            <button  @click="showModal = true" class="btn size-9 p-0 font-medium text-error hover:bg-error/20 focus:bg-error/20 active:bg-error/25">
                                                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5"
                                                                     fill="none" viewBox="0 0 24 24"
                                                                     stroke="currentColor">
                                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                                          stroke-width="2"
                                                                          d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
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
                                                                                    Message
                                                                                </h2>
                                                                                <p class="mt-2">
                                                                                   Bạn có chắc chắn muốn xoá yêu cầu này không!
                                                                                </p>
                                                                                <button onclick="deleteRegister(${item.id})"
                                                                                @click="showModal = false"
                                                                                        class="btn mt-6 bg-success font-medium text-white hover:bg-success-focus focus:bg-success-focus active:bg-success-focus/90">
                                                                                    Đồng ý
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </template>
                                                            </div>


                                                        </td>
                                                    </c:when>
                                                    <c:when test="${item.status.name() == 'Accepted'}">
                                                        <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                            <div class="badge space-x-2.5 rounded-full border border-success/30 bg-success/10 text-success hover:bg-success/20 focus:bg-success/20 active:bg-success/25">
                                                                <div class="size-2 rounded-full bg-success"></div>
                                                                <span>${item.status.name()}</span>
                                                            </div>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${item.status.name() == 'Rejected'}">
                                                        <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                            <div class="badge space-x-2.5 rounded-full border border-error/30 bg-error/10 text-error hover:bg-error/20 focus:bg-error/20 active:bg-error/25">
                                                                <div class="size-2 rounded-full bg-error"></div>
                                                                <span>${item.status.name()}</span>
                                                            </div>
                                                        </td>
                                                    </c:when>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="text-center">
                                    <button @click="showModal = false"
                                            class="btn mt-4 border border-primary/30 bg-primary/10 font-medium text-primary hover:bg-primary/20 focus:bg-primary/20 active:bg-primary/25 dark:border-accent-light/30 dark:bg-accent-light/10 dark:text-accent-light dark:hover:bg-accent-light/20 dark:focus:bg-accent-light/20 dark:active:bg-accent-light/25"
                                    >
                                        Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </template>
                </div>

                <%--        Modal End--%>
            </div>
        </div>
    </div>
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 sm:gap-5 lg:grid-cols-3 lg:gap-6 xl:grid-cols-4">
        <%--Danh sách giảng viên--%>

        <c:forEach items="${lecturers}" var="item">
            <div x-data="{showModal:false}">
                <div class="card grow items-center p-4 sm:p-5">
                    <div class="avatar size-20">
                        <img class="rounded-full" src="images/avatar/avatar-1.jpg" alt="avatar">
                        <div class="absolute right-0 m-1 size-4 rounded-full border-2 border-white bg-slate-300 dark:border-navy-700"></div>
                    </div>
                    <h3 class="pt-3 text-lg font-medium text-slate-700 dark:text-navy-100">
                            ${item.fullName}
                    </h3>
                    <p class="text-xs+"> ${item.department}</p>
                    <div class="my-4 h-px w-full bg-slate-200 dark:bg-navy-500"></div>
                    <div class="grow space-y-4">
                        <div class="flex items-center space-x-4">
                            <div class="flex h-7 w-7 items-center rounded-lg bg-primary/10 p-2 text-primary dark:bg-accent-light/10 dark:text-accent-light">
                                <i class="fa fa-phone text-xs"></i>
                            </div>
                            <p>(675)-975-0083</p>
                        </div>
                        <div class="flex items-center space-x-4">
                            <div class="flex h-7 w-7 items-center rounded-lg bg-primary/10 p-2 text-primary dark:bg-accent-light/10 dark:text-accent-light">
                                <i class="fa fa-envelope text-xs"></i>
                            </div>
                            <p> ${item.email}</p>
                        </div>
                        <div class="flex items-center space-x-4">
                            <div class="flex h-7 w-7 items-center rounded-lg bg-primary/10 p-2 text-primary dark:bg-accent-light/10 dark:text-accent-light">
                                <i class="fa fa-link text-xs"></i>
                            </div>
                            <p>${item.username}</p>
                        </div>
                    </div>
                    <button @click="showModal = true"
                            class="btn mt-5 space-x-2 rounded-full bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                        <svg xmlns="http://www.w3.org/2000/svg" class="size-4.5" viewbox="0 0 20 20"
                             fill="currentColor">
                            <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                  clip-rule="evenodd"></path>
                        </svg>
                        <span> View Classes </span>
                    </button>
                </div>
                <template x-teleport="#x-teleport-target">
                    <div class="fixed inset-0 z-[100] flex flex-col items-center justify-center overflow-hidden px-4 py-6 sm:px-5"
                         x-show="showModal"
                         role="dialog"
                         @keydown.window.escape="showModal = false">
                        <div
                                class="absolute inset-0 bg-slate-900/60 transition-opacity duration-300"
                                @click="showModal = false"
                                x-show="showModal"
                                x-transition:enter="ease-out"
                                x-transition:enter-start="opacity-0"
                                x-transition:enter-end="opacity-100"
                                x-transition:leave="ease-in"
                                x-transition:leave-start="opacity-100"
                                x-transition:leave-end="opacity-0"></div>
                        <div
                                class="relative w-full max-w-2xl origin-bottom rounded-lg bg-white pb-4 transition-all duration-300 dark:bg-navy-700"
                                x-show="showModal"
                                x-transition:enter="easy-out"
                                x-transition:enter-start="opacity-0 scale-95"
                                x-transition:enter-end="opacity-100 scale-100"
                                x-transition:leave="easy-in"
                                x-transition:leave-start="opacity-100 scale-100"
                                x-transition:leave-end="opacity-0 scale-95">
                            <div class="flex justify-between rounded-t-lg bg-slate-200 px-4 py-3 dark:bg-navy-800 sm:px-5">
                                <h3 class="text-base font-medium text-slate-700 dark:text-navy-100">
                                    Danh sách lớp của giảng viên
                                </h3>
                                <button
                                        @click="showModal = !showModal"
                                        class="btn -mr-1.5 size-7 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         class="size-4.5"
                                         fill="none"
                                         viewBox="0 0 24 24"
                                         stroke="currentColor"
                                         stroke-width="2">
                                        <path stroke-linecap="round"
                                              stroke-linejoin="round"
                                              d="M6 18L18 6M6 6l12 12"></path>
                                    </svg>
                                </button>
                            </div>
                            <div class="is-scrollbar-hidden min-w-full overflow-x-auto">
                                <table class="w-full text-left">
                                    <thead>
                                    <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                                        <th class="whitespace-nowrap px-3 py-3 font-semibold uppercase text-slate-800 dark:text-navy-100 lg:px-5">
                                            #
                                        </th>
                                        <th class="whitespace-nowrap px-3 py-3 font-semibold  text-slate-800 dark:text-navy-100 lg:px-5">
                                            Tên lớp
                                        </th>
                                        <th class="whitespace-nowrap px-3 py-3 font-semibold  text-slate-800 dark:text-navy-100 lg:px-5">
                                            Khóa
                                        </th>
                                        <th class="whitespace-nowrap px-3 py-3 font-semibold  text-slate-800 dark:text-navy-100 lg:px-5">
                                            Sinh viên
                                        </th>
                                        <th class="whitespace-nowrap px-3 py-3 font-semibold  text-slate-800 dark:text-navy-100 lg:px-5">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Status
                                        </th>
                                        <th class="whitespace-nowrap px-3 py-3 font-semibold  text-slate-800 dark:text-navy-100 lg:px-5">
                                            &nbsp;&nbsp;Action
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${item.classes}" var="class1">
                                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">${class1.id}</td>
                                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                    ${class1.className}
                                            </td>
                                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">${class1.semester}</td>
                                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">${class1.student_count}</td>

                                            <c:choose>
                                                <c:when test="${class1.status == 'Unlock'}">
                                                    <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                        <div class="badge space-x-2.5 rounded-full bg-primary/10 text-primary dark:bg-accent-light/15 dark:text-accent-light">
                                                            <div class="size-2 rounded-full bg-current"></div>
                                                            <span>Lớp đang mở</span>
                                                        </div>
                                                    </td>
                                                    <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                        <button
                                                                onclick="register(${class1.id},<%=com.javaweb.security.utils.SecurityUtils.getPrincipal().getId()%>)"
                                                                class="btn bg-success font-medium text-white hover:bg-success-focus focus:bg-success-focus active:bg-success-focus/90">
                                                            Join
                                                        </button>
                                                    </td>
                                                </c:when>
                                                <c:when test="${class1.status == 'Lock'}">
                                                    <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                        <div class="badge space-x-2.5 rounded-full bg-warning/10 text-warning dark:bg-warning/15">
                                                            <div class="size-2 rounded-full bg-current"></div>
                                                            <span>${class1.status}</span>
                                                        </div>
                                                    </td>
                                                    <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                        <button
                                                                disabled
                                                                class="btn bg-slate-150 font-medium text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 disabled:pointer-events-none disabled:select-none disabled:opacity-60 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90"
                                                        >
                                                            Lock
                                                        </button>
                                                    </td>
                                                </c:when>
                                            </c:choose>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="text-center">

                            </div>
                        </div>
                    </div>
                </template>
            </div>
        </c:forEach>
    </div>

    <script>
        //// Thêm yêu cầu gia nhập mới
        function register(id, studentId) {

            var data = {};
            data["id"] = id;
            data["studentId"] = studentId;

            $.ajax({
                type: "POST",
                url: "/api/student-request/class-register",
                data: JSON.stringify(data),
                contentType: "application/JSON",
                dataType: "JSON",

                success: function (respond) {
                    console.log(respond.message);
                    console.log("Success!");
                    toastr.success('Gửi đơn thành công! ', 'Success');
                    setTimeout(function () {
                        window.location.reload(); // Tải lại trang
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

        //// xoá class
        function deleteRegister(id) {

            $.ajax({
                type: "DELETE",
                url: "/api/student-request/delete-" + id,
                data: JSON.stringify(),
                contentType: "application/JSON",
                dataType: "JSON",

                success: function (respond) {
                    console.log(respond.message);
                    console.log("Success!");
                    toastr.success(respond.message, 'Success');
                    setTimeout(function () {
                        window.location.reload(); // Tải lại trang
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
</main>
