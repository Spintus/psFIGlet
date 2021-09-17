# This function takes layout data from font header and returns layout info.
function Get-SmushingRules
{
    param
    (
        [int] $oldLayout,
        [int] $newLayout
    )

    $rules = @{}
    $code = $null
    $codes = @(
        , @(16384, 'vLayout', $SMUSHING)
        , @(8192,  'vLayout', $FITTING)
        , @(4096,  'vRule5',  $true)
        , @(2048,  'vRule4',  $true)
        , @(1024,  'vRule3',  $true)
        , @(512,   'vRule2',  $true)
        , @(256,   'vRule1',  $true)
        , @(128,   'hLayout', $SMUSHING)
        , @(64,    'hLayout', $FITTING)
        , @(32,    'hRule6',  $true)
        , @(16,    'hRule5',  $true)
        , @(8,     'hRule4',  $true)
        , @(4,     'hRule3',  $true)
        , @(2,     'hRule2',  $true)
        , @(1,     'hRule1',  $true)
    )

    $val = if ($newLayout) {$newLayout} else {$oldLayout}
    $i = 0
    while ($i -lt $codes.Length)
    {
        $code = $codes[$i]
        if ($val -ge $code[0])
        {
            $val = $val - $code[0]
            $rules[$code[1]] = if ($(try{$rules[$code[1]].GetType()}catch{$false}))
            {
                $rules[$code[1]]
            }
            else
            {
                $code[2]
            }
        }
        elseif (($code[1] -ne 'vLayout') -and ($code[1] -ne 'hLayout'))
        {
            $rules[$code[1]] = $false
        }
        $i++
    }

    if (-not $(try{$rules['hLayout'].GetType()}catch{$false}))
    {
        if ($oldLayout -eq 0)
        {
            $rules['hLayout'] = $FITTING
        }
        elseif ($oldLayout -eq -1)
        {
            $rules['hLayout'] = $FULL_WIDTH
        }
        else
        {
            if ($rules['hRule1'] -or
                $rules['hRule2'] -or
                $rules['hRule3'] -or
                $rules['hRule4'] -or
                $rules['hRule5'] -or
                $rules['hRule6'])
            {
                $rules['hLayout'] = $CONTROLLED_SMUSHING
            }
            else
            {
                $rules['hLayout'] = $SMUSHING
            }
        }
    }
    elseif ($rules['hLayout'] -eq $SMUSHING)
    {
        if ($rules['hRule1'] -or
            $rules['hRule2'] -or
            $rules['hRule3'] -or
            $rules['hRule4'] -or
            $rules['hRule5'] -or
            $rules['hRule6'])
        {
            $rules['hLayout'] = $CONTROLLED_SMUSHING
        }
    }

    if (-not $(try{$rules['vLayout'].GetType()}catch{$false}))
    {
        if ($rules['vRule1'] -or
            $rules['vRule2'] -or
            $rules['vRule3'] -or
            $rules['vRule4'] -or
            $rules['vRule5'])
        {
            $rules['vLayout'] = $CONTROLLED_SMUSHING
        }
        else
        {
            $rules['vLayout'] = $FULL_WIDTH
        }
    }
    elseif ($rules['vLayout'] -eq $SMUSHING)
    {
        if ($rules['vRule1'] -or
            $rules['vRule2'] -or
            $rules['vRule3'] -or
            $rules['vRule4'] -or
            $rules['vRule5'])
        {
            $rules['vLayout'] = $CONTROLLED_SMUSHING
        }
    }

    $rules
}
