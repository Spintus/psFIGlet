# Universal Smushing Rule
function uni_Smush
{
    param
    (
        [char] $ch1,
        [char] $ch2,
        [char] $hardBlank
    )

    if ($ch2 -eq ' ' -or $ch2 -eq '')
    {
        $ch1
    }
    elseif ($ch2 -eq $hardBlank -and $ch1 -ne ' ')
    {
        $ch1
    }
    else
    {
        $ch2
    }
}
