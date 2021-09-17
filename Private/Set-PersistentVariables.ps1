# Private static variables
New-Variable -Name FULL_WIDTH          -Value 0 -Option ReadOnly -Force
New-Variable -Name FITTING             -Value 1 -Option ReadOnly -Force
New-Variable -Name SMUSHING            -Value 2 -Option ReadOnly -Force
New-Variable -Name CONTROLLED_SMUSHING -Value 3 -Option ReadOnly -Force

# Font information variables
New-Variable -Name figFonts    -Value @{} -Option AllScope -Force
New-Variable -Name figDefaults -Value @{
    font     = 'Standard'
    fontPath = Resolve-Path "$moduleRoot\fonts"
} -Option AllScope -Force