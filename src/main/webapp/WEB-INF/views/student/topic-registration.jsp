<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Đăng ký đề tài</title>

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
                Tạo phiếu đăng ký mới
            </h2>
        </div>

        <div class="flex justify-center space-x-2">
            <a type="button" href="/student/home"
               class="btn min-w-[7rem] border border-slate-300 font-medium text-slate-700 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-100 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90">
                Cancel
            </a>
            <button type="button" onclick="addTopicStudent()"
                    class="btn min-w-[7rem] bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                Send
            </button>
        </div>
    </div>
    <div class="grid grid-cols-12 gap-4 sm:gap-5 lg:gap-6">
        <div class="col-span-12 lg:col-span-8">
            <div class="card">
                <div class="tabs flex flex-col">
                    <form:form id="form-add" method="get">
                    <div class="is-scrollbar-hidden overflow-x-auto">
                        <div class="border-b-2 border-slate-150 dark:border-navy-500">
                            <div class="tabs-list -mb-0.5 flex">
                                <button class="btn h-14 shrink-0 space-x-2 rounded-none border-b-2 border-primary px-4 font-medium text-primary dark:border-accent dark:text-accent-light sm:px-5">
                                    <i class="fa-solid fa-layer-group text-base"></i>
                                    <span>Đăng ký đề tài</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="tab-content p-4 sm:p-5">
                        <div class="space-y-5">
                            <input type="hidden" value="<%=SecurityUtils.getPrincipal().getId()%>" name="studentId">
                            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                                <label class="block">
                                    <span class="font-medium text-slate-600 dark:text-navy-100">Tên đề tài</span>
                                    <select name="title1" class="mt-1.5 w-full"
                                            x-init="$el._tom = new Tom($el,{create: true,sortField: {field: 'text',direction: 'asc'}})">
                                        <option value="Xây dựng Website">Xây dựng Website</option>
                                        <option value="Xây dựng ứng dụng Website">Xây dựng ứng dụng Website</option>
                                        <option value="Xây dựng ứng dụng Desktop">Xây dựng ứng dụng Desktop</option>
                                        <option value="Nghiên cứu và phát triển">Nghiên cứu và phát triển</option>
                                    </select>
                                </label>
                                <label class="block">
                                    <span class="font-medium text-slate-600 dark:text-navy-100">-----</span>
                                    <input class="mt-1.5 form-input w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                           name="title2"
                                           type="text"/>
                                </label>
                            </div>

                            <label class="block">
                                <span class="font-medium text-slate-600 dark:text-navy-100">Loại đề tài</span>
                                <select name="category" class="mt-1.5 w-full"
                                        x-init="$el._tom = new Tom($el,{create: true,sortField: {field: 'text',direction: 'asc'}})">
                                    <option value="Doanh nghiệp thực tế">Cho doanh nghiệp thực tế</option>
                                    <option value="Trường học">Cho trường học</option>
                                    <option value="Tổ chức chính phủ">Cho tổ chức chính phủ</option>
                                    <option value="Mô hình giả lập">Mô hình giả lập</option>
                                    <option value="Other">Other</option>
                                </select>
                            </label>
                            <label class="block">
                                <span class="font-medium text-slate-600 dark:text-navy-100">Các công nghệ sử dụng</span>
                                <label class="block">
                                    <select name="technologies"
                                            x-init="$el._tom = new Tom($el)"
                                            class="mt-1.5 w-full"
                                            multiple
                                            placeholder="Select a state..."
                                            autocomplete="off"
                                    >
                                        <option value="">-- Chọn công nghệ sử dụng --</option>

                                        <!-- Frontend -->
                                        <option value="HTML/CSS/JS">HTML/CSS/JavaScript</option>
                                        <option value="ReactJS">ReactJS</option>
                                        <option value="VueJS">VueJS</option>
                                        <option value="Angular">Angular</option>
                                        <option value="Bootstrap">Bootstrap</option>
                                        <option value="TailwindCSS">TailwindCSS</option>

                                        <!-- Backend -->
                                        <option value="Java">Java</option>
                                        <option value="Spring Boot">Spring Boot</option>
                                        <option value="NodeJS">NodeJS</option>
                                        <option value="PHP">PHP</option>
                                        <option value="Laravel">Laravel</option>
                                        <option value=".NET">.NET</option>
                                        <option value="Python">Python</option>
                                        <option value="Django">Django</option>
                                        <option value="Flask">Flask</option>

                                        <!-- Database -->
                                        <option value="MySQL">MySQL</option>
                                        <option value="PostgreSQL">PostgreSQL</option>
                                        <option value="MongoDB">MongoDB</option>
                                        <option value="SQLite">SQLite</option>
                                        <option value="Oracle">Oracle</option>

                                        <!-- Mobile -->
                                        <option value="React Native">React Native</option>
                                        <option value="Flutter">Flutter</option>
                                        <option value="Kotlin">Kotlin</option>
                                        <option value="Java Android">Java Android</option>
                                        <option value="Swift">Swift</option>

                                        <!-- DevOps / Tools -->
                                        <option value="Docker">Docker</option>
                                        <option value="Git/GitHub">Git / GitHub</option>
                                        <option value="CI/CD">CI/CD</option>
                                        <option value="Firebase">Firebase</option>

                                        <!-- AI / Machine Learning -->
                                        <option value="Python AI">Python (AI/ML)</option>
                                        <option value="TensorFlow">TensorFlow</option>
                                        <option value="Scikit-learn">Scikit-learn</option>
                                        <option value="OpenCV">OpenCV</option>
                                    </select>
                                </label>
                            </label>
                             <span class="font-medium text-slate-600 dark:text-navy-100">Mô tả về đề tài</span>
                                <textarea rows="4" placeholder=" Enter Text" name="description"
                                          class="form-textarea w-full resize-none rounded-lg bg-slate-150 p-2.5 placeholder:text-slate-400 dark:bg-navy-900 dark:placeholder:text-navy-300"
                                ></textarea>

                        </div>
                    </div>
                    </form:form>
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
                                <span>Đề tài gợi ý</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="is-scrollbar-hidden min-w-full overflow-x-auto rounded-lg border border-slate-200 dark:border-navy-500">
                    <table class="w-full text-left text-xs">
                        <thead>
                        <tr>
                            <th style="width: 20px"
                                class="whitespace-nowrap border border-t-0 border-l-0 border-slate-200 px-3 py-3 font-semibold uppercase text-slate-800 dark:border-navy-500 dark:text-navy-100 lg:px-5">
                                #
                            </th>
                            <th class="whitespace-nowrap border border-t-0 border-slate-200 px-3 py-3 font-semibold uppercase text-slate-800 dark:border-navy-500 dark:text-navy-100 lg:px-5">
                                Tên đề tài
                            </th>

                        </tr>
                        </thead>
                        <tbody class="text-xs+">
                        <tr>
                            <td class="whitespace-nowrap border border-l-0 border-slate-200 px-3 py-3 dark:border-navy-500 lg:px-5">
                                1
                            </td>
                            <td class="whitespace-nowrap border border-slate-200 px-3 py-3 dark:border-navy-500 lg:px-5">
                                Ứng dụng quản lý quán cà phê
                            </td>
                        </tr>
                        <tr>
                            <td class="whitespace-nowrap border border-l-0 border-slate-200 px-3 py-3 dark:border-navy-500 lg:px-5">
                                2
                            </td>
                            <td class="whitespace-nowrap border border-slate-200 px-3 py-3 dark:border-navy-500 lg:px-5">
                                Hệ thống đăng ký học phần online
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-10 ml-4 flex items-center justify-between">
        <h2 class="text-base font-medium tracking-wide text-slate-700 line-clamp-1 dark:text-navy-100">
            Thông tin đề tài đã đăng ký
        </h2>
    </div>
    <%--    Bảng thông tin --%>
    <div class="mt-4 grid grid-cols-12 gap-4 sm:mt-5 sm:gap-5 lg:mt-6 lg:gap-6">
        <div class="card mt-3 lg:col-span-8 xl:col-span-8">
            <div class="is-scrollbar-hidden min-w-full overflow-x-auto">
                <table class="is-hoverable w-full text-left">
                    <thead>
                    <tr>
                        <th class="whitespace-nowrap rounded-tl-lg bg-slate-200 px-6 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                            Tên đề tài
                        </th>
                        <th class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                            Ngày tạo
                        </th>
                        <th class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                            Trạng thái
                        </th>
                        <th class="whitespace-nowrap rounded-tr-lg bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${topicRegisterList}">
                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <a href="#" class="hover:underline focus:underline"> ${item.title}
                                </a>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 font-medium text-slate-600 dark:text-navy-100 sm:px-5">
                                <fmt:formatDate value="${item.createdDate}" pattern="yyyy-MM-dd HH:mm"/>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <c:choose>
                                    <c:when test="${item.status.name() == 'Pending'}">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="ml-4 size-5" fill="none"
                                             viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                                  d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                        </svg>
                                    </c:when>

                                    <c:when test="${item.status.name() == 'Rejected'}">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="ml-4 size-5 text-error"
                                             fill="none"
                                             viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                                  d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                        </svg>
                                    </c:when>

                                    <c:when test="${item.status.name() == 'Accepted'}">
                                        <div class="flex size-6 items-center justify-center rounded-lg bg-success/10 text-success dark:bg-success/15"
                                             style="margin-left: 14px;">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none"
                                                 viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                                                <path d="M12.5293 18L20.9999 8.40002" stroke-linecap="round"
                                                      stroke-linejoin="round"></path>
                                                <path d="M3 13.2L7.23529 18L17.8235 6" stroke-linecap="round"
                                                      stroke-linejoin="round"></path>
                                            </svg>
                                        </div>
                                    </c:when>
                                </c:choose>

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
                                                <div x-data="{activeTab:'tabProfile'}" class="tabs flex flex-col">
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
                                                                    <span>Chi tiết</span>
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
                                                                    <span>Trạng thái</span>
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
                                                                <div>
                                                                    <p style="min-width: 500px" class="text-xs text-slate-400 dark:text-navy-300">
                                                                        Topic Name:
                                                                    </p>
                                                                    <h3 class="text-lg font-medium text-slate-700 dark:text-navy-100">
                                                                            ${item.title}
                                                                    </h3>

                                                                </div>
                                                                <div class="space-y-3 text-xs+">
                                                                    <div class="flex justify-between">
                                                                        <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                            Công nghệ sử dụng:
                                                                        </p>
                                                                        <p class="ml-4 text-right">${item.technologies}</p>
                                                                    </div>
                                                                    <div class="flex justify-between">
                                                                        <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                            Loại đề tài:
                                                                        </p>
                                                                        <p class="text-right">${item.category}</p>
                                                                    </div>
                                                                    <div class="flex justify-between">
                                                                        <p class="font-medium text-slate-700 dark:text-navy-100">
                                                                            Register Date:
                                                                        </p>
                                                                        <p class="pb-4 text-right"><fmt:formatDate
                                                                                value="${item.createdDate}"
                                                                                pattern="yyyy-MM-dd HH:mm"/></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div x-show="activeTab === 'tabProfile'"
                                                             x-transition:enter="transition-all duration-500 easy-in-out"
                                                             x-transition:enter-start="opacity-0 [transform:translate3d(1rem,0,0)]"
                                                             x-transition:enter-end="opacity-100 [transform:translate3d(0,0,0)]">


                                                                <%--    card--%>
                                                            <div>
                                                                <p style="min-width: 400px" class=" text-xs text-slate-400 dark:text-navy-300">
                                                                    Trạng thái:
                                                                </p>

                                                                <c:choose>
                                                                    <c:when test="${item.status.name() == 'Pending'}">
                                                                        <div class="ml-4 mt-1 badge bg-info/10 text-info dark:bg-info/15">
                                                                            Đang chờ duyệt
                                                                        </div>
                                                                    </c:when>

                                                                    <c:when test="${item.status.name() == 'Rejected'}">
                                                                        <div class=" ml-4 mt-1 badge bg-error/10 text-error dark:bg-error/15">
                                                                            Bị từ chối
                                                                        </div>
                                                                    </c:when>

                                                                    <c:when test="${item.status.name() == 'Accepted'}">
                                                                        <div class=" ml-4 mt-1 badge bg-success/10 text-success dark:bg-success/15">
                                                                            Được thông qua
                                                                        </div>
                                                                    </c:when>
                                                                </c:choose>
                                                                <h3 class="pb-1 mt-4 text-lg font-medium text-slate-700 dark:text-navy-100">
                                                                    Comment:
                                                                </h3>
                                                            </div>
                                                            <c:choose>
                                                                <c:when test="${item.comment != '' && item.comment != null }">
                                                                    <div class="card bg-primary p-4 dark:bg-accent">
                                                                        <div class="flex items-center space-x-3">
                                                                            <div class="flex">
                                                                                <div class="avatar">
                                                                                    <img class="rounded-full"
                                                                                         src="images/avatar/avatar-20.jpg"
                                                                                         alt="avatar">
                                                                                </div>
                                                                            </div>
                                                                            <div>
                                                                                <p class="font-medium text-white">${item.modifiedBy}</p>
                                                                                <p class="text-xs text-indigo-100">${item.modifiedDate}</p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="mt-2">
                                                                            <p class="text-xs+ text-indigo-100"
                                                                               style="min-width: 400px">
                                                                                    ${item.comment}
                                                                            </p>
                                                                        </div>
                                                                        <div class="pt-2">
<%--                                                                            <div class="badge rounded-full border border-white text-white">--%>
<%--                                                                                Tag 1--%>
<%--                                                                            </div>--%>
                                                                        </div>
                                                                    </div>
                                                                    <e
                                                                </c:when>
                                                                <c:when test="${item.comment == '' || item.comment == null }">
                                                                    <p class=" text-xs text-slate-400 dark:text-navy-300">
                                                                        Chưa có comment !
                                                                    </p>
                                                                </c:when>
                                                            </c:choose>


                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="mt-4 text-right">
                                                    <button class="btn h-8 rounded-full text-xs+ font-medium text-slate-700 hover:bg-slate-300/20 active:bg-slate-300/25 dark:text-navy-100 dark:hover:bg-navy-300/20 dark:active:bg-navy-300/25">
                                                        Cancel
                                                    </button>
                                                    <button @click="showModal = false"
                                                            class="btn h-8 rounded-full bg-primary text-xs+ font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                                                        Apply
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
</main>
<script>

    function addTopicStudent() {
        var data = {};
        var formData = $('#form-add').serializeArray();

        //Xử lý tên đề tài
        var title1 = $('select[name="title1"]').val();
        var title2 = $('input[name="title2"]').val();
        var title = '';
        if (title2 !== '') {
            title = title1 + ' ' + title2;
        }

        data['title'] = title;
        $.each(formData, function (index, value) {
            if (data[value.name]) {
                data[value.name] += ', ' + value.value;  // Nối thêm bằng dấu phẩy
            } else {
                data[value.name] = value.value;
            }
        });
        //Call api
        $.ajax({
            type: "POST",
            url: "/api/student-request/topic-register",
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
