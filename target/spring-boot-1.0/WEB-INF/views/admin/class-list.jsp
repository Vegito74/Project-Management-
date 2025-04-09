<%--
  Created by IntelliJ IDEA.
  User: Trọng Nguyễn
  Date: 3/23/2025
  Time: 7:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Lớp học</title>
</head>
<body>
<!-- Main Content Wrapper -->
<main class="main-content w-full px-[var(--margin-x)] pb-8">
    <div class="flex items-center justify-between py-5 lg:py-6">
        <div class="group flex items-center space-x-1">
            <h2 class="text-xl font-medium text-slate-700 line-clamp-1 dark:text-navy-50 lg:text-2xl">
                Danh sách lớp học
            </h2>
            <div x-data="usePopper({placement:'bottom-start',offset:4})"
                 @click.outside="isShowPopper && (isShowPopper = false)" class="inline-flex">
                <button x-ref="popperRef" @click="isShowPopper = !isShowPopper"
                        class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                    <i class="fas fa-chevron-down"></i>
                </button>
                <div x-ref="popperRoot" class="popper-root" :class="isShowPopper && 'show'">
                    <div class="popper-box rounded-md border border-slate-150 bg-white py-1.5 font-inter dark:border-navy-500 dark:bg-navy-700">
                        <ul>
                            <li>
                                <%--  Modal--%>
                                <div x-data="{showModal:false}">
                                    <a type="button" @click="showModal = true"
                                       class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="mt-px size-4.5" fill="none"
                                             viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M12 4v16m8-8H4"></path>
                                        </svg>
                                        <span> New User</span></a>
                                    <template x-teleport="#x-teleport-target">
                                        <div
                                                class="fixed inset-0 z-[100] flex flex-col items-center justify-center overflow-hidden px-4 py-6 sm:px-5"
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
                                                    x-transition:leave-end="opacity-0 scale-95">
                                                <div
                                                        class="flex justify-between rounded-t-lg bg-slate-200 px-4 py-3 dark:bg-navy-800 sm:px-5">
                                                    <h3 class="text-base font-medium text-slate-700 dark:text-navy-100">
                                                        Add New Class
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
                                                                stroke-width="2">
                                                            <path
                                                                    stroke-linecap="round"
                                                                    stroke-linejoin="round"
                                                                    d="M6 18L18 6M6 6l12 12"></path>
                                                        </svg>
                                                    </button>
                                                </div>

                                                <form:form modelAttribute="classModel"  id="form-add" method="POST" >
                                                <div class="px-4 py-4 sm:px-5">
                                                    <div class="mt-4 space-y-4">
                                                        <!-- Hidden input để lưu id giảng viên -->
                                                        <input type="hidden" id="lecturerId" name="lecturerId" value="<%=SecurityUtils.getPrincipal().getId()%>"/>
                                                        <label class="block">
                                                            <span>Giảng viên</span>:</span>
                                                            <input
                                                                    disabled
                                                                    class="form-input w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary disabled:pointer-events-none disabled:select-none disabled:border-none disabled:bg-zinc-100 dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent dark:disabled:bg-navy-600"
                                                                    placeholder="Class name"
                                                                    id="lecturerName"
                                                                    name="lecturerName"
                                                                    type="text"
                                                                    value="<%=SecurityUtils.getPrincipal().getFullName()%>"
                                                            />
                                                        </label>
                                                        <label class="block">
                                                            <span>Tên lớp</span>:</span>
                                                            <input
                                                                    class="form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                                                    placeholder="Class name"
                                                                    id="className"
                                                                    name="className"
                                                                    type="text"
                                                            />
                                                        </label>
                                                        <label class="block">
                                                            <span>Khoá:</span>

                                                             <form:select path="semester" class="form-select mt-1.5 w-full rounded-lg border border-slate-300 bg-white px-3 py-2 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:bg-navy-700 dark:hover:border-navy-400 dark:focus:border-accent">
                                                                    <form:options items="${semesterList}"/>
                                                              </form:select>
                                                        </label>


                                                        <label class="inline-flex items-center space-x-2">
                                                            <input
                                                                    id="status"
                                                                    name="status"
                                                                    class="form-switch is-outline h-5 w-10 rounded-full border border-slate-400/70 bg-transparent before:rounded-full before:bg-slate-300 checked:border-primary checked:before:bg-primary dark:border-navy-400 dark:before:bg-navy-300 dark:checked:border-accent dark:checked:before:bg-accent"
                                                                    type="checkbox"/>
                                                            <span>Lock Class</span>
                                                        </label>
                                                        </form:form>
                                                        <div class="space-x-2 text-right">
                                                            <button
                                                                     type="button"
                                                                    @click="showModal = false"
                                                                    class="btn min-w-[7rem] rounded-full border border-slate-300 font-medium text-slate-800 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-50 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90">
                                                                Cancel
                                                            </button>
                                                            <button
                                                                    type="button"
                                                                    id="btnAddClass1"

                                                                    class="btn min-w-[7rem] rounded-full bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                                                                Apply
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </template>
                                </div>
                            </li>
                            <li>
                                <a href="#"
                                   class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="mt-px size-4.5" fill="none"
                                         viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path>
                                    </svg>
                                    <span>Export Users</span></a>
                            </li>
                            <li>
                                <a href="#"
                                   class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="mt-px size-4.5" fill="none"
                                         viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                    </svg>
                                    <span>Setting</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
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
                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25 sm:h-9 sm:w-9">
                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24"
                         stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                              d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                              d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                </button>
            </div>
        </div>
    </div>
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 sm:gap-5 lg:grid-cols-3 lg:gap-6 xl:grid-cols-4">
      <c:forEach var="item" items="${listClass}">
        <div class="card">
            <div class="h-24 rounded-t-lg bg-primary dark:bg-accent">
                <img class="h-full w-full rounded-t-lg object-cover object-center" src="images/object/object-2.jpg"
                     alt="image">
            </div>
            <div class="px-4 py-2 sm:px-5">
                <div class="flex justify-between space-x-4">
                    <div class="avatar -mt-12 size-20">
                        <img class="mask is-hexagon-2 border-2 border-white dark:border-navy-700"
                             src="images/others/design-sm.jpg" alt="avatar">
                    </div>
                    <div class="flex space-x-2">
                        <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                            <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24"
                                 stroke="currentColor" stroke-width="1.5">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                            </svg>
                        </button>
                        <button onclick="deleteClass(${item.id})" class="btn size-9 p-0 font-medium text-error hover:bg-error/20 focus:bg-error/20 active:bg-error/25">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                 class="size-5"
                                 fill="none"
                                 viewBox="0 0 24 24"
                                 stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                            </svg>
                        </button>
                    </div>
                </div>

                <h3 class="pt-2 text-lg font-medium text-slate-700 dark:text-navy-100">
                    ${item.className} - ${item.semester}
                </h3>
                <p class="text-xs">${item.status}</p>
                <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 sm:gap-5 lg:gap-6">
                    <div class="flex items-center space-x-4 pt-2 mt-4 justify-center">
                        <div class="flex items-center space-x-4 rounded-2xl border border-slate-150 p-4 dark:border-navy-600 ">
                            <div class="mask is-star-2 flex size-12 items-center justify-center bg-warning/10 dark:bg-warning">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-6 text-warning dark:text-white"
                                     fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                </svg>
                            </div>
                            <div class="font-inter pl-3 pr-2">
                                <p class="text-base font-semibold text-slate-700 dark:text-navy-100">
                                    ${item.student_count}
                                </p>
                                <p>Student</p>
                            </div>
                        </div>
                    </div>
                    <div class="flex items-center space-x-4 pt-2 mt-4 justify-center">
                        <div class="flex items-center space-x-4 rounded-2xl border border-slate-150 p-4 dark:border-navy-600 ">
                            <div class="mask is-star-2 flex size-12 items-center justify-center bg-primary/10 dark:bg-accent">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-6 text-primary dark:text-white"
                                     fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                </svg>
                            </div>
                            <div class="font-inter pl-4">
                                <p class="text-base font-semibold text-slate-700 dark:text-navy-100">
                                    ${item.assignment_count}
                                </p>
                                <p>All Posts</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex divide-x divide-slate-150 border-t border-slate-150 dark:divide-navy-500 dark:border-navy-500 mt-4">
                <a type="button" href="class${item.id}-manage"
                class="btn h-11 w-full rounded-none rounded-bl-lg font-medium text-slate-700 hover:bg-slate-300/20 active:bg-slate-300/25 dark:text-navy-100 dark:hover:bg-navy-300/20 dark:active:bg-navy-300/25">
                    Manage
                </a>
                <a type="button" href="assignment-list${item.id}"
                   class="btn h-11 w-full rounded-none rounded-br-lg font-medium text-primary hover:bg-primary/20 focus:bg-primary/20 active:bg-primary/25 dark:text-accent-light dark:hover:bg-accent-light/20 dark:focus:bg-accent-light/20 dark:active:bg-accent-light/25">
                    Assignment
                </a>
            </div>
        </div>
      </c:forEach>
    </div>

</main>
<script>
    $(document).ready(function () {
        $('#btnAddClass1').click(function () {
            var data = {};
            var formData = $('#form-add').serializeArray();
            $.each(formData, function (index, value) {
                data["" + value.name + ""] = value.value;
            });
            // Lấy giá trị checkbox và cập nhật vào data
            data["status"] = $('#status').prop('checked') ? 'Lock' : 'Unlock'; // Đảm bảo giá trị là 'Lock' hoặc 'Unlock'

            addClass(data);
        });

        function addClass(data) {
            //Call api
            $.ajax({
                type: "POST",
                url: "/api/class",
                data: JSON.stringify(data),
                contentType: "application/JSON",
                dataType: "JSON",
                success: function () {
                    // Hiển thị thông báo thành công với Toastr
                    toastr.success("Thêm thành công", 'Success', {
                        closeButton: true,   // Thêm nút đóng thông báo
                        progressBar: true,   // Hiển thị thanh tiến trình
                        timeOut: 1500,
                    });

                    // Sau khi thông báo thành công, tải lại trang sau 3 giây
                    setTimeout(function() {
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
    });


//// xoá class
    function deleteClass(id) {
        $.ajax({
            type: "DELETE",
            url: "/api/class/"+ id +"/delete",
            data: JSON.stringify(id),
            contentType: "application/JSON",
            dataType: "JSON",

            success: function (respond) {
                console.log(respond.message);
                console.log("Success!");
                toastr.success('Xoá thành công lớp! ', 'Success');
                setTimeout(function() {
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

