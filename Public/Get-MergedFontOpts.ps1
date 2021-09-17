# Takes assigned options and merges them with the default options from the chosen font.
function Get-MergedFontOpts
{
    param
    (
        [HashTable] $fontOpts,
        [HashTable] $options
    )

    $myOpts = $fontOpts

    if ($(try {$options['horizontalLayout'].GetType()} catch {$false}))
    {
        $params = Get-HorizontalFittingRules $options['horizontalLayout'] $fontOpts

        foreach ($prop in $params)
        {
            $myOpts['fittingRules'][$prop] = $params[$prop]
        }
    }

    if ($(try {$options['verticalLayout'].GetType()} catch {$false}))
    {
        $params = Get-VerticalFittingRules $options['verticalLayout'] $fontOpts

        foreach ($prop in $params)
        {
            $myOpts['fittingRules'][$prop] = $params[$prop]
        }
    }

    #!!!
    $myOpts['printDirection']  = if ($(try {$options['printDirection'].GetType()} catch {$false})) {$options['printDirection']}  else {$fontOpts['printDirection']}
    $myOpts['showHardBlanks']  = if ($options['showHardBlanks'])                                   {$options['showHardBlanks']}  else {$false}
    $myOpts['width']           = if ($options['width'])                                            {$options['width']}           else {-1}
    $myOpts['whitespaceBreak'] = if ($options['whitespaceBreak'])                                  {$options['whitespaceBreak']} else {$false}

    $myOpts
}
