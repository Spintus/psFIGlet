# Vertical Rule 4: Horizontal Line Smushing (code value 2048)
function vRule4_Smush
{
    param
    (
        [char] $ch1,
        [char] $ch2
    )

    if (($ch1 -eq '-' -and $ch2 -eq '_') -or ($ch1 -eq '_' -and $ch2 -eq '-'))
    {
        '='
    }
    else
    {
        $false
    }
}
