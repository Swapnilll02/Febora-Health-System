<%@ page contentType="text/html;charset=UTF-8" %>

<%
if(session.getAttribute("resetEmail")==null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Febora Health | Create New Password</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/auth.css">

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>

<body>

<div class="page">

    <!-- LEFT PANEL -->
    <div class="left-panel">

        <img src="<%=request.getContextPath()%>/images/medical-login.svg">

        <div class="brand-text">
            <h1>🏥 Febora Health</h1>
            <p>Secure Password Update</p>
        </div>

    </div>

    <!-- RIGHT PANEL -->
    <div class="right-panel">

        <div class="auth-card">

            <h2>Create New Password</h2>

            <form action="${pageContext.request.contextPath}/resetPassword"
                  method="post"
                  onsubmit="return validatePassword()">

                <input type="password"
                       id="pass"
                       name="password"
                       placeholder="New Password"
                       required>

                <input type="password"
                       id="confirm"
                       placeholder="Confirm Password"
                       required>

                <button type="submit">Update Password</button>

            </form>

        </div>

    </div>

</div>

<script>
function validatePassword(){
    let p=document.getElementById("pass").value;
    let c=document.getElementById("confirm").value;

    if(p!==c){
        alert("Passwords do not match");
        return false;
    }
    return true;
}
</script>

</body>
</html>