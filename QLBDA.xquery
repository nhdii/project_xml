(: hiển thị tên món ăn có giá lớn hơn 30000

let $monan := doc("instance1.xml")
for $x in $monan/QLBDA/MONANS/MONAN
where $x/gia > 30000
return $x/tenMon
:)

(:
Hiển thị SDT và email của khách hàng có tên là Nguyễn Thị Hồng Vân

for $x in doc("instance1.xml")/QLBDA/KHACHHANGS/KHACHHANG[hoTen = "Nguyễn Thị Hồng Vân"]
return ($x/SDT, $x/email)
:)
 


(: Hiển thị tên món ăn và giá của món ăn có mã là MA0003

for $item in doc("instance1.xml")//MONANS/MONAN[@maMonAn = "MA0003"]
return concat($item/tenMon, ": ", $item/gia)
:)

(:lấy tên và địa chỉ email của tất cả các khách hàng đã đặt hàng trong tháng 4 năm 2023:

for $customer in distinct-values(doc("instance1.xml")
//HOADON[starts-with(ngayDH, '2023-04')]/@maKH)
return (doc("instance1.xml")//KHACHHANG[@maKH = $customer]/hoTen, doc("instance1.xml")
//KHACHHANG[@maKH = $customer]/email)
:)

(: Lấy ra tổng tiền của mỗi hóa đơn

for $hoadon in /QLBDA/HOADONS/HOADON
let $tongtien := sum(/QLBDA/CTHOADONS/CTHOADON[@maHD = $hoadon/@maHD]/thanhTien)
return <hoadon maHD="{$hoadon/@maHD}">
<tongtien>{$tongtien}</tongtien>
</hoadon>
:)

(: Lấy tên và số lượng của tất cả các đơn đặt hàng được đặt bởi khách hàng có tên là "Nguyễn Hoàng Duy":
let $maKH := //KHACHHANG[hoTen = 'Nguyễn Hoàng Duy']/@maKH
return concat(count(//HOADON[@maKH = $maKH]), ', ', 
//KHACHHANG[@maKH = $maKH]/hoTen)
:)

(: Giá trung bình của các món ăn
<result>Giá trung bình các món ăn là: {avg(//MONAN/gia)}</result>
:)

(:Lấy tên của tất cả các món ăn được sắp xếp theo giá từ thấp đến cao:
for $monan in //MONAN
order by $monan/gia ascending
return $monan/tenMon
:)

