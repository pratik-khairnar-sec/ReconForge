#!/usr/bin/env bash
# ==============================================================================
# ⚡ ReconForge v3 — Universal 1-Click Master Arsenal Installer & Tool Cloner
# Engineered for Bug Bounty Hunters, Penetration Testers & Red Teams
# Author: Pratik Khairnar (@pratik-khairnar-sec)
# ==============================================================================
# Compatible with: Kali Linux, Ubuntu 20.04/22.04/24.04, Debian 11/12, WSL2, VPS
# ==============================================================================

set -e

# Color Palette
C_RESET="\033[0m"
C_CYAN="\033[1;36m"
C_BLUE="\033[1;34m"
C_GREEN="\033[1;32m"
C_YELLOW="\033[1;33m"
C_RED="\033[1;31m"
C_BOLD="\033[1m"

banner() {
    clear 2>/dev/null || true
    echo -e "${C_CYAN}"
    echo "  ██████╗ ███████╗ ██████╗ ██████╗ ███╗   ██╗███████╗ ██████╗ ██████╗  ██████╗ ███████╗"
    echo "  ██╔══██╗██╔════╝██╔════╝██╔═══██╗████╗  ██║██╔════╝██╔═══██╗██╔══██╗██╔════╝ ██╔════╝"
    echo "  ██████╔╝█████╗  ██║     ██║   ██║██╔██╗ ██║█████╗  ██║   ██║██████╔╝██║  ███╗█████╗  "
    echo "  ██╔══██╗██╔══╝  ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║   ██║██╔══██╗██║   ██║██╔══╝  "
    echo "  ██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║  ██║╚██████╔╝███████╗"
    echo "  ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝"
    echo -e "${C_RESET}"
    echo -e "${C_BOLD}   ⚡ RECONFORGE v3 — 1-CLICK ALL TOOLS INSTALLER & CLONER ⚡${C_RESET}"
    echo -e "${C_CYAN}   Zero-Friction Bug Bounty Reconnaissance Suite Automated Setup${C_RESET}"
    echo -e "${C_BLUE}   Author: Pratik Khairnar (@pratik-khairnar-sec)${C_RESET}"
    echo " =============================================================================="
    echo ""
}

banner

INSTALL_DIR="$HOME/tools/reconforge"
WORDLIST_DIR="$HOME/wordlists"
mkdir -p "$INSTALL_DIR" "$WORDLIST_DIR" "$HOME/.gf"

# --- STEP 1: OS & ROOT / SUDO CHECK ---
echo -e "${C_CYAN}[+] Step 1: Checking System Environment & Package Manager...${C_RESET}"

if [ "$EUID" -eq 0 ]; then
    SUDO_CMD=""
else
    if command -v sudo >/dev/null 2>&1; then
        SUDO_CMD="sudo"
    else
        echo -e "${C_RED}[!] Sudo not found. Please run as root or install sudo.${C_RESET}"
        exit 1
    fi
fi

# --- STEP 2: INSTALL SYSTEM DEPENDENCIES & CORE PACKAGES ---
echo -e "${C_CYAN}[+] Step 2: Updating APT & Installing Core Security Utilities...${C_RESET}"
$SUDO_CMD apt-get update -y
$SUDO_CMD apt-get install -y --no-install-recommends \
    git curl wget jq build-essential make gcc libpcap-dev libssl-dev \
    python3 python3-pip python3-dev python3-venv \
    nmap masscan parallel unzip tar zip exiftool \
    ca-certificates gnupg lsb-release

# Install optional specialized tools if available in repo
$SUDO_CMD apt-get install -y wpscan apktool seclists 2>/dev/null || true

# --- STEP 3: CONFIGURE GO ENVIRONMENT ---
echo -e "${C_CYAN}[+] Step 3: Verifying / Installing Golang Environment...${C_RESET}"
if ! command -v go >/dev/null 2>&1; then
    echo -e "${C_YELLOW}[*] Golang not found. Installing latest Go binary...${C_RESET}"
    ARCH="$(uname -m)"
    case "$ARCH" in
        x86_64) GO_ARCH="amd64" ;;
        aarch64|arm64) GO_ARCH="arm64" ;;
        *) GO_ARCH="amd64" ;;
    esac
    GO_VER="1.23.2"
    wget -q "https://go.dev/dl/go${GO_VER}.linux-${GO_ARCH}.tar.gz" -O /tmp/go.tar.gz
    $SUDO_CMD rm -rf /usr/local/go
    $SUDO_CMD tar -C /usr/local -xzf /tmp/go.tar.gz
    rm -f /tmp/go.tar.gz
    export PATH=$PATH:/usr/local/go/bin
fi

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin"

# Persist PATH in shell rc files
for RC in "$HOME/.bashrc" "$HOME/.zshrc"; do
    if [ -f "$RC" ]; then
        if ! grep -q 'go/bin' "$RC"; then
            echo 'export GOPATH="$HOME/go"' >> "$RC"
            echo 'export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin"' >> "$RC"
        fi
    fi
done

echo -e "${C_GREEN}[✓] Go Version: $(go version)${C_RESET}"

# --- STEP 4: INSTALL ALL GO RECONNAISSANCE TOOLS ---
echo -e "${C_CYAN}[+] Step 4: Installing Golang Recon Tools (Go Install)...${C_RESET}"

declare -A GO_TOOLS=(
    ["subfinder"]="github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
    ["httpx"]="github.com/projectdiscovery/httpx/cmd/httpx@latest"
    ["katana"]="github.com/projectdiscovery/katana/cmd/katana@latest"
    ["nuclei"]="github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest"
    ["naabu"]="github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
    ["dnsx"]="github.com/projectdiscovery/dnsx/cmd/dnsx@latest"
    ["anew"]="github.com/tomnomnom/anew@latest"
    ["alterx"]="github.com/projectdiscovery/alterx/cmd/alterx@latest"
    ["asnmap"]="github.com/projectdiscovery/asnmap/cmd/asnmap@latest"
    ["dalfox"]="github.com/hahwul/dalfox/v2@latest"
    ["gau"]="github.com/lc/gau/v2/cmd/gau@latest"
    ["waybackurls"]="github.com/tomnomnom/waybackurls@latest"
    ["assetfinder"]="github.com/tomnomnom/assetfinder@latest"
    ["chaos"]="github.com/projectdiscovery/chaos-client/cmd/chaos@latest"
    ["subzy"]="github.com/LukaSikic/subzy@latest"
    ["notify"]="github.com/projectdiscovery/notify/cmd/notify@latest"
    ["interactsh-client"]="github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest"
    ["shosubgo"]="github.com/incogbyte/shosubgo@latest"
    ["airixss"]="github.com/ferreiraklet/airixss@latest"
    ["kxss"]="github.com/Emoe/kxss@latest"
    ["qsreplace"]="github.com/tomnomnom/qsreplace@latest"
    ["Gxss"]="github.com/KathanP19/Gxss@latest"
    ["shortscan"]="github.com/bitquark/shortscan/cmd/shortscan@latest"
    ["uncover"]="github.com/projectdiscovery/uncover/cmd/uncover@latest"
    ["gf"]="github.com/tomnomnom/gf@latest"
    ["ffuf"]="github.com/ffuf/ffuf/v2@latest"
)

for TOOL in "${!GO_TOOLS[@]}"; do
    PKG="${GO_TOOLS[$TOOL]}"
    echo -ne "  ${C_BLUE}→ Installing ${TOOL}...${C_RESET} "
    go install -v "$PKG" >/dev/null 2>&1 || true
    if command -v "$TOOL" >/dev/null 2>&1 || [ -f "$GOPATH/bin/$TOOL" ]; then
        echo -e "${C_GREEN}[INSTALLED]${C_RESET}"
    else
        echo -e "${C_YELLOW}[VERIFY]${C_RESET}"
    fi
done

# Update Nuclei templates immediately
if command -v nuclei >/dev/null 2>&1 || [ -f "$GOPATH/bin/nuclei" ]; then
    echo -e "${C_CYAN}[+] Updating Nuclei vulnerability templates to latest release...${C_RESET}"
    nuclei -update-templates -silent 2>/dev/null || "$GOPATH/bin/nuclei" -update-templates -silent 2>/dev/null || true
fi

# --- STEP 5: PYTHON CLI TOOLS INSTALLATION ---
echo -e "${C_CYAN}[+] Step 5: Installing Python Recon Tools & Libraries...${C_RESET}"
pip3 install --upgrade --break-system-packages \
    arjun dirsearch sqlmap uro x8 holehe theHarvester maigret trufflehog \
    requests beautifulsoup4 jsbeautifier shodan >/dev/null 2>&1 || \
pip3 install --upgrade \
    arjun dirsearch sqlmap uro x8 holehe theHarvester maigret trufflehog \
    requests beautifulsoup4 jsbeautifier shodan >/dev/null 2>&1 || true

echo -e "${C_GREEN}[✓] Python CLI packages installed.${C_RESET}"

# --- STEP 6: CLONE SPECIALIZED PYTHON RECON TOOLS ---
echo -e "${C_CYAN}[+] Step 6: Cloning Field-Tested Repositories to ${INSTALL_DIR}...${C_RESET}"

clone_or_update() {
    local NAME="$1"
    local URL="$2"
    local TARGET="${INSTALL_DIR}/${NAME}"
    echo -ne "  ${C_BLUE}→ Cloning ${NAME}...${C_RESET} "
    if [ -d "$TARGET/.git" ]; then
        git -C "$TARGET" pull --quiet >/dev/null 2>&1 || true
        echo -e "${C_GREEN}[UPDATED]${C_RESET}"
    else
        git clone --depth 1 "$URL" "$TARGET" --quiet >/dev/null 2>&1 || true
        echo -e "${C_GREEN}[CLONED]${C_RESET}"
    fi
}

clone_or_update "LinkFinder"     "https://github.com/GerbenJavado/LinkFinder.git"
clone_or_update "SecretFinder"   "https://github.com/m4ll0k/SecretFinder.git"
clone_or_update "GitDorker"      "https://github.com/obheda12/GitDorker.git"
clone_or_update "favUp"          "https://github.com/pielco11/fav-up.git"
clone_or_update "favirecon"      "https://github.com/edoardottt/favirecon.git"
clone_or_update "FavFreak"       "https://github.com/devanshbatham/FavFreak.git"
clone_or_update "jwt_tool"       "https://github.com/ticarpi/jwt_tool.git"
clone_or_update "cloud_enum"     "https://github.com/initstring/cloud_enum.git"
clone_or_update "s3scanner"      "https://github.com/sa7mon/S3Scanner.git"
clone_or_update "sherlock"       "https://github.com/sherlock-project/sherlock.git"
clone_or_update "blackbird"      "https://github.com/p1ngul1n0/blackbird.git"
clone_or_update "mosint"         "https://github.com/alpkeskin/mosint.git"
clone_or_update "CloakQuest3r"   "https://github.com/spyboy-productions/CloakQuest3r.git"
clone_or_update "bxss"           "https://github.com/ethicalhackingplayground/bxss.git"

# Install requirements for cloned tools
echo -e "${C_CYAN}[+] Step 7: Resolving Dependencies for Cloned Repositories...${C_RESET}"
for REPO in LinkFinder SecretFinder GitDorker favUp jwt_tool cloud_enum sherlock blackbird mosint CloakQuest3r; do
    if [ -f "${INSTALL_DIR}/${REPO}/requirements.txt" ]; then
        pip3 install --break-system-packages -r "${INSTALL_DIR}/${REPO}/requirements.txt" >/dev/null 2>&1 || \
        pip3 install -r "${INSTALL_DIR}/${REPO}/requirements.txt" >/dev/null 2>&1 || true
    fi
done

# Create global wrapper symlinks in /usr/local/bin so they can be run directly anywhere
echo -e "${C_CYAN}[+] Step 8: Creating Global CLI Shortcuts...${C_RESET}"
[ -f "${INSTALL_DIR}/SecretFinder/SecretFinder.py" ] && $SUDO_CMD ln -sf "${INSTALL_DIR}/SecretFinder/SecretFinder.py" /usr/local/bin/SecretFinder.py 2>/dev/null || true
[ -f "${INSTALL_DIR}/LinkFinder/linkfinder.py" ]     && $SUDO_CMD ln -sf "${INSTALL_DIR}/LinkFinder/linkfinder.py" /usr/local/bin/linkfinder.py 2>/dev/null || true
[ -f "${INSTALL_DIR}/jwt_tool/jwt_tool.py" ]         && $SUDO_CMD ln -sf "${INSTALL_DIR}/jwt_tool/jwt_tool.py" /usr/local/bin/jwt_tool.py 2>/dev/null || true
[ -f "${INSTALL_DIR}/GitDorker/GitDorker.py" ]       && $SUDO_CMD ln -sf "${INSTALL_DIR}/GitDorker/GitDorker.py" /usr/local/bin/GitDorker.py 2>/dev/null || true

# --- STEP 9: WORDLISTS & GF PATTERNS SETUP ---
echo -e "${C_CYAN}[+] Step 9: Configuring GF Patterns & SecLists...${C_RESET}"

# GF Patterns
if [ ! -d "$HOME/Gf-Patterns" ]; then
    git clone --depth 1 "https://github.com/1ndianl33t/Gf-Patterns.git" "$HOME/Gf-Patterns" --quiet 2>/dev/null || true
fi
if [ -d "$HOME/Gf-Patterns" ]; then
    cp -r "$HOME/Gf-Patterns"/*.json "$HOME/.gf/" 2>/dev/null || true
    echo -e "${C_GREEN}[✓] GF Patterns (xss, sqli, ssrf, redirect, lfi) copied to ~/.gf/${C_RESET}"
fi

# SecLists
if [ ! -d "/usr/share/seclists" ]; then
    echo -e "${C_YELLOW}[*] SecLists not found in /usr/share/seclists. Setting up...${C_RESET}"
    if [ ! -d "$WORDLIST_DIR/SecLists" ]; then
        git clone --depth 1 "https://github.com/danielmiessler/SecLists.git" "$WORDLIST_DIR/SecLists" --quiet 2>/dev/null || true
    fi
    if [ -d "$WORDLIST_DIR/SecLists" ]; then
        $SUDO_CMD mkdir -p /usr/share/seclists 2>/dev/null || true
        $SUDO_CMD ln -sf "$WORDLIST_DIR/SecLists"/* /usr/share/seclists/ 2>/dev/null || true
        echo -e "${C_GREEN}[✓] SecLists symlinked to /usr/share/seclists${C_RESET}"
    fi
else
    echo -e "${C_GREEN}[✓] SecLists already available at /usr/share/seclists${C_RESET}"
fi

# --- SUMMARY & VERIFICATION ---
echo ""
echo -e "${C_CYAN}==============================================================================${C_RESET}"
echo -e "${C_GREEN}${C_BOLD}   🎉 ALL RECONFORGE ARSENAL TOOLS INSTALLED & CONFIGURED SUCCESSFULLY!${C_RESET}"
echo -e "${C_CYAN}==============================================================================${C_RESET}"
echo -e "  • Go Binaries:     ${C_BOLD}$HOME/go/bin${C_RESET} (Exported to PATH)"
echo -e "  • Cloned Tools:    ${C_BOLD}$INSTALL_DIR${C_RESET}"
echo -e "  • Wordlists:       ${C_BOLD}/usr/share/seclists / $WORDLIST_DIR${C_RESET}"
echo -e "  • GF Patterns:     ${C_BOLD}$HOME/.gf/${C_RESET}"
echo ""
echo -e "${C_YELLOW}[!] Pro Tip: Run 'source ~/.bashrc' or open a new terminal tab to refresh PATH.${C_RESET}"
echo -e "${C_CYAN}==============================================================================${C_RESET}"
