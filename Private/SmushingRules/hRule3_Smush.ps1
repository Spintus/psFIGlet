# Horizontal Rule 3: Hierarchy Smushing (code value 4)
function hRule3_Smush
{
    param
    (
        [char] $ch1,
        [char] $ch2
    )

    $rule3Classes = '| /\\ [] {} () <>'
    $r3_pos1      = $rule3Classes.IndexOf($ch1)
    $r3_pos2      = $rule3Classes.IndexOf($ch2)

    if ($r3_pos1 -ne -1 -and $r3_pos2 -ne -1)
    {
        if ($r3_pos1 -ne $r3_pos2 -and [System.Math]::Abs($r3_pos1 - $r3_pos2) -ne 1)
        {
            $rule3Classes.Substring([System.Math]::Max($r3_pos1, $r3_pos2), 1)
        }
    }
    else
    {
        $false
    }
}
