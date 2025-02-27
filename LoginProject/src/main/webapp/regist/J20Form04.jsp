<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        var isValidate = function(frm){

            if(frm.id.value == ""){
                alert("아이디를 입력하세요");
                frm.id.focus();
                return false;
            }   
        }
        if(!frm.pwd.value|| !frm.pwd2.value){
            alert("패스워드를 입력하세요");
            return false;
        }
        if(frm.pwd.value != frm.pwd2.value){
        alert("패스워드가 일치하지 않습니다.");
        frm.pwd.value = "";
        frm.pwd2.value = "";
        frm.pwd.focus();
        return false;
        }
        var isGender = false;
        for(var i = 0; i<frm.gender.legnth; i++){
            if(frm.gender[i].checked==true){
                isGender = true;
                break;
            }
        }
        if(isGender!=true){
            alert("성별을 선택하세요");
            frm.gender[0].focus();
            return false;
        }
        var checkCount=0;
        for(var i = 0; i<frm.inter.length; i++){
            if(frm.inter[i].checked==true){
                checkCount++;
            }
        }
        
        if(checkCount<2){
            alert("관심사항은 2개dltkd 선택하세요");
            return false;
        }
        if(frm.grade1.selectedIndex==0){
            alert("최종학력을 선택하세요");
            frm.grade1.focus();
            return false;
        }
        if(frm.grade2.value==""){
            alert("최종학력을 선택하세요");
            frm.grade2.focus();
            return false;
        }
        if(frm.userfile.value==""){
            alert("첨부파일을 선택하세요");
            frm.userfile.focus();
            return false;
        }
        if(frm.intro.value==""){
            alert("자기소개를 입력하세요");
            frm.intro.focus();
            return false;
        }  function idCheck(fn){
            if(fn.id.value == ""){
                alert("아이디를 입력 후 중복확인을 누르삼");
                fn.id.focus();
                
            }
            else{
                fn.id.readOnly = true;
                window.open("../pages/id_overapping.jsp?id="+fn.id.value,"idover","width=300,height=200");
            }
        }

    </script>
</head>
<body>
    <h2>회원가입 페이지</h2>
    <form name="registFrm" onsubmit="return isValidate(this);">
    <!-- table>tr*9>td*2 -->
    <table border="1" cellspacing="0" cellpadding="5">
        <tr>
            <td>아이디</td>
            <td>
                <input type="text" name="id" size="20" />
                <button type="button" onclick="idCheck(this.form);">아이디중복확인</button>
            </td>
        </tr>
        <tr>
            <td>패스워드</td>
            <td>
                <input type="password" name="pwd" size="25" />
            </td>
        </tr>
        <tr>
            <td>패스워드확인</td>
            <td>
                <input type="password" name="pwd2" size='25' />
            </td>
        </tr>
        <tr>
            <td>성별</td>
            <td>
                <input type="radio" name="gender" value="man" />남
                <input type="radio" name="gender" value="woman"/>여
                <input type="radio" name="gender" value="trans" />트랜스젠더
            </td>
        </tr>
        <tr>
            <td>관심사항(2개선택)</td>
            <td>
                <label>
                <input type="checkbox" name="inter" value="pol" />정치
                </label>
    
                <input type="checkbox" name="inter" value="eco" 
                    id="ec"/><label for="ec">경제</label>
    
                <input type="checkbox" name="inter" value="spo" 
                    id="sp"/><label for="sp">스포츠</label>
    
                <input type="checkbox" name="inter" value="ent" 
                    id="en"/><label for="en">연예</label>
            </td>
        </tr>
        <tr>
            <td>최종학력</td>
            <td>
            <select name="grade1">
                <option value="noValue">--선택하세요(값있음)--</option>
                <option value="ele">초등학교</option>
                <option value="mid">중학교</option>
                <option value="high">고등학교</option>
                <option value="uni">대학교</option>
            </select>		
            &nbsp;
            <select name="grade2">
                <option value="">--선택하세요(값없음)--</option>
                <option value="ele">초등학교</option>
                <option value="mid">중학교</option>
                <option value="high">고등학교</option>
                <option value="uni">대학교</option>
            </select>
            </td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td>
                <input type="file" name="userfile" size="40"/>		
            </td>
        </tr>
        <tr>
            <td>자기소개</td>
            <td>
                <textarea name="intro" cols="30" rows="10" value="나는 누구? 나는 내용??"></textarea>	
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <button type="submit">회원가입하기</button>
                &nbsp;&nbsp;
                <button type="reset">RESET</button>
            </td>
        </tr>
    </table>
    </form>
    <script>
        
    </script>
    </body>
    
    
</html>