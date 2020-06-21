$(document).ready(function () {
    let height = $(window).height();
    let width = $(window).width();

    let search_width = width * 100 / 100;

    //$('#header_login .search_mb form').css('min-width', search_width);


    // $('#slide').slick({
    // 	slidesToShow: 1,
    // 	slidesToScroll: 1,
    // 	arrows: true,
    // 	dots: false,
    // 	fade: false,
    // 	infinite: true,
    // 	autoplay: true,
    // 	draggable: true,
    // 	cssEase: 'linear',
    // 	prevArrow: '<button id="slick-prev" class="slick-prev slick-arrow" aria-label="Previous" type="button"><i class="fa fa-chevron-left"></i></button>',
    // 	nextArrow: '<button id="slick-next" class="slick-next slick-arrow" aria-label="Next" type="button"><i class="fa fa-chevron-right"></i></button>',
    // 	responsive: [{
    // 		breakpoint: 320,
    // 		settings: {
    // 			fade: false,
    // 			arrows: false,
    // 			dots: true,
    // 			autoplay: true,
    // 			infinite: true,
    // 			slidesToShow: 1,
    // 			slidesToScroll: 1,
    // 		}
    // 	}]
    // });

    $('.related_news_slide').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        infinite: true,
        autoplay: true,
        mobileFirst: true,
        prevArrow: '<button id="slick-prev" class="slick-prev slick-arrow" aria-label="Previous" type="button"><i class="fa fa-chevron-left"></i></button>',
        nextArrow: '<button id="slick-next" class="slick-next slick-arrow" aria-label="Next" type="button"><i class="fa fa-chevron-right"></i></button>',
        responsive: [
            {
                breakpoint: 1025,
                settings: {
                    fade: false,
                    arrows: true,
                    dots: false,
                    infinite: true,
                    autoplay: true,
                    draggable: true,
                    cssEase: 'linear',
                    slidesToShow: 3,
                    slidesToScroll: 1,
                }
            },
        ]
    })

    $("#respMenu").aceResponsiveMenu({
        resizeWidth: '768', // Set the same in Media query       
        animationSpeed: 'fast', //slow, medium, fast
        accoridonExpAll: false //Expands all the accordion menu on click
    });

    $('.search_icon').on('click', function (e) {
        if (width < 1024) {
            $('.search_mb>#search_form input').toggleClass('show_search');
        } else if (width > 1024) {
            $('.search_pc>#search_form input').toggleClass('show_search');
        }
    });

    $('.row_category_div').click(function () {
        let id = $(this).data('id');
        let id_offsettop = $('#' + id).offset().top;
        $('html,body').animate({ scrollTop: id_offsettop }, 750);
    });

    $('.contract .form-check-label input').click(function () {
        var checked = $(this).data('id');
        console.log({ checked });
        if (checked == 'no_need_contract') {
            $('#abcd').addClass('no_need_contract');
        } else {
            $('#abcd').removeClass('no_need_contract');
        }
        // $(this).addClass('mnvdg');
    });

    // var abc = $('#need_contract').is(':checked');
    // console.log({ abc });
    // if (abc) {
    // 	$('#abcd').addClass('mnv');
    // }

    // $('#search_icon').click(function(){
    // 	$(this).next().toggleClass('search_show');
    // })




    // -------------------------------- AnhPT -----------------------------------
     var tablePublish = $("#tblPublish").DataTable({
        language: {
             "sProcessing": "Đang xử lý...",
             "sLengthMenu": "Xem _MENU_ mục",
             "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
             "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
             "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
             "sInfoFiltered": "(được lọc từ _MAX_ mục)",
             "sInfoPostFix": "",
             "sSearch": "Tìm:",
             "sUrl": "",
             "oPaginate": {
                 "sFirst": "Đầu",
                 "sPrevious": "Trước",
                 "sNext": "Tiếp",
                 "sLast": "Cuối"
             }
        }
        , sDom: 'lrtip'
        , "ordering": false
        , "lengthChange": false
        , "columnDefs": [
            {
                "targets": [3],
                "visible": false
            },
            { "width": "20%", "targets": [1] },
            { "width": "10%", "targets": [2] },
        ]
    });
    $("#tblPublish thead").append("<tr><th>Tên tài liệu</th><th>Thời gian đăng</th><th>Tải về</th></tr >");
    $("#tblPublish thead tr:eq(1) th").each(function (i) {
        let title = $(this).text();
        let select = $('<select class="form-control"><option value="">Tất cả</option></select>');

        tablePublish.column(3).data().unique().sort(function (a, b) { return b - a }).each(function (d, j) {
            select.append('<option value="' + d + '">' + d + '</option>');
        });

        i === 1 ? $(this).html(select) : $(this).html('<input type="text" class="form-control" placeholder="' + title + '" />');

        $("input", this).on("keyup change",
            function () {
                if (tablePublish.column(i).search() !== this.value) {
                    tablePublish
                        .column(i)
                        .search(this.value)
                        .draw();
                }
            });
        $("select", this).on("change",
            function () {
                var val = $.fn.dataTable.util.escapeRegex(
                    $(this).val()
                );
                tablePublish.column(i).search(val ? val : '', true, false).draw();
            });
    });


    var tableAdmin = $("#tblAdmin").DataTable({
        language: {
            "sProcessing": "Đang xử lý...",
            "sLengthMenu": "Xem _MENU_ mục",
            "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
            "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
            "sInfoFiltered": "(được lọc từ _MAX_ mục)",
            "sInfoPostFix": "",
            "sSearch": "Tìm:",
            "sUrl": "",
            "oPaginate": {
                "sFirst": "Đầu",
                "sPrevious": "Trước",
                "sNext": "Tiếp",
                "sLast": "Cuối"
            }
        }
        , sDom: 'lrtip'
        , "ordering": false
        , "lengthChange": false
        , "columnDefs": [
            {
                "targets": [3],
                "visible": false
            },
            { "width": "20%", "targets": [1] },
            { "width": "10%", "targets": [2] },
        ]
    });
    $("#tblAdmin thead").append("<tr><th>Tên tài liệu</th><th>Thời gian đăng</th><th>Tải về</th></tr >");
    $("#tblAdmin thead tr:eq(1) th").each(function (i) {
        let title = $(this).text();
        let select = $('<select class="form-control"><option value="">Tất cả</option></select>');

        tableAdmin.column(3).data().unique().sort(function (a, b) { return b - a }).each(function (d, j) {
            select.append('<option value="' + d + '">' + d + '</option>');
        });

        i === 1 ? $(this).html(select) : $(this).html('<input type="text" class="form-control" placeholder="' + title + '" />');

        $("input", this).on("keyup change",
            function () {
                if (tableAdmin.column(i).search() !== this.value) {
                    tableAdmin
                        .column(i)
                        .search(this.value)
                        .draw();
                }
            });
        $("select", this).on("change",
            function () {
                var val = $.fn.dataTable.util.escapeRegex(
                    $(this).val()
                );
                tableAdmin.column(i).search(val ? val : '', true, false).draw();
            });
    });


    var tableFinance = $("#tblFinance").DataTable({
        language: {
            "sProcessing": "Đang xử lý...",
            "sLengthMenu": "Xem _MENU_ mục",
            "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
            "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
            "sInfoFiltered": "(được lọc từ _MAX_ mục)",
            "sInfoPostFix": "",
            "sSearch": "Tìm:",
            "sUrl": "",
            "oPaginate": {
                "sFirst": "Đầu",
                "sPrevious": "Trước",
                "sNext": "Tiếp",
                "sLast": "Cuối"
            }
        }
        , sDom: 'lrtip'
        , "ordering": false
        , "lengthChange": false
        , "columnDefs": [
            {
                "targets": [3],
                "visible": false
            },
            { "width": "20%", "targets": [1] },
            { "width": "10%", "targets": [2] },
        ]
    });
    $("#tblFinance thead").append("<tr><th>Tên tài liệu</th><th>Thời gian đăng</th><th>Tải về</th></tr >");
    $("#tblFinance thead tr:eq(1) th").each(function (i) {
        let title = $(this).text();
        let select = $('<select class="form-control"><option value="">Tất cả</option></select>');

        tableFinance.column(3).data().unique().sort(function (a, b) { return b - a }).each(function (d, j) {
            select.append('<option value="' + d + '">' + d + '</option>');
        });

        i === 1 ? $(this).html(select) : $(this).html('<input type="text" class="form-control" placeholder="' + title + '" />');

        $("input", this).on("keyup change",
            function () {
                if (tableFinance.column(i).search() !== this.value) {
                    tableFinance
                        .column(i)
                        .search(this.value)
                        .draw();
                }
            });
        $("select", this).on("change",
            function () {
                var val = $.fn.dataTable.util.escapeRegex(
                    $(this).val()
                );
                tableFinance.column(i).search(val ? val : '', true, false).draw();
            });
    });


    var tableMidYear = $("#tblMidYear").DataTable({
        language: {
            "sProcessing": "Đang xử lý...",
            "sLengthMenu": "Xem _MENU_ mục",
            "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
            "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
            "sInfoFiltered": "(được lọc từ _MAX_ mục)",
            "sInfoPostFix": "",
            "sSearch": "Tìm:",
            "sUrl": "",
            "oPaginate": {
                "sFirst": "Đầu",
                "sPrevious": "Trước",
                "sNext": "Tiếp",
                "sLast": "Cuối"
            }
        }
        , sDom: 'lrtip'
        , "ordering": false
        , "lengthChange": false
        , "columnDefs": [
            {
                "targets": [3],
                "visible": false
            },
            { "width": "20%", "targets": [1] },
            { "width": "10%", "targets": [2] },
        ]
    });
    $("#tblMidYear thead").append("<tr><th>Tên tài liệu</th><th>Thời gian đăng</th><th>Tải về</th></tr >");
    $("#tblMidYear thead tr:eq(1) th").each(function (i) {
        let title = $(this).text();
        let select = $('<select class="form-control"><option value="">Tất cả</option></select>');

        tableMidYear.column(3).data().unique().sort(function (a, b) { return b - a }).each(function (d, j) {
            select.append('<option value="' + d + '">' + d + '</option>');
        });

        i === 1 ? $(this).html(select) : $(this).html('<input type="text" class="form-control" placeholder="' + title + '" />');

        $("input", this).on("keyup change",
            function () {
                if (tableMidYear.column(i).search() !== this.value) {
                    tableMidYear
                        .column(i)
                        .search(this.value)
                        .draw();
                }
            });
        $("select", this).on("change",
            function () {
                var val = $.fn.dataTable.util.escapeRegex(
                    $(this).val()
                );
                tableMidYear.column(i).search(val ? val : '', true, false).draw();
            });
    });


    var tableYearly = $("#tblYearly").DataTable({
        language: {
            "sProcessing": "Đang xử lý...",
            "sLengthMenu": "Xem _MENU_ mục",
            "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
            "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
            "sInfoFiltered": "(được lọc từ _MAX_ mục)",
            "sInfoPostFix": "",
            "sSearch": "Tìm:",
            "sUrl": "",
            "oPaginate": {
                "sFirst": "Đầu",
                "sPrevious": "Trước",
                "sNext": "Tiếp",
                "sLast": "Cuối"
            }
        }
        , sDom: 'lrtip'
        , "ordering": false
        , "lengthChange": false
        , "columnDefs": [
            {
                "targets": [3],
                "visible": false
            },
            { "width": "20%", "targets": [1] },
            { "width": "10%", "targets": [2] },
        ]
    });
    $("#tblYearly thead").append("<tr><th>Tên tài liệu</th><th>Thời gian đăng</th><th>Tải về</th></tr >");
    $("#tblYearly thead tr:eq(1) th").each(function (i) {
        let title = $(this).text();
        let select = $('<select class="form-control"><option value="">Tất cả</option></select>');

        tableYearly.column(3).data().unique().sort(function (a, b) { return b - a }).each(function (d, j) {
            select.append('<option value="' + d + '">' + d + '</option>');
        });

        i === 1 ? $(this).html(select) : $(this).html('<input type="text" class="form-control" placeholder="' + title + '" />');

        $("input", this).on("keyup change",
            function () {
                if (tableYearly.column(i).search() !== this.value) {
                    tableYearly
                        .column(i)
                        .search(this.value)
                        .draw();
                }
            });
        $("select", this).on("change",
            function () {
                var val = $.fn.dataTable.util.escapeRegex(
                    $(this).val()
                );
                tableYearly.column(i).search(val ? val : '', true, false).draw();
            });
    });


    var tableIndicator = $("#tblIndicator").DataTable({
        language: {
            "sProcessing": "Đang xử lý...",
            "sLengthMenu": "Xem _MENU_ mục",
            "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
            "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
            "sInfoFiltered": "(được lọc từ _MAX_ mục)",
            "sInfoPostFix": "",
            "sSearch": "Tìm:",
            "sUrl": "",
            "oPaginate": {
                "sFirst": "Đầu",
                "sPrevious": "Trước",
                "sNext": "Tiếp",
                "sLast": "Cuối"
            }
        }
        , sDom: 'lrtip'
        , "ordering": false
        , "lengthChange": false
        , "columnDefs": [
            {
                "targets": [3],
                "visible": false
            },
            { "width": "20%", "targets": [1] },
            { "width": "10%", "targets": [2] },
        ]
    });
    $("#tblIndicator thead").append("<tr><th>Tên tài liệu</th><th>Thời gian đăng</th><th>Tải về</th></tr >");
    $("#tblIndicator thead tr:eq(1) th").each(function (i) {
        let title = $(this).text();
        let select = $('<select class="form-control"><option value="">Tất cả</option></select>');

        tableIndicator.column(3).data().unique().sort(function (a, b) { return b - a }).each(function (d, j) {
            select.append('<option value="' + d + '">' + d + '</option>');
        });

        i === 1 ? $(this).html(select) : $(this).html('<input type="text" class="form-control" placeholder="' + title + '" />');

        $("input", this).on("keyup change",
            function () {
                if (tableIndicator.column(i).search() !== this.value) {
                    tableIndicator
                        .column(i)
                        .search(this.value)
                        .draw();
                }
            });
        $("select", this).on("change",
            function () {
                var val = $.fn.dataTable.util.escapeRegex(
                    $(this).val()
                );
                tableIndicator.column(i).search(val ? val : '', true, false).draw();
            });
    });
});