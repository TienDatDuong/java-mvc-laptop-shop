<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Flatpickr Date Time & Month Picker</title>
    <!-- FontAwesome (để hiển thị icon fa-calendar-alt) -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <!-- 2 thư viện CSS chính -->
    <link rel="stylesheet" type="text/css" href="/css/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="/css/monthSelect.min.css">
</head>
<body>
<div style="padding: 40px 15px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;">
    <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
        <h5 style="margin-bottom: 20px; color: #6b7280; font-weight: 600;">Chọn ngày & giờ hẹn</h5>
        <div class="datetime-picker-wrapper" style="display: flex; justify-content: center; align-items: center;">
            <div style="position: relative; width: 320px;">
                <input type="text" id="native-flatpickr-input" name="scheduleDateTime"
                       value="${savedDateFromJava}" readonly placeholder="YYYY-MM-DD hh:mm AM"
                       style="width: 100%; height: 42px; padding: 8px 40px 8px 14px; border: 1px solid #d1d5db; border-radius: 8px; outline: none; font-size: 14px; cursor: pointer; background: #fff; box-sizing: border-box; color: #111827;">
                <i class="fa fa-calendar-alt" id="calendar-icon-btn" style="position: absolute; right: 14px; top: 12px; color: #7c5ce0; cursor: pointer; font-size: 18px; z-index: 10;"></i>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript Libraries -->
<script src="/js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="/js/flatpickr.min.js"></script>
<script type="text/javascript" src="/js/monthSelect.min.js"></script>

<style>
    /* ======================================================== */
    /* 1. ĐỒNG BỘ CẤU TRÚC HEADER THÁNG/NĂM THEO CHUẨN THIẾT KẾ CĂN GIỮA */
    /* ======================================================== */
    .flatpickr-calendar {
        width: 308px !important;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1) !important;
        border-radius: 12px !important;
        border: 1px solid #e5e7eb !important;
        font-family: inherit !important;
    }
    .flatpickr-months {
        position: relative !important;
        display: flex !important;
        align-items: center !important;
        justify-content: space-between !important;
        height: 40px !important;
        padding: 6px 12px 2px 12px !important;
        box-sizing: border-box !important;
    }
    .flatpickr-months .flatpickr-month {
        flex: 1 !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        height: 100% !important;
        text-align: center !important;
        position: static !important;
        overflow: visible !important;
    }
    .flatpickr-current-month {
        position: static !important;
        transform: none !important;
        margin: 0 auto !important;
        width: auto !important;
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        gap: 6px !important;
        padding: 0 !important;
        height: 34px !important;
        text-align: center !important;
    }

    /* Chữ hiển thị Tháng trên header */
    .flatpickr-current-month span.cur-month {
        cursor: pointer !important;
        border-radius: 6px !important;
        padding: 2px 8px !important;
        margin: 0 !important;
        font-weight: 600 !important;
        color: #111827 !important;
        text-align: center !important;
        transition: background 0.2s ease !important;
    }
    .flatpickr-current-month span.cur-month:hover {
        background: #f3f4f6 !important;
        color: #7c5ce0 !important;
    }

    /* Wrapper bọc ô nhập Năm trên header */
    .flatpickr-current-month .numInputWrapper {
        width: auto !important;
        height: 34px !important;
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        padding: 0 !important;
        margin: 0 !important;
        border: none !important;
        border-radius: 0 !important;
        background: transparent !important;
        box-sizing: border-box !important;
        vertical-align: middle !important;
    }

    /* Ẩn hoàn toàn 2 nút mũi tên lên xuống của ô Năm */
    .flatpickr-current-month .numInputWrapper span {
        display: none !important;
    }

    .flatpickr-current-month input.cur-year {
        padding: 2px 6px !important;
        margin: 0 !important;
        border: none !important;
        border-radius: 6px !important;
        background: transparent !important;
        height: 28px !important;
        width: 6ch !important;
        font-size: 14px !important;
        font-family: inherit !important;
        font-weight: 600 !important;
        line-height: 28px !important;
        color: #111827 !important;
        cursor: pointer !important;
        display: inline-block !important;
        vertical-align: initial !important;
        box-sizing: border-box !important;
        -webkit-appearance: textfield !important;
        -moz-appearance: textfield !important;
        appearance: textfield !important;
        user-select: none !important;
        text-align: center !important;
        transition: background 0.2s ease !important;
    }
    .flatpickr-current-month input.cur-year:hover {
        background: #f3f4f6 !important;
        color: #7c5ce0 !important;
    }
    .flatpickr-current-month input.cur-year:focus {
        outline: 0 !important;
    }

    /* Hai nút mũi tên điều hướng < và > trên Header */
    .flatpickr-months .flatpickr-prev-month,
    .flatpickr-months .flatpickr-next-month {
        position: static !important;
        z-index: 2 !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        width: 28px !important;
        height: 28px !important;
        padding: 0 !important;
        margin: 0 !important;
        border: none !important;
        border-radius: 6px !important;
        background: transparent !important;
        cursor: pointer !important;
        transition: background 0.2s ease !important;
    }
    .flatpickr-months .flatpickr-prev-month:hover,
    .flatpickr-months .flatpickr-next-month:hover {
        background: #f3f4f6 !important;
    }
    .flatpickr-months .flatpickr-prev-month svg,
    .flatpickr-months .flatpickr-next-month svg {
        width: 14px !important;
        height: 14px !important;
        fill: #959ea9 !important;
        transition: fill 0.2s ease !important;
    }
    .flatpickr-months .flatpickr-prev-month:hover svg,
    .flatpickr-months .flatpickr-next-month:hover svg {
        fill: #7c5ce0 !important;
    }

    /* Ẩn dropdown select tháng gốc */
    .flatpickr-current-month .flatpickr-monthDropdown-months {
        display: none !important;
    }

    /* ======================================================== */
    /* 2. CẤU HÌNH LƯỚI CHỌN THÁNG/NĂM CUSTOM 3X4 MÀU TÍM CHUẨN */
    /* ======================================================== */
    .fp-my-grid {
        display: grid !important;
        grid-template-columns: repeat(3, 1fr) !important;
        gap: 8px 10px !important;
        padding: 14px 16px !important;
        background: #ffffff !important;
        box-sizing: border-box !important;
        width: 100% !important;
    }
    .fp-my-grid button {
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        text-align: center !important;
        position: relative !important;
        height: 42px !important;
        border: none !important;
        border-radius: 8px !important;
        background: transparent !important;
        color: #111827 !important;
        font-size: 13px !important;
        font-family: inherit !important;
        font-weight: 500 !important;
        cursor: pointer !important;
        outline: none !important;
        transition: all 0.15s ease !important;
    }
    .fp-my-grid button:hover:not(:disabled) {
        background: #f3f4f6 !important;
        color: #7c5ce0 !important;
    }
    /* Trạng thái ô đang active màu tím */
    .fp-my-grid button.fp-current {
        background: #7c5ce0 !important;
        color: #ffffff !important;
        font-weight: 700 !important;
    }
    .fp-my-grid button:disabled {
        color: #d1d5db !important;
        background: transparent !important;
        cursor: not-allowed !important;
    }



    /* ======================================================== */
    /* 3. ĐỒNG BỘ TOÀN BỘ TRẠNG THÁI Ô LỊCH NGÀY THEO THIẾT KẾ    */
    /* ======================================================== */
    /* Dấu chấm báo ngày Hiện tại (Today) dưới số */
    .flatpickr-calendar .flatpickr-day.today:not(.selected) {
        border-color: transparent !important;
        color: #111827 !important;
        font-weight: 600 !important;
    }
    .flatpickr-calendar .flatpickr-day.today:not(.selected)::after {
        content: "";
        position: absolute;
        left: 50%;
        bottom: 4px;
        width: 4px;
        height: 4px;
        margin-left: -2px;
        border-radius: 50%;
        background: #7c5ce0;
    }
    .flatpickr-calendar .flatpickr-day.today.flatpickr-disabled::after {
        background: #c4c4c4;
    }
    /* Hover ngày thường */
    .flatpickr-calendar .flatpickr-day:not(.selected):not(.flatpickr-disabled):hover {
        background: #f3f4f6 !important;
        border-color: transparent !important;
        border-radius: 8px !important;
    }
    /* Nhấp chuột giữ ngày thường (Pressed) */
    .flatpickr-calendar .flatpickr-day:not(.selected):not(.flatpickr-disabled):active {
        background: #fff !important;
        border: 1px solid #d1d5db !important;
        border-radius: 8px !important;
        box-shadow: 0 0 3px rgba(124, 92, 224, 0.25) !important;
    }
    /* Ô vuông chọn trúng (Selected màu tím) */
    .flatpickr-calendar .flatpickr-day.selected,
    .flatpickr-calendar .flatpickr-day.selected:hover {
        background: #7c5ce0 !important;
        border-color: #7c5ce0 !important;
        color: #fff !important;
        border-radius: 8px !important;
        font-weight: 700 !important;
    }
    .flatpickr-calendar .flatpickr-day.selected:hover {
        background: #6a4bd0 !important;
        border-color: #6a4bd0 !important;
    }
    .flatpickr-calendar .flatpickr-day.selected:active {
        background: #7c5ce0 !important;
        border: 1px solid #7c5ce0 !important;
        box-shadow: 0 0 4px rgba(124, 92, 224, 0.4) !important;
    }
    .flatpickr-calendar .flatpickr-day.today.selected::after {
        display: none !important;
    }
    /* Ngày bị khóa (Disabled) */
    .flatpickr-calendar .flatpickr-day.flatpickr-disabled {
        color: #d1d5db !important;
        background: transparent !important;
        border-color: transparent !important;
    }
    .flatpickr-calendar .flatpickr-day.selected.flatpickr-disabled {
        background: #c9b8f5 !important;
        color: #f0eaff !important;
    }

    /* ======================================================== */
    /* 4. ĐỒNG BỘ HÀNG THỜI GIAN & KHỐI CỤM PHÍM TĂNG GIẢM SỐ    */
    /* ======================================================== */
    .flatpickr-am-pm {
        display: none !important;
    }
    .flatpickr-time {
        display: inline-flex !important;
        flex: none !important;
        border: none !important;
        height: 36px !important;
        line-height: 36px !important;
        align-items: center !important;
    }
    .flatpickr-time .numInputWrapper {
        width: 56px !important;
        height: 36px !important;
        border: 1px solid #d1d5db !important;
        border-radius: 8px !important;
        background: #fff !important;
        box-sizing: border-box !important;
    }
    .flatpickr-time input.flatpickr-hour,
    .flatpickr-time input.flatpickr-minute {
        height: 34px !important;
        line-height: 34px !important;
        padding: 0 !important;
        background: transparent !important;
        box-sizing: border-box !important;
        font-weight: 600 !important;
        font-size: 13px !important;
    }
    .flatpickr-time .flatpickr-time-separator {
        height: 36px !important;
        line-height: 34px !important;
        display: inline-block !important;
        width: 15px !important;
        text-align: center;
        color: #111827 !important;
        font-size: 14px !important;
        font-weight: bold !important;
    }
    .time-row-container {
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        padding: 10px 14px !important;
        background: #ffffff;
        box-sizing: border-box !important;
        border-top: 1px solid #f3f4f6;
    }

    /* Thiết kế nút AM/PM Custom */
    .ampm-toggle-container {
        display: flex !important;
        margin-left: 12px;
        width: 90px;
        height: 36px !important;
        box-sizing: border-box !important;
    }
    .btn-ampm-custom {
        flex: 1;
        height: 36px !important;
        line-height: 34px !important;
        padding: 0 !important;
        font-size: 12px;
        cursor: pointer;
        border: 1px solid #d1d5db;
        background: #ffffff;
        color: #9ca3af;
        font-weight: 600;
        outline: none;
        box-sizing: border-box !important;
        transition: all 0.15s ease !important;
    }
    .btn-ampm-custom-am {
        border-radius: 6px 0 0 6px !important;
    }
    .btn-ampm-custom-pm {
        border-radius: 0 6px 6px 0 !important;
        border-left: none !important;
    }
    .btn-ampm-custom.active {
        background: #7c5ce0 !important;
        color: #ffffff !important;
        border-color: #7c5ce0 !important;
    }
    .btn-ampm-custom:hover:not(.active) {
        border-color: #7c5ce0;
        color: #7c5ce0;
    }
    .flatpickr-wrapper {
        width: 100%;
    }

    /* Khối 3 nút chân lịch (Today, Clear, Confirm) */
    .design-action-group {
        display: flex !important;
        justify-content: space-between !important;
        align-items: center !important;
        padding: 10px 14px 12px 14px !important;
        border-top: 1px solid #e5e7eb !important;
        background: #ffffff;
        box-sizing: border-box !important;
    }
    .design-action-right {
        display: flex !important;
        gap: 8px !important;
        margin-left: auto !important;
    }
    .design-action-group button {
        padding: 0 14px !important;
        font-size: 12px !important;
        cursor: pointer !important;
        border: 1px solid #d1d5db !important;
        border-radius: 8px !important;
        background: #ffffff !important;
        color: #111827 !important;
        font-weight: 600 !important;
        outline: none !important;
        height: 32px !important;
        line-height: 30px !important;
        box-sizing: border-box !important;
        transition: all 0.15s ease !important;
    }
    .design-action-group button:hover {
        border-color: #7c5ce0 !important;
        color: #7c5ce0 !important;
    }
    .design-action-group .btn-design-confirm {
        background: #7c5ce0 !important;
        color: #ffffff !important;
        border-color: #7c5ce0 !important;
    }
    .design-action-group .btn-design-confirm:hover {
        background: #6a4bd0 !important;
        border-color: #6a4bd0 !important;
        color: #ffffff !important;
    }

    /* Ép hiển thị nút tăng giảm số thời gian */
    .flatpickr-time .numInputWrapper span {
        opacity: 1 !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        background: transparent !important;
    }
    .flatpickr-time .numInputWrapper span.arrowUp {
        border-left: 1px solid #e5e7eb !important;
        border-bottom: 1px solid #e5e7eb !important;
        top: 0 !important;
    }
    .flatpickr-time .numInputWrapper span.arrowDown {
        border-left: 1px solid #e5e7eb !important;
        bottom: 0 !important;
    }
    .flatpickr-time .numInputWrapper span:hover {
        background: #f3f4f6 !important;
    }
    .flatpickr-time .numInputWrapper span:active {
        background: #e5e7eb !important;
    }

    /* ======================================================== */
    /* 5. CLASS ẨN TRIỆT ĐỂ KHI Ở CHẾ ĐỘ THÁNG / NĂM            */
    /* ======================================================== */
    .fp-hidden,
    .time-row-container.fp-hidden,
    .flatpickr-time.fp-hidden,
    .design-action-group button.fp-hidden,
    .flatpickr-days.fp-hidden,
    .flatpickr-weekdays.fp-hidden {
        display: none !important;
    }

    .flatpickr-rContainer{
        width: 100% !important;
    }
</style>

<script>
    $(document).ready(function() {
        var pickerDom = document.getElementById("native-flatpickr-input");
        if (!pickerDom) return;

        var isConfirmed = false;
        var lastConfirmedValue = pickerDom.value || "";
        var myMyGrid = null;
        var myMode = "day"; // "day", "month", "year"
        var myBaseYear = new Date().getFullYear();
        var timeRowContainer = null;
        var btnToday = null;
        var wasCleared = false;

        var fpInstance = flatpickr(pickerDom, {
            enableTime: true,
            time_24hr: false,
            minuteIncrement: 1,
            static: true,
            altInput: true,
            allowInput: true,
            clickOpens: true,
            monthSelectorType: "static",
            altFormat: "Y-m-d h:i K",
            dateFormat: "Y-m-d H:i:S",
            onChange: function(selectedDates, dateStr, instance) {
                wasCleared = false;
            },
            onOpen: function(selectedDates, dateStr, instance) {
                if (instance._fpExitMyMode) instance._fpExitMyMode();
                isConfirmed = false;
                wasCleared = false;
                lastConfirmedValue = pickerDom.value;
                if (instance._updateAmpmStyle) instance._updateAmpmStyle();
            },
            onClose: function(selectedDates, dateStr, instance) {
                if (instance._fpExitMyMode) instance._fpExitMyMode();
                if (!isConfirmed) {
                    if (lastConfirmedValue) {
                        instance.setDate(lastConfirmedValue, false);
                    } else {
                        instance.setDate(new Date(), false);
                        instance.clear();
                    }
                }
            },
            onReady: function(selectedDates, dateStr, instance) {
                // 1. Tạo hàng thời gian & AM/PM
                timeRowContainer = document.createElement("div");
                timeRowContainer.className = "time-row-container";

                var ampmContainer = document.createElement("div");
                ampmContainer.className = "ampm-toggle-container";

                var btnAM = document.createElement("button");
                btnAM.type = "button";
                btnAM.className = "btn-ampm-custom btn-ampm-custom-am";
                btnAM.innerHTML = "AM";

                var btnPM = document.createElement("button");
                btnPM.type = "button";
                btnPM.className = "btn-ampm-custom btn-ampm-custom-pm";
                btnPM.innerHTML = "PM";

                function updateAmpmButtonsStyle() {
                    if (instance.amPM) {
                        var currentMode = instance.amPM.textContent.trim();
                        if (currentMode === "AM") {
                            btnAM.classList.add("active");
                            btnPM.classList.remove("active");
                        } else {
                            btnPM.classList.add("active");
                            btnAM.classList.remove("active");
                        }
                    }
                }
                instance._updateAmpmStyle = updateAmpmButtonsStyle;

                btnAM.addEventListener("click", function(e) {
                    e.stopPropagation();
                    if (instance.amPM && instance.amPM.textContent.trim() !== "AM") {
                        instance.amPM.click();
                        updateAmpmButtonsStyle();
                    }
                });

                btnPM.addEventListener("click", function(e) {
                    e.stopPropagation();
                    if (instance.amPM && instance.amPM.textContent.trim() !== "PM") {
                        instance.amPM.click();
                        updateAmpmButtonsStyle();
                    }
                });

                ampmContainer.appendChild(btnAM);
                ampmContainer.appendChild(btnPM);

                if (instance.timeContainer) {
                    timeRowContainer.appendChild(instance.timeContainer);
                }
                timeRowContainer.appendChild(ampmContainer);

                // 2. Tạo thanh 3 nút bấm (Today, Clear, Confirm)
                var actionGroup = document.createElement("div");
                actionGroup.className = "design-action-group";

                var actionRightSide = document.createElement("div");
                actionRightSide.className = "design-action-right";

                btnToday = document.createElement("button");
                btnToday.type = "button";
                btnToday.className = "btn-design-today";
                btnToday.innerHTML = "Today";
                btnToday.addEventListener("click", function(e) {
                    e.stopPropagation();
                    instance.setDate(new Date());
                    updateAmpmButtonsStyle();
                });

                var btnClear = document.createElement("button");
                btnClear.type = "button";
                btnClear.className = "btn-design-clear";
                btnClear.innerHTML = "Clear";
                btnClear.addEventListener("click", function(e) {
                    e.stopPropagation();
                    isConfirmed = true;
                    lastConfirmedValue = "";
                    wasCleared = true;
                    instance.clear();
                    updateAmpmButtonsStyle();
                });

                var btnConfirm = document.createElement("button");
                btnConfirm.type = "button";
                btnConfirm.className = "btn-design-confirm";
                btnConfirm.innerHTML = "Confirm";
                btnConfirm.addEventListener("click", function(e) {
                    e.stopPropagation();
                    isConfirmed = true;
                    if (!wasCleared && (!instance.selectedDates || instance.selectedDates.length === 0)) {
                        instance.setDate(new Date(), true);
                    }
                    instance.close();
                });

                actionGroup.appendChild(btnToday);
                actionRightSide.appendChild(btnClear);
                actionRightSide.appendChild(btnConfirm);
                actionGroup.appendChild(actionRightSide);

                instance.calendarContainer.appendChild(timeRowContainer);
                instance.calendarContainer.appendChild(actionGroup);
                updateAmpmButtonsStyle();

                // 3. Khối logic Lưới Grid Tháng / Năm Custom (3x4)
                function syncYearInput() {
                    if (instance.currentYearElement) {
                        instance.currentYearElement.value = instance.currentYear;
                    }
                }

                function isMonthDisabled(m) {
                    var y = instance.currentYear;
                    if (instance.config.minDate) {
                        var minDate = instance.config.minDate;
                        if (y < minDate.getFullYear() || (y === minDate.getFullYear() && m < minDate.getMonth())) {
                            return true;
                        }
                    }
                    if (instance.config.maxDate) {
                        var maxDate = instance.config.maxDate;
                        if (y > maxDate.getFullYear() || (y === maxDate.getFullYear() && m > maxDate.getMonth())) {
                            return true;
                        }
                    }
                    return false;
                }

                function isYearDisabled(y) {
                    if (instance.config.minDate && y < instance.config.minDate.getFullYear()) return true;
                    if (instance.config.maxDate && y > instance.config.maxDate.getFullYear()) return true;
                    return false;
                }

                function removeMyGrid() {
                    if (myMyGrid && myMyGrid.parentNode) {
                        myMyGrid.parentNode.removeChild(myMyGrid);
                    }
                    myMyGrid = null;
                }

                function enterMyMode(mode) {
                    myMode = mode;
                    var isDayMode = (mode === "day");

                    // Ẩn/hiện cụm thời gian hh:mm AM/PM triệt để
                    if (timeRowContainer) {
                        if (isDayMode) {
                            timeRowContainer.classList.remove("fp-hidden");
                        } else {
                            timeRowContainer.classList.add("fp-hidden");
                        }
                    }
                    if (instance.timeContainer) {
                        if (isDayMode) {
                            instance.timeContainer.classList.remove("fp-hidden");
                        } else {
                            instance.timeContainer.classList.add("fp-hidden");
                        }
                    }

                    // Ẩn/hiện nút Today
                    if (btnToday) {
                        if (isDayMode) {
                            btnToday.classList.remove("fp-hidden");
                        } else {
                            btnToday.classList.add("fp-hidden");
                        }
                    }

                    // Ẩn/hiện lưới ngày và thứ trong tuần
                    if (instance.daysContainer) {
                        if (isDayMode) {
                            instance.daysContainer.classList.remove("fp-hidden");
                        } else {
                            instance.daysContainer.classList.add("fp-hidden");
                        }
                    }
                    if (instance.weekdayContainer) {
                        if (isDayMode) {
                            instance.weekdayContainer.classList.remove("fp-hidden");
                        } else {
                            instance.weekdayContainer.classList.add("fp-hidden");
                        }
                    }

                    removeMyGrid();
                    if (isDayMode) return;

                    myMyGrid = document.createElement("div");
                    myMyGrid.className = "fp-my-grid";

                    if (mode === "month") {
                        var names = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                        for (var m = 0; m < 12; m++) {
                            (function(idx) {
                                var b = document.createElement("button");
                                b.type = "button";
                                b.innerHTML = names[idx];
                                if (idx === instance.currentMonth) {
                                    b.className = "fp-current";
                                }
                                if (isMonthDisabled(idx)) {
                                    b.disabled = true;
                                }
                                b.addEventListener("click", function(e) {
                                    e.stopPropagation();
                                    instance.currentMonth = idx;
                                    instance.redraw();
                                    enterMyMode("day");
                                });
                                myMyGrid.appendChild(b);
                            })(m);
                        }
                    } else if (mode === "year") {
                        for (var y = 0; y < 12; y++) {
                            (function(idx) {
                                var yr = myBaseYear + idx;
                                var b = document.createElement("button");
                                b.type = "button";
                                b.innerHTML = yr;
                                if (yr === instance.currentYear) {
                                    b.className = "fp-current";
                                }
                                if (isYearDisabled(yr)) {
                                    b.disabled = true;
                                }
                                b.addEventListener("click", function(e) {
                                    e.stopPropagation();
                                    instance.currentYear = yr;
                                    syncYearInput();
                                    instance.redraw();
                                    enterMyMode("month");
                                });
                                myMyGrid.appendChild(b);
                            })(y);
                        }
                    }

                    var anchor = instance.weekdayContainer || instance.daysContainer;
                    if (anchor && anchor.parentNode) {
                        anchor.parentNode.insertBefore(myMyGrid, anchor);
                    } else {
                        instance.calendarContainer.appendChild(myMyGrid);
                    }
                }

                function exitMyMode() {
                    if (myMode !== "day") {
                        enterMyMode("day");
                    }
                }
                instance._fpExitMyMode = exitMyMode;

                // Event delegation cho Month và Year trên header
                instance.calendarContainer.addEventListener("click", function(e) {
                    var monthTarget = e.target.closest(".flatpickr-current-month span.cur-month");
                    if (monthTarget) {
                        e.stopPropagation();
                        if (myMode === "day") {
                            enterMyMode("month");
                        } else {
                            enterMyMode("day");
                        }
                    }
                });

                instance.calendarContainer.addEventListener("mousedown", function(e) {
                    var yearTarget = e.target.closest(".flatpickr-current-month input.cur-year");
                    if (yearTarget) {
                        e.stopPropagation();
                        e.preventDefault();
                        if (myMode !== "year") {
                            myBaseYear = instance.currentYear - 4;
                            enterMyMode("year");
                        } else {
                            enterMyMode("day");
                        }
                    }
                });

                // Xử lý nút mũi tên < và > trên header khi đang ở mode Month hoặc Year
                instance.calendarContainer.addEventListener("click", function(e) {
                    var prevBtn = e.target.closest(".flatpickr-prev-month");
                    var nextBtn = e.target.closest(".flatpickr-next-month");
                    if (prevBtn) {
                        if (myMode === "year") {
                            e.preventDefault();
                            e.stopPropagation();
                            myBaseYear -= 12;
                            enterMyMode("year");
                        } else if (myMode === "month") {
                            e.preventDefault();
                            e.stopPropagation();
                            instance.currentYear -= 1;
                            syncYearInput();
                            enterMyMode("month");
                        }
                    } else if (nextBtn) {
                        if (myMode === "year") {
                            e.preventDefault();
                            e.stopPropagation();
                            myBaseYear += 12;
                            enterMyMode("year");
                        } else if (myMode === "month") {
                            e.preventDefault();
                            e.stopPropagation();
                            instance.currentYear += 1;
                            syncYearInput();
                            enterMyMode("month");
                        }
                    }
                }, true);
            }
        });

        // Hàm mở rộng toàn cục cho bất kỳ icon hay nút nào muốn mở Flatpickr
        window.openFlatpickrFor = function(inputId, evt) {
            var targetDom = document.getElementById(inputId);
            if (!targetDom || !targetDom._flatpickr) return;
            if (evt) evt.stopPropagation();
            targetDom._flatpickr.open();
        };

        // Bắt sự kiện bấm icon lịch bên cạnh ô input (Đóng nếu đang mở, Mở nếu đang đóng)
        var calendarIcon = document.getElementById("calendar-icon-btn");
        if (calendarIcon) {
            calendarIcon.addEventListener("pointerdown", function(e) {
                e.stopPropagation();
            });
            calendarIcon.addEventListener("mousedown", function(e) {
                e.stopPropagation();
                e.preventDefault();
            });
            calendarIcon.addEventListener("click", function(e) {
                e.stopPropagation();
                e.preventDefault();
                if (!pickerDom._flatpickr) return;
                var fp = pickerDom._flatpickr;
                if (fp.isOpen) {
                    fp.close();
                } else {
                    fp.open();
                }
            });
        }

        // Click vào ô input khi đang mở cũng sẽ đóng lịch lại
        if (fpInstance && fpInstance.altInput) {
            var inputWasOpen = false;
            fpInstance.altInput.addEventListener("mousedown", function(e) {
                inputWasOpen = fpInstance.isOpen;
            });
            fpInstance.altInput.addEventListener("click", function(e) {
                if (inputWasOpen) {
                    e.stopPropagation();
                    fpInstance.close();
                }
            });
        }
    });
</script>
</body>
</html>
