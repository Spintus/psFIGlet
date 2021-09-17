# Vertical Rule 5: Vertical Line Smushing (code value 4096)
function vRule5_Smush
{
    param
    (
        [char] $ch1,
        [char] $ch2
    )

    if ($ch1 -eq '|' -and $ch2 -eq '|')
    {
        '|'
    }
    else
    {
        $false
    }
}
