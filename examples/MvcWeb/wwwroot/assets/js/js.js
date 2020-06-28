$(document).ready(function () {
    let height = $(window).height();
    let width = $(window).width();

    let search_width = width * 100 / 100;

    function ShowLoadingScreen() {
        $(".loading-screen").css({ "display": "block" });
    }

    function HideLoadingScreen() {
        $(".loading-screen").css({ "display": "none" });
    }


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






    $("#btnContactPage").click(function () {
        ShowLoadingScreen();
        let ToMail = $("#mailReceiver").text();
        let FromMail = $("#mailSender").text();
        let FromPass = $("#mailSenderPass").text();
        let hoten = "Họ tên: " + $("#ctphoten").val();
        let tencty = "Tên công ty: " + $("#ctptencongty").val();
        let chucdanh = "Chức danh: " + $("#ctpchucdanh").val();
        let fax = "Số fax: " + $("#ctpsofax").val();
        let email = "E-mail" + $("#ctpemail").val();
        let phone = "Số điện thoại: " + $("#ctpphone").val();
        let diachi = "Địa chỉ: " + $("#ctpdiachi").val();
        let ttmn = "Thông tin muốn nhận : ";
        if ($("#ctptuvansatnhap").checked)
            ttmn += "Tư vấn sát nhập, ";
        if ($("#ctpdoitac").checked)
            ttmn += "Đối tác / Cơ hội hợp tác, ";
        if ($("#ctptaicocaudn").checked)
            ttmn += "Tái cấu trúc doanh nghiệp, ";
        if ($("#ctptangvon").checked)
            ttmn += "Tăng vốn.";

        let body = hoten + "\n" + tencty + "\n" + chucdanh + "\n" + fax + "\n" + email + "\n" + phone + "\n" + diachi + "\n" + ttmn;

        let info = JSON.stringify({
            From: FromMail,
            FromPass: FromPass,
            To: ToMail,
            Subject: "TVS - Nhận thông tin hàng quý",
            Body: body
        });

        $.ajax({
            url: "/api/sendmail",
            data: info,
            dataType: "json",
            type: "POST",
            contentType: "application/json",
            success: function (response) {
                HideLoadingScreen();
                if (response.status == "success")
                    alert("Gửi thông tin thành công");
                else alert("Gửi thông tin không thành công, vui lòng kiểm tra lại.");
            },
            error: function (response) {
                HideLoadingScreen();
                alert("Gửi thông tin không thành công, vui lòng kiểm tra lại.");
            }
        });
    });

    var country_list = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Anguilla", "Antigua &amp; Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas"
        , "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia &amp; Herzegovina", "Botswana", "Brazil", "British Virgin Islands"
        , "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Cape Verde", "Cayman Islands", "Chad", "Chile", "China", "Colombia", "Congo", "Cook Islands", "Costa Rica"
        , "Cote D Ivoire", "Croatia", "Cruise Ship", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea"
        , "Estonia", "Ethiopia", "Falkland Islands", "Faroe Islands", "Fiji", "Finland", "France", "French Polynesia", "French West Indies", "Gabon", "Gambia", "Georgia", "Germany", "Ghana"
        , "Gibraltar", "Greece", "Greenland", "Grenada", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea Bissau", "Guyana", "Haiti", "Honduras", "Hong Kong", "Hungary", "Iceland", "India"
        , "Indonesia", "Iran", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kuwait", "Kyrgyz Republic", "Laos", "Latvia"
        , "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Mauritania"
        , "Mauritius", "Mexico", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Namibia", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia"
        , "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal"
        , "Puerto Rico", "Qatar", "Reunion", "Romania", "Russia", "Rwanda", "Saint Pierre &amp; Miquelon", "Samoa", "San Marino", "Satellite", "Saudi Arabia", "Senegal", "Serbia", "Seychelles"
        , "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "South Africa", "South Korea", "Spain", "Sri Lanka", "St Kitts &amp; Nevis", "St Lucia", "St Vincent", "St. Lucia", "Sudan"
        , "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor L'Este", "Togo", "Tonga", "Trinidad &amp; Tobago", "Tunisia"
        , "Turkey", "Turkmenistan", "Turks &amp; Caicos", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "Uruguay", "Uzbekistan", "Venezuela", "Việt Nam", "Virgin Islands (US)"
        , "Yemen", "Zambia", "Zimbabwe"];

    $.each(country_list, function (val, text) {
        $("#selCountries").append($('<option></option>').val(text).html(text));
    });

    $("#openAcc").click(function () {
        ShowLoadingScreen();
        let ToMail = $("#mailReceiv").text();
        let FromMail = $("#mailSender").text();
        let FromPass = $("#mailPass").text();
        let openFor = "Mở tài khoản cho: " + $('input[name="openfor"]:checked').val();
        let nationality = "Quốc tịch: " + $('input[name="nationality"]:checked').val();
        let name = "Họ và tên: " + $("#inpNameAcc").val();
        let sex = "Giới tính: " + $("#accSex option:selected").text();
        let dateProvide = "Ngày cấp: " + $("#accDateProvide").val();
        let dateBirth = "Ngày sinh: " + $("#accDateBirth").val();
        let idcard = "Số CMT: " + $("#accIDcard").val();
        let locatProvide = "Nơi cấp: " + $("#accLocatProvide").val();
        let phoneNum = "Số điện thoại: " + $("#accPhoneNum").val();
        let mail = "E-mail: " + $("#accMail").val();
        let address = "Địa chỉ: " + $("#accAddress").val();
        let printContract = $('input[name="contract"]:checked').val();
        let countries = "Quốc gia: " + $("#selCountries option:selected").text();
        let city = "Thành phố: " + $("#accCity").val();
        let company = "Công ty làm việc: " + $("#accCompany").val();
        let companyPhone = "Số điện thoại công ty: " + $("#accCompanyPhone").val();
        let position = "Vị trí làm việc: " + $("#accPosition").val();
        let companyFax = "Fax công ty: " + $("#accFax").val();
        let bankacc = "Số TK ngân hàng: " + $("#accBanknum").val();
        let bankManager = "Người quản lý tài khoản: " + $("#accBankManger").val();
        let bank = "Ngân hàng: " + $("#accBankname").val();
        let companyName = "Công ty đại chúng cho người đang quản lý: " + $("#accCompanyManager").val();
        let companySpent = "Công ty đại chúng bạn đang giữ hơn 5% vốn điều lệ: " + $("#accCompanySpent").val();

        if (!$("#inpNameAcc").val() || !$("#accDateBirth").val() || $("#accSex").val()!= -1 || !$("#accIDcard").val() ||
            !$("#accDateProvide").val() || !$("#accLocatProvide").val() || !$("#accPhoneNum").val() || !$("#accMail").val()
            || !$("#accAddress").val() || !$("#selCountries").val() != -1 || !$("#accCity").val()) {
            HideLoadingScreen();
            alert("Bạn phải nhập đầy đủ thông tin.");
            return;
        }

        let body = "I. Thông tin chung\n";
        body += openFor + "\n" + nationality + "\n";
        body += "II. Thông tin cá nhân\n";
        body += name + "\n" + dateBirth + "\n" + sex + "\n" + idcard + "\n" + dateProvide + "\n" + locatProvide + "\n";
        body += "III.Thông tin liên lạc\n";
        body += phoneNum + "\n" + mail + "\n" + address + "\n";
        body += "Bạn có cần in sẵn hợp đồng không? " + printContract + "\n";
        body += "IV. Thông tin nơi ở\n";
        body += countries + "\n" + city + "\n";
        body += "V. Thông tin nghề nghiệp\n";
        body += company + "\n" + position + "\n" + companyPhone + "\n" + companyFax + "\n";
        body += "VI. Tài khoản ngân hàng\n";
        body += bankacc + "\n" + bank + "\n" + bankManager + "\n";
        body += "VII. Thông tin khác\n";
        body += companyName + "\n" + companySpent + "\n";

        let info = JSON.stringify({
            From: FromMail,
            FromPass: FromPass,
            To: ToMail,
            Subject: "TVS - Gửi yêu cầu mở tài khoản",
            Body: body
        });
        $.ajax({
            url: "/api/sendmail",
            data: info,
            dataType: "json",
            type: "POST",
            contentType: "application/json",
            success: function (response) {
                HideLoadingScreen();
                if (response.status == "success")
                    alert("Gửi thông tin thành công");
                else alert("Gửi thông tin không thành công, vui lòng kiểm tra lại.");
            },
            error: function (response) {
                HideLoadingScreen();
                alert("Gửi thông tin không thành công, vui lòng kiểm tra lại.");
            }
        });
    });
});