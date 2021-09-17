# Horizontal Rule 4: Opposite Pair Smushing (code value 8)
function hRule4_Smush
{
    param
    (
        [char] $ch1,
        [char] $ch2
    )

    $rule4Str = '[] {} ()'
    $r4_pos1  = $rule4Str.IndexOf($ch1)
    $r4_pos2  = $rule4Str.IndexOf($ch2)

    if ($r4_pos1 -ne -1 -and $r4_pos2 -ne -1)
    {
        if ([System.Math]::Abs($r4_pos1 - $r4_pos2) -le 1)
        {
            '|'
        }
    }
    else
    {
        $false
    }
}
