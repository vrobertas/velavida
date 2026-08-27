# Comprehensive translation for remaining sections of lt/index.html
$file = "k:\github\velavida\lt\index.html"
$enc = [System.Text.Encoding]::UTF8
$content = [System.IO.File]::ReadAllText($file, $enc)

# Helper: Lithuanian chars
$e_dot = [string][char]0x0117    # ė
$a_og = [string][char]0x0105     # ą
$u_og = [string][char]0x0173     # ų
$i_og = [string][char]0x012F     # į
$sh = [string][char]0x0161       # š
$zh = [string][char]0x017E       # ž
$ch = [string][char]0x010D       # č
$e_og = [string][char]0x0119     # ę
$u_macron = [string][char]0x016B # ū
$Sh = [string][char]0x0160       # Š
$Zh = [string][char]0x017D       # Ž
$Ie = [string][char]0x012E       # Į

# =============================================
# NAVIGATION  
# =============================================
$content = $content.Replace('>The Flotilla<', ('>Flotil' + $e_dot + '<'))
# >Jachta< is already done
$content = $content.Replace('>Route<', ('>Mar' + $sh + 'rutas<'))
$content = $content.Replace('>Pricing<', ('>Kaina<'))
$content = $content.Replace('>Moments<', ('>Akimirkos<'))
$content = $content.Replace('>Join 2026<', ('>Prisijunk 2026<'))

# =============================================
# GALLERY SECTION
# =============================================
$content = $content.Replace('>Visual Log<', ('>Vizualinis ' + $Zh + 'urnalas<'))
$content = $content.Replace('>Moments at Sea<', ('>Akimirkos J' + $u_macron + 'roje<'))
$content = $content.Replace('Photos from previous expeditions.', ('Nuotraukos i' + $sh + ' ankstesni' + $u_og + ' ekspedicij' + $u_og + '.'))
# Translate alt text for gallery images
$content = $content.Replace('alt="Crew sailing together on deck during Sicily flotilla adventure"', ('alt="' + $Ie + 'gula kartu buriuoja ant denio Sicilijos flotil' + $e_dot + 's nuotykio metu"'))
$content = $content.Replace('alt="Flotilla crew enjoying sunset drinks aboard sailing yacht"', ('alt="Flotil' + $e_dot + 's ' + $i_og + 'gula m' + $e_dot + 'gaujasi saul' + $e_dot + 'lyd' + $zh + 'io g' + $e_dot + 'rimais ant burin' + $e_dot + 's jachtos"'))
$content = $content.Replace('alt="Crystal clear Mediterranean waters during Aeolian Islands sailing trip"', ('alt="Krištoliškai skaidr' + $u_macron + 's Vidur' + $zh + 'emio j' + $u_macron + 'ros vandenys Eolini' + $u_og + ' sal' + $u_og + ' buriavimo kelion' + $e_dot + 'je"'))
$content = $content.Replace('alt="Golden sunset over sailing yacht anchored near Sicilian coast"', ('alt="Auksinis saul' + $e_dot + 'lydis vir' + $sh + ' burin' + $e_dot + 's jachtos, ' + $i_og + 'sitvirtinusios prie Sicilijos pakrant' + $e_dot + 's"'))
$content = $content.Replace('alt="Morning coffee on deck with Mediterranean Sea view during sailing holiday"', ('alt="Rytin' + $e_dot + ' kava ant denio su Vidur' + $zh + 'emio j' + $u_macron + 'ros vaizdu buriavimo atostog' + $u_og + ' metu"'))

# =============================================
# SKIPPER SECTION
# =============================================
$content = $content.Replace('>Meet Your Captain<', ('>Susipa' + $zh + 'inkite su Kapitonu<'))
$content = $content.Replace('>Your Skipper<', ('>J' + $u_macron + 's' + $u_og + ' Skiperis<'))

# Skipper badge
$content = $content.Replace([char]0x2693 + ' Skipper', [char]0x2693 + ' Skiperis')

# Skipper title
$content = $content.Replace('>Your Skipper &amp; Sailing Enthusiast<', ('>J' + $u_macron + 's' + $u_og + ' Skiperis ir Buriavimo Entuziastas<'))

# Skipper bio paragraph 1
$old = "This is my debut charter " + [char]0x2014 + " and that" + [char]0x2019 + "s exactly why every detail matters more. After sailing as a co-skipper and learning the ropes hands-on alongside an experienced captain, I" + [char]0x2019 + "m launching my own voyage. I hold an ICC license, I" + [char]0x2019 + "ve trained on both monohulls and catamarans, and I" + [char]0x2019 + "ve spent time studying the Aeolian waters."
$new = [string]::Concat("Tai mano pirmasis " + $ch + "arteris ", [char]0x2014, " ir b" + $u_macron + "tent d" + $e_dot + "l to kiekviena detal" + $e_dot, " svarbesn" + $e_dot + ". Po buriavimo kaip antrasis skiperis ir mok", "ymosi praktiškai šalia patyrusio kapitono, prad", $e_dot + "jau sav" + $a_og, " kelion" + $e_og + ". Turiu ICC licencij" + $a_og, ", trenirav", "ausi tiek ant vienkorpori" + $u_og + ", tiek ant katamaran" + $u_og, ", ir skyriau laik" + $a_og + " Eolini" + $u_og + " vandenis tyrin" + $e_dot + "ti.")
$content = $content.Replace($old, $new)

# Skipper bio paragraph 2
$old = "What I bring isn" + [char]0x2019 + "t decades of routine " + [char]0x2014 + " it" + [char]0x2019 + "s fresh energy, meticulous preparation, and a genuine commitment to making this trip extraordinary for every person on board. Your safety is non-negotiable. Your experience is my reputation. Let" + [char]0x2019 + "s build something memorable together."
$new = [string]::Concat("Tai, k" + $a_og + " at", "nešu, n" + $e_dot + "ra dešimtme" + $ch + "i" + $u_og + " rutin", "a ", [char]0x2014, " tai šviežia energija, kruopštus pasirengimas ir nuoširdus ", $i_og, "sipareigojimas padaryti ši" + $a_og + " kelion" + $e_og + " ypatinga kiekvienam žmogui laive. J" + $u_macron + "s" + $u_og + " saugumas yra neding" + $a_og + ". J" + $u_macron + "s" + $u_og + " patirtis ", [char]0x2014, " mano reputacija. Sukurkime kažk" + $a_og + " " + $i_og + "simintino kartu.")
$content = $content.Replace($old, $new)

# Trust indicators
$content = $content.Replace('>ICC Licensed<', ('>ICC Licencija<'))
$content = $content.Replace('>Internationally certified skipper<', ('>Tarptautiniu mastu sertifikuotas skiperis<'))
$content = $content.Replace('>Co-Skipper Trained<', ('>Antrojo Skiperio Patirtis<'))
$content = $content.Replace('>Learned from an experienced captain<', ('>Mok' + $e_dot + 'si i' + $sh + ' patyrusio kapitono<'))
$content = $content.Replace('>Dual Trained<', ('>Dvigubas Apmokymas<'))
$content = $content.Replace('>Monohull & catamaran experience<', ('>Vienkorpor' + $e_dot + 's ir katamarano patirtis<'))
$content = $content.Replace('>Safety Committed<', ('>Saugumo ' + $Ie + 'sipareigojimas<'))
$content = $content.Replace('>Your safety is non-negotiable<', ('>J' + $u_macron + 's' + $u_og + ' saugumas yra neding' + $a_og + '<'))

# =============================================
# PRICING SECTION
# =============================================
$content = $content.Replace('>The Investment<', ('>Investicija<'))
$content = $content.Replace('>Join the Adventure<', ('>Prisijunkite prie Nuotykio<'))

# Pricing subtitle
$old = "Transparent pricing for an unforgettable experience."
$new = "Skaidri kainodara u" + $zh + " nepamirštam" + $a_og + " patirt" + $i_og + "."
$content = $content.Replace($old, $new)
$old = "your spot with a "
$new = "savo viet" + $a_og + " su "
$content = $content.Replace($old, $new)
$old = [char]0x20AC + "200 deposit."
$new = [char]0x20AC + "200 u" + $zh + "statu."
$content = $content.Replace($old, $new)
# The word "Secure" at line start
$content = $content.Replace('>Secure', ('>Rezervuokite'))

# Inclusion card
$content = $content.Replace("What's Included", ("Kas " + $Ie + "traukta"))
$content = $content.Replace('Yacht Charter &', ('Jachtos Nuoma ir'))
$content = $content.Replace('Insurance', 'Draudimas')
$content = $content.Replace('>Professional Skipper<', ('>Profesionalus Skiperis<'))
$content = $content.Replace('Professional Skipper', ('Profesionalus Skiperis'))
$content = $content.Replace('Dinghy &amp; Outboard', ('Dingi ir Pakabinamasis'))
$content = $content.Replace('>Engine<', ('>Variklis<'))
# Handle "Engine" on its own line
$content = $content.Replace("                Engine`r`n", "                Variklis`r`n")
$content = $content.Replace("Final Yacht Cleaning", ("Galutin" + $e_dot + " Jachtos Valymas"))
$content = $content.Replace("Bed Linen & Towels", ("Patalyn" + $e_dot + " ir Rank" + $sh + "luos" + $ch + "iai"))
$content = $content.Replace("Sailing Guidance &", ("Buriavimo Konsultacijos ir"))
$content = $content.Replace("Training", "Mokymai")
$content = $content.Replace("Pre-trip Planning", ("Pasiruošimo Kelionei"))
$content = $content.Replace("Assistance", "Pagalba")

# Pricing card
$content = $content.Replace('>per person<', ('>asmeniui<'))
$content = $content.Replace('>Reserve Now<', ('>Rezervuoti Dabar<'))
$content = $content.Replace("Reserve Now", ("Rezervuoti Dabar"))
$content = $content.Replace("Prices subject to change.", ("Kainos gali keistis."))

# Exclusion card  
$content = $content.Replace("Additional Costs", ("Papildomos I" + $sh + "laidos"))
$content = $content.Replace(">Operating Kitty (~" + [char]0x20AC + "200)<", (">Eksploatacin" + $e_dot + " Kasa (~" + [char]0x20AC + "200)<"))
$content = $content.Replace("Covers fuel, marina fees, and breakfast/lunch provisions.", ("Dengia kur" + $a_og + ", prieplauk" + $u_og + " mokesčius ir pusry" + $ch + "i" + $u_og + "/piet" + $u_og + " atsargas."))
$content = $content.Replace(">Security Deposit (" + [char]0x20AC + "250)<", (">Užstatas (" + [char]0x20AC + "250)<"))
$content = $content.Replace("Fully refundable if no damages occur.", ("Pilnai gr" + $a_og + "žinamas, jei n" + $e_dot + "ra žalos."))
$content = $content.Replace("Flights & Transfers", ("Skrydžiai ir Pervežimai"))
$content = $content.Replace("Dinners at", ("Vakarien" + $e_dot + "s"))
$content = $content.Replace("Restaurants", "Restoranuose")

# =============================================
# JOIN CTA SECTION
# =============================================
$content = $content.Replace(">Secure Your Berth<", (">Rezervuokite Savo Viet" + $a_og + "<"))
$old = "We're looking for open-minded crew members to join our Lagoon 38"
$new = "Ieškome atvir" + $u_og + " žmoni" + $u_og + " prisijungti prie m" + $u_macron + "s" + $u_og + " Lagoon 38"
$content = $content.Replace($old, $new)
$old = "catamaran in the flotilla. No previous sailing experience"
$new = "katamarano flotil" + $e_dot + "je. Ankstesn" + $e_dot + " buriavimo patirtis"
$content = $content.Replace($old, $new)
$old = "needed" + [char]0x2014 + "just a love for the sea."
$new = "neb" + $u_macron + "tina " + [char]0x2014 + " tik meil" + $e_dot + " j" + $u_macron + "rai."
$content = $content.Replace($old, $new)

# Form labels
$content = $content.Replace('>Name<', ('>Vardas<'))
$content = $content.Replace('placeholder="Your Name"', ('placeholder="J' + $u_macron + 's' + $u_og + ' Vardas"'))
$content = $content.Replace('placeholder="your@email.com"', ('placeholder="jusu@email.com"'))
$content = $content.Replace('>Message / Request<', ('>Žinut' + $e_dot + ' / Užklausa<'))
$content = $content.Replace("placeholder=""I'm interested in joining the flotilla...""", ("placeholder=""Noriu prisijungti prie flotil" + $e_dot + "s..."""))
$content = $content.Replace('>Send Request<', ('>Si' + $u_og + 'sti Užklaus' + $a_og + '<'))
$content = $content.Replace("Send Request", ("Si" + $u_og + "sti Užklaus" + $a_og))

# =============================================
# FOOTER
# =============================================
$content = $content.Replace('Vela Vida &bull; Sicily Expedition 2026', ('Vela Vida &bull; Sicilijos Ekspedicija 2026'))
$content = $content.Replace('>Privacy Policy<', ('>Privatumo Politika<'))

# =============================================
# REMAINING YACHT SECTION (stats that weren't caught)  
# =============================================
# "per person" in pricing section
$content = $content.Replace(">per person<", (">asmeniui<"))

[System.IO.File]::WriteAllText($file, $content, (New-Object System.Text.UTF8Encoding $false))
Write-Host "All remaining sections translated successfully!"
