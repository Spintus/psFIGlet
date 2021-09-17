# Horizontal Rule 1: Equal Character Smushing (code value 1)
function hRule1_Smush
{
    param
    (
        [char] $ch1,
        [char] $ch2,
        [char] $hardBlank
    )
    
    if ($ch1 -eq $ch2 -and $ch1 -ne $hardBlank)
    {
        $ch1
    }
    else
    {
        $false
    }
}
