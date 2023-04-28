<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="//code.jauery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <meta charset="UTF-8">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script type="text/javascript">
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' &&
                            /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' &&
                            data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' +
                                data.buildingName :
                                data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("user_address4").value = extraAddr;

                    } else {
                        document.getElementById("user_address4").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('user_address1').value = data.zonecode;
                    document.getElementById('user_address2').value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById('user_address3').focus();

                }
            }).open();
        }
    </script>

    <script type="text/javascript">
        $(function() {
            $("#check").click(function() {
                //id검사
                var id = $("#user_id").val();
                var vid = /^[a-zA-Z0-9]{6,10}$/;
                if (id == "") {
                    alert("아이디 입력이 잘못되었습니다.");
                    $("#user_id").focus();
                    return;
                }

                if (!vid.test(id)) {
                    alert("아이디는 띄어쓰기 없이 영/숫자 6~10자!");
                    $("#user_id").focus();
                    return;
                }
                //이메일 유효성검사 or 이메일 인증
                var email = $("#user_email").val();
                var emailChk = $("#emailDoubleChk").val();
                if (email == "") {
                     alert("이메일 입력이 잘못되었습니다.");
                $("#user_email").focus();
                      return;
                  }

                 if (emailChk !== "true") {
                     alert("이메일 인증을 완료해주세요.");
                     return;
                  }
            
                //id중복검사
                var idcheck = $("#idcheck").attr("idcheck");
                if (idcheck == "" || idcheck == "N") {
                    alert("아이디 중복검사 해주세요.");
                    $("#idcheck").focus();
                    return;
                }

                //패스워드 입력
                var pw = $("#user_pwd").val();
                var vpw = /^[a-zA-Z0-9?=.*\W]{8,15}$/;
                if (pw == "") {
                    alert("패스워드를 입력하세요.");
                    $("#user_pwd").focus();
                    return;
                }
                if (!vpw.test(pw)) {
                    alert("비밀번호는 띄어쓰기 없는 8~15자의 영문 대/소문자, 숫자 또는 특수문자 조합으로 입력하셔야 합니다.");
                    $("#user_pwd").focus();
                    return;
                }
                //패스워드 재확인
                var pw2 = $("#user_pwd2").val();
                var vpw2 = /^[a-zA-Z0-9?=.*\W]{8,15}$/;
                if (pw2 == "") {
                    alert("비밀번호를 입력하세요.");
                    $("#user_pwd2").focus();
                    return;
                }
                if (!vpw.test(pw2)) {
                    alert("비밀번호는 띄어쓰기 없는 8~15자의 영문 대/소문자, 숫자 또는 특수문자 조합으로 입력하셔야 합니다.");
                    $("#user_pwd2").focus();
                    return;
                }
                if (pw != pw2) {
                    alert("비밀번호가 다르니 다시 입력하세요");
                    $("#user_pwd").val('');
                    $("#user_pwd2").val('');
                    $("#user_pwd").focus();
                    return;
                }
                //이름 입력
                var name = $("#user_name").val();
                var vname = /^[가-힣]{2,4}$/;
                if (name == "") {
                    alert("이름을 입력하세요.");
                    $("#user_name").focus();
                    return false;
                }
                if (!vname.test(name)) {

                    alert("이름은 한글로만 입력하세요.");
                    $("#user_name").focus();
                    return false;
                }

                //전화번호입력
                var vphone = /^[\d]{3}[\d]{4}[\d]{4}$/;
                var phone = $("#user_phone").val();
                if (phone == "") {
                    alert("전화번호 입력란이 공백입니다.");
                    $("#user_phone").focus();
                    return false;
                }
                if (!vphone.test(콜)) {
                    alert("전화번호는 -없이 입력하세요. 숫자만 입력하세요.");
                    $("#user_phone").focus();
                    return false;
                }
                //주소입력
                var address = $("#user_address3").val();
                if (address == "") {
                    alert("상세주소를 입력해주세요.");
                    $("#user_address3").focus();
                    return;
                }

                //이메일 중복검사
                var echeck = $("#echeck").attr("echeck");
                if (echeck == "" || echeck == "N") {
                    alert("이메일 중복검사 해주세요.");
                    $("#echeck").focus();
                    return;
                }


                //생년월일
                var vbirthday = /^[\d]{8}$/;
                var birthday = $("#user_birthday").val();
                if (birthday == "") {
                    alert("생일입력란이 공백입니다.");
                    $("#user_birthday").focus();
                    return false;
                }
                if (!vbirthday.test(birthday)) {
                    alert(")ex 19990415 형식으로 숫자로만");
                    $("#user_birthday").focus();
                    return false;
                }
                //닉네임
                var nickname = $("#user_nickname").val();
                if (nickname == "") {
                    alert("닉네임을 입력해주세요.");
                    $("#user_nickname").focus();
                    return;
                }





                $("#form1").submit();
            });


            //아이디 중복확인
            $("#idcheck").click(function() {
                var user_id = $("#user_id").val();
                $.ajax({
                    type: "post",
                    async: true,
                    dataType: "text",
                    url: "joinsend",
                    data: {
                        "user_id": user_id
                    },
                    success: function(str) {
                        if (str == "ok") {
                            $('#idcheck').attr('idcheck', 'Y');
                            alert("사용가능한 아이디 입니다.");
                        } else {
                            $('#idcheck').attr('idcheck', 'N');
                            alert("이미 사용중인 아이디입니다.");
                        }
                    }
                });
            });

            //이메일 중복 
            $("#echeck").click(function() {
              var user_email = $("#user_email").val();
                $.ajax({
                    type: "post",
                 async: true,
                    dataType: "text",
                    url: "joinsend1",
                    data: {
                        "user_email": user_email
                    },
                    success: function(str1) {
                        if (str1 == "ok") {
                           $('#echeck').attr('echeck', 'Y');
                            alert("사용가능한 이메일 아이디입니다.");
                       } else {
                           $('#echeck').attr('echeck', 'N');
                           alert("이미 사용중인 이메일 아이디입니다.");
                        }
                    }
               });
            });

            //이메일인증번호전송
            var code = "error";
            $("#emailChk").click(function() {
                var userEmail = $("#user_email").val();
                if (userEmail) {
                    $.ajax({
                        type: "POST",
                        url: "sendemail",
                        cashe: false,
                        data: {
                            "user_email": userEmail
                        },
                        success: function(data) {
                            alert("인증번호가 전송되었습니다.");
                            if (data == "error") {
                                alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
                                $("#user_email").attr("autofocus", true);
                                $(".successEmailChk").text("유효한 이메일 주소를 입력해주세요.");
                                $(".successEmailChk").css("color", "red");
                            } else {
                                alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
                                $("#user_email2").attr("disabled", false);
                                $("#emailChk2").css("display", "inline-block");
                                $(".successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
                                $(".successEmailChk").css("color", "green");
                                code = data;
                            }

                        },
                    });
                } else {
                    alert("이메일 주소가 올바르지 않습니다.");
                }

            });
            //이메일 인증번호 대조
          
            $("#emailChk2").click(function() {
                if ($("#user_email2").val() == code) {
                    $(".successEmailChk").text("인증번호가 일치합니다.");
                    $(".successEmailChk").css("color", "green");
                    $("#emailDoubleChk").val("true");
                    $("#user_email2").attr("disabled", true);
                } else {
                    $(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
                    $(".successEmailChk").css("color", "red");
                    $("#emailDoubleChk").val("false");
                    $("#user_email2").attr("autofocus", true);
                    return false; 
                }
            });

        });
    </script>
   <style type="text/css">
   body *{
      text-align: left;
   }

   .layout_login_wrap{
      width: 600px;
      margin: 0 auto;
   }
   .layout_inner{
      width: 570px;
      margin: auto;
   }
   .seller_signup_title{
      margin-top: 50px;
      text-align: center;
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 600;
      
   }
   .seller_signup_subtitle{
      text-align: left;
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 400;
      font-size: 20px;
      margin-bottom: 25px;
   }
   .seller_form_group{
      margin-bottom: 30px;
   }
   .seller_input_form_phone{
      padding-left: 13px;
      margin-top: 10px;
      width: 160px;
      height: 36px;
      border-radius: 5px;
      border-width: 0.4px;
      border: solid 1px gray;
   }
   .seller_input_form{
      padding-left: 13px;
      margin-top: 10px;
      width: 553px;
      height: 36px;
      border-radius: 5px;
      border-width: 0.4px;
      border: solid 1px gray;
   }
   .seller_input_form:disabled{
      background-color: #DDDDDD;
   }
   .user_gender_wrap{
      padding-left: 13px; padding-top: 7px;
      margin-top: 10px;
      width: 553px; height: 36px;
      background-color: #F6FFDE;
      border-width: 0.4px; border: none; border-radius: 5px;
   }
   .addressform1, .addressform2, .addressform3{
      padding-left: 13px;
      margin-top: 10px;
      height: 36px;
      border-radius: 5px;
      border-width: 0.4px;
      border: solid 1px gray;
   }
   .addressform2{
      width: 389px;
      
   }
   .addressform3{
      width: 160px;
      margin-right: 0;
   }
   label{
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 400; font-size: 15px;
   }
   .btn_address{
      height: 36px;
      border-radius: 5px;
      background-color: #005700;
      color: white;
      width: 120px;
      border-style: none;
      text-align: center;
   }
   .btn_seller_signup_submit{
      height: 36px;
      border-radius: 5px;
      background-color: #005700;
      color: white;
      text-align: center;
      width: 250px;   
      border-style: none;
      margin: 50px;
   }
   .btn_idcheck{
      height: 36px; width: 90px;
      text-align: center;
      border-radius: 5px; border-style: none;
      background-color: #005700; color: white;
   }
   .emailform1{
      padding-left: 13px;
      margin-top: 10px;
      height: 36px; width: 290px; 
      border-radius: 5px;
      border-width: 0.4px;
      border: solid 1px gray;
   }
   .btn_email1{
      height: 36px; width: 128px;
      text-align: center;
      border-radius: 5px; border-style: none;
      background-color: #005700; color: white;
   }
   .successEmailChk{
      color: #FF6969;
   }
   #emailChk2{
      border: 1px solid #009d00; border-radius: 4px;
   }
   .user_gender{
      
   }
</style>
</style>

    <title>Insert title here</title>
</head>

<body>
<div class="layout_join_wrap">
   <div class="layout_inner">
      <h2 class="seller_signup_title">회원가입</h2>
      <hr style="margin-top: 30px; margin-bottom: 50px;">
      
       <form id="form1" name="form1" action="save" method="post" >
           <div class="seller_signup_subtitle">고객 정보 입력</div>
          <div class="seller_form_group">
             <label for="user_id">아이디</label><br>
             <input class="seller_input_form" type="text" name="user_id" id="user_id" placeholder="아이디를 입력하세요." maxlength="10" style="width: 460px;">
             <button class="btn_idcheck" type="button" idcheck="" id="idcheck" width="100%">ID중복검사</button>
          </div>
         <div class="seller_form_group">
             <label for="user_pwd">비밀번호</label><br>
             <input type="password" class="seller_input_form" name="user_pwd" id="user_pwd" size="30" placeholder="띄어쓰기 없이8~15 영문대/소문자 또는 특수문자" maxlength="15">
          </div>
         <div class="seller_form_group">
             <label for="user_pwd2" style="color: #005700;">비밀번호 재확인</label><br>
             <input type="password" class="seller_input_form" name="user_pwd2" id="user_pwd2" placeholder="비밀번호 재확인" maxlength="15">
          </div>
         <div class="seller_form_group">
             <label for="user_name">이름</label><br>
             <input type="text" class="seller_input_form" name="user_name" id="user_name" placeholder="이름을 입력하세요." maxlength="8">
          </div>
          <div class="seller_form_group">
             <label for="user_nickname">닉네임</label><br>
             <input type="text" class="seller_input_form" name="user_nickname" id="user_nickname" placeholder="닉네임을 입력하세요." maxlength="10">
          </div>
           <div class="seller_form_group">
             <label for="user_phone">전화번호</label><br>
             <input type="text" class="seller_input_form" name="user_phone" id="user_phone" placeholder=" -없이 숫자만입력" maxlength="11">
          </div>
         <div class="seller_form_group">
             <label for="business_address">주소</label><br>
             <input type="text" class="addressform1" name="user_address1" id="user_address1" placeholder="우편번호" readonly="readonly">
             <input type="button" class="btn_address" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
             <input type="text" class="seller_input_form" name="user_address2" id="user_address2" placeholder="주소 " readonly="readonly"><br>
            <div style="width: 100%;">
               <input type="text" class="addressform2" name="user_address3" id="user_address3" placeholder="상세주소 ">
               <input type="text" class="addressform3" name="user_address4" id="user_address4" placeholder="참고항목 " readonly="readonly" >
            </div>
          </div>
         <div class="seller_form_group">
            <label for="useremail">이메일</label><br>
            <input  class="emailform1"  id="user_email" type="text" name="user_email" placeholder="이메일 주소를 입력해주세요." required />
            <button class="btn_email1" type="button" echeck="" id="echeck">이메일ID중복검사</button>
               <button class="btn_email1" type="button" id="emailChk" name="emailChk">인증번호 보내기</button><br>
             <input  class="seller_input_form"  id="user_email2" type="text" name="user_email2" placeholder="인증번호 입력" disabled required />
               <div style="margin-top: 5px;">
               <button type="button" id="emailChk2">이메일인증</button>
               <span class="point successEmailChk">이메일 입력후 인증번호 보내기를 해주십시오.</span>
               </div>
               <input type="hidden" id="emailDoubleChk" />         
          </div> 
           <div class="seller_form_group">
             <label for="user_birthday">생년월일</label><br>
             <input type="text" class="seller_input_form" name="user_birthday" id="user_birthday" placeholder="ex) 19990415" maxlength="8">
          </div>  
         <div class="seller_form_group">
             <label for="user_gender">성별</label><br>
             <div class="user_gender_wrap">
                <input type="radio" name="user_gender" class="user_gender" value="남자" >남자&emsp;
                  <input type="radio" name="user_gender" class="user_gender" value="여자" >여자&emsp;
                  <input type="radio" name="user_gender" class="user_gender" value="선택안함" >선택안함
               </div>
          </div> 

          <div class="seller_form_group">
             <label for="email_check">이메일 수신여부</label><br>
             <div class="user_gender_wrap">
                <input type="radio" name="email_check" class="email_check" value="Y" >수신&emsp;
                  <input type="radio" name="email_check" class="email_check" value="N" >비수신
               </div>
          </div>      
           <div style="text-align: center;">
              <button type="button" id="check"  class="btn_seller_signup_submit">회원가입</button>
          </div>
       </form>
    </div>
</div>  
</body>

</html>