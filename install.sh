#!/usr/bin/env bash
set -e

# Ganti USERNAME dengan akun GitHub Anda
REPO="USERNAME/nyrax-release"
INSTALL_DIR="$HOME/.local/bin"

echo "=== Installing Nyrax Security CLI ==="

# 1. Cek & Install Bun jika belum ada
if ! command -v bun &> /dev/null; then
    echo "[*] Installing Bun runtime..."
    curl -fsSL https://bun.sh/install | bash
    export PATH="$HOME/.bun/bin:$PATH"
fi

# 2. Buat direktori bin user
mkdir -p "$INSTALL_DIR"

# 3. Download binary nyrax langsung dari repo GitHub release
echo "[*] Downloading Nyrax binary..."
curl -L -o "$INSTALL_DIR/nyrax" "https://raw.githubusercontent.com/$REPO/main/nyrax"
chmod +x "$INSTALL_DIR/nyrax"

echo "================================================="
echo "   NYRAX SUCCESSFULLY INSTALLED!"
echo "================================================="
echo "Run 'nyrax --help' to get started."
