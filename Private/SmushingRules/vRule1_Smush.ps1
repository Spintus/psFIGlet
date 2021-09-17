# Vertical Rule 1: Equal Character Smushing (code value 256)
function vRule1_Smush
{
    param
    (
        [char] $ch1,
        [char] $ch2
    )

    if ($ch1 -eq $ch2)
    {
        $ch1
    }
    else
    {
        $false
    }
}
