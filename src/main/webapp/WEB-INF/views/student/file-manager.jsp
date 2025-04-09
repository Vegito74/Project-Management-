<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Main Content Wrapper -->
<main class="main-content filemanager-app w-full pb-6">
    <div class="flex items-center justify-between space-x-2 px-[var(--margin-x)] pb-4 pt-5 transition-all duration-[.25s]">
        <div class="flex items-center space-x-1">
            <h3 class="text-lg font-medium text-slate-700 line-clamp-1 dark:text-navy-50">
                Home
            </h3>
            <div x-data="usePopper({placement:'bottom-start',offset:4})" @click.outside="isShowPopper && (isShowPopper = false)" class="inline-flex">
                <button x-ref="popperRef" @click="isShowPopper = !isShowPopper" class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                    <i class="fas fa-chevron-down"></i>
                </button>

                <div x-ref="popperRoot" class="popper-root" :class="isShowPopper && 'show'">
                    <div class="popper-box rounded-md border border-slate-150 bg-white py-1.5 font-inter dark:border-navy-500 dark:bg-navy-700">
                        <ul>
                            <li>
                                <a href="#" class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="mt-px size-4.5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 13h6m-3-3v6m-9 1V7a2 2 0 012-2h6l2 2h6a2 2 0 012 2v8a2 2 0 01-2 2H5a2 2 0 01-2-2z"></path>
                                    </svg>

                                    <span> Thư mục gần đ</span></a>
                            </li>
                            <li>
                                <a href="#" class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="mt-px size-4.5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"></path>
                                    </svg>

                                    <span>Upload Folder</span></a>
                            </li>
                            <li>
                                <a href="#" class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="mt-px size-4.5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path>
                                    </svg>

                                    <span>Download Folder</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="flex">
            <button @click="$dispatch('show-drawer', { drawerId: 'filemanager-activity-drawer' })" class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:active:bg-navy-300/25">
                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
            </button>
            <a href="pages-help-1.html" class="btn size-8 rounded-full p-0 text-slate-500 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:text-navy-200 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
            </a>
        </div>
    </div>
    <div class="flex flex-col" x-data="{activeTab:'tab-recent'}">
        <div class="flex space-x-2 px-[var(--margin-x)] transition-all duration-[.25s]">
            <button @click="activeTab = 'tab-recent'" class="btn h-8 rounded-full text-xs+ font-medium" :class="activeTab === 'tab-recent' ? 'bg-slate-150 text-slate-800 dark:bg-navy-600 dark:text-navy-50' : 'hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 hover:text-slate-800 focus:text-slate-800 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25 dark:hover:text-navy-100 dark:focus:text-navy-100'">
                Recent
            </button>
            <button @click="activeTab = 'tab-pinned'" class="btn h-8 rounded-full text-xs+ font-medium" :class="activeTab === 'tab-pinned' ? 'bg-slate-150 text-slate-800 dark:bg-navy-600 dark:text-navy-50' : 'hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 hover:text-slate-800 focus:text-slate-800 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25 dark:hover:text-navy-100 dark:focus:text-navy-100'">
                Pinned
            </button>
        </div>
        <div>
            <div x-show="activeTab === 'tab-recent'" x-transition:enter="transition-all duration-500 easy-in-out" x-transition:enter-start="opacity-0 [transform:translate3d(1rem,0,0)]" x-transition:enter-end="opacity-100 [transform:translate3d(0,0,0)]" x-init="$nextTick(()=>new Swiper($el,{  slidesPerView: 'auto', spaceBetween: 20}))" class="swiper px-[var(--margin-x)] pt-4 transition-all duration-[.25s]">
                <div class="swiper-wrapper">
                    <div class="card swiper-slide w-56 shrink-0 p-3 pt-4">
                        <div class="flex items-center justify-between">
                            <img class="w-14" src="images/folders/folder-primary.svg" alt="folder">
                            <button class="btn -mr-2 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="pt-5 text-base font-medium tracking-wide text-primary dark:text-accent-light">
                            Tài liệu pdf
                        </div>
                        <div class="mt-1.5 flex items-center justify-between">
                            <p class="text-salte-400 text-xs+ dark:text-navy-300">
                                22 files
                            </p>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                455 MB
                            </p>
                        </div>
                    </div>
                    <div class="card swiper-slide w-56 shrink-0 p-3 pt-4">
                        <div class="flex items-center justify-between">
                            <img class="w-14" src="images/folders/folder-warning.svg" alt="folder">
                            <button class="btn -mr-2 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="pt-5 text-base font-medium tracking-wide text-warning">
                            Hình ảnh
                        </div>
                        <div class="mt-1.5 flex items-center justify-between">
                            <p class="text-salte-400 text-xs+ dark:text-navy-300">
                                135 files
                            </p>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                3.5 GB
                            </p>
                        </div>
                    </div>
                    <div class="card swiper-slide w-56 shrink-0 p-3 pt-4">
                        <div class="flex items-center justify-between">
                            <img class="w-14" src="images/folders/folder-info.svg" alt="folder">
                            <button class="btn -mr-2 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="pt-5 text-base font-medium tracking-wide text-info">
                            Tài liệu tham khảo
                        </div>
                        <div class="mt-1.5 flex items-center justify-between">
                            <p class="text-salte-400 text-xs+ dark:text-navy-300">
                                14 files
                            </p>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                984 MB
                            </p>
                        </div>
                    </div>
                    <div class="card swiper-slide w-56 shrink-0 p-3 pt-4">
                        <div class="flex items-center justify-between">
                            <img class="w-14" src="images/folders/folder-secondary.svg" alt="folder">
                            <button class="btn -mr-2 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="pt-5 text-base font-medium tracking-wide text-secondary dark:text-secondary-light">
                            Behance Files
                        </div>
                        <div class="mt-1.5 flex items-center justify-between">
                            <p class="text-salte-400 text-xs+ dark:text-navy-300">
                                14 files
                            </p>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                984 MB
                            </p>
                        </div>
                    </div>
                    <div class="card swiper-slide w-56 shrink-0 p-3 pt-4">
                        <div class="flex items-center justify-between">
                            <img class="w-14" src="images/folders/folder-success.svg" alt="folder">
                            <button class="btn -mr-2 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="pt-5 text-base font-medium tracking-wide text-success">
                            Backup Files
                        </div>
                        <div class="mt-1.5 flex items-center justify-between">
                            <p class="text-salte-400 text-xs+ dark:text-navy-300">
                                65 files
                            </p>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                12 GB
                            </p>
                        </div>
                    </div>
                    <div class="card swiper-slide w-56 shrink-0 p-3 pt-4">
                        <div class="flex items-center justify-between">
                            <img class="w-14" src="images/folders/folder-error.svg" alt="folder">
                            <button class="btn -mr-2 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="pt-5 text-base font-medium tracking-wide text-error">
                            Vue Apps
                        </div>
                        <div class="mt-1.5 flex items-center justify-between">
                            <p class="text-salte-400 text-xs+ dark:text-navy-300">
                                34 files
                            </p>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                146 MB
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div x-show="activeTab === 'tab-pinned'" x-transition:enter="transition-all duration-500 easy-in-out" x-transition:enter-start="opacity-0 [transform:translate3d(1rem,0,0)]" x-transition:enter-end="opacity-100 [transform:translate3d(0,0,0)]" x-init="$nextTick(()=>new Swiper($el,{  slidesPerView: 'auto', spaceBetween: 20}))" class="swiper px-[var(--margin-x)] pt-4 transition-all duration-[.25s]">
                <div class="swiper-wrapper">
                    <div class="card swiper-slide w-56 shrink-0 p-3 pt-4">
                        <div class="flex items-center justify-between">
                            <img class="w-14" src="images/folders/folder-error.svg" alt="folder">
                            <button class="btn -mr-2 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="pt-5 text-base font-medium tracking-wide text-error">
                            Vue Apps
                        </div>
                        <div class="mt-1.5 flex items-center justify-between">
                            <p class="text-salte-400 text-xs+ dark:text-navy-300">
                                34 files
                            </p>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                146 MB
                            </p>
                        </div>
                    </div>
                    <div class="card swiper-slide w-56 shrink-0 p-3 pt-4">
                        <div class="flex items-center justify-between">
                            <img class="w-14" src="images/folders/folder-warning.svg" alt="folder">
                            <button class="btn -mr-2 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="pt-5 text-base font-medium tracking-wide text-warning">
                            Design
                        </div>
                        <div class="mt-1.5 flex items-center justify-between">
                            <p class="text-salte-400 text-xs+ dark:text-navy-300">
                                135 files
                            </p>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                3.5 GB
                            </p>
                        </div>
                    </div>
                    <div class="card swiper-slide w-56 shrink-0 p-3 pt-4">
                        <div class="flex items-center justify-between">
                            <img class="w-14" src="images/folders/folder-primary.svg" alt="folder">
                            <button class="btn -mr-2 size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="pt-5 text-base font-medium tracking-wide text-primary dark:text-accent-light">
                            Dribble Shots
                        </div>
                        <div class="mt-1.5 flex items-center justify-between">
                            <p class="text-salte-400 text-xs+ dark:text-navy-300">
                                22 files
                            </p>
                            <p class="font-medium text-slate-600 dark:text-navy-100">
                                455 MB
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mt-4 grid grid-cols-12 gap-4 px-[var(--margin-x)] transition-all duration-[.25s] sm:mt-5 sm:gap-5 lg:gap-6">
        <div class="col-span-12 lg:col-span-8">
            <div class="flex items-center justify-between">
                <h2 class="text-base font-medium tracking-wide text-slate-700 line-clamp-1 dark:text-navy-100">
                    Folders
                </h2>
                <div class="flex">
                    <div class="flex items-center" x-data="{isInputActive:false}">
                        <label class="block">
                            <input x-effect="isInputActive === true && $nextTick(() => { $el.focus()});" :class="isInputActive ? 'w-32 lg:w-48' : 'w-0'" class="form-input bg-transparent px-1 text-right transition-all duration-100 placeholder:text-slate-500 dark:placeholder:text-navy-200" placeholder="Search here..." type="text">
                        </label>
                        <button @click="isInputActive = !isInputActive" class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                            <svg xmlns="http://www.w3.org/2000/svg" class="size-4.5" fill="none" viewbox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                            </svg>
                        </button>
                    </div>
                    <div x-data="usePopper({placement:'bottom-end',offset:4})" @click.outside="isShowPopper && (isShowPopper = false)" class="inline-flex">
                        <button x-ref="popperRef" @click="isShowPopper = !isShowPopper" class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                            <svg xmlns="http://www.w3.org/2000/svg" class="size-4.5" fill="none" viewbox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                            </svg>
                        </button>
                        <div x-ref="popperRoot" class="popper-root" :class="isShowPopper && 'show'">
                            <div class="popper-box rounded-md border border-slate-150 bg-white py-1.5 font-inter dark:border-navy-500 dark:bg-navy-700">
                                <ul>
                                    <li>
                                        <a href="#" class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Action</a>
                                    </li>
                                    <li>
                                        <a href="#" class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Another Action</a>
                                    </li>
                                    <li>
                                        <a href="#" class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Something else</a>
                                    </li>
                                </ul>
                                <div class="my-1 h-px bg-slate-150 dark:bg-navy-500"></div>
                                <ul>
                                    <li>
                                        <a href="#" class="flex h-8 items-center px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">Separated Link</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mt-3">
                <div class="is-scrollbar-hidden min-w-full overflow-x-auto">
                    <table class="is-hoverable w-full text-left">
                        <thead>
                        <tr>
                            <th class="whitespace-nowrap rounded-tl-lg bg-slate-200 px-4 py-3 font-semibold uppercase text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                Name
                            </th>
                            <th class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold uppercase text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                Last edit
                            </th>
                            <th class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold uppercase text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                Size
                            </th>
                            <th class="whitespace-nowrap bg-slate-200 px-4 py-3 font-semibold uppercase text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5">
                                Members
                            </th>

                            <th class="whitespace-nowrap rounded-tr-lg bg-slate-200 px-4 py-3 font-semibold uppercase text-slate-800 dark:bg-navy-800 dark:text-navy-100 lg:px-5"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex items-center space-x-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-8 text-yellow-500" viewbox="0 0 20 20" fill="currentColor">
                                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"></path>
                                    </svg>
                                    <span class="font-medium text-slate-700 dark:text-navy-100">Designs</span>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                2 day ago
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 text-slate-700 dark:text-navy-100 sm:px-5">
                                14.3GB
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex -space-x-2">
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-16.jpg" alt="avatar">
                                    </div>

                                    <div class="avatar size-7 hover:z-10">
                                        <div class="is-initial rounded-full bg-info text-xs+ uppercase text-white ring ring-white dark:ring-navy-700">
                                            jd
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex items-center space-x-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-8 text-yellow-500" viewbox="0 0 20 20" fill="currentColor">
                                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"></path>
                                    </svg>
                                    <span class="font-medium text-slate-700 dark:text-navy-100">Movies</span>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                a month ago
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 text-slate-700 dark:text-navy-100 sm:px-5">
                                31 GB
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex -space-x-2">
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-19.jpg" alt="avatar">
                                    </div>

                                    <div class="avatar size-7 hover:z-10">
                                        <div class="is-initial rounded-full bg-warning text-xs+ uppercase text-white ring ring-white dark:ring-navy-700">
                                            sm
                                        </div>
                                    </div>
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-20.jpg" alt="avatar">
                                    </div>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex items-center space-x-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-8 text-secondary" viewbox="0 0 20 20" fill="currentColor">
                                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"></path>
                                    </svg>
                                    <span class="font-medium text-slate-700 dark:text-navy-100">Media</span>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                2 hour ago
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 text-slate-700 dark:text-navy-100 sm:px-5">
                                17.2 GB
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex -space-x-2">
                                    <div class="avatar size-7 hover:z-10">
                                        <div class="is-initial rounded-full bg-success text-xs+ uppercase text-white ring ring-white dark:ring-navy-700">
                                            uh
                                        </div>
                                    </div>
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-18.jpg" alt="avatar">
                                    </div>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex items-center space-x-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-8 text-yellow-500" viewbox="0 0 20 20" fill="currentColor">
                                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"></path>
                                    </svg>
                                    <span class="font-medium text-slate-700 dark:text-navy-100">Web Applications
                          </span>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                42 minute ago
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 text-slate-700 dark:text-navy-100 sm:px-5">
                                12.4 GB
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex -space-x-2">
                                    <div class="avatar size-7 hover:z-10">
                                        <div class="is-initial rounded-full bg-error text-xs+ uppercase text-white ring ring-white dark:ring-navy-700">
                                            nd
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex items-center space-x-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-8 text-yellow-500" viewbox="0 0 20 20" fill="currentColor">
                                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"></path>
                                    </svg>
                                    <span class="font-medium text-slate-700 dark:text-navy-100">Designs
                          </span>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                2 day ago
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 text-slate-700 dark:text-navy-100 sm:px-5">
                                4.33 GB
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex -space-x-2">
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-1.jpg" alt="avatar">
                                    </div>
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-2.jpg" alt="avatar">
                                    </div>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex items-center space-x-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-8 text-yellow-500" viewbox="0 0 20 20" fill="currentColor">
                                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"></path>
                                    </svg>
                                    <span class="font-medium text-slate-700 dark:text-navy-100">Archives
                          </span>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                12 days ago
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 text-slate-700 dark:text-navy-100 sm:px-5">
                                1.2 TB
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex -space-x-2">
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-3.jpg" alt="avatar">
                                    </div>
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-4.jpg" alt="avatar">
                                    </div>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-y border-transparent border-b-slate-200 dark:border-b-navy-500">
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex items-center space-x-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-8 text-yellow-500" viewbox="0 0 20 20" fill="currentColor">
                                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"></path>
                                    </svg>
                                    <span class="font-medium text-slate-700 dark:text-navy-100">Movies</span>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                a month ago
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 text-slate-700 dark:text-navy-100 sm:px-5">
                                31 GB
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex -space-x-2">
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-19.jpg" alt="avatar">
                                    </div>

                                    <div class="avatar size-7 hover:z-10">
                                        <div class="is-initial rounded-full bg-warning text-xs+ uppercase text-white ring ring-white dark:ring-navy-700">
                                            sm
                                        </div>
                                    </div>
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-20.jpg" alt="avatar">
                                    </div>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-y border-transparent">
                            <td class="whitespace-nowrap rounded-bl-lg px-4 py-3 sm:px-5">
                                <div class="flex items-center space-x-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-8 text-yellow-500" viewbox="0 0 20 20" fill="currentColor">
                                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"></path>
                                    </svg>
                                    <span class="font-medium text-slate-700 dark:text-navy-100">Documents
                          </span>
                                </div>
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                a day ago
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 text-slate-700 dark:text-navy-100 sm:px-5">
                                602 MB
                            </td>
                            <td class="whitespace-nowrap px-4 py-3 sm:px-5">
                                <div class="flex -space-x-2">
                                    <div class="avatar size-7 hover:z-10">
                                        <div class="is-initial rounded-full bg-info text-xs+ uppercase text-white ring ring-white dark:ring-navy-700">
                                            gh
                                        </div>
                                    </div>
                                    <div class="avatar size-7 hover:z-10">
                                        <img class="rounded-full ring ring-white dark:ring-navy-700" src="images/avatar/avatar-10.jpg" alt="avatar">
                                    </div>
                                </div>
                            </td>
                            <td class="whitespace-nowrap rounded-br-lg px-4 py-3 sm:px-5">
                                <button class="btn size-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewbox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                    </svg>  
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>
