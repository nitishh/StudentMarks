<table>
    <tr>
        <td>Name *</td>
        <td><g:textField required="" name="name" value="${studlist?.name}"></g:textField></td>
    </tr>
    <tr>
        <td>Address *</td>
        <td><g:textField name="address" required="" value="${studlist?.address}"></g:textField></td>
    </tr>
    <tr>
        <td>Email</td>
        <td><g:textField name="email" value="${studlist?.email}"></g:textField></td>
    </tr>
    <tr>
        <td>Phone</td>
        <td><g:textField name="phone" value="${studlist?.phone}"></g:textField></td>
    </tr>
    <tr>
        <td>Roll Number *</td>
        <td><g:textField name="roll" required="" value="${studlist?.roll}"></g:textField></td>
    </tr>
    <tr>
        <td>Batch *</td>
        <td><g:textField name="batch" required="" value="${studlist?.batch}"></g:textField></td>
    </tr>
    <tr>
        <td>Image</td>
        <td>
            <input type="file" name="studentImage">
        </td>
            %{--<g:textField name="image" value="${studlist?.image}"></g:textField>--}%
    </tr>

</table>