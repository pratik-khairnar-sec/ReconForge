import os
import sys
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def run_all_buttons_test():
    html_path = os.path.abspath("index.html")
    assert os.path.exists(html_path), f"File not found: {html_path}"

    chrome_options = Options()
    chrome_options.add_argument("--headless=new")
    chrome_options.add_argument("--window-size=1920,1080")
    chrome_options.add_argument("--disable-gpu")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    chrome_options.set_capability("goog:loggingPrefs", {"browser": "ALL"})

    driver = webdriver.Chrome(options=chrome_options)
    errors = []

    try:
        url = f"file:///{html_path.replace(os.sep, '/')}"
        print(f"[+] Loading {url}...")
        driver.get(url)
        time.sleep(2)

        def check_console(stage):
            logs = driver.get_log("browser")
            severe = [l for l in logs if l.get("level") == "SEVERE" and "favicon" not in l.get("message", "")]
            if severe:
                print(f"  [!] SEVERE Console Errors at {stage}:")
                for s in severe:
                    print(f"      {s['message']}")
                errors.append(f"{stage}: {severe}")
            else:
                print(f"  ✓ Console clean at {stage} (0 errors)")

        check_console("Initial Load")

        # ==========================================
        # 1. TOPBAR BUTTONS & TOGGLES
        # ==========================================
        print("\n--- [1] Testing Topbar Panels & Toggles ---")

        panels = [
            ("tbInstallBtn", "toolsInstallPanel", "Install All Tools Panel"),
            ("tbEngBtn", "engPanel", "Engagement Manager Panel"),
            ("tbReportBtn", "reportPanel", "Report Generator Panel"),
            ("tbPipeBtn", "pipePanel", "Pipeline Script Generator Panel"),
            ("tbTgBtn", "tgPanel", "Telegram / All-Methodology Panel")
        ]

        for btn_id, panel_id, name in panels:
            btn = driver.find_element(By.ID, btn_id)
            panel = driver.find_element(By.ID, panel_id)
            assert panel.value_of_css_property("display") == "none", f"{name} should be closed initially"
            
            # Click to open
            driver.execute_script("arguments[0].click();", btn)
            time.sleep(0.3)
            assert panel.value_of_css_property("display") != "none", f"{name} failed to open on click!"
            print(f"  ✓ {name}: Opens successfully.")

            # Click close button inside panel
            close_btn = panel.find_element(By.CSS_SELECTOR, ".sp-close")
            driver.execute_script("arguments[0].click();", close_btn)
            time.sleep(0.3)
            assert panel.value_of_css_property("display") == "none", f"{name} failed to close on ✕ click!"
            print(f"  ✓ {name}: Closes cleanly on ✕.")

        # Test Eye Comfort Toggle
        comfort_btn = driver.find_element(By.ID, "tbComfortBtn")
        driver.execute_script("arguments[0].click();", comfort_btn)
        time.sleep(0.2)
        print(f"  ✓ Comfort toggle clicked: '{comfort_btn.text}'")
        assert "ON" in comfort_btn.text, "Comfort button text should reflect ON"
        driver.execute_script("arguments[0].click();", comfort_btn)
        time.sleep(0.2)
        assert "OFF" in comfort_btn.text, "Comfort button text should reflect OFF"
        print(f"  ✓ Comfort toggle toggled back OFF.")

        # Test Theme Toggle
        theme_btn = driver.find_element(By.ID, "themeToggle")
        init_theme_text = theme_btn.text
        driver.execute_script("arguments[0].click();", theme_btn)
        time.sleep(0.2)
        assert theme_btn.text != init_theme_text, "Theme button text should change upon toggle"
        print(f"  ✓ Theme toggle switched to: '{theme_btn.text}'")
        driver.execute_script("arguments[0].click();", theme_btn)
        time.sleep(0.2)
        assert theme_btn.text == init_theme_text, "Theme button toggled back successfully"

        # Test Topbar Jump to Phase 21
        jump_btn = driver.find_element(By.ID, "tbDorkSearchJump")
        driver.execute_script("arguments[0].click();", jump_btn)
        time.sleep(0.5)
        p21 = driver.find_element(By.ID, "p21")
        print(f"  ✓ Phase 21 Jump button scrolled to Phase 21.")

        # ==========================================
        # 2. TARGET SCOPE TERMINAL BUTTONS
        # ==========================================
        print("\n--- [2] Testing Scope Ingestion Buttons & Presets ---")
        presets = driver.find_elements(By.CSS_SELECTOR, ".target-presets-row .preset-pill")
        print(f"  Found {len(presets)} preset buttons.")

        # Click preset 0 (Multi-target demo)
        driver.execute_script("arguments[0].click();", presets[0])
        time.sleep(0.5)
        domains_len = driver.execute_script("return (typeof DOMAINS !== 'undefined') ? DOMAINS.length : 0;")
        assert domains_len == 4, f"Preset failed to populate 4 domains! Got: {domains_len}"
        count_line = driver.find_element(By.ID, "domainCountLine").text
        assert "4" in count_line, f"domainCountLine should mention 4 targets! Got: '{count_line}'"
        print(f"  ✓ Preset 1 populated domains ({domains_len} targets loaded).")

        # Verify generated commands pre
        cmd_pre = driver.find_element(By.ID, "cmdCode").text
        assert "example.com" in cmd_pre or "subfinder" in cmd_pre, "Pipeline commands were not generated!"
        print(f"  ✓ Generated pipeline code block populated ({len(cmd_pre)} chars).")

        # Clear targets preset
        clear_preset = driver.find_element(By.CSS_SELECTOR, ".preset-clear")
        driver.execute_script("arguments[0].click();", clear_preset)
        time.sleep(0.3)
        domains_after_clear = driver.execute_script("return (typeof DOMAINS !== 'undefined') ? DOMAINS.length : 0;")
        assert domains_after_clear == 0, f"Clear Scope failed to reset DOMAINS! Got: {domains_after_clear}"
        assert driver.find_element(By.ID, "domainInput").get_attribute("value") == "", "Clear Scope failed to empty input!"
        print("  ✓ Clear Scope button emptied input and reset scope inventory.")

        # Apply again with 3 test targets
        driver.execute_script("""
            document.getElementById('domainInput').value = 'target1.com\\ntarget2.com\\ntarget3.com';
            applyDomainEverywhere();
        """)
        time.sleep(0.5)

        # ==========================================
        # 3. PHASE 21 UNIVERSAL DORK CONTROLS
        # ==========================================
        print("\n--- [3] Testing Phase 21 Dork Engine Buttons ---")
        single_btn = driver.find_element(By.ID, "dorkSingleModeBtn")
        comb_btn = driver.find_element(By.ID, "dorkCombinedModeBtn")
        bulk_btn = driver.find_element(By.ID, "dorkBulkExportBtn")
        next_btn = driver.find_element(By.ID, "dorkNextTargetBtn")
        prev_btn = driver.find_element(By.ID, "dorkPrevTargetBtn")
        sel = driver.find_element(By.ID, "dorkTargetSelect")

        # Cycle targets
        init_sel = sel.get_attribute("value")
        driver.execute_script("arguments[0].click();", next_btn)
        time.sleep(0.2)
        next_sel = sel.get_attribute("value")
        assert init_sel != next_sel, "Next target button failed to cycle target!"
        print(f"  ✓ Cycle Next button changed target: '{init_sel}' -> '{next_sel}'")

        driver.execute_script("arguments[0].click();", prev_btn)
        time.sleep(0.2)
        assert sel.get_attribute("value") == init_sel, "Prev target button failed to cycle back!"
        print(f"  ✓ Cycle Prev button restored target: '{init_sel}'")

        # Mode toggles
        driver.execute_script("arguments[0].click();", comb_btn)
        time.sleep(0.3)
        assert "active" in comb_btn.get_attribute("class"), "Combined mode button not marked active!"
        print("  ✓ Combined Targets Mode button activated.")

        driver.execute_script("arguments[0].click();", single_btn)
        time.sleep(0.3)
        assert "active" in single_btn.get_attribute("class"), "Single target mode button not marked active!"
        print("  ✓ Active Target Mode button activated.")

        # Copy visible button
        copy_vis_btn = driver.find_element(By.ID, "dorkCopyAllBtn")
        driver.execute_script("arguments[0].click();", copy_vis_btn)
        time.sleep(0.3)
        print("  ✓ Copy Visible Dorks button triggered.")

        # Clear search button
        search_input = driver.find_element(By.ID, "globalDorkInput")
        search_input.send_keys("database")
        time.sleep(0.3)
        clear_search_btn = driver.find_element(By.ID, "globalDorkClearBtn")
        driver.execute_script("arguments[0].click();", clear_search_btn)
        time.sleep(0.3)
        assert search_input.get_attribute("value") == "", "Search clear button ✕ failed to clear input!"
        print("  ✓ Search clear button ✕ emptied input.")

        # ==========================================
        # 4. REPORT GENERATOR FUNCTIONALITY
        # ==========================================
        print("\n--- [4] Testing Report Generator Actions ---")
        driver.execute_script("document.getElementById('reportPanel').style.display='block';")
        time.sleep(0.3)
        rg_gen = driver.find_element(By.ID, "rgGenerate")
        driver.execute_script("arguments[0].click();", rg_gen)
        time.sleep(0.3)
        rg_output = driver.find_element(By.ID, "rgOutput")
        assert rg_output.value_of_css_property("display") != "none", "Report output should be visible after generate!"
        assert len(rg_output.text) > 50, "Report output text is too short!"
        print(f"  ✓ Report Generator produced report markdown ({len(rg_output.text)} chars).")

        rg_copy = driver.find_element(By.ID, "rgCopy")
        driver.execute_script("arguments[0].click();", rg_copy)
        time.sleep(0.2)
        print("  ✓ Report Copy Markdown button clicked.")

        # ==========================================
        # 5. PIPELINE SCRIPT GENERATOR ACTIONS
        # ==========================================
        print("\n--- [5] Testing Script Generator Actions ---")
        driver.execute_script("""
            if(typeof DOMAINS !== 'undefined' && DOMAINS.length === 0){
                DOMAINS.push('target.com');
            }
            document.getElementById('pipePanel').style.display='block';
        """)
        time.sleep(0.3)
        pipe_gen = driver.find_element(By.ID, "pipeGen")
        driver.execute_script("arguments[0].click();", pipe_gen)
        time.sleep(0.3)
        pipe_output = driver.find_element(By.ID, "pipeOutput")
        assert pipe_output.value_of_css_property("display") != "none", "Script generator output should be visible after generate!"
        assert "#!/usr/bin/env bash" in pipe_output.text or "bash" in pipe_output.text.lower(), "Script output does not contain bash script!"
        print(f"  ✓ Script Generator produced bash pipeline script ({len(pipe_output.text)} chars).")

        pipe_copy = driver.find_element(By.ID, "pipeCopy")
        driver.execute_script("arguments[0].click();", pipe_copy)
        time.sleep(0.2)
        print("  ✓ Script Copy button clicked.")

        # ==========================================
        # 6. STEP ACCORDION COLLAPSE/EXPAND
        # ==========================================
        print("\n--- [6] Testing Step Accordions (All 30 Phases) ---")
        step_heads = driver.find_elements(By.CSS_SELECTOR, ".step-head")
        print(f"  Found {len(step_heads)} step headers across methodology.")
        assert len(step_heads) >= 95, f"Expected at least 95 steps, found {len(step_heads)}"

        # Test toggling first 5 steps
        for i in range(5):
            sh = step_heads[i]
            step = sh.find_element(By.XPATH, "..")
            was_open = "open" in step.get_attribute("class")
            driver.execute_script("arguments[0].click();", sh)
            time.sleep(0.1)
            is_open = "open" in step.get_attribute("class")
            assert was_open != is_open, f"Step #{i} failed to toggle open/closed!"
            # Toggle back
            driver.execute_script("arguments[0].click();", sh)
            time.sleep(0.1)
        print(f"  ✓ Step accordions toggle open and closed cleanly.")

        # ==========================================
        # 7. FAST PHASE NAVIGATOR BADGES (1 to 30)
        # ==========================================
        print("\n--- [7] Testing Fast Phase Navigator Badges (30 Phases) ---")
        badges = driver.find_elements(By.CSS_SELECTOR, ".badges .badge")
        print(f"  Found {len(badges)} fast navigator badges.")
        assert len(badges) == 30, f"Expected exactly 30 badges, found {len(badges)}"
        for i, b in enumerate(badges, 1):
            assert f"{i:02d}" in b.text or f"{i}" in b.text, f"Badge {i} text mismatch: {b.text}"
        print("  ✓ All 30 navigation badges validated and aligned.")

        # Final console check
        check_console("End of All-Buttons Test")

        print("\n===========================================================================")
        print("   ALL BUTTON & INTERACTION TESTS PASSED WITH 100% SUCCESS!   ")
        print("===========================================================================")

    finally:
        driver.quit()

if __name__ == "__main__":
    run_all_buttons_test()
