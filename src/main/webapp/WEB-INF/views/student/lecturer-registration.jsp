<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">


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
            <button class="btn min-w-[7rem] border border-slate-300 font-medium text-slate-700 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-100 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90">
                Cancel
            </button>
            <button class="btn min-w-[7rem] bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90">
                Send
            </button>
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
                                    <span>Đăng ký đề tài</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content p-4 sm:p-5">
                        <div class="space-y-5">
                            <label class="block">
                                <span class="font-medium text-slate-600 dark:text-navy-100">Tên đề tài</span>
                                <select class="mt-1.5 w-full"
                                        x-init="$el._tom = new Tom($el,{create: true,sortField: {field: 'text',direction: 'asc'}})">
                                    <option>Xây dựng Website</option>
                                    <option>Xây dựng ứng dụng Website</option>
                                    <option>Xây dựng ứng dụng Desktop</option>
                                    <option>Nghiên cứu và phát triển</option>
                                </select>
                            </label>
                            <label class="block">
                                <span class="font-medium text-slate-600 dark:text-navy-100">Loại đề tài</span>
                                <select
                                        class="mt-1.5 w-full"
                                        x-init="$el._tom = new Tom($el,{create: true,sortField: {field: 'text',direction: 'asc'}})"
                                >
                                    <option>Cho doanh nghiệp thực tế</option>
                                    <option>Cho trường học</option>
                                    <option>Cho tổ chức chính phủ</option>
                                    <option>Mô hình giả lập</option>
                                    <option>Other</option>
                                </select>
                            </label>
                            <label class="block">
                                <span class="font-medium text-slate-600 dark:text-navy-100">Các công nghệ sử dụng</span>
                                <label class="block">
                                    <select
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


                            <label class="block">
                                <span class="font-medium text-slate-600 dark:text-navy-100">Mô tả về đề tài</span>
                                <textarea rows="4" placeholder=" Enter Text"
                                          class="form-textarea w-full resize-none rounded-lg bg-slate-150 p-2.5 placeholder:text-slate-400 dark:bg-navy-900 dark:placeholder:text-navy-300"
                                ></textarea>
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
                                <span>Đề tài gợi ý</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="is-scrollbar-hidden min-w-full overflow-x-auto rounded-lg border border-slate-200 dark:border-navy-500">
                    <table class="w-full text-left text-xs">
                        <thead>
                        <tr>
                            <th style="width: 20px" class="whitespace-nowrap border border-t-0 border-l-0 border-slate-200 px-3 py-3 font-semibold uppercase text-slate-800 dark:border-navy-500 dark:text-navy-100 lg:px-5">
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
</main>
</body>
</html>
