function Get-BrokenWord
{
    param
    (
        $figChars,
        $len,
        [HashTable] $opts
    )

    $result = @{}

    for ($i = $figChars.Length; $i--)
    {
        $w = Join-FigArray $figChars[0..$i - 1] $len $opts

        if ($(Get-FigLinesWidth $w) -le $opts['width'])
        {
            $result['outputFigText'] = $w

            $result['chars'] = if ($i -lt $figChars.Length)
            {
                $figChars[$i..$figChars.Length]
            }
            else
            {
                @()
            }

            break
        }
    }

    $result
}
