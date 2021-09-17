#
# Module manifest for module 'psFIGlet'
#
# Generated by: Will Marcum
#
# Generated on: 7/1/2021
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule        = '.\psFIGlet.psm1'

    # Version number of this module.
    ModuleVersion     = '0.5.2'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID              = '5e860de0-a554-410a-ba01-8bb2f4435afe'

    # Author of this module
    Author            = 'Will Marcum'

    # Company or vendor of this module
    CompanyName       = 'Boulder Imaging Inc.'

    # Copyright statement for this module
    Copyright         = '(c) 2021 Boulder Imaging Inc. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'PowerShell FIGDriver for FIGlet fonts'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    ScriptsToProcess  = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @(
        'Get-Defaults'
        'Get-Font'
        'Get-FontSync'
        'Get-MergedFontOpts'
        'Get-MetaData'
        'Get-ParsedFont'
        'Get-PreLoadedFonts'
        'New-Text'
        'New-TextSync'
    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport   = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    FileList          = @(
        '.\en-US\about_psFIGlet.help.txt'
        '.\fonts\1Row.flf'
        '.\fonts\3-D.flf'
        '.\fonts\3D Diagonal.flf'
        '.\fonts\3D-ASCII.flf'
        '.\fonts\3d.flf'
        '.\fonts\3d_diagonal.flf'
        '.\fonts\3x5.flf'
        '.\fonts\4Max.flf'
        '.\fonts\5 Line Oblique.flf'
        '.\fonts\5lineoblique.flf'
        '.\fonts\646-ca.flc'
        '.\fonts\646-ca2.flc'
        '.\fonts\646-cn.flc'
        '.\fonts\646-cu.flc'
        '.\fonts\646-de.flc'
        '.\fonts\646-dk.flc'
        '.\fonts\646-es.flc'
        '.\fonts\646-es2.flc'
        '.\fonts\646-fr.flc'
        '.\fonts\646-gb.flc'
        '.\fonts\646-hu.flc'
        '.\fonts\646-irv.flc'
        '.\fonts\646-it.flc'
        '.\fonts\646-jp.flc'
        '.\fonts\646-kr.flc'
        '.\fonts\646-no.flc'
        '.\fonts\646-no2.flc'
        '.\fonts\646-pt.flc'
        '.\fonts\646-pt2.flc'
        '.\fonts\646-se.flc'
        '.\fonts\646-se2.flc'
        '.\fonts\646-yu.flc'
        '.\fonts\8859-2.flc'
        '.\fonts\8859-3.flc'
        '.\fonts\8859-4.flc'
        '.\fonts\8859-5.flc'
        '.\fonts\8859-7.flc'
        '.\fonts\8859-8.flc'
        '.\fonts\8859-9.flc'
        '.\fonts\Acrobatic.flf'
        '.\fonts\Alligator.flf'
        '.\fonts\Alligator2.flf'
        '.\fonts\alligator3.flf'
        '.\fonts\Alpha.flf'
        '.\fonts\Alphabet.flf'
        '.\fonts\AMC 3 Line.flf'
        '.\fonts\AMC 3 Liv1.flf'
        '.\fonts\AMC AAA01.flf'
        '.\fonts\AMC Neko.flf'
        '.\fonts\AMC Razor.flf'
        '.\fonts\AMC Razor2.flf'
        '.\fonts\AMC Slash.flf'
        '.\fonts\AMC Slider.flf'
        '.\fonts\AMC Thin.flf'
        '.\fonts\AMC Tubes.flf'
        '.\fonts\AMC Untitled.flf'
        '.\fonts\amc3line.flf'
        '.\fonts\amc3liv1.flf'
        '.\fonts\amcaaa01.flf'
        '.\fonts\amcneko.flf'
        '.\fonts\amcrazo2.flf'
        '.\fonts\amcrazor.flf'
        '.\fonts\amcslash.flf'
        '.\fonts\amcslder.flf'
        '.\fonts\amcthin.flf'
        '.\fonts\amctubes.flf'
        '.\fonts\amcun1.flf'
        '.\fonts\ANSI Regular.flf'
        '.\fonts\ANSI Shadow.flf'
        '.\fonts\Arrows.flf'
        '.\fonts\ASCII New Roman.flf'
        '.\fonts\ascii12.tlf'
        '.\fonts\ascii9.tlf'
        '.\fonts\ascii_new_roman.flf'
        '.\fonts\Avatar.flf'
        '.\fonts\B1FF.flf'
        '.\fonts\B1FF.php'
        '.\fonts\Banner.flf'
        '.\fonts\Banner3-D.flf'
        '.\fonts\Banner3.flf'
        '.\fonts\Banner4.flf'
        '.\fonts\Barbwire.flf'
        '.\fonts\Basic.flf'
        '.\fonts\Bear.flf'
        '.\fonts\Bell.flf'
        '.\fonts\Benjamin.flf'
        '.\fonts\Big Chief.flf'
        '.\fonts\Big Money-ne.flf'
        '.\fonts\Big Money-nw.flf'
        '.\fonts\Big Money-se.flf'
        '.\fonts\Big Money-sw.flf'
        '.\fonts\Big.flf'
        '.\fonts\bigascii12.tlf'
        '.\fonts\bigascii9.tlf'
        '.\fonts\bigchief.flf'
        '.\fonts\Bigfig.flf'
        '.\fonts\bigmono12.tlf'
        '.\fonts\bigmono9.tlf'
        '.\fonts\Binary.flf'
        '.\fonts\Block.flf'
        '.\fonts\Blocks.flf'
        '.\fonts\Bloody.flf'
        '.\fonts\Bolger.flf'
        '.\fonts\Braced.flf'
        '.\fonts\Bright.flf'
        '.\fonts\Broadway KB.flf'
        '.\fonts\Broadway.flf'
        '.\fonts\broadway_kb.flf'
        '.\fonts\Bubble.flf'
        '.\fonts\Bulbhead.flf'
        '.\fonts\calgphy2.flf'
        '.\fonts\Caligraphy.flf'
        '.\fonts\Caligraphy2.flf'
        '.\fonts\Calvin S.flf'
        '.\fonts\Cards.flf'
        '.\fonts\Catwalk.flf'
        '.\fonts\Chiseled.flf'
        '.\fonts\Chunky.flf'
        '.\fonts\circle.tlf'
        '.\fonts\Coinstak.flf'
        '.\fonts\Cola.flf'
        '.\fonts\Colossal.flf'
        '.\fonts\Computer.flf'
        '.\fonts\Contessa.flf'
        '.\fonts\Contrast.flf'
        '.\fonts\cosmic.flf'
        '.\fonts\Cosmike.flf'
        '.\fonts\Crawford.flf'
        '.\fonts\Crawford2.flf'
        '.\fonts\Crazy.flf'
        '.\fonts\Cricket.flf'
        '.\fonts\Cursive.flf'
        '.\fonts\Cyberlarge.flf'
        '.\fonts\Cybermedium.flf'
        '.\fonts\Cybersmall.flf'
        '.\fonts\Cygnet.flf'
        '.\fonts\DANC4.flf'
        '.\fonts\Dancing Font.flf'
        '.\fonts\dancingfont.flf'
        '.\fonts\Decimal.flf'
        '.\fonts\Def Leppard.flf'
        '.\fonts\defleppard.flf'
        '.\fonts\Delta Corps Priest 1.flf'
        '.\fonts\Diamond.flf'
        '.\fonts\Diet Cola.flf'
        '.\fonts\dietcola.flf'
        '.\fonts\Digital.flf'
        '.\fonts\Doh.flf'
        '.\fonts\Doom.flf'
        '.\fonts\DOS Rebel.flf'
        '.\fonts\dosrebel.flf'
        '.\fonts\Dot Matrix.flf'
        '.\fonts\dotmatrix.flf'
        '.\fonts\Double Shorts.flf'
        '.\fonts\Double.flf'
        '.\fonts\doubleshorts.flf'
        '.\fonts\Dr Pepper.flf'
        '.\fonts\drpepper.flf'
        '.\fonts\DWhistled.flf'
        '.\fonts\Efti Chess.flf'
        '.\fonts\Efti Font.flf'
        '.\fonts\Efti Italic.flf'
        '.\fonts\Efti Piti.flf'
        '.\fonts\Efti Robot.flf'
        '.\fonts\Efti Wall.flf'
        '.\fonts\Efti Water.flf'
        '.\fonts\eftichess.flf'
        '.\fonts\eftifont.flf'
        '.\fonts\eftipiti.flf'
        '.\fonts\eftirobot.flf'
        '.\fonts\eftitalic.flf'
        '.\fonts\eftiwall.flf'
        '.\fonts\eftiwater.flf'
        '.\fonts\Electronic.flf'
        '.\fonts\Elite.flf'
        '.\fonts\emboss.tlf'
        '.\fonts\emboss2.tlf'
        '.\fonts\Epic.flf'
        '.\fonts\Fender.flf'
        '.\fonts\Filter.flf'
        '.\fonts\Fire Font-k.flf'
        '.\fonts\Fire Font-s.flf'
        '.\fonts\fire_font-k.flf'
        '.\fonts\fire_font-s.flf'
        '.\fonts\Flipped.flf'
        '.\fonts\Flower Power.flf'
        '.\fonts\flowerpower.flf'
        '.\fonts\Four Tops.flf'
        '.\fonts\fourtops.flf'
        '.\fonts\Fraktur.flf'
        '.\fonts\frango.flc'
        '.\fonts\Fun Face.flf'
        '.\fonts\Fun Faces.flf'
        '.\fonts\funface.flf'
        '.\fonts\funfaces.flf'
        '.\fonts\future.tlf'
        '.\fonts\Fuzzy.flf'
        '.\fonts\Georgi16.flf'
        '.\fonts\Georgia11.flf'
        '.\fonts\Ghost.flf'
        '.\fonts\Ghoulish.flf'
        '.\fonts\Glenyn.flf'
        '.\fonts\Goofy.flf'
        '.\fonts\Gothic.flf'
        '.\fonts\Graceful.flf'
        '.\fonts\Gradient.flf'
        '.\fonts\Graffiti.flf'
        '.\fonts\Greek.flf'
        '.\fonts\Heart Left.flf'
        '.\fonts\Heart Right.flf'
        '.\fonts\heart_left.flf'
        '.\fonts\heart_right.flf'
        '.\fonts\Henry 3D.flf'
        '.\fonts\henry3d.flf'
        '.\fonts\Hex.flf'
        '.\fonts\Hieroglyphs.flf'
        '.\fonts\Hollywood.flf'
        '.\fonts\Horizontal Left.flf'
        '.\fonts\Horizontal Right.flf'
        '.\fonts\horizontalleft.flf'
        '.\fonts\horizontalright.flf'
        '.\fonts\hz.flc'
        '.\fonts\ICL-1900.flf'
        '.\fonts\ilhebrew.flc'
        '.\fonts\Impossible.flf'
        '.\fonts\Invita.flf'
        '.\fonts\Isometric1.flf'
        '.\fonts\Isometric2.flf'
        '.\fonts\Isometric3.flf'
        '.\fonts\Isometric4.flf'
        '.\fonts\Italic.flf'
        '.\fonts\Ivrit.flf'
        '.\fonts\Jacky.flf'
        '.\fonts\Jazmine.flf'
        '.\fonts\Jerusalem.flf'
        '.\fonts\jis0201.flc'
        '.\fonts\JS Block Letters.flf'
        '.\fonts\JS Bracket Letters.flf'
        '.\fonts\JS Capital Curves.flf'
        '.\fonts\JS Cursive.flf'
        '.\fonts\JS Stick Letters.flf'
        '.\fonts\Katakana.flf'
        '.\fonts\Kban.flf'
        '.\fonts\Keyboard.flf'
        '.\fonts\Knob.flf'
        '.\fonts\koi8r.flc'
        '.\fonts\Konto Slant.flf'
        '.\fonts\Konto.flf'
        '.\fonts\kontoslant.flf'
        '.\fonts\Larry 3D 2.flf'
        '.\fonts\Larry 3D.flf'
        '.\fonts\larry3d.flf'
        '.\fonts\LCD.flf'
        '.\fonts\Lean.flf'
        '.\fonts\letter.tlf'
        '.\fonts\Letters.flf'
        '.\fonts\Lil Devil.flf'
        '.\fonts\lildevil.flf'
        '.\fonts\Line Blocks.flf'
        '.\fonts\lineblocks.flf'
        '.\fonts\Linux.flf'
        '.\fonts\Lockergnome.flf'
        '.\fonts\Madrid.flf'
        '.\fonts\Marquee.flf'
        '.\fonts\Maxfour.flf'
        '.\fonts\maxiwi.flf'
        '.\fonts\Merlin1.flf'
        '.\fonts\Merlin2.flf'
        '.\fonts\Mike.flf'
        '.\fonts\Mini.flf'
        '.\fonts\miniwi.flf'
        '.\fonts\Mirror.flf'
        '.\fonts\Mnemonic.flf'
        '.\fonts\Modular.flf'
        '.\fonts\mono12.tlf'
        '.\fonts\mono9.tlf'
        '.\fonts\Morse.flf'
        '.\fonts\Morse2.flf'
        '.\fonts\moscow.flc'
        '.\fonts\Moscow.flf'
        '.\fonts\Mshebrew210.flf'
        '.\fonts\Muzzle.flf'
        '.\fonts\Nancyj-Fancy.flf'
        '.\fonts\Nancyj-Improved.flf'
        '.\fonts\Nancyj-Underlined.flf'
        '.\fonts\Nancyj.flf'
        '.\fonts\Nipples.flf'
        '.\fonts\NScript.flf'
        '.\fonts\NT Greek.flf'
        '.\fonts\ntgreek.flf'
        '.\fonts\NV Script.flf'
        '.\fonts\O8.flf'
        '.\fonts\Octal.flf'
        '.\fonts\Ogre.flf'
        '.\fonts\Old Banner.flf'
        '.\fonts\oldbanner.flf'
        '.\fonts\OS2.flf'
        '.\fonts\Pagga.flf'
        '.\fonts\pagga.tlf'
        ".\fonts\Patorjk's Cheese.flf"
        '.\fonts\Patorjk-HeX.flf'
        '.\fonts\Pawp.flf'
        '.\fonts\Peaks Slant.flf'
        '.\fonts\Peaks.flf'
        '.\fonts\peaksslant.flf'
        '.\fonts\Pebbles.flf'
        '.\fonts\Pepper.flf'
        '.\fonts\Poison.flf'
        '.\fonts\Puffy.flf'
        '.\fonts\Puzzle.flf'
        '.\fonts\Pyramid.flf'
        '.\fonts\Rammstein.flf'
        '.\fonts\README.md'
        '.\fonts\rebel.tlf'
        '.\fonts\Rectangles.flf'
        '.\fonts\Red Phoenix.flf'
        '.\fonts\red_phoenix.flf'
        '.\fonts\Relief.flf'
        '.\fonts\Relief2.flf'
        '.\fonts\rev.flf'
        '.\fonts\Reverse.flf'
        '.\fonts\Roman.flf'
        '.\fonts\Rot13.flf'
        '.\fonts\Rot13.php'
        '.\fonts\Rotated.flf'
        '.\fonts\Rounded.flf'
        '.\fonts\Rowan Cap.flf'
        '.\fonts\rowancap.flf'
        '.\fonts\Rozzo.flf'
        '.\fonts\Runic.flf'
        '.\fonts\Runyc.flf'
        '.\fonts\rusto.tlf'
        '.\fonts\rustofat.tlf'
        '.\fonts\S Blood.flf'
        '.\fonts\s-relief.flf'
        '.\fonts\Santa Clara.flf'
        '.\fonts\santaclara.flf'
        '.\fonts\sblood.flf'
        '.\fonts\Script.flf'
        '.\fonts\Serifcap.flf'
        '.\fonts\Shadow.flf'
        '.\fonts\Shimrod.flf'
        '.\fonts\Short.flf'
        '.\fonts\SL Script.flf'
        '.\fonts\Slant Relief.flf'
        '.\fonts\Slant.flf'
        '.\fonts\Slide.flf'
        '.\fonts\slscript.flf'
        '.\fonts\Small Caps.flf'
        '.\fonts\Small Isometric1.flf'
        '.\fonts\Small Keyboard.flf'
        '.\fonts\Small Poison.flf'
        '.\fonts\Small Script.flf'
        '.\fonts\Small Shadow.flf'
        '.\fonts\Small Slant.flf'
        '.\fonts\Small Tengwar.flf'
        '.\fonts\Small.flf'
        '.\fonts\smallcaps.flf'
        '.\fonts\smascii12.tlf'
        '.\fonts\smascii9.tlf'
        '.\fonts\smblock.tlf'
        '.\fonts\smbraille.tlf'
        '.\fonts\smisome1.flf'
        '.\fonts\smkeyboard.flf'
        '.\fonts\smmono12.tlf'
        '.\fonts\smmono9.tlf'
        '.\fonts\smpoison.flf'
        '.\fonts\smscript.flf'
        '.\fonts\smshadow.flf'
        '.\fonts\smslant.flf'
        '.\fonts\smtengwar.flf'
        '.\fonts\Soft.flf'
        '.\fonts\Speed.flf'
        '.\fonts\Spliff.flf'
        '.\fonts\Stacey.flf'
        '.\fonts\Stampate.flf'
        '.\fonts\Stampatello.flf'
        '.\fonts\Standard.flf'
        '.\fonts\Star Strips.flf'
        '.\fonts\Star Wars.flf'
        '.\fonts\starstrips.flf'
        '.\fonts\starwars.flf'
        '.\fonts\Stellar.flf'
        '.\fonts\Stforek.flf'
        '.\fonts\Stick Letters.flf'
        '.\fonts\Stop.flf'
        '.\fonts\Straight.flf'
        '.\fonts\Stronger Than All.flf'
        '.\fonts\Sub-Zero.flf'
        '.\fonts\Swamp Land.flf'
        '.\fonts\swampland.flf'
        '.\fonts\Swan.flf'
        '.\fonts\Sweet.flf'
        '.\fonts\Tanja.flf'
        '.\fonts\Tengwar.flf'
        '.\fonts\Term.flf'
        '.\fonts\Test1.flf'
        '.\fonts\The Edge.flf'
        '.\fonts\Thick.flf'
        '.\fonts\Thin.flf'
        '.\fonts\THIS.flf'
        '.\fonts\Thorned.flf'
        '.\fonts\Three Point.flf'
        '.\fonts\threepoint.flf'
        '.\fonts\Ticks Slant.flf'
        '.\fonts\Ticks.flf'
        '.\fonts\ticksslant.flf'
        '.\fonts\Tiles.flf'
        '.\fonts\Tinker-Toy.flf'
        '.\fonts\Tombstone.flf'
        '.\fonts\Train.flf'
        '.\fonts\Trek.flf'
        '.\fonts\Tsalagi.flf'
        '.\fonts\Tubular.flf'
        '.\fonts\Twisted.flf'
        '.\fonts\Two Point.flf'
        '.\fonts\twopoint.flf'
        '.\fonts\Univers.flf'
        '.\fonts\upper.flc'
        '.\fonts\USA Flag.flf'
        '.\fonts\usaflag.flf'
        '.\fonts\ushebrew.flc'
        '.\fonts\uskata.flc'
        '.\fonts\utf8.flc'
        '.\fonts\Varsity.flf'
        '.\fonts\Wavy.flf'
        '.\fonts\Weird.flf'
        '.\fonts\Wet Letter.flf'
        '.\fonts\wetletter.flf'
        '.\fonts\Whimsy.flf'
        '.\fonts\wideterm.tlf'
        '.\fonts\Wow.flf'
        '.\Private\ParsingAndGenerationFunctions\Get-FigLinesWidth.ps1'
        '.\Private\ParsingAndGenerationFunctions\Get-HorizontalFittingRules.ps1'
        '.\Private\ParsingAndGenerationFunctions\New-GeneratedText.ps1'
        '.\Private\SmushingRoutines\Get-BrokenWord.ps1'
        '.\Private\SmushingRoutines\Get-HorizontallySmushedBlocks.ps1'
        '.\Private\SmushingRoutines\Get-HorizontalSmushLength.ps1'
        '.\Private\SmushingRoutines\Get-PaddedLines.ps1'
        '.\Private\SmushingRoutines\Get-VerticallySmushed.ps1'
        '.\Private\SmushingRoutines\Get-VerticallySmushedFigLines.ps1'
        '.\Private\SmushingRoutines\Get-VerticallySmushedLines.ps1'
        '.\Private\SmushingRoutines\Get-VerticalSmushDist.ps1'
        '.\Private\SmushingRoutines\Join-FigArray.ps1'
        '.\Private\SmushingRoutines\New-FigChar.ps1'
        '.\Private\SmushingRoutines\New-FigTextLines.ps1'
        '.\Private\SmushingRoutines\Test-CanVerticalSmush.ps1'
        '.\Private\SmushingRules\Get-SmushingRules.ps1'
        '.\Private\SmushingRules\hRule1_Smush.ps1'
        '.\Private\SmushingRules\hRule2_Smush.ps1'
        '.\Private\SmushingRules\hRule3_Smush.ps1'
        '.\Private\SmushingRules\hRule4_Smush.ps1'
        '.\Private\SmushingRules\hRule5_Smush.ps1'
        '.\Private\SmushingRules\hRule6_Smush.ps1'
        '.\Private\SmushingRules\uni_Smush.ps1'
        '.\Private\SmushingRules\vRule1_Smush.ps1'
        '.\Private\SmushingRules\vRule2_Smush.ps1'
        '.\Private\SmushingRules\vRule3_Smush.ps1'
        '.\Private\SmushingRules\vRule4_Smush.ps1'
        '.\Private\SmushingRules\vRule5_Smush.ps1'
        '.\Private\Set-PersistentVariables.ps1'
        '.\Public\Get-Defaults.ps1'
        '.\Public\Get-Font.ps1'
        '.\Public\Get-FontSync.ps1'
        '.\Public\Get-MergedFontOpts.ps1'
        '.\Public\Get-Metadata.ps1'
        '.\Public\Get-ParsedFont.ps1'
        '.\Public\Get-PreLoadedFonts.ps1'
        '.\Public\New-Text.ps1'
        '.\Public\New-TextSync.ps1'
        '.\psFIGlet.psm1'
        '.\psFIGlet.psd1'
        '.\README.md'
    )

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags         = @(
                'FIGlet'
                'ASCII'
                'Font'
            )

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            # ProjectUri = ''

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            ReleaseNotes = @'
            KNOWN ISSUES:
                • Vertical smushing doesn't work; overlap isn't getting set right.
                    - Must fix functions for proper implementation.
                • Host output is borked on linewrap from buffer size.
                    - Must implement powershell host-specific logic for auto-specifying figLine wrapping from buffer size.

            07/19/2021 - Restructured module for compliance with my "standard" module format for ease of modification and scope standardization.
            07/18/2021 - Reworked functions to be more 'powershell-y' (cmdlet calls + pipelines)
            07/01/2021 - Initial structuring and partial conversion from FIGlet.js (by patorjk)
'@

            # Prerelease string of this module
            Prerelease   = 'alpha'

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = 'BI'

}

