#!/usr/bin/env python3
"""Fix encoding issues and complete remaining translations in lt/index.html"""

import re

file_path = r"k:\github\velavida\lt\index.html"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# =============================================
# FIX DOUBLE-ENCODED CHARACTERS
# =============================================
# When UTF-8 bytes are read as Latin-1 then re-encoded to UTF-8,
# we get sequences like Å¡ for š, Å¾ for ž, etc.
double_encode_map = {
    "Å¡": "š",   # š
    "Å¾": "ž",   # ž  
    "Å«": "ū",   # ū
    "Å³": "ų",   # ų
    "Å ": "Š",   # Š
    "Å½": "Ž",   # Ž
    "Ä—": "ė",   # ė
    "Ä…": "ą",   # ą
    "Ä¯": "į",   # į
    "Ä™": "ę",   # ę
    "ÄŒ": "Č",   # Č
    "Ä\u008d": "č",  # č
}

for bad, good in double_encode_map.items():
    if bad in content:
        print(f"Fixing double-encoded: {repr(bad)} -> {good}")
        content = content.replace(bad, good)

# =============================================
# FIX CASE ISSUES
# =============================================
# "MarŠrutas" -> "Maršrutas"
content = content.replace("MarŠrutas", "Maršrutas")
# "uŽ " -> "už " (preposition)
content = content.replace("uŽ ", "už ")
content = content.replace("uŽs", "užs")

# =============================================
# FIX REMAINING ENGLISH TEXT
# =============================================
# "Join the Adventure" -> Lithuanian
content = content.replace("Join the Adventure", "Prisijunkite prie Nuotykio")
# "Join 2026" -> Lithuanian  
content = content.replace("Join 2026", "Prisijunk 2026")

# =============================================
# VERIFY PROBLEMATIC AREAS
# =============================================
lines = content.split("\n")
for i, line in enumerate([lines[1979], lines[1993], lines[2824], lines[2827]], start=1):
    print(f"Check {i}: {line.strip()[:80]}")

with open(file_path, "w", encoding="utf-8", newline="") as f:
    f.write(content)

print("\nAll fixes applied successfully!")
