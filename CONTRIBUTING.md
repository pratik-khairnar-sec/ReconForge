# 🤝 Contributing to ReconForge v3

Thank you for your interest in contributing to **ReconForge v3** — the client-side bug bounty & VAPT reconnaissance engine! We welcome community contributions from offensive security researchers, penetration testers, and OSINT specialists worldwide.

---

## 🎯 Contribution Areas
You can contribute in several key areas:
1. **New Dorks & Queries:** Add high-impact Google Dorks, GitHub Secret Regexes, or Shodan IoT queries.
2. **Methodology Phases:** Refine or extend the 33 master phases with new offensive tooling and edge-case attack vectors.
3. **Payload Additions:** Submit verified, high-yield payloads for SQLi, XSS, SSRF, SSTI, or CORS misconfigurations.
4. **Ergonomic UI & Performance:** Suggest performance tweaks for instant search indexing and eye comfort ergonomics.

---

## 🛠️ Step-by-Step Contribution Workflow

1. **Fork the Repository:**
   Visit [github.com/pratik-khairnar-sec/ReconForge](https://github.com/pratik-khairnar-sec/ReconForge) and click **Fork**.

2. **Clone your Fork:**
   ```bash
   git clone https://github.com/<your-username>/ReconForge.git
   cd ReconForge
   ```

3. **Create a Feature Branch:**
   ```bash
   git checkout -b feature/add-new-dorks
   ```

4. **Make Your Changes & Test:**
   - Keep the architecture **100% client-side & offline** inside `index.html`.
   - Maintain the **Steel Slate & Cyber Ice-Blue anti-glare theme** (zero bright/flickering neon).
   - Zero telemetry: no third-party logging, external CDNs, or tracking scripts.

5. **Commit with Clear Message:**
   ```bash
   git commit -m "feat(dorks): add fresh secret regex dorks"
   ```

6. **Push and Open a Pull Request:**
   ```bash
   git push origin feature/add-new-dorks
   ```
   Open a Pull Request on the `main` branch with a clear description and screenshot if UI changes were made.

---

## ⚖️ Ethical Guidelines
- All tools, pipelines, and dorks must be intended strictly for **authorized security testing and bug bounty programs**.
- Do not submit destructive or weaponized zero-day exploits.

Thank you for helping make reconnaissance faster and safer for the security community! 🛡️
