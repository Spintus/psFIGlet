#!!! THIS METHOD IS NOT IMPLEMENTED ACCORDING TO SPEC!
function Get-Font
{
    param
    (
        [string]      $fontName,
        [ScriptBlock] $next
    )

    if ($figFonts[$fontName])
    {
        .$next $null $figFonts[$fontname]['options']
        return
    }

    $font = try
    {
        Resolve-Path ".\$fontName.flf" | Get-Content -Raw
    }
    catch
    {
        try
        {
            Resolve-Path "$moduleRoot\fonts\$fontName.flf" | Get-Content -Raw
        }
        catch
        {
            Write-Error 'Could not find path to font file'
        }
    }

    if ($next)
    {
        .$next $null $(Get-ParsedFont $fontName $font)
    }
    else
    {
        Get-ParsedFont $fontName $font
    }
}
