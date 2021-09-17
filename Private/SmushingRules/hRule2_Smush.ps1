# Horizontal Rule 2: Underscore Smushing (code value 2)
function hRule2_Smush
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
            $ch2
        }
    }
    elseif ($ch2 -eq '_')
    {
        if ($ch1 -match $rule2Str)
        {
            $ch1
        }
    }
    else
    {
        $false
    }
}
