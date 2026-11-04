<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Flatpickr Date Time & Range Picker</title>
    <!-- FontAwesome (icon fa-calendar-alt) -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <!-- Thư viện CSS chính -->
    <link rel="stylesheet" type="text/css" href="/css/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="/css/monthSelect.min.css">
</head>
<body>
<div style="padding: 40px 15px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;">
    <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 32px;">

        <!-- =========================================================================
             1. KHỐI DATE RANGE PICKER (sDate - eDate)
             ========================================================================= -->
        <div style="display: flex; flex-direction: column; align-items: center;">
            <h4 style="margin-bottom: 16px; color: #111827; font-weight: 700; font-size: 20px;">Date Range Picker</h4>
            <div id="date-range-container" style="display: flex; align-items: center; gap: 8px;">
                <!-- Ô From (sDate) -->
                <div style="position: relative; width: 230px;">
                    <input type="text" id="sDate" name="sDate"
                           value="2026-04-10 09:00" readonly placeholder="YYYY-MM-DD HH:mm"
                           style="width: 100%; height: 42px; padding: 8px 38px 8px 12px; border: 1px solid #d1d5db; border-radius: 8px; outline: none; font-size: 14px; cursor: pointer; background: #fff; box-sizing: border-box; color: #111827;"
                           onclick="openFlatpickrFor('sDate', event, true)">
                    <i class="fa fa-calendar-alt" id="icon-sDate" style="position: absolute; right: 12px; top: 13px; color: #6b7280; cursor: pointer; font-size: 16px; z-index: 10;"
                       onclick="openFlatpickrFor('sDate', event, true)"></i>
                </div>
                <span style="color: #6b7280; font-weight: 600; font-size: 18px;">-</span>
                <!-- Ô To (eDate) -->
                <div style="position: relative; width: 230px;">
                    <input type="text" id="eDate" name="eDate"
                           value="2026-05-10 16:00" readonly placeholder="YYYY-MM-DD HH:mm"
                           style="width: 100%; height: 42px; padding: 8px 38px 8px 12px; border: 1px solid #d1d5db; border-radius: 8px; outline: none; font-size: 14px; cursor: pointer; background: #fff; box-sizing: border-box; color: #111827;"
                           onclick="openFlatpickrFor('eDate', event, true)">
                    <i class="fa fa-calendar-alt" id="icon-eDate" style="position: absolute; right: 12px; top: 13px; color: #6b7280; cursor: pointer; font-size: 16px; z-index: 10;"
                       onclick="openFlatpickrFor('eDate', event, true)"></i>
                </div>
            </div>

            <!-- CÁC NÚT THAO TÁC THEO YÊU CẦU CỦA BẠN -->
            <div style="margin-top: 14px; display: flex; gap: 10px; align-items: center; justify-content: center; flex-wrap: wrap;">
                <!-- Button mở lịch thông qua eDate: onclick="openFlatpickrFor('eDate', event, true, true)" -->
                <button type="button"
                        onclick="openFlatpickrFor('eDate', event, true, true)"
                        style="display: inline-flex; align-items: center; gap: 6px; padding: 8px 16px; background: #4f46e5; color: #ffffff; border: none; border-radius: 6px; font-weight: 600; font-size: 13px; cursor: pointer; box-shadow: 0 1px 2px rgba(0,0,0,0.05); transition: background 0.15s ease;">
                    <i class="fa fa-calendar-alt"></i> Mở lịch: openFlatpickrFor('eDate', event, true, true)
                </button>

                <!-- Button lấy kết quả của Date trả ra để xem -->
                <button type="button" id="btn-get-result"
                        style="display: inline-flex; align-items: center; gap: 6px; padding: 8px 16px; background: #059669; color: #ffffff; border: none; border-radius: 6px; font-weight: 600; font-size: 13px; cursor: pointer; box-shadow: 0 1px 2px rgba(0,0,0,0.05); transition: background 0.15s ease;">
                    <i class="fa fa-check-circle"></i> Lấy kết quả Date đã chọn
                </button>
            </div>

            <!-- Khung hiển thị chi tiết kết quả Date trả ra -->
            <div id="result-display-box" style="display: none; margin-top: 14px; width: 100%; max-width: 480px; padding: 12px 16px; background: #f8fafc; border: 1px solid #cbd5e1; border-radius: 8px; box-sizing: border-box;">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 6px;">
                    <span style="font-size: 12px; font-weight: 700; color: #334155; text-transform: uppercase;">Kết quả Date trả ra:</span>
                    <span style="font-size: 11px; color: #64748b;" id="result-timestamp"></span>
                </div>
                <div id="result-content" style="font-family: Consolas, Monaco, monospace; font-size: 13px; color: #0f172a; line-height: 1.5;"></div>
            </div>
        </div>

        <!-- =========================================================================
             2. KHỐI SINGLE DATE TIME PICKER (DEMO CHẾ ĐỘ CŨ)
             ========================================================================= -->
        <div style="display: flex; flex-direction: column; align-items: center; border-top: 1px dashed #e5e7eb; padding-top: 24px; width: 100%; max-width: 500px;">
            <h5 style="margin-bottom: 16px; color: #6b7280; font-weight: 600;">Single Date & Time Picker</h5>
            <div style="position: relative; width: 320px;">
                <input type="text" id="native-flatpickr-input" name="scheduleDateTime"
                       value="${savedDateFromJava}" readonly placeholder="YYYY-MM-DD hh:mm AM"
                       style="width: 100%; height: 42px; padding: 8px 40px 8px 14px; border: 1px solid #d1d5db; border-radius: 8px; outline: none; font-size: 14px; cursor: pointer; background: #fff; box-sizing: border-box; color: #111827;"
                       onclick="openFlatpickrFor('native-flatpickr-input', event, true, false)">
                <i class="fa fa-calendar-alt" id="calendar-icon-btn" style="position: absolute; right: 14px; top: 12px; color: #7c5ce0; cursor: pointer; font-size: 18px; z-index: 10;"
                   onclick="openFlatpickrFor('native-flatpickr-input', event, true, false)"></i>
            </div>
        </div>

    </div>
</div>

<!-- JavaScript Libraries -->
<script src="/js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="/js/flatpickr.min.js"></script>
<script type="text/javascript" src="/js/monthSelect.min.js"></script>

<style>
    /* =========================================================================
       1. CẤU TRÚC CHUNG CỦA FLATPICKR CONTAINER
       ========================================================================= */
    .flatpickr-calendar {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif !important;
        font-size: 14px !important;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12) !important;
        border-radius: 10px !important;
        border: 1px solid #d1d5db !important;
        background: #ffffff !important;
        overflow: hidden !important;
    }

    /* Chế độ Single */
    .flatpickr-calendar:not(.rangeMode) {
        width: 250px !important;
    }

    .flatpickr-calendar:not(.rangeMode) .dayContainer {
        width: 196px !important;
        min-width: 196px !important;
        max-width: 196px !important;
        margin: 0 auto !important;
        justify-content: flex-start !important;
    }

    .flatpickr-calendar:not(.rangeMode) .flatpickr-weekdaycontainer {
        width: 196px !important;
        min-width: 196px !important;
        max-width: 196px !important;
        margin: 0 auto !important;
        justify-content: flex-start !important;
    }

    /* Chế độ Range 2 tháng song song */
    .flatpickr-calendar.rangeMode {
        width: 480px !important;
        max-width: 96vw !important;
    }

    .flatpickr-calendar.rangeMode .flatpickr-innerContainer {
        display: flex !important;
        justify-content: center !important;
        width: 100% !important;
    }

    .flatpickr-calendar.rangeMode .flatpickr-rContainer {
        display: flex !important;
        flex-direction: column !important;
        width: 100% !important;
    }

    /* Header các thứ trong tuần (S M T W T F S) */
    .flatpickr-calendar.rangeMode .flatpickr-weekdays {
        display: flex !important;
        width: 100% !important;
        justify-content: space-around !important;
        height: 28px !important;
        border-bottom: 1px solid #f3f4f6 !important;
    }

    .flatpickr-calendar.rangeMode .flatpickr-weekdaycontainer {
        display: flex !important;
        width: 196px !important;
        min-width: 196px !important;
        max-width: 196px !important;
        justify-content: flex-start !important;
    }

    /* Lưới ngày 2 tháng */
    .flatpickr-calendar.rangeMode .flatpickr-days {
        display: flex !important;
        width: 100% !important;
        justify-content: space-around !important;
    }

    /* Container 7 cột ngày x 28px = 196px (Loại bỏ hoàn toàn khoảng cách thừa) */
    .flatpickr-calendar.rangeMode .dayContainer {
        width: 196px !important;
        min-width: 196px !important;
        max-width: 196px !important;
        padding: 4px 0 !important;
        box-sizing: border-box !important;
        display: flex !important;
        flex-wrap: wrap !important;
        justify-content: flex-start !important;
        align-content: flex-start !important;
    }

    .flatpickr-calendar.rangeMode .dayContainer + .dayContainer {
        box-shadow: none !important;
    }

    /* Header thanh tiêu đề tháng / năm */
    .flatpickr-months {
        position: relative !important;
        display: flex !important;
        align-items: center !important;
        justify-content: space-between !important;
        height: 40px !important;
        padding: 4px 12px !important;
        background: #ffffff !important;
        border-bottom: 1px solid #f3f4f6 !important;
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
        height: 32px !important;
        text-align: center !important;
        font-size: 15px !important;
        font-weight: 600 !important;
        color: #111827 !important;
    }

    .flatpickr-current-month span.cur-month {
        cursor: pointer !important;
        border-radius: 6px !important;
        padding: 2px 6px !important;
        margin: 0 !important;
        font-size: 15px !important;
        font-weight: 600 !important;
        color: #111827 !important;
        transition: background 0.15s ease !important;
    }

    .flatpickr-current-month span.cur-month:hover {
        background: #f3f4f6 !important;
        color: #2563eb !important;
    }

    .flatpickr-current-month .numInputWrapper {
        width: auto !important;
        height: 32px !important;
        display: inline-flex !important;
        align-items: center !important;
        border: none !important;
        background: transparent !important;
    }

    .flatpickr-current-month .numInputWrapper span {
        display: none !important;
    }

    .flatpickr-current-month input.cur-year {
        padding: 2px 4px !important;
        border: none !important;
        border-radius: 6px !important;
        background: transparent !important;
        height: 26px !important;
        width: 52px !important;
        font-size: 15px !important;
        font-weight: 600 !important;
        color: #111827 !important;
        cursor: pointer !important;
        text-align: center !important;
        transition: background 0.15s ease !important;
    }

    .flatpickr-current-month input.cur-year:hover {
        background: #f3f4f6 !important;
        color: #2563eb !important;
    }

    /* Mũi tên < và > điều hướng */
    .flatpickr-months .flatpickr-prev-month,
    .flatpickr-months .flatpickr-next-month {
        position: static !important;
        z-index: 5 !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        width: 28px !important;
        height: 28px !important;
        padding: 0 !important;
        border-radius: 6px !important;
        background: transparent !important;
        cursor: pointer !important;
        transition: background 0.15s ease !important;
    }

    .flatpickr-months .flatpickr-prev-month:hover,
    .flatpickr-months .flatpickr-next-month:hover {
        background: #f3f4f6 !important;
    }

    .flatpickr-months .flatpickr-prev-month svg,
    .flatpickr-months .flatpickr-next-month svg {
        width: 12px !important;
        height: 12px !important;
        fill: #4b5563 !important;
    }

    .flatpickr-months .flatpickr-prev-month:hover svg,
    .flatpickr-months .flatpickr-next-month:hover svg {
        fill: #2563eb !important;
    }

    .flatpickr-current-month .flatpickr-monthDropdown-months {
        display: none !important;
    }

    /* =========================================================================
       2. ĐỊNH DẠNG Ô NGÀY CHUẨN: WIDTH 28PX x HEIGHT 28PX
       ========================================================================= */
    .flatpickr-calendar .flatpickr-day,
    .flatpickr-calendar .flatpickr-day.selected,
    .flatpickr-calendar .flatpickr-day.startRange,
    .flatpickr-calendar .flatpickr-day.endRange,
    .flatpickr-calendar .flatpickr-day.inRange,
    .flatpickr-calendar .flatpickr-day.selected.startRange + .endRange,
    .flatpickr-calendar .flatpickr-day.startRange + .endRange,
    .flatpickr-calendar .flatpickr-day.endRange + .startRange {
        -webkit-box-shadow: none !important;
        box-shadow: none !important;
    }

    .flatpickr-calendar .flatpickr-weekday {
        width: 28px !important;
        max-width: 28px !important;
        min-width: 28px !important;
        height: 28px !important;
        line-height: 28px !important;
        font-size: 13px !important;
        font-weight: 600 !important;
        color: #4b5563 !important;
        text-align: center !important;
        margin: 0 !important;
        padding: 0 !important;
    }

    .flatpickr-calendar .flatpickr-weekday:first-child {
        color: #ef4444 !important;
    }

    .flatpickr-calendar .flatpickr-day {
        width: 28px !important;
        height: 28px !important;
        line-height: 28px !important;
        max-width: 28px !important;
        min-width: 28px !important;
        margin: 1px 0 !important;
        padding: 0 !important;
        font-size: 13px !important;
        color: #111827;
        border-radius: 50% !important;
        border: none !important;
        box-sizing: border-box !important;
        position: relative !important;
        z-index: 1 !important;
        transition: background 0.1s ease !important;
    }

    .flatpickr-calendar .flatpickr-day:nth-child(7n+1):not(.selected):not(.startRange):not(.endRange):not(.inRange):not(.flatpickr-disabled) {
        color: #ef4444 !important;
    }

    .flatpickr-calendar .flatpickr-day:not(.selected):not(.startRange):not(.endRange):not(.flatpickr-disabled):hover {
        background: #f3f4f6 !important;
        border-radius: 50% !important;
    }

    .flatpickr-calendar .flatpickr-day.today:not(.selected):not(.startRange):not(.endRange)::after {
        content: "" !important;
        position: absolute !important;
        left: 50% !important;
        bottom: 2px !important;
        transform: translateX(-50%) !important;
        width: 12px !important;
        height: 2px !important;
        border-radius: 2px !important;
        background: #2563eb !important;
    }

    .flatpickr-calendar .flatpickr-day.flatpickr-disabled {
        color: #d1d5db !important;
        background: transparent !important;
        cursor: not-allowed !important;
    }

    /* =========================================================================
       3. ĐỊNH DẠNG DẢI CHỌN RANGE: LIỀN MẠCH, KHÔNG KHOẢNG CÁCH, KHÔNG THỪA MÀU
       ========================================================================= */
    .flatpickr-calendar .flatpickr-day.selected,
    .flatpickr-calendar .flatpickr-day.startRange,
    .flatpickr-calendar .flatpickr-day.endRange {
        background: #2563eb !important;
        border-color: #2563eb !important;
        color: #ffffff !important;
        font-weight: 600 !important;
        border-radius: 50% !important;
        z-index: 3 !important;
    }

    .flatpickr-calendar .flatpickr-day.inRange {
        background: #d8e5fd !important;
        color: #1e40af !important;
        border-radius: 0 !important;
        z-index: 1 !important;
    }

    .flatpickr-calendar.rangeMode .flatpickr-day.startRange.has-end::before {
        content: "" !important;
        position: absolute !important;
        top: 0 !important;
        bottom: 0 !important;
        right: 0 !important;
        width: 50% !important;
        background: #d8e5fd !important;
        z-index: -1 !important;
    }

    .flatpickr-calendar.rangeMode .flatpickr-day.endRange.has-start::before {
        content: "" !important;
        position: absolute !important;
        top: 0 !important;
        bottom: 0 !important;
        left: 0 !important;
        width: 50% !important;
        background: #d8e5fd !important;
        z-index: -1 !important;
    }

    .flatpickr-calendar.rangeMode .flatpickr-day.inRange:nth-child(7n+1) {
        border-top-left-radius: 4px !important;
        border-bottom-left-radius: 4px !important;
    }

    .flatpickr-calendar.rangeMode .flatpickr-day.inRange:nth-child(7n) {
        border-top-right-radius: 4px !important;
        border-bottom-right-radius: 4px !important;
    }

    /* =========================================================================
       4. CONTAINER 2 CỤM HH:MM RIÊNG DƯỚI LƯỚI NGÀY
       ========================================================================= */
    .range-time-wrapper {
        display: flex !important;
        width: 100% !important;
        justify-content: space-around !important;
        padding: 8px 0 !important;
        background: #ffffff !important;
        border-top: 1px solid #f3f4f6 !important;
        box-sizing: border-box !important;
    }

    .range-time-col {
        width: 196px !important;
        display: flex !important;
        justify-content: center !important;
        align-items: center !important;
        box-sizing: border-box !important;
    }

    .range-time-box {
        display: flex !important;
        align-items: center !important;
        gap: 4px !important;
    }

    .range-num-wrap {
        position: relative !important;
        width: 58px !important;
        height: 30px !important;
        border: 1px solid #d1d5db !important;
        border-radius: 6px !important;
        background: #ffffff !important;
        display: flex !important;
        align-items: center !important;
        box-sizing: border-box !important;
    }

    .range-num-wrap input.range-time-input {
        width: 36px !important;
        height: 100% !important;
        border: none !important;
        outline: none !important;
        background: transparent !important;
        text-align: center !important;
        font-size: 13px !important;
        font-weight: 500 !important;
        color: #111827 !important;
        padding: 0 0 0 4px !important;
        box-sizing: border-box !important;
        -moz-appearance: textfield !important;
    }

    .range-num-wrap input.range-time-input::-webkit-outer-spin-button,
    .range-num-wrap input.range-time-input::-webkit-inner-spin-button {
        -webkit-appearance: none !important;
        margin: 0 !important;
    }

    .range-stepper {
        position: absolute !important;
        right: 0 !important;
        top: 0 !important;
        bottom: 0 !important;
        width: 18px !important;
        border-left: 1px solid #e5e7eb !important;
        display: flex !important;
        flex-direction: column !important;
    }

    .range-stepper .range-step-btn {
        flex: 1 !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        cursor: pointer !important;
        background: transparent !important;
        user-select: none !important;
        transition: background 0.1s ease !important;
    }

    .range-stepper .range-step-btn:hover {
        background: #f3f4f6 !important;
    }

    .range-stepper .range-step-btn svg {
        pointer-events: none !important;
    }

    .range-time-sep {
        font-size: 14px !important;
        font-weight: 700 !important;
        color: #374151 !important;
        margin: 0 2px !important;
        user-select: none !important;
    }

    /* Single mode: cụm giờ mặc định */
    .time-row-container {
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        padding: 8px 12px !important;
        background: #ffffff !important;
        border-top: 1px solid #f3f4f6 !important;
    }

    /* =========================================================================
       5. CHÂN LỊCH: PREVIEW NGÀY GIỜ + NÚT CLEAR / CONFIRM
       ========================================================================= */
    .design-action-group {
        display: flex !important;
        justify-content: space-between !important;
        align-items: center !important;
        padding: 8px 14px !important;
        border-top: 1px solid #e5e7eb !important;
        background: #ffffff !important;
        box-sizing: border-box !important;
    }

    .btn-design-preview {
        font-size: 13px !important;
        color: #374151 !important;
        font-weight: 500 !important;
        background: transparent !important;
        border: none !important;
        padding: 0 !important;
        text-align: left !important;
        user-select: none !important;
        font-variant-numeric: tabular-nums !important;
    }

    .design-action-right {
        display: flex !important;
        gap: 6px !important;
        margin-left: auto !important;
    }

    .btn-design-clear {
        padding: 4px 12px !important;
        font-size: 13px !important;
        font-weight: 500 !important;
        cursor: pointer !important;
        border: 1px solid #d1d5db !important;
        border-radius: 6px !important;
        background: #ffffff !important;
        color: #4b5563 !important;
        outline: none !important;
        height: 28px !important;
        transition: all 0.15s ease !important;
    }

    .btn-design-clear:hover {
        border-color: #9ca3af !important;
        background: #f9fafb !important;
        color: #111827 !important;
    }

    .btn-design-confirm {
        padding: 4px 14px !important;
        font-size: 13px !important;
        font-weight: 500 !important;
        cursor: pointer !important;
        border: 1px solid #2563eb !important;
        border-radius: 6px !important;
        background: #2563eb !important;
        color: #ffffff !important;
        outline: none !important;
        height: 28px !important;
        transition: all 0.15s ease !important;
    }

    .btn-design-confirm:hover {
        background: #1d4ed8 !important;
        border-color: #1d4ed8 !important;
    }

    /* =========================================================================
       6. LƯỚI GRID THÁNG (3X4) & NĂM CUSTOM
       ========================================================================= */
    .fp-my-grid {
        display: grid !important;
        grid-template-columns: repeat(3, 1fr) !important;
        gap: 12px 14px !important;
        padding: 16px !important;
        background: #ffffff !important;
        box-sizing: border-box !important;
        width: 100% !important;
    }

    .fp-my-grid button {
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        height: 38px !important;
        width: 38px !important;
        margin: 0 auto !important;
        border: none !important;
        border-radius: 50% !important;
        background: transparent !important;
        color: #111827 !important;
        font-size: 14px !important;
        font-weight: 500 !important;
        cursor: pointer !important;
        outline: none !important;
        transition: all 0.15s ease !important;
    }

    .fp-my-grid button:hover:not(:disabled) {
        background: #f3f4f6 !important;
    }

    .fp-my-grid button.fp-current {
        background: #2563eb !important;
        color: #ffffff !important;
        font-weight: 600 !important;
    }

    .fp-my-grid button.fp-underline::after {
        content: "" !important;
        position: absolute;
        bottom: 4px;
        width: 14px;
        height: 2px;
        border-radius: 2px;
        background: #2563eb;
    }

    .fp-year-wrap {
        display: flex !important;
        flex-direction: column !important;
        width: 100% !important;
        padding: 12px 16px !important;
        background: #ffffff !important;
        box-sizing: border-box !important;
    }

    .fp-year-search {
        display: flex !important;
        align-items: center !important;
        height: 34px !important;
        border-radius: 6px !important;
        border: 1px solid #d1d5db !important;
        padding: 4px 10px !important;
        background: #ffffff !important;
        margin-bottom: 8px !important;
        box-sizing: border-box !important;
    }

    .fp-year-search input {
        flex: 1 !important;
        border: none !important;
        outline: none !important;
        font-size: 13px !important;
        color: #111827 !important;
        background: transparent !important;
    }

    .fp-year-list {
        overflow-y: auto !important;
        height: 200px !important;
        border: 1px solid #f1f5f9 !important;
        border-radius: 6px !important;
        padding: 4px 0 !important;
    }

    .fp-year-item {
        display: block !important;
        width: 100% !important;
        height: 32px !important;
        line-height: 32px !important;
        padding: 0 14px !important;
        border: none !important;
        background: transparent !important;
        color: #333333 !important;
        font-size: 13px !important;
        text-align: left !important;
        cursor: pointer !important;
        transition: background 0.1s ease !important;
        box-sizing: border-box !important;
    }

    .fp-year-item:hover {
        background: #f1f5f9 !important;
    }

    .fp-year-item.fp-current {
        background: #2563eb !important;
        color: #ffffff !important;
        font-weight: 600 !important;
    }

    /* =========================================================================
       7. CLASS ẨN TRIỆT ĐỂ KHI Ở CHẾ ĐỘ THÁNG / NĂM (ĐẶT Ở CUỐI ĐỂ ƯU TIÊN CAO NHẤT)
       ========================================================================= */
    .flatpickr-calendar .fp-hidden,
    .range-time-wrapper.fp-hidden,
    .time-row-container.fp-hidden,
    .flatpickr-time.fp-hidden,
    .design-action-group.fp-hidden,
    .design-action-group button.fp-hidden,
    .flatpickr-innerContainer.fp-hidden,
    .fp-hidden {
        display: none !important;
    }
</style>

<script>
    var _fpOpenInstances = [];
    function _fpCloseOthers(currentInstance) {
        _fpOpenInstances.forEach(function (inst) {
            if (inst !== currentInstance && inst.isOpen) {
                inst.close();
            }
        });
    }

    $(document).ready(function() {

        /**
         * Bộ phân giải cặp Start Dom và End Dom linh hoạt:
         * - sDate <-> eDate
         * - rangePickerS <-> rangePickerE
         * - startDate <-> endDate
         */
        function resolveRangePair(id) {
            var startDom = null;
            var endDom = null;

            if (id === "sDate" || id === "eDate") {
                startDom = document.getElementById("sDate");
                endDom = document.getElementById("eDate");
            } else if (id === "rangePickerS" || id === "rangePickerE") {
                startDom = document.getElementById("rangePickerS");
                endDom = document.getElementById("rangePickerE");
            } else if (/^s([A-Z_].*)$/.test(id)) {
                var candidateEnd = document.getElementById("e" + RegExp.$1);
                startDom = document.getElementById(id);
                endDom = candidateEnd || document.getElementById("eDate");
            } else if (/^e([A-Z_].*)$/.test(id)) {
                var candidateStart = document.getElementById("s" + RegExp.$1);
                startDom = candidateStart || document.getElementById("sDate");
                endDom = document.getElementById(id);
            } else if (/start/i.test(id)) {
                var eId = id.replace(/start/i, "end").replace(/End/i, "Start");
                startDom = document.getElementById(id);
                endDom = document.getElementById(eId) || document.getElementById("eDate");
            } else if (/end/i.test(id)) {
                var sId = id.replace(/end/i, "start").replace(/End/i, "Start");
                startDom = document.getElementById(sId) || document.getElementById("sDate");
                endDom = document.getElementById(id);
            }

            var isPair = !!(startDom && endDom && startDom !== endDom);
            return {
                startDom: startDom,
                endDom: endDom,
                isPair: isPair
            };
        }

        /**
         * Hàm mở Flatpickr thông minh cho mọi trường hợp:
         * - openFlatpickrFor('sDate', event, true)
         * - openFlatpickrFor('eDate', event, true)
         * - openFlatpickrFor('eDate', event, true, true)
         */
        window.openFlatpickrFor = function (inputId, evt, showTime, range) {
            var e = evt || window.event;
            if (e && typeof e.stopPropagation === "function") {
                e.stopPropagation();
            }

            if (typeof showTime === "undefined") showTime = true;

            var pair = resolveRangePair(inputId);
            var isRange = false;

            if (range === true) {
                isRange = true;
            } else if (range === false) {
                isRange = false;
            } else {
                if (pair.isPair || inputId === "sDate" || inputId === "eDate") {
                    isRange = true;
                }
            }

            var pickerDom = null;
            var startDom = null;
            var endDom = null;

            if (isRange) {
                startDom = pair.startDom || document.getElementById("sDate");
                endDom = pair.endDom || document.getElementById("eDate");
                pickerDom = startDom;
            } else {
                pickerDom = document.getElementById(inputId);
            }

            if (!pickerDom) return;

            // Nếu instance đã khởi tạo: toggle mở / đóng thông minh
            if (pickerDom._flatpickr) {
                var fp = pickerDom._flatpickr;
                var currentTrigger = (e && e.target) ? e.target : inputId;
                if (fp.isOpen) {
                    if (pickerDom._lastTrigger === currentTrigger) {
                        fp.close();
                        pickerDom._lastTrigger = null;
                        return;
                    }
                }
                pickerDom._lastTrigger = currentTrigger;
                fp.open();
                return;
            }
            pickerDom._lastTrigger = (e && e.target) ? e.target : inputId;

            var isConfirmed = false;
            var myMode = "day";
            var pickedYear = null;
            var pickedMonth = null;
            var myMyGrid = null;
            var myYearList = null;
            var myYearSearch = "";

            var lastConfirmedRange = [
                (pickerDom && pickerDom.value) ? pickerDom.value.trim() : "",
                (endDom && endDom.value) ? endDom.value.trim() : ""
            ];

            var initialSingleValue = (pickerDom && pickerDom.value) ? pickerDom.value.trim() : "";
            var lastConfirmedSingle = initialSingleValue;

            function parseCustomDateTime(str) {
                if (!str) return null;
                var parts = str.trim().split(/\s+/);
                var dParts = parts[0].split(/[-/]/);
                if (dParts.length < 3) return null;
                var y = parseInt(dParts[0], 10);
                var m = parseInt(dParts[1], 10) - 1;
                var d = parseInt(dParts[2], 10);
                var hh = 0, mm = 0;
                if (parts[1]) {
                    var tParts = parts[1].split(":");
                    hh = parseInt(tParts[0], 10) || 0;
                    mm = parseInt(tParts[1], 10) || 0;
                }
                var res = new Date(y, m, d, hh, mm, 0, 0);
                return isNaN(res.getTime()) ? null : res;
            }

            pickerDom._flatpickr = flatpickr(pickerDom, {
                showMonths: isRange ? 2 : 1,
                enableTime: !isRange && showTime,
                time_24hr: true,
                minuteIncrement: 1,
                static: true,
                altInput: false,
                allowInput: true,
                clickOpens: false,
                closeOnSelect: false,
                monthSelectorType: "static",
                mode: "single",
                dateFormat: showTime ? "Y-m-d H:i" : "Y-m-d",
                positionElement: isRange ? (document.getElementById("date-range-container") || pickerDom) : pickerDom,

                locale: {
                    weekdays: {
                        shorthand: ["S", "M", "T", "W", "T", "F", "S"],
                        longhand: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
                    }
                },

                onDayCreate: function (dObj, dStr, fp, dayElem) {
                    if (isRange && fp._myRangeDates) {
                        var d = dayElem.dateObj;
                        if (!d) return;
                        var curr = new Date(d.getFullYear(), d.getMonth(), d.getDate()).getTime();
                        var sDate = fp._myRangeDates[0];
                        var eDate = fp._myRangeDates[1];

                        var sTime = sDate ? new Date(sDate.getFullYear(), sDate.getMonth(), sDate.getDate()).getTime() : null;
                        var eTime = eDate ? new Date(eDate.getFullYear(), eDate.getMonth(), eDate.getDate()).getTime() : null;

                        dayElem.classList.remove("inRange", "startRange", "endRange", "selected", "has-end", "has-start");

                        if (sTime !== null && eTime !== null) {
                            if (curr >= sTime && curr <= eTime) {
                                if (curr === sTime) {
                                    dayElem.classList.add("startRange", "selected");
                                    if (sTime !== eTime) dayElem.classList.add("has-end");
                                } else if (curr === eTime) {
                                    dayElem.classList.add("endRange", "selected");
                                    if (sTime !== eTime) dayElem.classList.add("has-start");
                                } else {
                                    dayElem.classList.add("inRange");
                                }
                            }
                        } else if (sTime !== null) {
                            if (curr === sTime) {
                                dayElem.classList.add("startRange", "selected");
                            }
                        }
                    }
                },

                onChange: function (selectedDates, dateStr, instance) {
                    if (!isRange) {
                        if (instance._renderPreview) instance._renderPreview();
                        return;
                    }

                    if (!instance._myRangeDates) {
                        instance._myRangeDates = [];
                    }

                    if (selectedDates && selectedDates.length > 0) {
                        var clicked = new Date(selectedDates[0].getTime());
                        clicked.setSeconds(0, 0);

                        if (instance._myRangeDates.length !== 1) {
                            var hL = parseInt(rangeTimeRows.leftHour.value, 10) || 0;
                            var mL = parseInt(rangeTimeRows.leftMin.value, 10) || 0;
                            clicked.setHours(hL, mL, 0, 0);
                            instance._myRangeDates = [clicked];
                        } else {
                            var startD = new Date(instance._myRangeDates[0]);
                            var startZero = new Date(startD.getFullYear(), startD.getMonth(), startD.getDate()).getTime();
                            var clickZero = new Date(clicked.getFullYear(), clicked.getMonth(), clicked.getDate()).getTime();

                            if (clickZero < startZero) {
                                var hL2 = parseInt(rangeTimeRows.leftHour.value, 10) || 0;
                                var mL2 = parseInt(rangeTimeRows.leftMin.value, 10) || 0;
                                clicked.setHours(hL2, mL2, 0, 0);
                                instance._myRangeDates = [clicked];
                            } else {
                                var hR = parseInt(rangeTimeRows.rightHour.value, 10) || 0;
                                var mR = parseInt(rangeTimeRows.rightMin.value, 10) || 0;
                                clicked.setHours(hR, mR, 0, 0);
                                instance._myRangeDates.push(clicked);
                            }
                        }
                    }

                    instance.redraw();
                    if (instance._renderPreview) instance._renderPreview();
                },

                onOpen: function (selectedDates, dateStr, instance) {
                    if (instance._fpExitMyMode) instance._fpExitMyMode();
                    _fpCloseOthers(instance);
                    if (_fpOpenInstances.indexOf(instance) === -1) {
                        _fpOpenInstances.push(instance);
                    }

                    isConfirmed = false;

                    if (isRange) {
                        instance._myRangeDates = [];
                        var dS = parseCustomDateTime(pickerDom.value);
                        var dE = parseCustomDateTime(endDom ? endDom.value : "");

                        if (dS) {
                            instance._myRangeDates.push(dS);
                            rangeTimeRows.setLeftTime(dS.getHours(), dS.getMinutes());
                        } else {
                            rangeTimeRows.setLeftTime(9, 0);
                        }

                        if (dE) {
                            instance._myRangeDates.push(dE);
                            rangeTimeRows.setRightTime(dE.getHours(), dE.getMinutes());
                        } else {
                            rangeTimeRows.setRightTime(16, 0);
                        }

                        if (dS) {
                            instance.jumpToDate(dS);
                        }
                        instance.redraw();
                    } else {
                        lastConfirmedSingle = pickerDom.value;
                    }

                    if (instance._renderPreview) instance._renderPreview();
                },

                onClose: function (selectedDates, dateStr, instance) {
                    if (instance._fpExitMyMode) instance._fpExitMyMode();
                    var idx = _fpOpenInstances.indexOf(instance);
                    if (idx !== -1) _fpOpenInstances.splice(idx, 1);

                    if (!isConfirmed) {
                        if (isRange) {
                            pickerDom.value = lastConfirmedRange[0] || "";
                            if (endDom) endDom.value = lastConfirmedRange[1] || "";
                        } else {
                            pickerDom.value = lastConfirmedSingle || "";
                        }
                    }
                },

                onReady: function (selectedDates, dateStr, instance) {
                    if (isRange && instance.calendarContainer) {
                        instance.calendarContainer.classList.add("rangeMode");
                    }
                }
            });

            var instance = pickerDom._flatpickr;

            // =========================================================================
            // 2 CỤM HH:MM RIÊNG DƯỚI 2 THÁNG (RANGE MODE)
            // =========================================================================
            var rangeTimeRows = {
                leftHour: null,
                leftMin: null,
                rightHour: null,
                rightMin: null,
                setLeftTime: function(h, m) {
                    if (this.leftHour) this.leftHour.value = ("0" + h).slice(-2);
                    if (this.leftMin) this.leftMin.value = ("0" + m).slice(-2);
                },
                setRightTime: function(h, m) {
                    if (this.rightHour) this.rightHour.value = ("0" + h).slice(-2);
                    if (this.rightMin) this.rightMin.value = ("0" + m).slice(-2);
                }
            };

            var rangeTimeWrapper = null;
            if (isRange) {
                if (instance.timeContainer) {
                    instance.timeContainer.classList.add("fp-hidden");
                }

                rangeTimeWrapper = document.createElement("div");
                rangeTimeWrapper.className = "range-time-wrapper";

                function createTimeCol(isRightSide) {
                    var col = document.createElement("div");
                    col.className = "range-time-col " + (isRightSide ? "range-time-col-right" : "range-time-col-left");

                    var box = document.createElement("div");
                    box.className = "range-time-box";

                    function createInputWrap(isMinute) {
                        var wrap = document.createElement("div");
                        wrap.className = "range-num-wrap";

                        var inp = document.createElement("input");
                        inp.type = "text";
                        inp.className = "range-time-input";
                        inp.maxLength = 2;
                        inp.value = isMinute ? "00" : (isRightSide ? "16" : "09");

                        var stepper = document.createElement("div");
                        stepper.className = "range-stepper";

                        var btnUp = document.createElement("span");
                        btnUp.className = "range-step-btn range-up";
                        btnUp.innerHTML = '<svg width="7" height="4" viewBox="0 0 7 4"><path d="M1 3L3.5 1L6 3" stroke="#4b5563" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/></svg>';

                        var btnDown = document.createElement("span");
                        btnDown.className = "range-step-btn range-down";
                        btnDown.innerHTML = '<svg width="7" height="4" viewBox="0 0 7 4"><path d="M1 1L3.5 3L6 1" stroke="#4b5563" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/></svg>';

                        stepper.appendChild(btnUp);
                        stepper.appendChild(btnDown);
                        wrap.appendChild(inp);
                        wrap.appendChild(stepper);

                        function stepValue(delta) {
                            var max = isMinute ? 59 : 23;
                            var cur = parseInt(inp.value, 10);
                            if (isNaN(cur)) cur = 0;
                            cur += delta;
                            if (cur < 0) cur = max;
                            if (cur > max) cur = 0;
                            inp.value = ("0" + cur).slice(-2);
                            applyTimeChange();
                        }

                        btnUp.addEventListener("mousedown", function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            stepValue(1);
                        });

                        btnDown.addEventListener("mousedown", function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            stepValue(-1);
                        });

                        inp.addEventListener("change", function() {
                            var max = isMinute ? 59 : 23;
                            var val = parseInt(inp.value, 10);
                            if (isNaN(val)) val = 0;
                            if (val < 0) val = 0;
                            if (val > max) val = max;
                            inp.value = ("0" + val).slice(-2);
                            applyTimeChange();
                        });

                        return { wrap: wrap, input: inp };
                    }

                    var hourObj = createInputWrap(false);
                    var minObj = createInputWrap(true);

                    var sep = document.createElement("span");
                    sep.className = "range-time-sep";
                    sep.textContent = ":";

                    box.appendChild(hourObj.wrap);
                    box.appendChild(sep);
                    box.appendChild(minObj.wrap);
                    col.appendChild(box);

                    function applyTimeChange() {
                        if (!instance._myRangeDates) return;
                        var idx = isRightSide ? 1 : 0;
                        var target = instance._myRangeDates[idx];
                        if (target) {
                            var hh = parseInt(hourObj.input.value, 10) || 0;
                            var mm = parseInt(minObj.input.value, 10) || 0;
                            target.setHours(hh, mm, 0, 0);
                        }
                        if (instance._renderPreview) instance._renderPreview();
                    }

                    if (isRightSide) {
                        rangeTimeRows.rightHour = hourObj.input;
                        rangeTimeRows.rightMin = minObj.input;
                    } else {
                        rangeTimeRows.leftHour = hourObj.input;
                        rangeTimeRows.leftMin = minObj.input;
                    }

                    return col;
                }

                rangeTimeWrapper.appendChild(createTimeCol(false));
                rangeTimeWrapper.appendChild(createTimeCol(true));
                instance.calendarContainer.appendChild(rangeTimeWrapper);

                // Hover xem trước dải ngày
                instance.calendarContainer.addEventListener("mouseover", function(e) {
                    if (!instance._myRangeDates || instance._myRangeDates.length !== 1) return;
                    var dayElem = e.target.closest(".flatpickr-day");
                    if (!dayElem || !dayElem.dateObj || dayElem.classList.contains("flatpickr-disabled")) return;

                    var sTime = new Date(instance._myRangeDates[0].getFullYear(), instance._myRangeDates[0].getMonth(), instance._myRangeDates[0].getDate()).getTime();
                    var hoverTime = new Date(dayElem.dateObj.getFullYear(), dayElem.dateObj.getMonth(), dayElem.dateObj.getDate()).getTime();

                    var allDays = instance.calendarContainer.querySelectorAll(".flatpickr-day:not(.flatpickr-disabled)");
                    allDays.forEach(function(dEl) {
                        if (!dEl.dateObj) return;
                        var t = new Date(dEl.dateObj.getFullYear(), dEl.dateObj.getMonth(), dEl.dateObj.getDate()).getTime();
                        if (hoverTime > sTime) {
                            if (t === sTime) {
                                dEl.classList.add("has-end");
                            } else if (t > sTime && t < hoverTime) {
                                dEl.classList.add("inRange");
                                dEl.classList.remove("endRange", "has-start");
                            } else if (t === hoverTime) {
                                dEl.classList.add("endRange", "has-start");
                                dEl.classList.remove("inRange");
                            } else if (t > hoverTime) {
                                dEl.classList.remove("inRange", "endRange", "has-start");
                            }
                        } else {
                            if (t === sTime) {
                                dEl.classList.remove("has-end");
                            } else {
                                dEl.classList.remove("inRange", "endRange", "has-start");
                            }
                        }
                    });
                });

                instance.calendarContainer.addEventListener("mouseleave", function() {
                    if (instance._myRangeDates && instance._myRangeDates.length === 1) {
                        var allDays = instance.calendarContainer.querySelectorAll(".flatpickr-day");
                        allDays.forEach(function(dEl) {
                            dEl.classList.remove("inRange", "endRange", "has-end", "has-start");
                        });
                    }
                });
            }

            // =========================================================================
            // CHÂN LỊCH: PREVIEW + CLEAR + CONFIRM
            // =========================================================================
            var actionGroup = document.createElement("div");
            actionGroup.className = "design-action-group";

            var previewLabel = document.createElement("span");
            previewLabel.className = "btn-design-preview";

            var actionRight = document.createElement("div");
            actionRight.className = "design-action-right";

            var btnClear = document.createElement("button");
            btnClear.type = "button";
            btnClear.className = "btn-design-clear";
            btnClear.textContent = "Clear";

            var btnConfirm = document.createElement("button");
            btnConfirm.type = "button";
            btnConfirm.className = "btn-design-confirm";
            btnConfirm.textContent = "Confirm";

            actionRight.appendChild(btnClear);
            actionRight.appendChild(btnConfirm);
            actionGroup.appendChild(previewLabel);
            actionGroup.appendChild(actionRight);
            instance.calendarContainer.appendChild(actionGroup);

            function formatDT(date) {
                if (!date) return "";
                var y = date.getFullYear();
                var m = ("0" + (date.getMonth() + 1)).slice(-2);
                var d = ("0" + date.getDate()).slice(-2);
                var hh = ("0" + date.getHours()).slice(-2);
                var mm = ("0" + date.getMinutes()).slice(-2);
                return y + "-" + m + "-" + d + " " + hh + ":" + mm;
            }

            instance._renderPreview = function() {
                if (isRange) {
                    var d = instance._myRangeDates;
                    if (d && d.length === 2) {
                        previewLabel.textContent = formatDT(d[0]) + " - " + formatDT(d[1]);
                    } else if (d && d.length === 1) {
                        previewLabel.textContent = formatDT(d[0]);
                    } else {
                        previewLabel.textContent = "";
                    }
                } else {
                    if (myMode === "year") {
                        previewLabel.textContent = (pickedYear !== null) ? pickedYear : instance.currentYear;
                    } else if (myMode === "month") {
                        var y = (pickedYear !== null) ? pickedYear : instance.currentYear;
                        var mo = (pickedMonth !== null) ? pickedMonth : instance.currentMonth;
                        previewLabel.textContent = y + "-" + ("0" + (mo + 1)).slice(-2);
                    } else if (instance.selectedDates && instance.selectedDates.length > 0) {
                        previewLabel.textContent = instance.formatDate(instance.selectedDates[0], instance.config.dateFormat);
                    } else {
                        previewLabel.textContent = "";
                    }
                }
            };
            instance._renderPreview();

            // =========================================================================
            // NÚT CLEAR: FOCUS VÀO NGÀY HIỆN TẠI, XÓA LỰA CHỌN TỪ NGÀY ĐẾN NGÀY
            // =========================================================================
            btnClear.addEventListener("click", function(e) {
                e.preventDefault();
                e.stopPropagation();

                if (isRange) {
                    if (startDom) startDom.value = "";
                    if (endDom) endDom.value = "";
                    lastConfirmedRange = ["", ""];
                    instance._myRangeDates = [];

                    var now = new Date();
                    instance.jumpToDate(now);
                    instance.redraw();

                    var allDays = instance.calendarContainer.querySelectorAll(".flatpickr-day");
                    allDays.forEach(function(dEl) {
                        dEl.classList.remove("inRange", "startRange", "endRange", "selected", "has-end", "has-start");
                    });

                    var todayEl = instance.calendarContainer.querySelector(".flatpickr-day.today");
                    if (todayEl) {
                        todayEl.focus();
                    }

                    if (instance._renderPreview) instance._renderPreview();
                } else {
                    pickerDom.value = "";
                    lastConfirmedSingle = "";
                    instance.clear();
                    instance.jumpToDate(new Date());
                    var todayEl2 = instance.calendarContainer.querySelector(".flatpickr-day.today");
                    if (todayEl2) {
                        todayEl2.focus();
                    }
                    if (instance._renderPreview) instance._renderPreview();
                }
            });

            // NÚT CONFIRM: LƯU GIÁ TRỊ VÀ ĐÓNG LỊCH
            btnConfirm.addEventListener("click", function(e) {
                e.preventDefault();
                e.stopPropagation();
                isConfirmed = true;

                if (myMode === "year") {
                    enterMyMode("month");
                    return;
                }
                if (myMode === "month") {
                    enterMyMode("day");
                    return;
                }

                if (isRange) {
                    var d = instance._myRangeDates;
                    if (d && d.length === 2) {
                        var strS = formatDT(d[0]);
                        var strE = formatDT(d[1]);
                        if (startDom) startDom.value = strS;
                        if (endDom) endDom.value = strE;
                        lastConfirmedRange = [strS, strE];
                    } else if (d && d.length === 1) {
                        var strSingle = formatDT(d[0]);
                        if (startDom) startDom.value = strSingle;
                        if (endDom) endDom.value = "";
                        lastConfirmedRange = [strSingle, ""];
                    }
                    instance.close();
                    return;
                }

                if (instance.selectedDates.length > 0) {
                    var val = instance.formatDate(instance.selectedDates[0], instance.config.dateFormat);
                    pickerDom.value = val;
                    lastConfirmedSingle = val;
                }
                instance.close();
            });

            // =========================================================================
            // LƯỚI GRID THÁNG (3X4) & NĂM CUSTOM (ĐÃ HOÀN THIỆN CHUẨN FOCUS & FILTER)
            // =========================================================================
            function removeMyGrid() {
                if (myMyGrid && myMyGrid.parentNode) {
                    myMyGrid.parentNode.removeChild(myMyGrid);
                }
                myMyGrid = null;
            }

            function enterMyMode(mode) {
                var wasMonthYear = (myMode === "month" || myMode === "year");
                myMode = mode;
                var isDayMode = (mode === "day");

                // Ẩn triệt để cụm thời gian hh:mm khi ở mode Month hoặc Year
                if (rangeTimeWrapper) {
                    if (isDayMode) rangeTimeWrapper.classList.remove("fp-hidden");
                    else rangeTimeWrapper.classList.add("fp-hidden");
                }
                if (instance.timeContainer) {
                    if (isDayMode) instance.timeContainer.classList.remove("fp-hidden");
                    else instance.timeContainer.classList.add("fp-hidden");
                }
                var otherTimeEls = instance.calendarContainer.querySelectorAll(".flatpickr-time, .time-row-container");
                otherTimeEls.forEach(function(el) {
                    if (isDayMode) el.classList.remove("fp-hidden");
                    else el.classList.add("fp-hidden");
                });

                // Ẩn/hiện cụm chân lịch (Clear/Confirm) khi ở mode Month hoặc Year
                if (actionGroup) {
                    if (isDayMode) actionGroup.classList.remove("fp-hidden");
                    else actionGroup.classList.add("fp-hidden");
                }

                // Ẩn/hiện innerContainer chứa toàn bộ lưới ngày và thứ trong tuần
                var inner = instance.innerContainer || instance.calendarContainer.querySelector(".flatpickr-innerContainer");
                if (inner) {
                    if (isDayMode) inner.classList.remove("fp-hidden");
                    else inner.classList.add("fp-hidden");
                }

                var rContainers = instance.calendarContainer.querySelectorAll(".flatpickr-rContainer, .flatpickr-days, .dayContainer, .flatpickr-weekdays");
                rContainers.forEach(function(el) {
                    if (isDayMode) el.classList.remove("fp-hidden");
                    else el.classList.add("fp-hidden");
                });

                var monthsEl = instance.calendarContainer.querySelector(".flatpickr-months");
                if (monthsEl) {
                    if (mode === "year") monthsEl.classList.add("fp-hidden");
                    else monthsEl.classList.remove("fp-hidden");
                }

                var monthSpans = instance.calendarContainer.querySelectorAll(".flatpickr-current-month span.cur-month");
                monthSpans.forEach(function(sp) {
                    sp.style.display = (mode === "month") ? "none" : "";
                });

                removeMyGrid();

                if (isDayMode) {
                    if (wasMonthYear && pickedMonth !== null) {
                        instance.currentMonth = pickedMonth;
                        pickedMonth = null;
                        instance.redraw();
                    }
                    if (instance._renderPreview) instance._renderPreview();
                    return;
                }

                if (mode === "month") {
                    var dispYear = (pickedYear !== null) ? pickedYear : (instance.currentYear || new Date().getFullYear());
                    instance.currentYear = dispYear;
                    if (instance.currentYearElement) instance.currentYearElement.value = dispYear;

                    myMyGrid = document.createElement("div");
                    myMyGrid.className = "fp-my-grid";

                    var now = new Date();
                    var nowYear = now.getFullYear();
                    var nowMonth = now.getMonth();
                    var dispMonth = (pickedMonth !== null) ? pickedMonth : (instance.currentMonth !== undefined ? instance.currentMonth : nowMonth);

                    for (var m = 0; m < 12; m++) {
                        (function (idx) {
                            var b = document.createElement("button");
                            b.type = "button";
                            b.textContent = idx + 1;
                            if (idx === dispMonth) {
                                b.classList.add("fp-current");
                            }
                            if (dispYear === nowYear && idx === nowMonth) {
                                b.classList.add("fp-underline");
                            }
                            b.addEventListener("click", function (e) {
                                e.stopPropagation();
                                pickedMonth = idx;
                                instance.currentMonth = idx;
                                instance.jumpToDate(new Date(dispYear, idx, 1));
                                instance.redraw();
                                enterMyMode("day");
                            });
                            myMyGrid.appendChild(b);
                        })(m);
                    }
                } else if (mode === "year") {
                    if (!wasMonthYear) {
                        myYearSearch = "";
                    }
                    pickedYear = (pickedYear !== null) ? pickedYear : (instance.currentYear || new Date().getFullYear());

                    myMyGrid = document.createElement("div");
                    myMyGrid.className = "fp-year-wrap";

                    var searchBox = document.createElement("div");
                    searchBox.className = "fp-year-search";
                    var searchInput = document.createElement("input");
                    searchInput.type = "text";
                    searchInput.placeholder = "Tìm năm...";
                    searchInput.value = myYearSearch || "";
                    var searchIcon = document.createElement("i");
                    searchIcon.className = "fa fa-search";
                    searchIcon.style.color = "#9ca3af";
                    searchIcon.style.fontSize = "13px";
                    searchBox.appendChild(searchInput);
                    searchBox.appendChild(searchIcon);

                    var list = document.createElement("div");
                    list.className = "fp-year-list";
                    myYearList = list;

                    var allYears = [];
                    for (var yr = 1970; yr <= 2099; yr++) allYears.push(yr);

                    function renderYearList(shouldScroll) {
                        var qq = (myYearSearch || "").trim().toLowerCase();
                        var years = allYears.filter(function (y) {
                            return !qq || String(y).indexOf(qq) !== -1;
                        });
                        list.innerHTML = "";
                        var curItem = null;
                        years.forEach(function (y) {
                            var b = document.createElement("button");
                            b.type = "button";
                            var isCur = (y === pickedYear);
                            b.className = "fp-year-item" + (isCur ? " fp-current" : "");
                            b.textContent = y;
                            b.addEventListener("click", function (e) {
                                e.stopPropagation();
                                pickedYear = y;
                                instance.currentYear = y;
                                if (instance.currentYearElement) instance.currentYearElement.value = y;
                                enterMyMode("month");
                            });
                            list.appendChild(b);
                            if (isCur) {
                                curItem = b;
                            }
                        });

                        // Tự động cuộn danh sách vào năm hiện tại nằm ở giữa danh sách ngay khi mở
                        if (shouldScroll && curItem) {
                            setTimeout(function() {
                                if (curItem && list) {
                                    var targetTop = curItem.offsetTop - (list.clientHeight / 2) + (curItem.clientHeight / 2);
                                    list.scrollTop = Math.max(0, targetTop);
                                }
                            }, 20);
                        }
                    }

                    myMyGrid.appendChild(searchBox);
                    myMyGrid.appendChild(list);

                    searchInput.addEventListener("mousedown", function (e) { e.stopPropagation(); });
                    searchInput.addEventListener("click", function (e) { e.stopPropagation(); });
                    searchInput.addEventListener("keydown", function (e) { e.stopPropagation(); });
                    searchInput.addEventListener("input", function (e) {
                        e.stopPropagation();
                        myYearSearch = this.value;
                        renderYearList(false);
                    });
                }

                // Gắn myMyGrid vào DOM ngay trên innerContainer
                if (inner && inner.parentNode) {
                    inner.parentNode.insertBefore(myMyGrid, inner);
                } else {
                    instance.calendarContainer.appendChild(myMyGrid);
                }

                // Nếu là mode Year: render danh sách năm và tự động focus ô tìm kiếm
                if (mode === "year") {
                    renderYearList(true);
                    setTimeout(function() {
                        searchInput.focus();
                    }, 40);
                }

                if (instance._renderPreview) instance._renderPreview();
            }

            instance._fpExitMyMode = function () {
                removeMyGrid();
                myMode = "day";
                pickedYear = null;
                pickedMonth = null;
                myYearSearch = "";

                var inner = instance.innerContainer || instance.calendarContainer.querySelector(".flatpickr-innerContainer");
                if (inner) inner.classList.remove("fp-hidden");

                if (rangeTimeWrapper) rangeTimeWrapper.classList.remove("fp-hidden");
                if (instance.timeContainer) instance.timeContainer.classList.remove("fp-hidden");
                if (actionGroup) actionGroup.classList.remove("fp-hidden");

                var otherTimeEls = instance.calendarContainer.querySelectorAll(".flatpickr-time, .time-row-container");
                otherTimeEls.forEach(function(el) { el.classList.remove("fp-hidden"); });

                var monthsEl = instance.calendarContainer.querySelector(".flatpickr-months");
                if (monthsEl) monthsEl.classList.remove("fp-hidden");

                var monthSpans = instance.calendarContainer.querySelectorAll(".flatpickr-current-month span.cur-month");
                monthSpans.forEach(function(sp) { sp.style.display = ""; });

                var rContainers = instance.calendarContainer.querySelectorAll(".flatpickr-rContainer, .flatpickr-days, .dayContainer, .flatpickr-weekdays");
                rContainers.forEach(function(el) { el.classList.remove("fp-hidden"); });
            };

            instance.calendarContainer.addEventListener("click", function (e) {
                var monthTarget = e.target.closest(".flatpickr-current-month span.cur-month");
                if (monthTarget) {
                    e.stopPropagation();
                    enterMyMode(myMode === "day" ? "month" : "day");
                    return;
                }
                var yearTarget = e.target.closest(".flatpickr-current-month input.cur-year");
                if (yearTarget) {
                    e.stopPropagation();
                    e.preventDefault();
                    enterMyMode(myMode !== "year" ? "year" : "day");
                    return;
                }

                var prevBtn = e.target.closest(".flatpickr-months .flatpickr-prev-month");
                var nextBtn = e.target.closest(".flatpickr-months .flatpickr-next-month");
                if (prevBtn) {
                    if (myMode === "month") {
                        e.preventDefault();
                        e.stopPropagation();
                        instance.currentYear -= 1;
                        pickedYear = instance.currentYear;
                        if (instance.currentYearElement) instance.currentYearElement.value = instance.currentYear;
                        enterMyMode("month");
                    }
                } else if (nextBtn) {
                    if (myMode === "month") {
                        e.preventDefault();
                        e.stopPropagation();
                        instance.currentYear += 1;
                        pickedYear = instance.currentYear;
                        if (instance.currentYearElement) instance.currentYearElement.value = instance.currentYear;
                        enterMyMode("month");
                    }
                }
            }, true);

            pickerDom._flatpickr.open();
        };

        // =========================================================================
        // XỬ LÝ CLICK BUTTON "LẤY KẾT QUẢ DATE ĐÃ CHỌN"
        // =========================================================================
        var btnGetResult = document.getElementById("btn-get-result");
        if (btnGetResult) {
            btnGetResult.addEventListener("click", function(e) {
                e.preventDefault();
                var sInput = document.getElementById("sDate");
                var eInput = document.getElementById("eDate");
                var sVal = sInput ? sInput.value.trim() : "";
                var eVal = eInput ? eInput.value.trim() : "";

                var resultData = {
                    startDate: sVal,
                    endDate: eVal,
                    rangeText: (sVal && eVal) ? (sVal + " - " + eVal) : (sVal || eVal || "Chưa chọn"),
                    status: (sVal && eVal) ? "Khoảng ngày hợp lệ" : (sVal ? "Chỉ mới chọn ngày bắt đầu" : "Trống")
                };

                console.log("[DatePicker Result]:", resultData);

                var displayBox = document.getElementById("result-display-box");
                var contentEl = document.getElementById("result-content");
                var timeEl = document.getElementById("result-timestamp");

                if (displayBox && contentEl) {
                    displayBox.style.display = "block";
                    if (timeEl) {
                        var now = new Date();
                        timeEl.textContent = now.getHours() + ":" + ("0" + now.getMinutes()).slice(-2) + ":" + ("0" + now.getSeconds()).slice(-2);
                    }
                    contentEl.innerHTML = 
                        '<div>• <b>startDate (sDate)</b> : <span style="color:#2563eb;">' + (sVal || '<i>(rỗng)</i>') + '</span></div>' +
                        '<div>• <b>endDate (eDate)</b> &nbsp;&nbsp;: <span style="color:#2563eb;">' + (eVal || '<i>(rỗng)</i>') + '</span></div>' +
                        '<div>• <b>rangeText</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <span style="color:#059669; font-weight:600;">' + resultData.rangeText + '</span></div>' +
                        '<div>• <b>Trạng thái</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ' + resultData.status + '</div>';
                }
            });
        }

    });
</script>
</body>
</html>
