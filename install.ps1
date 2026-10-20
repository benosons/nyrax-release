Write-Host "=== Installing Nyrax Security CLI ===" -ForegroundColor Cyan

# Ganti USERNAME dengan akun GitHub Anda
$Repo = "USERNAME/nyrax-release"
$BinDir = "$HOME\.local\bin"

# 1. Cek & Install Bun
if (-not (Get-Command bun -ErrorAction SilentlyContinue)) {
    Write-Host "[*] Installing Bun runtime..." -ForegroundColor Yellow
    irm https://bun.sh/install.ps1 | iex
    $env:PATH += ";$HOME\.bun\bin"
}

# 2. Buat direktori bin
if (-not (Test-Path $BinDir)) {
    New-Item -ItemType Directory -Force -Path $BinDir | Out-Null
}

# 3. Download binary nyrax.exe
Write-Host "[*] Downloading Nyrax binary..." -ForegroundColor Yellow
$DownloadUrl = "https://raw.githubusercontent.com/$Repo/main/nyrax.exe"
Invoke-WebRequest -Uri $DownloadUrl -OutFile "$BinDir\nyrax.exe"

# 4. Tambahkan ke User PATH jika belum ada
$UserPath = [Environment]::GetEnvironmentVariable("PATH", "User")
if ($UserPath -notlike "*$BinDir*") {
    [Environment]::SetEnvironmentVariable("PATH", "$UserPath;$BinDir", "User")
    Write-Host "[+] Added $BinDir to user PATH." -ForegroundColor Green
}

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "   NYRAX SUCCESSFULLY INSTALLED!" -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "Restart your terminal and run 'nyrax --help' to get started." -ForegroundColor Cyan
