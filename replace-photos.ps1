Add-Type -AssemblyName System.Drawing
$src=@{ mechanic=(Join-Path (Get-Location) 'images\gallery\source-mechanic.jpg');under=(Join-Path (Get-Location) 'images\gallery\source-underbody.jpg');tires=(Join-Path (Get-Location) 'images\gallery\source-tires.jpg');shop=(Join-Path (Get-Location) 'images\gallery\source-tire-shop.jpg');car=(Join-Path (Get-Location) 'images\gallery\try.jpg') }
function Save-Crop($source,$dest,$w,$h){$im=[Drawing.Image]::FromFile($source);$ratio=[Math]::Max($w/$im.Width,$h/$im.Height);$cw=[int]($w/$ratio);$ch=[int]($h/$ratio);$cx=[int](($im.Width-$cw)/2);$cy=[int](($im.Height-$ch)/2);$bmp=[Drawing.Bitmap]::new($w,$h);$g=[Drawing.Graphics]::FromImage($bmp);$g.InterpolationMode=[Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic;$g.SmoothingMode=[Drawing.Drawing2D.SmoothingMode]::HighQuality;$g.DrawImage($im,[Drawing.Rectangle]::new(0,0,$w,$h),$cx,$cy,$cw,$ch,[Drawing.GraphicsUnit]::Pixel);$enc=[Drawing.Imaging.ImageCodecInfo]::GetImageEncoders()|Where-Object{$_.MimeType -eq 'image/jpeg'};$ep=[Drawing.Imaging.EncoderParameters]::new(1);$ep.Param[0]=[Drawing.Imaging.EncoderParameter]::new([Drawing.Imaging.Encoder]::Quality,[long]78);$bmp.Save($dest,$enc,$ep);$ep.Dispose();$g.Dispose();$bmp.Dispose();$im.Dispose()}
# Website hero photos
Save-Crop $src.mechanic (Join-Path (Get-Location) 'images\hero\hero.jpg') 1920 1080
Save-Crop $src.mechanic (Join-Path (Get-Location) 'images\hero\hero-mobile.jpg') 800 1000
Save-Crop $src.car (Join-Path (Get-Location) 'images\placeholder.jpg') 800 600
# Service and thumbnail photo map
$service=@{ 'engine-diagnostics'='mechanic';'brake-service'='under';'oil-change'='mechanic';'transmission'='under';'ac-heating'='mechanic';'suspension-alignment'='under';'tires-wheels'='tires';'battery-electrical'='mechanic';'check-engine'='mechanic';'ev-hybrid'='car';'scheduled-maintenance'='mechanic';'pre-purchase-inspection'='car' }
foreach($name in $service.Keys){$key=$service[$name];Save-Crop $src[$key] (Join-Path (Get-Location) "images\services\$name.jpg") 800 600;Save-Crop $src[$key] (Join-Path (Get-Location) "images\thumbnails\$name.jpg") 160 160}
# Feature photos and thumbnails
$features=@{'free-inspection'='mechanic';'shuttle'='car';'same-day'='under';'transparent-pricing'='shop';'financing'='car';'fleet'='shop'}
foreach($name in $features.Keys){$key=$features[$name];Save-Crop $src[$key] (Join-Path (Get-Location) "images\features\$name.jpg") 640 480;Save-Crop $src[$key] (Join-Path (Get-Location) "images\thumbnails\$name.jpg") 160 160}
# Gallery and before/after photos
$gal=@('mechanic','under','shop','tires','car','mechanic','under','shop');for($i=1;$i -le 8;$i++){Save-Crop $src[$gal[$i-1]] (Join-Path (Get-Location) "images\gallery\gallery-$i.jpg") 1200 900}
Save-Crop $src.under (Join-Path (Get-Location) 'images\gallery\before-1.jpg') 1200 600;Save-Crop $src.mechanic (Join-Path (Get-Location) 'images\gallery\after-1.jpg') 1200 600
# Other visible identity and photo paths
Save-Crop $src.car (Join-Path (Get-Location) 'images\logo\logo.jpg') 256 256
Save-Crop $src.mechanic (Join-Path (Get-Location) 'images\team\team-1.jpg') 800 800
Save-Crop $src.mechanic (Join-Path (Get-Location) 'images\reviews\avatar-1.jpg') 200 200;Save-Crop $src.under (Join-Path (Get-Location) 'images\reviews\avatar-2.jpg') 200 200;Save-Crop $src.shop (Join-Path (Get-Location) 'images\reviews\avatar-3.jpg') 200 200
# Badges are illustrative workshop photos, not certification artwork.
Save-Crop $src.tires (Join-Path (Get-Location) 'images\badges\smog-check.jpg') 400 300;Save-Crop $src.shop (Join-Path (Get-Location) 'images\badges\bar-registered.jpg') 400 300;Save-Crop $src.under (Join-Path (Get-Location) 'images\badges\ase-certified.jpg') 400 300;Save-Crop $src.car (Join-Path (Get-Location) 'images\badges\warranty.jpg') 400 300
