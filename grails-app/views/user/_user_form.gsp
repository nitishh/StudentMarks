<table>
    <tr>
        <td>UserName *</td>
        <td><g:textField name="username" required="" value="${userinfo?.username}"></g:textField></td>
    </tr>
    <tr>
        <td>Password *</td>
        <td><g:passwordField name="password" required="" value="${userinfo?.password}"></g:passwordField></td>
    </tr>
    <tr>
        <td>Type *</td>
        <td><g:textField name="user_type" required="" value="${userinfo?.user_type}"></g:textField></td>
    </tr>
</table>