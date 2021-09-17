# Vertical Rule 2: Undescore Smushing (code value 512)
function vRule2_Smush
{
    param
    (
        [char] $ch1,
        [char] $ch2
    )

    $rule2Str = '[|\/\\\[\]\{\}\(\)\<\>]'

    if ($ch1 -eq '_')
    {
        if ($ch2 -match $rule2Str)
        {
            return $ch2
        }
    }
    elseif ($ch2 -eq '_')
    {
        if ($ch1 -match $rule2Str)
        {
            return $ch1
        }
    }

    $false
}
