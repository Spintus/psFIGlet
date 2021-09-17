function Get-VerticalFittingRules
{
    param
    (
        [string]    $layout,
        [HashTable] $options
    )

    $props = @('vLayout', 'vRule1', 'vRule2', 'vRule3', 'vRule4', 'vRule5')
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
                vLayout = $FULL_WIDTH
                vRule1 = $false
                vRule2 = $false
                vRule3 = $false
                vRule4 = $false
                vRule5 = $false
            }
        }

        'fitted'
        {
            $params = @{
                vLayout = $FITTING
                vRule1 = $false
                vRule2 = $false
                vRule3 = $false
                vRule4 = $false
                vRule5 = $false
            }
        }

        'controlled smushing'
        {
            $params = @{
                vLayout = $CONTROLLED_SMUSHING
                vRule1 = $true
                vRule2 = $true
                vRule3 = $true
                vRule4 = $true
                vRule5 = $true
            }
        }

        'universal smushing'
        {
            $params = @{
                vLayout = $SMUSHING
                vRule1 = $false
                vRule2 = $false
                vRule3 = $false
                vRule4 = $false
                vRule5 = $false
            }
        }

        default {return}
    }

    $params
}
