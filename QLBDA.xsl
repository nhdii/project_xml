<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Bán đồ ăn Online</title>
                <link rel="stylesheet" type="text/css" href="QLBDA.css"/>
            </head>
            <body>
                <h2>DANH SÁCH CÁC MÓN ĂN</h2>
                <table border="1" >
                    <tr bgcolor="#ADFF2F">
                        <th>Mã món ăn</th>
                        <th>Tên món</th>
                        <th>Giá</th>
                        <th>Mô tả</th>
                    </tr>
                    <xsl:for-each select="QLBDA/MONANS/MONAN">
                        <tr>
                            <td align="center"><xsl:value-of select="@maMonAn"/></td>
                            <td><xsl:value-of select="tenMon"/></td>
                            <td><xsl:value-of select="gia"/></td>
                            <td><xsl:value-of select="moTa"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <h2>DANH SÁCH KHÁCH HÀNG</h2>
                <table border="1" width="70%">
                    <tr bgcolor="#ADFF2F">
                        <th>Mã KH</th>
                        <th>Họ và tên</th>
                        <th>Địa chỉ</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                    </tr>
                    <xsl:for-each select="QLBDA/KHACHHANGS/KHACHHANG">
                        <tr>
                            <td align="center"><xsl:value-of select="@maKH"/></td>
                            <td><xsl:value-of select="hoTen"/></td>
                            <td><xsl:value-of select="diaChi"/></td>
                            <td align="center"><xsl:value-of select="SDT"/></td>
                            <td><xsl:value-of select="email"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <h2>DANH SÁCH NHÂN VIÊN</h2>
                <table border="1" width="50%">
                    <tr bgcolor="#ADFF2F">
                        <th>Mã NV</th>
                        <th>Họ và tên</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                    </tr>
                    <xsl:for-each select="QLBDA/NHANVIENS/NHANVIEN">
                        <tr>
                            <td align="center"><xsl:value-of select="@maNV"/></td>
                            <td><xsl:value-of select="hoTenNV"/></td>
                            <td align="center"><xsl:value-of select="SDT"/></td>
                            <td><xsl:value-of select="email"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <h2>DANH SÁCH HÓA ĐƠN</h2>
                <table border="1" width="50%">
                    <tr bgcolor="#ADFF2F">
                        <th>Mã HD</th>
                        <th>Mã KH</th>
                        <th>Mã NV</th>
                        <th>Ngày đặt hàng</th>
                    </tr>
                    <xsl:for-each select="QLBDA/HOADONS/HOADON">
                        <tr align="center">
                            <td><xsl:value-of select="@maHD"/></td>
                            <td><xsl:value-of select="@maKH"/></td>
                            <td><xsl:value-of select="@maNV"/></td>
                            <td><xsl:value-of select="ngayDH"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <h2>Danh sách chi tiết hóa đơn</h2>
                <table border="1" width="60%">
                    <tr bgcolor="#ADFF2F">
                        <th>Mã HD</th>
                        <th>Mã món ăn</th>
                        <th>Số lượng</th>
                        <th>Địa chỉ giao hàng</th>
                        <th>Thành tiền</th>
                    </tr>
                    <xsl:for-each select="QLBDA/CTHOADONS/CTHOADON">
                        <tr>
                            <td align="center"><xsl:value-of select="@maHD"/></td>
                            <td align="center"><xsl:value-of select="@maMonAn"/></td>
                            <td align="center"><xsl:value-of select="soLuong"/></td>
                            <td><xsl:value-of select="diaChiGH"/></td>
                            <td><xsl:value-of select="thanhTien"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>