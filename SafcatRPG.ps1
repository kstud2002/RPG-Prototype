# --------------------------------------------
# Datei:		<SafcatRPG.ps1>
# Datum:		<2020-06-19>
# Ersteller:	<Kian Studerus> (<BBB>)
# Version:		<1.0.0.0>
# Änderungen:	<ÄNDERUNGEN DATUM/WER/WAS>
# Beschreibung: <Top-Down RPG-Prototyp>
# --------------------------------------------


# VARIABLEN UND KONSTANTEN
$pathScreen1 = "Screen1.txt"
$arrScreen1
$2darrScreen1
$arrLine1
$arrLine2
$arrLine3
$arrLine4
$arrLine5
$arrLine6
$arrLine7
$arrLine8
$arrLine9
$arrLine10
$arrLine11
$arrLine12
$arrLine13
$arrLine14
$arrLine15
$arrLine16

[int]$direction = 2
[int]$playerx = 0
[int]$playery = 0
$keyInfo

#FUNKTIONEN UND PROZEDUREN
function redraw {
    foreach ($line in $2darrScreen1) {
        foreach ($ch in $line) {
            if ($ch -eq '.') {
                Write-Host " " -nonewline -BackgroundColor Green -ForegroundColor Black
                Write-Host $ch  -nonewline -BackgroundColor Green -ForegroundColor Black
                Write-Host " " -nonewline -BackgroundColor Green -ForegroundColor Black
            }
            elseif ($ch -eq '0') {
                Write-Host " " -nonewline -BackgroundColor DarkGreen -ForegroundColor Black
                Write-Host $ch -nonewline -BackgroundColor DarkGreen -ForegroundColor Black
                Write-Host " " -nonewline -BackgroundColor DarkGreen -ForegroundColor Black
            }
            elseif ($ch -eq '|') {
                Write-Host " " -nonewline -BackgroundColor DarkRed -ForegroundColor Black
                Write-Host $ch -nonewline -BackgroundColor DarkRed -ForegroundColor Black
                Write-Host " " -nonewline -BackgroundColor DarkRed -ForegroundColor Black
            }
            elseif ($ch -eq '"') {
                Write-Host " " -nonewline -BackgroundColor Magenta -ForegroundColor Black
                Write-Host $ch -nonewline -BackgroundColor Magenta -ForegroundColor Black
                Write-Host " " -nonewline -BackgroundColor Magenta -ForegroundColor Black
            }
            elseif ($ch -eq '~') {
                Write-Host " " -nonewline -BackgroundColor Darkblue -ForegroundColor Black
                Write-Host $ch -nonewline -BackgroundColor Darkblue -ForegroundColor Black
                Write-Host " " -nonewline -BackgroundColor Darkblue -ForegroundColor Black
            }
            elseif ($ch -eq $player) {
                Write-Host " " -nonewline -BackgroundColor Red -ForegroundColor Blue
                Write-Host $ch -nonewline -BackgroundColor Red -ForegroundColor Blue
                Write-Host " " -nonewline -BackgroundColor Red -ForegroundColor Blue
            }
            
        }Write-Host "`r"
    }
}

function Wait-KeyPress {
    param(
    
        [string]
        $Message = 'Use the Arrow-Keys to move',

        [ConsoleKey]
        $DownKey = [ConsoleKey]::DownArrow,

        [ConsoleKey]
        $UpKey = [ConsoleKey]::UpArrow,

        [ConsoleKey]
        $LeftKey = [ConsoleKey]::LeftArrow,

        [ConsoleKey]
        $RightKey = [ConsoleKey]::RightArrow,

        [ConsoleKey]
        $EscKey = [ConsoleKey]::Escape
        
    )
    
    # emit your custom message
    Write-Host -Object $Message -ForegroundColor Yellow -BackgroundColor Black
    
    # use a blocking call because we *want* to wait

    do {
        $keyInfo = [Console]::ReadKey($true)

        if ($keyInfo.Key -eq $EscKey) {
            exit
        }
        elseif ($keyInfo.Key -eq $DownKey) {
            $direction = 0
        }
        elseif ($keyInfo.Key -eq $UpKey) {
            $direction = 1
        }
        elseif ($keyInfo.Key -eq $RightKey) {
            $direction = 2
        }
        elseif ($keyInfo.Key -eq $LeftKey) {
            $direction = 3
        }

    } until ($keyInfo.Key -eq $DownKey -or $keyInfo.Key -eq $UpKey -or $keyInfo.Key -eq $LeftKey -or $keyInfo.Key -eq $RightKey -or $keyInfo.Key -eq $EscKey)

    return $direction
}

function redrawPlayer {

    if ($playery -eq 0) {
        $arrLine1[$playerx] = '.'
    }
    elseif ($playery -eq 1) {
        $arrLine2[$playerx] = '.'
    }
    elseif ($playery -eq 2) {
        $arrLine3[$playerx] = '.'      
    }
    elseif ($playery -eq 3) {
        $arrLine4[$playerx] = '.'
    }
    elseif ($playery -eq 4) {
        $arrLine5[$playerx] = '.'
    }
    elseif ($playery -eq 5) {
        $arrLine6[$playerx] = '.'
    }
    elseif ($playery -eq 6) {
        $arrLine7[$playerx] = '.'
    }
    elseif ($playery -eq 7) {
        $arrLine8[$playerx] = '.'
    }
    elseif ($playery -eq 8) {
        $arrLine9[$playerx] = '.'
    }
    elseif ($playery -eq 9) {
        $arrLine10[$playerx] = '.'
    }
    elseif ($playery -eq 10) {
        $arrLine11[$playerx] = '.'
    }
    elseif ($playery -eq 11) {
        $arrLine12[$playerx] = '.'
    }
    elseif ($playery -eq 12) {
        $arrLine13[$playerx] = '.'
    }
    elseif ($playery -eq 13) {
        $arrLine14[$playerx] = '.'
    }
    elseif ($playery -eq 14) {
        $arrLine15[$playerx] = '.'
    }
    elseif ($playery -eq 15) {
        $arrLine16[$playerx] = '.'
    }

    return $arrScreen1
}

function movePlayerY {

    if ($direction -eq 0) {
        $playery = $playery + 1
    }
    elseif ($direction -eq 1) {
        $playery = $playery - 1
    }

    return $playery
}

function movePlayerX {
    
    if ($direction -eq 2) {
        $playerx = $playerx + 1
    }
    elseif ($direction -eq 3) {
        $playerx = $playerx - 1
    }

    return $playerx
}

function drawPlayer {

    Write-Host "`r"    

    if ($playery -eq 0) {
        $arrLine1[$playerx] = $player
    }
    elseif ($playery -eq 1) {
        $arrLine2[$playerx] = $player
    }
    elseif ($playery -eq 2) {
        $arrLine3[$playerx] = $player
    }
    elseif ($playery -eq 3) {
        $arrLine4[$playerx] = $player
    }
    elseif ($playery -eq 4) {
        $arrLine5[$playerx] = $player
    }
    elseif ($playery -eq 5) {
        $arrLine6[$playerx] = $player
    }
    elseif ($playery -eq 6) {
        $arrLine7[$playerx] = $player
    }
    elseif ($playery -eq 7) {
        $arrLine8[$playerx] = $player
    }
    elseif ($playery -eq 8) {
        $arrLine9[$playerx] = $player
    }
    elseif ($playery -eq 9) {
        $arrLine10[$playerx] = $player
    }
    elseif ($playery -eq 10) {
        $arrLine11[$playerx] = $player
    }
    elseif ($playery -eq 11) {
        $arrLine12[$playerx] = $player
    }
    elseif ($playery -eq 12) {
        $arrLine13[$playerx] = $player
    }
    elseif ($playery -eq 13) {
        $arrLine14[$playerx] = $player
    }
    elseif ($playery -eq 14) {
        $arrLine15[$playerx] = $player
    }
    elseif ($playery -eq 15) {
        $arrLine16[$playerx] = $player
    }

    return $arrScreen1
    
}

#HAUPTPROGRAMM

Clear-Host

$arrScreen1 = Get-Content $pathScreen1

$arrLine1 = $arrScreen1[0].ToCharArray()
$arrLine2 = $arrScreen1[1].ToCharArray()
$arrLine3 = $arrScreen1[2].ToCharArray()
$arrLine4 = $arrScreen1[3].ToCharArray()
$arrLine5 = $arrScreen1[4].ToCharArray()
$arrLine6 = $arrScreen1[5].ToCharArray()
$arrLine7 = $arrScreen1[6].ToCharArray()
$arrLine8 = $arrScreen1[7].ToCharArray()
$arrLine9 = $arrScreen1[8].ToCharArray()
$arrLine10 = $arrScreen1[9].ToCharArray()
$arrLine11 = $arrScreen1[10].ToCharArray()
$arrLine12 = $arrScreen1[11].ToCharArray()
$arrLine13 = $arrScreen1[12].ToCharArray()
$arrLine14 = $arrScreen1[13].ToCharArray()
$arrLine15 = $arrScreen1[14].ToCharArray()
$arrLine16 = $arrScreen1[15].ToCharArray()

$2darrScreen1 = @($arrLine1, $arrLine2, $arrLine3, $arrLine4, $arrLine5, $arrLine6, $arrLine7, $arrLine8, $arrLine9, $arrLine10, $arrLine11, $arrLine12, $arrLine13, $arrLine14, $arrLine15, $arrLine16)

redraw

do {
    $player = Read-Host "Geben Sie den Spielernamen ein"
} while ($player -eq "")

$arrLine1[0] = $player

Clear-Host

redraw

while ($true) {
    $direction = Wait-KeyPress

    $arrScreen1 = redrawPlayer

    $playerx = movePlayerX
    $playery = movePlayerY

    $arrScreen1 = drawPlayer

    Clear-Host

    redraw
}