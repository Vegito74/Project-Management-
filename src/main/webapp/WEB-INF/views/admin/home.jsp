<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Trang chủ</title>
</head>

<body>
<!-- Main Content Wrapper -->
<main class="main-content w-full px-[var(--margin-x)] pb-8">
    <div class="mt-4 grid grid-cols-12 gap-4 sm:mt-5 sm:gap-5 lg:mt-6 lg:gap-6">
        <div class="col-span-12 lg:col-span-8 xl:col-span-9">
            <div :class="$store.breakpoints.smAndUp && 'via-purple-300'"
                 class="card mt-12 bg-gradient-to-l from-pink-300 to-indigo-400 p-5 sm:mt-0 sm:flex-row">
                <div class="flex justify-center sm:order-last">
                    <img class="-mt-16 h-40 sm:mt-0" src="images/illustrations/teacher.svg" alt="">
                </div>
                <div class="mt-2 flex-1 pt-2 text-center text-white sm:mt-0 sm:text-left">
                    <h3 class="text-xl">
                        Welcome Back, <span class="font-semibold">Nguyễn Văn Trọng</span>
                    </h3>
                    <p class="mt-2 leading-relaxed">
                        Tiến độ công việc mà bạn đã hoàn thành là
                        <span class="font-semibold text-navy-700">85%</span>
                    </p>
                    <p>Progress is <span class="font-semibold">excellent!</span></p>
                    <a type="button" href="class-list"
                       class="btn mt-6 bg-slate-50 font-medium text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80">
                        Quản lý
                    </a>
                </div>
            </div>

            <div class="mt-4 sm:mt-5 lg:mt-6">
                <div class="flex h-8 items-center justify-between">
                    <h2 class="text-base font-medium tracking-wide text-slate-700 dark:text-navy-100">
                        Thống kê
                    </h2>
                    <a href="#"
                       class="border-b border-dotted border-current pb-0.5 text-xs+ font-medium text-primary outline-none transition-colors duration-300 hover:text-primary/70 focus:text-primary/70 dark:text-accent-light dark:hover:text-accent-light/70 dark:focus:text-accent-light/70">View
                        All</a>
                </div>
                <div class="mt-3 grid grid-cols-1 gap-4 sm:grid-cols-3 sm:gap-5">
                    <div class="card flex-row justify-between p-4">
                        <div>
                            <p class="text-xs+ uppercase">Sinh viên hướng dẫn</p>
                            <div class="mt-8 flex items-baseline space-x-1">
                                <p class="text-2xl font-semibold text-slate-700 dark:text-navy-100">
                                   ${studentCount}
                                </p>

                            </div>
                        </div>
                        <div class="mask is-squircle flex size-10 items-center justify-center bg-warning/10">
                            <i class="fa-solid fa-user text-xl text-warning"></i>
                        </div>
                        <div class="absolute bottom-0 right-0 overflow-hidden rounded-lg">
                            <i class="fa-solid fa-user translate-x-1/4 translate-y-1/4 text-5xl opacity-15"></i>
                        </div>
                    </div>
                    <div class="card flex-row justify-between p-4">
                        <div>
                            <p class="text-xs+ uppercase">Lớp học</p>
                            <div class="mt-8 flex items-baseline space-x-1">
                                <p class="text-2xl font-semibold text-slate-700 dark:text-navy-100">
                                    ${myProfile.get().classes.size()}
                                </p>

                            </div>
                        </div>
                        <div class="mask is-squircle flex size-10 items-center justify-center bg-info/10">
                            <i class="fa-solid fa-eye text-xl text-info"></i>
                        </div>
                        <div class="absolute bottom-0 right-0 overflow-hidden rounded-lg">
                            <i class="fa-solid fa-eye translate-x-1/4 translate-y-1/4 text-5xl opacity-15"></i>
                        </div>
                    </div>
                    <div class="card flex-row justify-between p-4">
                        <div>
                            <p class="text-xs+ uppercase">Sinh viên đã hoàn thành</p>
                            <div class="mt-8 flex items-baseline space-x-1">
                                <p class="text-2xl font-semibold text-slate-700 dark:text-navy-100">
                                    ${studentComplete}
                                </p>
                            </div>
                        </div>
                        <div class="mask is-squircle flex size-10 items-center justify-center bg-success/10">
                            <i class="fa-solid fa-thumbs-up text-xl text-success"></i>
                        </div>
                        <div class="absolute bottom-0 right-0 overflow-hidden rounded-lg">
                            <i class="fa-solid fa-thumbs-up translate-x-1/4 translate-y-1/4 text-5xl opacity-15"></i>
                        </div>
                    </div>

                </div>
            </div>
            <div class="mt-4 sm:mt-5 lg:mt-6">
                <div class="flex items-center justify-between">
                    <h2 class="text-base font-medium tracking-wide text-slate-700 line-clamp-1 dark:text-navy-100">
                        Lớp học của bạn
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
                    <div class="card col-span-12 pb-4">
                        <div class="mt-3 flex items-center justify-between px-4 sm:px-5">
                            <h2 class="text-sm+ font-medium tracking-wide text-slate-700 dark:text-navy-100">
                                Báo cáo thông kê thông tin lớp học
                            </h2>
                            <div class="flex items-center space-x-4">
                                <div class="hidden cursor-pointer items-center space-x-2 sm:flex">
                                    <div class="size-3 rounded-full bg-warning"></div>
                                    <p>Đã đăng ký đề tài</p>
                                </div>
                                <div class="hidden cursor-pointer items-center space-x-2 sm:flex">
                                    <div class="size-3 rounded-full bg-error"></div>
                                    <p>Tỷ lệ sinh viên hoàn thành công việc</p>
                                </div>
                                <div class="hidden cursor-pointer items-center space-x-2 sm:flex">
                                    <div class="size-3 rounded-full bg-success"></div>
                                    <p>Công việc đạt yêu cầu (Point >= 5)</p>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3 grid grid-cols-12">
                            <div class="col-span-12 px-4 sm:col-span-6 sm:px-5 lg:col-span-6">
                                <select class="mt-1.5 w-full" id="classSelect"
                                        x-init="$el._x_tom = new Tom($el,{sortField: {field: 'text',direction: 'asc'}})">
                                </select>
                                <div class="mt-6 grid grid-cols-2 gap-x-4 gap-y-8">
                                    <div>
                                        <p  class="text-xs uppercase text-slate-400 dark:text-navy-300">
                                            Số lợng sinh viên
                                        </p>
                                        <p id="studentCount" class="mt-1 text-xl font-medium text-slate-700 dark:text-navy-100">
                                            0
                                        </p>
                                    </div>

                                    <div>
                                        <p class="text-xs uppercase text-slate-400 dark:text-navy-300">
                                            Số lượng nhiệm vụ
                                        </p>
                                        <p class="mt-1">
                                         <span id="taskCount" class="text-xl font-medium text-slate-700 dark:text-navy-100">
                                             0
                                         </span>
                                        </p>
                                    </div>

                                    <div>
                                        <p class="text-xs uppercase text-slate-400 dark:text-navy-300">
                                            Yêu cầu gia nhập mới
                                        </p>
                                        <p id="joinRequest" class="mt-1 text-xl font-medium text-slate-700 dark:text-navy-100">
                                            0
                                        </p>
                                    </div>
                                    <div>
                                        <p class="text-xs uppercase text-slate-400 dark:text-navy-300">
                                            Đề tài đợi duyệt
                                        </p>
                                        <p id="pendingTopic"  class="mt-1 text-xl font-medium text-slate-700 dark:text-navy-100">
                                        0
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="ax-transparent-gridline col-span-12 px-2 sm:col-span-6 lg:col-span-6">
                                <div>
                                    <div  id="chartContainer" x-init="$nextTick(() => { $el._x_chart = new ApexCharts($el,pages.charts.travelAnalytics); $el._x_chart.render() });"></div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-span-12 lg:col-span-4 xl:col-span-3">
            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 sm:gap-5 lg:grid-cols-1 lg:gap-6">
                <div class="card pb-5">
                    <div class="mt-3 flex items-center justify-between px-4">
                        <h2 class="font-medium tracking-wide text-slate-700 dark:text-navy-100">
                            Working
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
                    <div>
                        <div x-init="$nextTick(() => {
    $el._x_chart = new ApexCharts($el, workingHours);
    $el._x_chart.render()
});"></div>
                    </div>
                    <script>
                        // Giả sử bạn muốn set lại series hoặc màu
                        var workingHours = {
                            colors: ["#0EA5E9"],
                            series: [${worked}],  // thay đổi phần trăm ví dụ 85
                            chart: {height: 210, type: "radialBar"},
                            plotOptions: {
                                radialBar: {
                                    hollow: {margin: 0, size: "70%"},
                                    dataLabels: {
                                        name: {show: false},
                                        value: {show: true, color: "#333", offsetY: 10, fontSize: "24px", fontWeight: 600}
                                    }
                                }
                            },
                            grid: {show: false, padding: {left: 0, right: 0, top: 0, bottom: 0}},
                            stroke: {lineCap: "round"}
                        };
                    </script>
                    <div class="px-4 text-center text-xs+ sm:px-5">
                        <p>Tiến độ công việc, xử lý các yêu cầu</p>
                    </div>
                </div>


                <div class="sm:col-span-2 lg:col-span-1">
                    <div class="card col-span-12 sm:col-span-7 lg:col-span-8 xl:col-span-7">
                        <div class="my-3 flex items-center justify-between px-4">
                            <h2 class="font-medium tracking-wide text-slate-700 dark:text-navy-100">
                                Biểu đồ thống kê sinh viên đăng ký lớp hướng dẫn
                            </h2>
                            <div x-data="usePopper({placement:'bottom-end',offset:4})"
                                 @click.outside="isShowPopper && (isShowPopper = false)" class="inline-flex">
                                <button x-ref="popperRef" @click="isShowPopper = !isShowPopper"
                                        class="btn -mr-1.5 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none"
                                         viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                    </svg>
                                </button>

                            </div>
                        </div>
                        <div class="grid grid-cols-2 gap-3 px-4">
                            <div class="rounded-lg bg-slate-100 p-3 dark:bg-navy-600">
                                <div class="flex justify-between space-x-1">
                                    <p class="text-xl font-semibold text-slate-700 dark:text-navy-100">
                                        186
                                    </p>
                                    <svg xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"
                                         class="size-5 text-primary dark:text-accent" fill="none" viewbox="0 0 24 24"
                                         stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                                    </svg>
                                </div>
                                <p class="mt-1 text-xs+">Yêu cầu gia nhập</p>
                            </div>
                            <div class="rounded-lg bg-slate-100 p-3 dark:bg-navy-600">
                                <div class="flex justify-between">
                                    <p class="text-xl font-semibold text-slate-700 dark:text-navy-100">
                                        154
                                    </p>
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5 text-success" fill="none"
                                         viewbox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"></path>
                                    </svg>
                                </div>
                                <p class="mt-1 text-xs+">Cho phép gia nhập</p>
                            </div>
                        </div>
                        <div class="mt-3 px-3">
                            <div x-init="$nextTick(() => { $el._x_chart = new ApexCharts($el,pages.charts.analyticsSiteOverview); $el._x_chart.render() });"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    const classList = ${classReports};
    document.addEventListener('DOMContentLoaded', function () {
        const select = document.getElementById('classSelect');

        // Đổ dữ liệu vào select
        classList.forEach(cls => {
            const opt = document.createElement('option');
            opt.value = cls.id;
            opt.textContent = cls.name;
            select.appendChild(opt);
        });

        // Bắt sự kiện thay đổi lớp
        select.addEventListener('change', function () {
            const selectedId = parseInt(this.value);
            const selectedClass = classList.find(c => c.id === selectedId);
            if (selectedClass) {
                updateClassInfo(selectedClass);
            }
        });

        // Load lớp đầu tiên
        if (classList.length > 0) {
            select.value = classList[0].id;
            updateClassInfo(classList[0]);
        }
    });

    function updateClassInfo(cls) {
        document.getElementById('studentCount').textContent = cls.studentCount.toLocaleString();
        document.getElementById('taskCount').textContent = cls.taskCount;
        document.getElementById('joinRequest').textContent = cls.joinRequest;
        document.getElementById('pendingTopic').textContent = cls.pendingTopic;

        // Cập nhật biểu đồ ApexCharts
        if (window.chartInstance) {
            window.chartInstance.updateSeries(cls.chartSeries); // Cập nhật dữ liệu mới
        } else {
            // Tạo biểu đồ mới với giao diện có sẵn
            const chartOptions = {
                ...window.pages.charts.travelAnalytics,
                series: cls.chartSeries
            };
            window.chartInstance = new ApexCharts(document.querySelector("#chartContainer"), chartOptions);
            window.chartInstance.render();
        }
    }


</script>
</body>

</html>