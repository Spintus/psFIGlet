Import-Module ".\psFIGlet.psd1"

$fontName        = 'big'
$inputText       = "test `nnewline `ntest"
$vLayout         = 3
$hLayout         = 3
$width           = 50
$whitespaceBreak = $false

$inputTextOptions = @{
    font             = $fontName
    horizontalLayout = $hLayout
    verticalLayout   = $vLayout
    width            = $width
    whitespaceBreak  = $whitespaceBreak
}

$errHandler = {
    param ($err, $text)
    if ($err)
    {
        Write-Error 'something went wrong...'
        Write-Error $err
    }
}

New-Text $inputText @inputTextOptions $errHandler
