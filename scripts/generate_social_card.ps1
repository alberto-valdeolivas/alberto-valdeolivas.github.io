# Original code-drawn social preview. Uses the locally hosted open-source fonts.
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$siteRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$fontCollection = New-Object System.Drawing.Text.PrivateFontCollection
$fontCollection.AddFontFile((Join-Path $siteRoot 'assets/fonts/instrument-serif-1.ttf'))
$fontCollection.AddFontFile((Join-Path $siteRoot 'assets/fonts/dm-sans-0.ttf'))
$serifFamily = $fontCollection.Families | Where-Object Name -eq 'Instrument Serif'
$sansFamily = $fontCollection.Families | Where-Object Name -like 'DM Sans*'
$bitmap = New-Object System.Drawing.Bitmap 1200,630
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
$graphics.Clear([System.Drawing.ColorTranslator]::FromHtml('#20334d'))
$textBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#e7ecf4'))
$cyanBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#45c7d9'))
$periwinkleBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#a3aef3'))
$blueBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#79a9e8'))
$line = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml('#425e7e')),1
$titleFont = New-Object System.Drawing.Font $serifFamily,76,([System.Drawing.FontStyle]::Regular),([System.Drawing.GraphicsUnit]::Pixel)
$nameFont = New-Object System.Drawing.Font $sansFamily,21,([System.Drawing.FontStyle]::Regular),([System.Drawing.GraphicsUnit]::Pixel)
$smallFont = New-Object System.Drawing.Font $sansFamily,15,([System.Drawing.FontStyle]::Regular),([System.Drawing.GraphicsUnit]::Pixel)
$graphics.DrawString('ALBERTO VALDEOLIVAS',$nameFont,$textBrush,64,52)
$graphics.DrawLine($line,64,101,1136,101)
$graphics.DrawString('Biology is complex.',$titleFont,$textBrush,60,156)
$graphics.DrawString("Let's connect the dots.",$titleFont,$textBrush,60,240)
$roleText = 'Principal & Applied AI Scientist ' + [char]0x00B7 + ' Roche'
$graphics.DrawString($roleText,$nameFont,$cyanBrush,64,383)
$graphics.DrawString('SPATIAL OMICS   /   MACHINE LEARNING   /   NETWORK BIOLOGY',$smallFont,$textBrush,64,438)
$random = New-Object System.Random 73
for ($x = -143; $x -le 143; $x += 12) {
    for ($y = -165; $y -le 165; $y += 12) {
        if (($x*$x/20449 + $y*$y/27225) -gt 1) { continue }
        $px = 960 + $x + $random.Next(-3,4)
        $py = 303 + $y + $random.Next(-3,4)
        $domain = [Math]::Sin($x/45) + [Math]::Cos($y/40)
        $brush = if ($domain -gt 0.5) { $cyanBrush } elseif ($domain -lt -0.5) { $periwinkleBrush } else { $blueBrush }
        $size = $random.Next(4,9)
        $graphics.FillEllipse($brush,$px,$py,$size,$size)
    }
}
$graphics.DrawLine($line,64,536,1136,536)
$graphics.DrawString('alberto-valdeolivas.github.io',$smallFont,$textBrush,64,565)
$graphics.DrawString('BASEL, SWITZERLAND',$smallFont,$textBrush,958,565)
$bitmap.Save((Join-Path $siteRoot 'assets/img/social-card.png'),[System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$bitmap.Dispose()
$titleFont.Dispose()
$nameFont.Dispose()
$smallFont.Dispose()
$textBrush.Dispose()
$cyanBrush.Dispose()
$periwinkleBrush.Dispose()
$blueBrush.Dispose()
$line.Dispose()
$fontCollection.Dispose()
Write-Output 'Generated 1200 x 630 social preview.'
