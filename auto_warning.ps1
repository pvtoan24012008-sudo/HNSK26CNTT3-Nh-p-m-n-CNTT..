# Script: auto_warning.ps1
# Tac gia: Pham Viet Toan
# Ngay tao: 21/10/2026

Write-Host "Dang loc canh bao thanh toan..."

"=== CANH BAO THANH TOAN ===" > .\logs\warning_report.txt

Get-Content .\logs\payment.log | Select-String "WARNING" >> .\logs\warning_report.txt

Write-Host "Hoan thanh!"