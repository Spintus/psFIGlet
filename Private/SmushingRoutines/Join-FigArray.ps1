function Join-FigArray
{
    param
    (
        [string[]]  $array,
        [int]       $len,
        [HashTable] $opts
    )

    $reducer = {
        param
        (
            $acc,
            $data
        )

        Get-HorizontallySmushedBlocks $acc $data.fig $data.overlap $opts
    }

    # array.reduce(function(acc, data) {...}, newFigChar(len))
    #!!! CHECK THIS IT WON'T WORK GUARANTEED!
    $acc = New-FigChar $len
    foreach ($object in $input)
    {
        $acc = .$reducer $acc $object
    }
}
