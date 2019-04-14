<table class="table b-t">
    <tbody>
        <tr>
            <td style="width: 25%;border-color: transparent;">
                <p style="font-family: Roboto-Bold!important;    margin-bottom: 0;">Tên khách hàng</p>
            </td>
            <td style="border-color: transparent;">{!! $feedback->name !!}</td>
        </tr>
        <tr>
            <td style="width: 5%">
                <p style="font-family: Roboto-Bold!important;margin-bottom: 0;">Số điện thoại</p>
            </td>
            <td>{!! $feedback->phone !!}</td>
        </tr>
        <tr>
            <td style="width: 5%">
                <p style="font-family: Roboto-Bold!important;margin-bottom: 0;">Địa chỉ</p>
            </td>
            <td>{!! $feedback->address !!}</td>
        </tr>
        <tr>
            <td style="width: 5%">
                <p style="font-family: Roboto-Bold!important;margin-bottom: 0;">Email</p>
            </td>
            <td>{!! $feedback->email !!}</td>
        </tr>
        <tr>
            <td style="width: 5%">
                <p style="font-family: Roboto-Bold!important;margin-bottom: 0;">Bình luận</p>
            </td>
            <td>{!! $feedback->content !!}</td>
        </tr>
    </tbody>
</table>