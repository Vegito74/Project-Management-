<%--
  Created by IntelliJ IDEA.
  User: Trọng Nguyễn
  Date: 5/24/2025
  Time: 2:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Quản lý đề tài</title>
</head>
<body>
<!-- Main Content Wrapper -->
<main class="main-content w-full px-[var(--margin-x)] pb-8">
    <div class="flex flex-col items-center justify-between space-y-4 py-5 sm:flex-row sm:space-y-0 lg:py-6">
        <div class="flex items-center space-x-1">
            <svg xmlns="http://www.w3.org/2000/svg" class="size-6" fill="none" viewbox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
            </svg>
            <h2 class="text-xl font-medium text-slate-700 line-clamp-1 dark:text-navy-50">
                Quan lý đề tài
            </h2>
        </div>
        <div class="flex justify-center space-x-2">
            <button class="btn min-w-[7rem] border border-slate-300 font-medium text-slate-700 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-100 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90">
                Preview
            </button>
            <button class="btn min-w-[7rem] bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                Save
            </button>
        </div>
    </div>
    <div class="grid grid-cols-12 gap-4 sm:gap-5 lg:gap-6">
        <div class="col-span-12 lg:col-span-7">
            <div class="card">
                <div class="tabs flex flex-col">
                    <div class="is-scrollbar-hidden overflow-x-auto">
                        <div class="border-b-2 border-slate-150 dark:border-navy-500">
                            <div class="tabs-list -mb-0.5 flex">
                                <button class="btn h-14 shrink-0 space-x-2 rounded-none border-b-2 border-primary px-4 font-medium text-primary dark:border-accent dark:text-accent-light sm:px-5">
                                    <i class="fa-solid fa-layer-group text-base"></i>
                                    <span>Đề tài của sinh viên</span>
                                </button>
                                <%--<button class="btn h-14 shrink-0 space-x-2 rounded-none border-b-2 border-transparent px-4 font-medium hover:text-slate-800 focus:text-slate-800 dark:hover:text-navy-100 dark:focus:text-navy-100 sm:px-5">
                                    <i class="fa-solid fa-tags text-base"></i>
                                    <span>Meta Tags</span>
                                </button>
                                <button class="btn h-14 shrink-0 space-x-2 rounded-none border-b-2 border-transparent px-4 font-medium hover:text-slate-800 focus:text-slate-800 dark:hover:text-navy-100 dark:focus:text-navy-100 sm:px-5">
                                    <i class="fa-solid fa-bars-staggered text-base"></i>
                                    <span> Keywords </span>
                                </button>--%>

                            </div>
                        </div>

                    </div>
                    <div class="tab-content p-4 sm:p-5">
                        <div class="space-y-5">
                            <%--    Bảng thông tin --%>
                                <div class="card mt-3 lg:col-span-8 xl:col-span-8">

                                    <span for="classFilter">Lớp học</span>
                                    <div class="flex justify-between">
                                        <select id="classFilter" onchange="filterTableByClass()"
                                            class=" form-select mt-1.5 w-1/2 rounded-lg border border-slate-300 bg-white px-3 py-2 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:bg-navy-700 dark:hover:border-navy-400 dark:focus:border-accent">
                                        <option value="">Tất cả</option>
                                        <c:forEach var="item" items="${classList}">
                                            <option value="${item.className}">${item.className}</option>
                                        </c:forEach>
                                    </select>
                                    <label class=" w-1/4 mt-2">
                                        <input class="  form-input w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                                                placeholder="Tìm kiếm tên đề tài"
                                               type="text" id="searchTitle" onkeyup="filterTable()"
                                        />
                                    </label>
                                        </div>
                                    <script>
                                        function filterTable() {
                                            const classFilter = document.getElementById("classFilter").value.trim().toLowerCase();
                                            const titleFilter = document.getElementById("searchTitle").value.trim().toLowerCase();
                                            const table = document.getElementById("myTable");
                                            const rows = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
                                            let visibleRowCount = 0;

                                            for (let i = 0; i < rows.length; i++) {
                                                if (rows[i].id === "noResultsRow") continue;

                                                const titleCell = rows[i].cells[1]; // cột "Tên đề tài"
                                                const classCell = rows[i].cells[4]; // cột "Lớp"

                                                const titleText = titleCell ? titleCell.textContent.trim().toLowerCase() : "";
                                                const classText = classCell ? classCell.textContent.trim().toLowerCase() : "";

                                                const matchClass = classFilter === "" || classText === classFilter;
                                                const matchTitle = titleFilter === "" || titleText.includes(titleFilter);

                                                const shouldShow = matchClass && matchTitle;

                                                rows[i].style.display = shouldShow ? "" : "none";
                                                if (shouldShow) visibleRowCount++;
                                            }

                                            document.getElementById("noResultsRow").style.display = visibleRowCount === 0 ? "" : "none";
                                        }

                                        // Gọi lại filter khi chọn lớp
                                        function filterTableByClass() {
                                            filterTable();
                                        }
                                    </script>
                                    <div class="mt-5 is-scrollbar-hidden min-w-full overflow-x-auto overflow-y-auto max-h-96">
                                        <table id="myTable" class=" display is-hoverable w-full text-left min-w-full table-auto ">
                                            <thead class="sticky top-0  z-10">
                                            <tr>
                                                <th class="whitespace-nowrap rounded-tl-lg bg-slate-200 px-6 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                                    #
                                                </th>
                                                <th class="whitespace-nowrap rounded-tl-lg bg-slate-200 px-6 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                                    Tên đề tài
                                                </th>
                                                <th style="width: 15%"
                                                    class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                                    Sinh viên thực hiện
                                                </th>
                                                <th style="width: 15%"
                                                    class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                                    Người duyệt
                                                </th>
                                                <th style="width: 10%"
                                                    class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                                    Lớp
                                                </th>
                                                <th style="width: 10%"
                                                    class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                                    Thời gian đăng ký
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
                                                    <td class="whitespace-nowrap px-4 py-3 font-medium text-slate-600 dark:text-navy-100 sm:px-5">
                                                            ${item.className}
                                                    </td>
                                                    <td class="whitespace-nowrap px-4 py-3 font-medium text-slate-600 dark:text-navy-100 sm:px-5">
                                                        <fmt:formatDate value="${item.modifiedDate}"
                                                                        pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <!-- Dòng thông báo khi không tìm thấy -->
                                            <tr id="noResultsRow" style="display: none;">
                                                <td colspan="4" class="text-center text-slate-500">Không tìm thấy kết quả</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <script>
                                            function filterTableByClass() {
                                                const filter = document.getElementById("classFilter").value.toLowerCase();
                                                const table = document.getElementById("myTable");
                                                const rows = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
                                                let visibleRowCount = 0;

                                                for (let i = 0; i < rows.length; i++) {
                                                    // Bỏ qua dòng thông báo "Không tìm thấy kết quả"
                                                    if (rows[i].id === "noResultsRow") continue;

                                                    const classCell = rows[i].cells[4];
                                                    if (classCell) {
                                                        const classText = classCell.textContent.trim().toLowerCase();
                                                        const shouldShow = filter === "" || classText === filter;

                                                        rows[i].style.display = shouldShow ? "" : "none";
                                                        if (shouldShow) visibleRowCount++;
                                                    }
                                                }

                                                // Ẩn/hiện dòng "Không tìm thấy kết quả"
                                                document.getElementById("noResultsRow").style.display = visibleRowCount === 0 ? "" : "none";
                                            }
                                        </script>

                                    </div>
                                </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-span-12 lg:col-span-5">
            <div class="card">
                <div class="tabs flex flex-col">
                    <div class="is-scrollbar-hidden overflow-x-auto">
                        <div class="border-b-2 border-slate-150 dark:border-navy-500">
                            <div class="tabs-list -mb-0.5 flex">
                                <button class="btn h-14 shrink-0 space-x-2 rounded-none border-b-2 border-primary px-4 font-medium text-primary dark:border-accent dark:text-accent-light sm:px-5">
                                    <i class="fa-solid fa-layer-group text-base"></i>
                                    <span>Đề tài gợi ý</span>
                                </button>
                                <%--<button class="btn h-14 shrink-0 space-x-2 rounded-none border-b-2 border-transparent px-4 font-medium hover:text-slate-800 focus:text-slate-800 dark:hover:text-navy-100 dark:focus:text-navy-100 sm:px-5">
                                    <i class="fa-solid fa-tags text-base"></i>
                                    <span>Meta Tags</span>
                                </button>
                                <button class="btn h-14 shrink-0 space-x-2 rounded-none border-b-2 border-transparent px-4 font-medium hover:text-slate-800 focus:text-slate-800 dark:hover:text-navy-100 dark:focus:text-navy-100 sm:px-5">
                                    <i class="fa-solid fa-bars-staggered text-base"></i>
                                    <span> Keywords </span>
                                </button>--%>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content p-4 sm:p-5">
                        <div class="space-y-5">
                            <%--    Bảng thông tin --%>
                            <div class="card mt-3 lg:col-span-8 xl:col-span-8">
                                <div class="is-scrollbar-hidden min-w-full overflow-x-auto overflow-y-auto max-h-96">
                                    <table id="myTable1" class=" display is-hoverable w-full text-left min-w-full table-auto ">
                                        <thead class="sticky top-0  z-10">
                                        <tr>
                                            <th class="whitespace-nowrap rounded-tl-lg bg-slate-200 px-6 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                                #
                                            </th>
                                            <th class="whitespace-nowrap rounded-tl-lg bg-slate-200 px-6 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                                Tên đề tài
                                            </th>
                                            <th style="width: 30%"
                                                class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold  text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                                Mô tả
                                            </th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${topics}" varStatus="status">
                                            <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                                                <td class="whitespace-nowrap px-4 py-3 font-medium text-slate-600 dark:text-navy-100 sm:px-5">
                                                        ${status.index +1}
                                                </td>
                                                <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                                        ${item.topicDescription}
                                                </td>
                                                <td class="whitespace-nowrap px-4 py-3 font-medium text-slate-600 dark:text-navy-100 sm:px-5">

                                                        ${item.topicName}
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
