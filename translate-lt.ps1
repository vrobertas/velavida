# Translation script for lt/index.html - Batch 2
# Uses .NET for proper UTF-8 handling
$file = "k:\github\velavida\lt\index.html"
$enc = [System.Text.Encoding]::UTF8
$content = [System.IO.File]::ReadAllText($file, $enc)

# Fix escaped unicode from previous edit
$content = $content.Replace('\u0117', [char]0x0117)
$content = $content.Replace('\u012e', [char]0x012e)
$content = $content.Replace('\u0105', [char]0x0105)
$content = $content.Replace('\u0119', [char]0x0119)
$content = $content.Replace('\u0173', [char]0x0173)
$content = $content.Replace('\u201e', [char]0x201e)
$content = $content.Replace('\u017e', [char]0x017e)
$content = $content.Replace('\u0161', [char]0x0161)
$content = $content.Replace('\u201c', [char]0x201c)
$content = $content.Replace('\u012f', [char]0x012f)

# Yacht section
$content = $content.Replace('>The Yacht<', '>Jachta<')
$content = $content.Replace('>Exterior<', ('>I' + [char]0x0161 + 'or' + [char]0x0117 + '<'))
$content = $content.Replace('Interior Comfort', 'Vidaus Komfortas')

# Stats
$content = $content.Replace('>Length<', '>Ilgis<')
# Can't just replace "Length" or "Berths" as they might be in class names
$old = "                  Length"
$new = "                  Ilgis"
$content = $content.Replace($old, $new)
$old = "                  Berths"
$new = "                  Vietos"
$content = $content.Replace($old, $new)

# Yacht heading
$content = $content.Replace('Award-Winning <br /><span class="italic text-slate-400"', ('Apdovanojimus Laim' + [char]0x0117 + 'j' + [char]0x0119 + 's <br /><span class="italic text-slate-400"'))

# Yacht description
$old = 'Sail aboard the <strong>Lagoon 38</strong>, a legend in the charter'
$new = 'Buriuokite ant <strong>Lagoon 38</strong>, legendos ' + [char]0x010D + 'arterio'
$content = $content.Replace($old, $new)
$old = "world and winner of multiple cruising awards. This isn" + [char]0x2019 + "t just a"
$new = "pasaulyje ir daugyb" + [char]0x0117 + "s kruizini" + [char]0x0173 + " apdovanojim" + [char]0x0173 + " laim" + [char]0x0117 + "tojo. Tai ne tik"
$content = $content.Replace($old, $new)
$old = "boat" + [char]0x2014 + "it" + [char]0x2019 + "s a floating villa with 360" + [char]0x00B0 + " sea views, offering stability"
$new = "valtis " + [char]0x2014 + " tai plaukiojanti vila su 360" + [char]0x00B0 + " j" + [char]0x016B + "ros vaizdais, si" + [char]0x016B + "lanti stabilum" + [char]0x0105
$content = $content.Replace($old, $new)
$old = "and space that monohulls simply can" + [char]0x2019 + "t match."
$new = "ir erdv" + [char]0x0119 + ", kurios vienkorpor" + [char]0x0117 + "s jachtos tiesiog negali pasi" + [char]0x016B + "lyti."
$content = $content.Replace($old, $new)

# Yacht features
$content = $content.Replace('Unmatched Stability', 'Neprilygstamas Stabilumas')
$old = "No heeling over while sailing. Perfect for beginners and those"
$new = "Jokio pasvirimo plaukiant. Puikiai tinka pradedantiesiems ir tiems,"
$content = $content.Replace($old, $new)
$old = "who want to relax with a drink in hand while underway."
$new = "kurie nori atsipalaiduoti su g" + [char]0x0117 + "rimu rankoje kelion" + [char]0x0117 + "s metu."
$content = $content.Replace($old, $new)

$content = $content.Replace('>Living Space<', ('>Gyvenamoji Erdv' + [char]0x0117 + '<'))
$old = '4 private double cabins and spacious common areas. The "In &'
$new = '4 priva' + [char]0x010D + 'ios dviviet' + [char]0x0117 + 's kajut' + [char]0x0117 + 's ir erdvios bendros zonos. ' + [char]0x201E + 'In &'
$content = $content.Replace($old, $new)
$old = 'Out" design connects the saloon and cockpit into one massive'
$new = 'Out' + [char]0x201C + ' dizainas sujungia salon' + [char]0x0105 + ' ir kokpit' + [char]0x0105 + ' ' + [char]0x012F + ' vien' + [char]0x0105 + ' did' + [char]0x017E + 'iul' + [char]0x0119
$content = $content.Replace($old, $new)
$old = "living deck."
$new = "gyvenam" + [char]0x0105 + "j" + [char]0x012F + " den" + [char]0x012F + "."
$content = $content.Replace($old, $new)

$content = $content.Replace('>Eco-Conscious<', ('>Ekologi' + [char]0x0161 + 'kas<'))
$old = "Featuring modern construction with eco-friendly materials and"
$new = [char]0x0160 + "iuolaikin" + [char]0x0117 + " konstrukcija su ekologi" + [char]0x0161 + "komis med" + [char]0x017E + "iagomis ir"
$content = $content.Replace($old, $new)
$old = "efficient cruising performance."
$new = "efektyviais kruiziniais parametrais."
$content = $content.Replace($old, $new)

$content = $content.Replace('See Availability', ([char]0x017D + 'i' + [char]0x016B + 'r' + [char]0x0117 + 'ti Prieinamum' + [char]0x0105))

# Route section
$content = $content.Replace('>The Itinerary<', ('>Mar' + [char]0x0161 + 'rutas<'))
$content = $content.Replace('>The Aeolian Route<', ('>Eolini' + [char]0x0173 + ' Sal' + [char]0x0173 + ' Mar' + [char]0x0161 + 'rutas<'))
$content = $content.Replace('Flexible route subject to weather.', ('Lankstus mar' + [char]0x0161 + 'rutas, priklausantis nuo oro.'))
$content = $content.Replace('Start/End:', ('Prad' + [char]0x017E + 'ia/Pabaiga:'))

# Route stops
$content = $content.Replace('>Palermo Start<', '>Palermo Prad' + [char]0x017E + 'ia<')
$old = "Your first taste of the magical island. Excitement builds as we"
$new = "Pirmasis stebuklingos salos paragavimas. Jaudulys auga, kai"
$content = $content.Replace($old, $new)
$old = "gather in this historic capital. Provisioning, meeting the crew,"
$new = "susiburiame " + [char]0x0161 + "ioje istorin" + [char]0x0117 + "je sostin" + [char]0x0117 + "je. Apsipirkimas, susipa" + [char]0x017E + "inimas su " + [char]0x012F + "gula"
$content = $content.Replace($old, $new)
$old = "and the first Italian dinner together before setting sail."
$new = "ir pirmoji itali" + [char]0x0161 + "ka vakarien" + [char]0x0117 + " kartu prie" + [char]0x0161 + " i" + [char]0x0161 + "plaukiant."
$content = $content.Replace($old, $new)

# Vulcano
$old = "Where the land breathes! Explore famous mud baths and hot"
$new = "Kur " + [char]0x017E + "em" + [char]0x0117 + " kv" + [char]0x0117 + "puoja! Tyrin" + [char]0x0117 + "kite garsias purvo vonias ir kar" + [char]0x0161 + "tuosius"
$content = $content.Replace($old, $new)
$old = "springs. Adventure seekers can hike the smoking crater for"
$new = [char]0x0161 + "altinius. Nuotyki" + [char]0x0173 + " ie" + [char]0x0161 + "kotojai gali kopti " + [char]0x012F + " r" + [char]0x016B + "kstant" + [char]0x012F + " krater" + [char]0x012F + " d" + [char]0x0117 + "l"
$content = $content.Replace($old, $new)
$old = "breathless views. Feel the volcanic warmth beneath your feet."
$new = "kvap" + [char]0x0105 + " gniau" + [char]0x017E + "ian" + [char]0x010D + "i" + [char]0x0173 + " vaizd" + [char]0x0173 + ". Pajuskite vulkanin" + [char]0x0119 + " " + [char]0x0161 + "ilum" + [char]0x0105 + " po kojomis."
$content = $content.Replace($old, $new)

# Panarea
$old = "The picture-perfect island for your Instagram. Stroll narrow"
$new = "Tobula sala j" + [char]0x016B + "s" + [char]0x0173 + " Instagram nuotraukoms. Pasivaikš" + [char]0x010D + "iokite siauromis"
$content = $content.Replace($old, $new)
$old = "streets, discover hidden cafes and boutique shops. As the sun"
$new = "gatv" + [char]0x0117 + "mis, atraskite pasl" + [char]0x0117 + "ptas kavines ir butikus. Saulei"
$content = $content.Replace($old, $new)
$old = "dips, join the lively atmosphere at local trattorias. Where"
$new = "leid" + [char]0x017E + "iantis, prisijunkite prie gyvos atmosferos vietin" + [char]0x0117 + "se tratorijose."
$content = $content.Replace($old, $new)
$old = "relaxation meets chic."
$new = "Kur poilsis susitinka su elegancija."
$content = $content.Replace($old, $new)

# Stromboli
$old = "A fiery masterpiece. Witness volcanic eruptions lighting up the"
$new = "Ugningas " + [char]0x0161 + "edevras. Steb" + [char]0x0117 + "kite vulkano i" + [char]0x0161 + "siver" + [char]0x017E + "imus, ap" + [char]0x0161 + "vie" + [char]0x010D + "ian" + [char]0x010D + "ius"
$content = $content.Replace($old, $new)
$old = "night sky. Dine on unique black sand beaches under the stars and"
$new = "naktin" + [char]0x012F + " dang" + [char]0x0173 + ". Vakarieniaukite ant unikali" + [char]0x0173 + " juodo sm" + [char]0x0117 + "lio paplūdimi" + [char]0x0173 + " po " + [char]0x017E + "vaig" + [char]0x017E + "d" + [char]0x0117 + "mis"
$content = $content.Replace($old, $new)
$old = "feel the raw power of nature."
$new = "ir pajuskite neapdorot" + [char]0x0105 + " gamtos gali" + [char]0x0105 + "."
$content = $content.Replace($old, $new)

# Salina
$old = "The green jewel of the archipelago. Lush landscapes, endless"
$new = [char]0x017D + "aliasis archipelago brangakmenis. Ve" + [char]0x0161 + "l" + [char]0x016B + "s kra" + [char]0x0161 + "tovaizd" + [char]0x017E + "iai, nesibaigiančios"
$content = $content.Replace($old, $new)
$old = "vineyards, and the famous Malvasia wine. Explore quiet old"
$new = "vynuogynai ir garsus Malvasia vynas. Tyrin" + [char]0x0117 + "kite ramius senus"
$content = $content.Replace($old, $new)
$old = "villages and enjoy the authentic Mediterranean summer vibe."
$new = "kaimelius ir m" + [char]0x0117 + "gauk" + [char]0x012F + "t" + [char]0x0117 + "s autenti" + [char]0x0161 + "ka Vidur" + [char]0x017E + "emio j" + [char]0x016B + "ros vasaros atmosfera."
$content = $content.Replace($old, $new)

# Lipari
$old = "The heart of the islands. Wander through historical sites, visit"
$new = "Sal" + [char]0x0173 + " " + [char]0x0161 + "irdis. Klajokite po istorines vietas, aplankykite"
$content = $content.Replace($old, $new)
$old = "the imposing castle, and explore vibrant markets. End the trip"
$new = "diding" + [char]0x0105 + " pil" + [char]0x012F + " ir tyrin" + [char]0x0117 + "kite gyv" + [char]0x0105 + "sias turgavietes. U" + [char]0x017E + "baikite kelion" + [char]0x0119
$content = $content.Replace($old, $new)
$old = "with a stunning sunset view from the harbor."
$new = "su nuostabiu saul" + [char]0x0117 + "lyd" + [char]0x017E + "io vaizdu i" + [char]0x0161 + " uosto."
$content = $content.Replace($old, $new)

[System.IO.File]::WriteAllText($file, $content, (New-Object System.Text.UTF8Encoding $false))
Write-Host "Yacht + Route translation complete"
