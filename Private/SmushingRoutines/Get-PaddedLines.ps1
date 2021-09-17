function Get-PaddedLines
{
    param
    (
        [string[]] $lines,
        [int]      $numSpaces
    )

    $len = $lines.Length
    $padding = ''

    for ($i = 0; $i -lt $numSpaces; $i++)
    {
        $padding += ' '
    }

    for ($i = 0; $i -lt $len; $i++)
    {
        $lines[$i] += $padding
    }

    $lines
}
