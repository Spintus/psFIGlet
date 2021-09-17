function Get-HorizontalFittingRules
{
    param
    (
        [string]    $layout,
        [HashTable] $options
    )

    $props = @('hLayout', 'hRule1', 'hRule2', 'hRule3', 'hRule4', 'hRule5', 'hRule6')
    $params = @{}

    switch ($layout)
    {
        'default'
        {
            for ($i = 0; $i -lt $props.Length; $i++)
            {
                $params[$props[$i]] = $options['fittingRules'][$props[$i]]
            }
        }

        'full'
        {
            $params = @{
                hLayout = $FULL_WIDTH
                hRule1 = $false
                hRule2 = $false
                hRule3 = $false
                hRule4 = $false
                hRule5 = $false
                hRule6 = $false
            }
        }

        'fitted'
        {
            $params = @{
                hLayout = $FITTING
                hRule1 = $false
                hRule2 = $false
                hRule3 = $false
                hRule4 = $false
                hRule5 = $false
                hRule6 = $false
            }
        }

        'controlled smushing'
        {
            $params = @{
                hLayout = $CONTROLLED_SMUSHING
                hRule1 = $true
                hRule2 = $true
                hRule3 = $true
                hRule4 = $true
                hRule5 = $true
                hRule6 = $true
            }
        }

        'universal smushing'
        {
            $params = @{
                hLayout = $SMUSHING
                hRule1 = $false
                hRule2 = $false
                hRule3 = $false
                hRule4 = $false
                hRule5 = $false
                hRule6 = $false
            }
        }

        default {return}
    }

    $params
}
