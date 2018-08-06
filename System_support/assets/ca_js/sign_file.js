
function showErrorMessage(message) {
    alert(message);
}


var hasAboutPlugin = true;
function checkPluginIsRunning() {
    var about = null;
    var actionUrl = 'http://127.0.0.1:17910/getAbout';
    if (location.protocol == 'https:') {
        actionUrl = "https://127.0.0.1:18670/getAbout";
    }
    jQuery.ajax({
        url: actionUrl,
        type: "POST",
        async: false,
        dataType: "json",
        data: { "action": "loadall" },
        success: function (data) {
            console.log(data);
            if (data != null && data != undefined && data.about != null && data.about != undefined) {
                about = data.about;
            }
        },
        error: function (error) {
            console.log("Get Cert Error:");
            console.log(error);
        }
    });

    if (about != null) {
        var author = about.author;
        var version = about.version;
        var company = about.company;
        var email = about.email;
        if (hasAboutPlugin) {
            alert('Bạn đã cài đặt Plugin. Thông tin về Digital Signature Plugin: \n' +
                'Author: ' + author + '\n' +
                'Version: ' + version + '\n' +
                'Company: ' + company + '\n' +
                'Email: ' + email);
            hasAboutPlugin = false;
        } else {
            alert('Bạn đã cài đặt Plugin.');
        }
    } else {
        alert('Không phát hiện Plugin. \nBạn cần cài đặt hay mở Plugin trước khi thực hiện Ký số.');
        //window.open("DigitalSignaturePlugin.msi");
        return false;
    }
    return true;
}



function checkSessionId(sessionId) {
    if (sessionId != undefined && sessionId.trim() != "") {
        var actionUrl = 'http://127.0.0.1:17910/checkSessionID';
        if (location.protocol == 'https:') {
            actionUrl = "https://127.0.0.1:18670/checkSessionID";
        }
        jQuery.ajax({
            url: actionUrl,
            type: "POST",
            async: false,
            dataType: "json",
            data: { "sessionId": sessionId },
            success: function (data) {
                console.log(data);
                if (data != null && data != undefined && data.isValid != null && data.isValid != undefined) {
                    isValid = data.isValid;
                }
            },
            error: function (error) {
                console.log("Kiểm tra Session ID không thành công:");
                console.log(error);
            }
        });

        if (isValid != null) {
            if (isValid) {
                console.log('Session hợp lệ');
                return true;
            } else {
                console.log('Session không hợp lệ');
            }
        } else {
            console.log('Kiểm tra Session không thành công');
        }
    }

    return false;
}


function getSession() {

    var sessionId = jQuery("#ContentPlaceHolder1_sessionId").val();
    if (sessionId != undefined && sessionId.trim() != "") {
        if (checkSessionId(sessionId)) {
            return sessionId;
        }
    }

    var actionUrl = 'http://127.0.0.1:17910/getSession';
    if (location.protocol == 'https:') {
        actionUrl = "https://127.0.0.1:18670/getSession";
    }
    jQuery.ajax({
        url: actionUrl,
        type: "POST",
        async: false,
        dataType: "json",
        data: {},
        success: function (data) {
            console.log(data);
            if (data != null && data != undefined && data.sessionId != null && data.sessionId != undefined) {
                sessionId = data.sessionId;
            }
        },
        error: function (error) {
            console.log("Get Cert Error:");
            console.log(error);
        }
    });

    if (sessionId != null) {
        jQuery("#ContentPlaceHolder1_sessionId").val(sessionId);
    } else {
        alert('Lấy Session không thành công');
        return false;
    }
    return true;
}


function signUSB() {

    //Bước 1. Lấy dữ liệu File dạng Base64
    var fileBase64 = jQuery('#ContentPlaceHolder1_HiddenField1').val();
    
    if (fileBase64 == "") {
        showErrorMessage("Tạo Hash không thành công");
        return false;
    }

    signFile(fileBase64);
}


function signFile(fileBase64) {
    if (!getSession()) {
        return;
    }
    var sessionId = jQuery("#ContentPlaceHolder1_sessionId").val();

    //Bước 2. Sau khi nhận File Base64 từ Server, gọi Plugin ký mã Hash này để thu được File đã ký dạng Base64

    var signedFileBase64 = null;

    actionUrl = 'http://127.0.0.1:17910/signFileOoxml';
    if (location.protocol == 'https:') {
        actionUrl = "https://127.0.0.1:18670/signFileOoxml";
    }

    jQuery.ajax({
        url: actionUrl,
        type: "POST",
        async: false,
        dataType: "json",
        data: { "sessionId": sessionId, "fileBase64": fileBase64 },
        success: function (data) {
            console.log(data);
            if (data != null && data != undefined && data.signedFileBase64 != null && data.signedFileBase64 != undefined) {
                signedFileBase64 = data.signedFileBase64;
            }
        },
        error: function (error) {
            console.log("Sign Error:");
            console.log(error);
        }
    });

    if (signedFileBase64 == null || signedFileBase64 == undefined || signedFileBase64.trim().length == 0) {
        
        showErrorMessage("Sign File không thành công");
        return false;
    }

    jQuery('#ContentPlaceHolder1_signedBase64String').val(signedFileBase64);
}