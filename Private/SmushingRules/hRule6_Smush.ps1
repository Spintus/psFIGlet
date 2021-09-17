# Horizontal Rule 6: Hardblank Smushing (code value 32)
function hRule6_Smush
{
    param
    (
        [char] $ch1,
        [char] $ch2,
        [char] $hardBlank
    )

    if ($ch1 -eq $hardBlank -and $ch2 -eq $hardBlank)
    {
        $hardBlank
    }
    else
    {
        $false
    }
}
