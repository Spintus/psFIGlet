function New-Text
{
    param
    (
        [string]      $txt,
        [HashTable]   $options,
        [ScriptBlock] $next
    )

    $fontName = ''

    # Validate inputs
    $txt = $txt + ''

    if (
        $(
            try
            {
                $options.GetType() -eq [scriptblock]
            }
            catch
            {
                $false
            }
        )
    )
    {
        $next            = $options
        $options         = @{}
        $options['font'] = $figDefaults['font']
    }

    if ($(try {$options.GetType() -eq [string]} catch {$false}))
    {
        $next    = $options
        $options = @{}
    }
    else
    {
        $options  = if ($options)         {$options}         else {@{}}
        $fontName = if ($options['font']) {$options['font']} else {$figDefaults['font']}
    }

    Get-Font $fontName {
        param
        (
            $err,
            $fontOpts
        )

        if ($err)
        {
            .$next $err
        }

        $options = Get-Variable -Name options -ValueOnly
        $txt     = Get-Variable -Name txt -ValueOnly

        New-GeneratedText $fontName $(Get-MergedFontOpts $fontOpts $options) $txt
    }
}
