function Get-Defaults
{
    param
    (
        [HashTable] $opts
    )

    if ($(try {$opts -and $opts.GetType() -eq [System.Object]} catch {$false}))
    {
        foreach ($prop in $opts)
        {
            if ($opts.PSobject.Properties.name -match $prop)
            {
                $figDefaults[$prop] = $opts[$prop]
            }
        }
    }

    $figDefaults #!!!
}
