#!/usr/bin/env python3
"""Fix remaining issues in lt/index.html - skipper bio and case issues"""

file_path = r"k:\github\velavida\lt\index.html"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# =============================================
# FIX CASE ISSUES
# =============================================
content = content.replace("iŠ ", "iš ")
content = content.replace("nedingą", "neginčijamas")

# =============================================
# SKIPPER BIO - PARAGRAPH 1
# =============================================
old_bio1 = "This is my debut charter \u2014 and that\u2019s exactly why every detail matters more. After sailing as a co-skipper and learning the ropes hands-on alongside an experienced captain, I\u2019m launching my own voyage. I hold an ICC license, I\u2019ve trained on both monohulls and catamarans, and I\u2019ve spent time studying the Aeolian waters."
new_bio1 = "Tai mano pirmasis čarteris \u2014 ir būtent dėl to kiekviena detalė svarbesnė. Po buriavimo kaip antrasis skiperis ir mokymosi praktiškai šalia patyrusio kapitono, pradėjau savo kelionę. Turiu ICC licenciją, treniravau tiek ant vienkorporių, tiek ant katamaranų, ir skyriau laiką Eolinių vandenims tyrinėti."

if old_bio1 in content:
    content = content.replace(old_bio1, new_bio1)
    print("✅ Skipper bio paragraph 1 translated")
else:
    print("❌ Skipper bio paragraph 1 NOT found")
    # Debug: find what's there
    idx = content.find("This is my debut")
    if idx >= 0:
        print(f"  Found at index {idx}: {repr(content[idx:idx+50])}")
    else:
        print("  'This is my debut' not found either")

# =============================================
# SKIPPER BIO - PARAGRAPH 2
# =============================================
old_bio2 = "What I bring isn\u2019t decades of routine \u2014 it\u2019s fresh energy, meticulous preparation, and a genuine commitment to making this trip extraordinary for every person on board. Your safety is non-negotiable. Your experience is my reputation. Let\u2019s build something memorable together."
new_bio2 = "Tai, ką atnešu, nėra dešimtmečių rutina \u2014 tai šviežia energija, kruopštus pasirengimas ir nuoširdus įsipareigojimas padaryti šią kelionę ypatinga kiekvienam žmogui laive. Jūsų saugumas yra neginčijamas. Jūsų patirtis \u2014 mano reputacija. Sukurkime kažką įsimintino kartu."

if old_bio2 in content:
    content = content.replace(old_bio2, new_bio2)
    print("✅ Skipper bio paragraph 2 translated")
else:
    print("❌ Skipper bio paragraph 2 NOT found")
    idx = content.find("What I bring")
    if idx >= 0:
        print(f"  Found at index {idx}: {repr(content[idx:idx+50])}")

# =============================================
# CHECK FOR ANY REMAINING OBVIOUS ENGLISH
# =============================================
english_checks = [
    "What's Included",
    "Additional Costs",
    "Operating Kitty",
    "Security Deposit",
    "Flights & Transfers",
    "Dinners at",
    "Restaurants",
    "per person",
    "Reserve Now",
    "Prices subject",
    "Photos from previous",
    "Send Request",
    "Message / Request",
    "Dinghy",
    "Bed Linen",
    "Sailing Guidance",
    "Pre-trip Planning",
    "Yacht Charter",
    "Professional Skipper",
    "Final Yacht Cleaning",
]

remaining_english = []
for phrase in english_checks:
    if phrase in content:
        remaining_english.append(phrase)

if remaining_english:
    print(f"\n⚠️  {len(remaining_english)} English phrases still present:")
    for p in remaining_english:
        idx = content.find(p)
        line_num = content[:idx].count("\n") + 1
        print(f"  Line {line_num}: {p}")
else:
    print("\n✅ No obvious English phrases remain!")

with open(file_path, "w", encoding="utf-8", newline="") as f:
    f.write(content)

print("\nDone!")
