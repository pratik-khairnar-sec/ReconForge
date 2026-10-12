# ReconForge Elite Dork Vaults — Modular Categorized Wordlists

> **Total Dorks:** 17,071 Live Google & GitHub & Shodan Dorks
> **Architecture:** Clean, dedicated single-purpose files for Bug Bounty, GitHub secrets, Cloud leaks, SQLi, and Admin portals.

| File Name | Dork Count | Categories Included |
| :--- | :---: | :--- |
| [`01_top_1_percent_elite_vault.txt`](01_top_1_percent_elite_vault.txt) | **1,674** | 🔥 Top 1% Elite Vault (P1/P2 Exploits & Cloud Leaks) |
| [`02_bug_bounty_programs_and_vdp.txt`](02_bug_bounty_programs_and_vdp.txt) | **121** | Bug Bounty — 🎯 Bug Bounty Platform Programs, Bug Bounty — 💰 Responsible Disclosure & VDP Pages, Bug Bounty — 🔍 Security.txt Discovery (RFC 9116), Bug Bounty — 🌍 BB Programs by Region / Country, Bug Bounty — 🏢 Enterprise & Startup BB Programs (undisclosed), Bug Bounty — 🚀 New & Recently Launched Programs, Bug Bounty — 💼 High-Value Corporate Targets, Bug Bounty — 🔎 Finding Specific Program Scopes, Bug Bounty — 🐙 GitHub — Finding BB Program Policies |
| [`03_github_secrets_and_api_tokens.txt`](03_github_secrets_and_api_tokens.txt) | **591** | GitHub Secrets — Leaked Tokens & Keys |
| [`04_admin_portals_and_login_panels.txt`](04_admin_portals_and_login_panels.txt) | **1,075** | GHDB — Login Portals & Admin Panels, Admin/Login Path Dorks (from wordlist), Target Discovery — Login & Admin Panel Discovery |
| [`05_passwords_credentials_and_env_files.txt`](05_passwords_credentials_and_env_files.txt) | **310** | GHDB — Password & Credential Files, GHDB — Configuration Files (.ini / .env / .cfg), Target Discovery — Sensitive Files & Credentials |
| [`06_sqli_and_injection_parameters.txt`](06_sqli_and_injection_parameters.txt) | **4,000** | GHDB — Error Messages (SQLi / Stack Traces), SQLi-Prone Parameter Dorks (from wordlist), SQLi — Advanced Vulnerability Dorks |
| [`07_database_dumps_and_backups.txt`](07_database_dumps_and_backups.txt) | **21** | GHDB — Database Dumps & SQL Files, GHDB — Backup & Archive Files |
| [`08_open_directory_listings.txt`](08_open_directory_listings.txt) | **153** | GHDB — Open Directory Listings |
| [`09_shodan_dorks_and_recon.txt`](09_shodan_dorks_and_recon.txt) | **97** | Bug Bounty — 📊 Shodan — Finding BB Program Hosts, Shodan — Bug Bounty & Cloud Assets |
| [`10_apis_and_target_discovery.txt`](10_apis_and_target_discovery.txt) | **25** | Target Discovery — Subdomain & Asset Discovery, Target Discovery — API & Endpoint Discovery, Target Discovery — Tech Stack & Cloud Exposure |
| [`11_network_iot_and_management_consoles.txt`](11_network_iot_and_management_consoles.txt) | **102** | GHDB — Network Cameras & IoT Devices, GHDB — Network Devices, Printers & Management Consoles |
| [`12_vulnerable_software_and_version_banners.txt`](12_vulnerable_software_and_version_banners.txt) | **243** | GHDB — Vulnerable Software / Version Banners |
| [`13_shopping_and_financial_data.txt`](13_shopping_and_financial_data.txt) | **4** | GHDB — Shopping / Financial Data Exposure |
| [`14_google_master_broad_attack_surface.txt`](14_google_master_broad_attack_surface.txt) | **600** | Google Master — Broad Attack Surface |
| [`15_ghdb_comprehensive_juicy_files_vault.txt`](15_ghdb_comprehensive_juicy_files_vault.txt) | **8,055** | GHDB — Miscellaneous Software Banners & Juicy Files |


### How to Use With CLI Tools
```bash
# 1. Run GitHub Leaks Search
cat wordlists/dorks/03_github_secrets_and_api_tokens.txt | sed 's/target.com/example.com/g'

# 2. Search Bug Bounty Programs
cat wordlists/dorks/02_bug_bounty_programs_and_vdp.txt

# 3. Top 1% High Impact P1/P2 Exploits
cat wordlists/dorks/01_top_1_percent_elite_vault.txt | sed 's/target.com/example.com/g'
```
