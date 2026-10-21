# BÀI LÀM – ÔN TẬP NGÀY 2

- **Họ tên:*Phạm Viết Toàn* 
- **Lớp:** HNKS26CNTT3
- **Link repository:** 
- **Hệ điều hành (Windows/macOS):** Windows 

## Bài 1. Lọc Log Thủ Công 

### Lệnh đã chạy 
```shell
Get-content .\logs\access.log | Select-String "ERROR" > .\logs\error_report.txt
Get-Content .\logs\error_report.txt -Head 2
```

### 2 Dòng Lỗi Đầu Tiên Trong ``error_report.txt``

```shell
2025-10-18 08:17:59 [ERROR] Khong tim thay trang /lich-thi (404)
2025-10-18 08:25:55 [ERROR] Het thoi gian cho (timeout)
```

## Bài 2. Đếm bằng pipeline 

### 2 Lệnh Đã Sử Dụng 
```shell
(Get-Content .\logs\access.log | Select-String "WARNING").Count
(Get-content .\logs\payment.log | Select-String "ERROR").Count
```

### Kết Quả 
```shell
WARNING trong access.log:4
ERROR trong payment.log:3
```

## Bài 3. Hoàn thiện script có khung sẵn

### Script ``auto_warning.ps1``

```shell
# Script: auto_warning.ps1
# Tac gia: Tran Duc Tai
# Ngay tao: 21/10/2026

Write-Host "Dang loc canh bao thanh toan..."

"=== CANH BAO THANH TOAN ===" > .\logs\warning_report.txt

Get-Content .\logs\payment.log | Select-String "WARNING" >> .\logs\warning_report.txt

Write-Host "Hoan thanh!"
```

### Lệnh Chạy (Em Đã Chạy Quyền Admin Rồi)

```shell
.\auto_warning.ps1
```
### Nội dung file ``logs/warning_report.txt``

```shell
=== CANH BAO THANH TOAN ===

2025-10-18 09:19:13 [WARNING] Cong thanh toan phan hoi cham
2025-10-18 09:28:16 [WARNING] Nhieu lan nhap sai ma OTP
2025-10-18 09:43:01 [WARNING] So du vi gan bang hoc phi
2025-10-18 09:46:22 [WARNING] So du vi gan bang hoc phi
2025-10-18 09:49:43 [WARNING] So du vi gan bang hoc phi
```

## Bài 4. Báo Cáo Tổng Hợp 

### Các Lệnh Đã Chạy 
```shell
"=== TONG HOP ACCESS LOG ===" > .\logs\tong_hop_ngay2.txt
Get-Content .\logs\access.log | Select-String "ERROR" >> .\logs\tong_hop_ngay2.txt
Get-Content .\logs\payment.log | Select-String "WARNING" >> .\logs\tong_hop_ngay2.txt
```
### Nội dung ``logs/tong_hop_ngay2.txt``
```shell
=== TONG HOP ACCESS LOG ===

 2 0 2 5 - 1 0 - 1 8   0 8 : 1 7 : 5 9   [ E R R O R ]   K h o n g   t i m   t h a y   t r a n g   / l i c h - t h i   ( 4 0 4 ) 
 
 2 0 2 5 - 1 0 - 1 8   0 8 : 2 5 : 5 5   [ E R R O R ]   H e t   t h o i   g i a n   c h o   ( t i m e o u t ) 
 
 2 0 2 5 - 1 0 - 1 8   0 8 : 3 3 : 5 1   [ E R R O R ]   K e t   n o i   m a y   c h u   d u   l i e u   t h a t   b a i 
 
 2 0 2 5 - 1 0 - 1 8   0 8 : 3 7 : 1 9   [ E R R O R ]   K e t   n o i   m a y   c h u   d u   l i e u   t h a t   b a i 
 
 2 0 2 5 - 1 0 - 1 8   0 8 : 4 9 : 4 3   [ E R R O R ]   H e t   t h o i   g i a n   c h o   ( t i m e o u t ) 
 
 2 0 2 5 - 1 0 - 1 8   0 8 : 5 3 : 1 1   [ E R R O R ]   H e t   t h o i   g i a n   c h o   ( t i m e o u t ) 
  
 2 0 2 5 - 1 0 - 1 8   0 9 : 1 9 : 1 3   [ W A R N I N G ]   C o n g   t h a n h   t o a n   p h a n   h o i   c h a m 
 
 2 0 2 5 - 1 0 - 1 8   0 9 : 2 8 : 1 6   [ W A R N I N G ]   N h i e u   l a n   n h a p   s a i   m a   O T P 
 
 2 0 2 5 - 1 0 - 1 8   0 9 : 4 3 : 0 1   [ W A R N I N G ]   S o   d u   v i   g a n   b a n g   h o c   p h i 
 
 2 0 2 5 - 1 0 - 1 8   0 9 : 4 6 : 2 2   [ W A R N I N G ]   S o   d u   v i   g a n   b a n g   h o c   p h i 
 
 2 0 2 5 - 1 0 - 1 8   0 9 : 4 9 : 4 3   [ W A R N I N G ]   S o   d u   v i   g a n   b a n g   h o c   p h i 
```
## Bài 5. Câu hỏi ngắn 
- a) Lệnh ...>file là chèn một nội dung mới vô file và xóa các nội dung cũ trong file có sẵn .
Lệnh ...>>file là chèn thêm nội dung mới nối tiếp nội dung cũ trong file mà không xóa hay ghi đè .
- b) Ở Bài 4, nếu lệnh thứ hai (nối các dòng ERROR) dùng > thay cho >>, nội dung file tong_hop_ngay2.txt thì sẽ mất đi dòng === TONG HOP ACCESS LOG === thay vào đó là các dòng chứa "ERROR"
- c) Sao trong script nên dùng đường dẫn tương đối logs/payment.log thay vì đường dẫn tuyệt đối trên máy mình (ví dụ C:/Users/An/Desktop/...) . Tại vì đường dẫn tương đối giúp mã nguồn ngắn gọn, dễ đọc, dễ bảo trì và ít phụ thuộc vào cấu hình của từng máy tính. Nó cũng thuận tiện khi chia sẻ dự án, làm việc nhóm và di chuyển dự án sang vị trí khác, miễn là cấu trúc thư mục cần thiết được giữ nguyên.

## Tự chấm (điền sau khi có đáp án)

- **Điểm tự chấm:** ..../100
- **Lỗi mình đã mắc và cách sửa:**
