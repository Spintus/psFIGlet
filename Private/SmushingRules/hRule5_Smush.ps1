# Horizontal Rule 5: Big X Smushing (code value 16)
function hRule5_Smush
{
    param
    (
        [char] $ch1,
        [char] $ch2
    )

    $rule5Str = '/\\ \\/ ><'
    $rule5Hash = @{
        0 = '|'
        3 = 'Y'
        6 = 'X'
    }
    $r5_pos1 = $rule5Str.IndexOf($ch1)
    $r5_pos2 = $rule5Str.IndexOf($ch2)

    if ($r5_pos1 -ne -1 -and $r5_pos2 -ne -1)
    {
        if (($r5_pos2 - $r5_pos1) -eq 1)
        {
            $rule5Hash[$r5_pos1]
        }
    }
    else
    {
        $false
    }
}
