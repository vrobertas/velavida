# Deep fix for double-encoded and wrong-case Lithuanian characters
$file = "k:\github\velavida\lt\index.html"
$bytes = [System.IO.File]::ReadAllBytes($file)
$content = [System.Text.Encoding]::UTF8.GetString($bytes)

# The issue: some characters got double-encoded (UTF-8 bytes treated as Latin-1 then re-encoded)
# Pattern: Original UTF-8 bytes (C5 A1 for š) were read as Latin-1 (Å¡) then encoded to UTF-8 again
# This results in: C3 85 C2 A1 instead of C5 A1

# Fix double-encoded patterns by doing string replacements on the decoded content
# Double-encoded š (should be š): Å¡ -> š
$content = $content.Replace("Å¡", "š")
# Double-encoded ž (should be ž): Å¾ -> ž  
$content = $content.Replace("Å¾", "ž")
# Double-encoded ū (should be ū): Å« -> ū
$content = $content.Replace("Å«", "ū")
# Double-encoded ų (should be ų): Å³ -> ų
$content = $content.Replace("Å³", "ų")
# Double-encoded Š (should be Š): Å  -> Š
$content = $content.Replace("Å ", "Š")
# Double-encoded Ž (should be Ž): Å½ -> Ž
$content = $content.Replace("Å½", "Ž")

# Also fix uppercase Ž where it should be lowercase ž
# "uŽ " -> "už " (preposition)
$content = $content.Replace("uŽ ", "už ")
$content = $content.Replace("uŽs", "užs")

# Fix nav "MarŠrutas" -> "Maršrutas" 
$content = $content.Replace("MarŠrutas", "Maršrutas")

# Fix "Join the Adventure" still in English
$content = $content.Replace("Join the Adventure", "Prisijunkite prie Nuotykio")

# Fix "Join 2026" still in English
$content = $content.Replace("Join 2026", "Prisijunk 2026")

# Write back
$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($file, $content, $utf8NoBom)

# Verify
$check = [System.IO.File]::ReadAllText($file, $utf8NoBom)
$lines = $check -split "`r`n"
Write-Host "Line 1980: $($lines[1979].Trim())"
Write-Host "Line 1994: $($lines[1993].Trim())"
Write-Host "Line 2825: $($lines[2824].Trim())"
Write-Host "Line 2828: $($lines[2827].Trim())"
Write-Host "Done!"
