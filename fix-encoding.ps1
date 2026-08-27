# Fix encoding issues and case problems in lt/index.html
$file = "k:\github\velavida\lt\index.html"

# Read as raw bytes, detect encoding
$bytes = [System.IO.File]::ReadAllBytes($file)
$content = [System.Text.Encoding]::UTF8.GetString($bytes)

# Fix case issue: MarŠrutas -> Maršrutas
$content = $content.Replace('MarŠrutas', 'Maršrutas')

# Fix "Join 2026" that wasn't translated
$content = $content.Replace('Join 2026', 'Prisijunk 2026')

# Fix "Join the Adventure" that wasn't replaced
$content = $content.Replace('Join the Adventure', 'Prisijunkite prie Nuotykio')

# Check for garbled characters (Mojibake) and fix them
# Ž should be ž in lowercase contexts
$content = $content.Replace('uŽ ', 'už ')
$content = $content.Replace('uŽs', 'užs')

# Fix any Å¡ (garbled š)
$content = $content.Replace([char]0x00C5 + [string][char]0x00A1, 'š')

# Fix any Ä (garbled č) 
# Ä followed by specific bytes for č
$content = $content.Replace([char]0x00C4 + [string][char]0x008D, 'č')

# Fix Ä— (garbled ė) 
$content = $content.Replace([char]0x00C4 + [string][char]0x0097, 'ė')

# Fix Ä¯ (garbled į)
$content = $content.Replace([char]0x00C4 + [string][char]0x00AF, 'į')

# Fix Å¾ (garbled ž)
$content = $content.Replace([char]0x00C5 + [string][char]0x00BE, 'ž')

# Fix Å« (garbled ū)
$content = $content.Replace([char]0x00C5 + [string][char]0x00AB, 'ū')

# Fix Ä™ (garbled ę)
$content = $content.Replace([char]0x00C4 + [string][char]0x0099, 'ę')

# Fix Ä… (garbled ą)
$content = $content.Replace([char]0x00C4 + [string][char]0x0085, 'ą')

# Fix Å³ (garbled ų)
$content = $content.Replace([char]0x00C5 + [string][char]0x00B3, 'ų')

# Write back as UTF-8 without BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($file, $content, $utf8NoBom)

Write-Host "Encoding fixes applied"

# Verification
$check = [System.IO.File]::ReadAllText($file, $utf8NoBom)
$line2828 = ($check -split "`r`n")[2827]
Write-Host "Line 2828: $line2828"
$line1980 = ($check -split "`r`n")[1979]
Write-Host "Line 1980: $line1980"
