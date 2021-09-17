function New-GeneratedText
{
    param
    (
        [string]    $fontName,
        [HashTable] $options,
        [string[]]  $txt
    )

    $txt = $txt.Replace("`r`n", "`n").Replace("`r", "`n")
    [string[]] $lines = $txt.Split("`n")
    $figLines = @()
    $len = $lines.Length

    for ($i = 0; $i -lt $len; $i++)
    {
        $figLines += @(New-FigTextLines $lines[$i] $figFonts[$fontName] $options)
    }

    $len = $figLines.Length
    $output = $figLines[0]

    for ($i = 1; $i -lt $len; $i++)
    {
        $output = Get-VerticallySmushedFigLines $output $figLines[$i] $options
    }

    if ($output)
    {
        $output
        # $(for ($i = 0; $i -lt $output.Count; $i++)
        #     {
        #         $output[$i] -join "`n"
        #     }) -join "`n"
    }
    else
    {
        ''
    }
}
