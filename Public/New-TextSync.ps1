function New-TextSync
{
    param
    (
        [string]    $txt,
        [HashTable] $options
    )

    $fontName = ''

    # Validate inputs
    $txt = $txt + ''

    if ($(try {$options.GetType() -eq [string]} catch {$false}))
    {
        $fontName = $options
        $options  = @{}
    }
    else
    {
        $options  = if ($options)         {$options}         else {@{}}
        $fontName = if ($options['font']) {$options['font']} else {$figDefaults['font']}
    }

    $fontOpts = Get-MergedFontOpts $(Get-FontSync $fontName) $options
    New-GeneratedText $fontName $fontOpts $txt
}
