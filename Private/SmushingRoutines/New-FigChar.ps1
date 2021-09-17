function New-FigChar
{
    param
    (
        [int] $len
    )

    $outputFigText = @()

    for ($row = 0; $row -lt $len; $row++)
    {
        $outputFigText += ''
    }

    $outputFigText
}
