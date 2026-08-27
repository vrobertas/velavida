# Fix escaped unicode from feature card 1
$file = "k:\github\velavida\lt\index.html"
$enc = [System.Text.Encoding]::UTF8
$content = [System.IO.File]::ReadAllText($file, $enc)

# Fix literal \uXXXX sequences - use string.Replace not char
$content = $content.Replace("\u0117", [string][char]0x0117)
$content = $content.Replace("\u012e", [string][char]0x012e)
$content = $content.Replace("\u0105", [string][char]0x0105)
$content = $content.Replace("\u0119", [string][char]0x0119)
$content = $content.Replace("\u0173", [string][char]0x0173)
$content = $content.Replace("\u201e", [string][char]0x201e)
$content = $content.Replace("\u017e", [string][char]0x017e)
$content = $content.Replace("\u0161", [string][char]0x0161)
$content = $content.Replace("\u201c", [string][char]0x201c)
$content = $content.Replace("\u012f", [string][char]0x012f)
$content = $content.Replace("\u017d", [string][char]0x017d)
$content = $content.Replace("\u016b", [string][char]0x016b)

[System.IO.File]::WriteAllText($file, $content, (New-Object System.Text.UTF8Encoding $false))
Write-Host "Unicode escapes fixed"
