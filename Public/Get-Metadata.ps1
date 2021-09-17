function Get-Metadata
{
    param
    (
        [string]      $fontName,
        [ScriptBlock] $next
    )

    $fontName = $fontName + ''

    Get-LoadedFont $fontName { #!!! NOT IMPLEMENTED!
        param
        (
            $err,
            $fontOpts
        )

        if ($err)
        {
            .$next $err
            return
        }

        .$next $null $fontOpts $figFonts[$fontName]['comment']
    }
}
