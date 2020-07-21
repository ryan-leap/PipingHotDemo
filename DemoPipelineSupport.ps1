function Show-FruitColor {
<#
.SYNOPSIS
    Sample function which does NOT support the pipeline
.PARAMETER Fruit
    Specify a piece of fruit to learn its color
.NOTES
    Author: Ryan Leap
    Email: ryan.leap@gmail.com
#>
    param (
        [ValidateSet('Apple','Banana','Kiwi')]
        [Parameter(Mandatory = $true)]
        [string[]] $Fruit
    )

    $colorMap = @{
        'Apple'  = 'Red'
        'Banana' = 'Yellow'
        'Kiwi'   = 'Green'
    }

    foreach ($pieceOfFruit in $Fruit) {
        Write-Host "[$pieceOfFruit]'s are [$($colorMap[$pieceOfFruit])]" -ForegroundColor $colorMap[$pieceOfFruit]
    }
}

function Show-Pipeline {
<#
.SYNOPSIS
    Super simple function with pipeline support
.PARAMETER Thing
    Specify one or more strings
.NOTES
    Author: Ryan Leap
    Email: ryan.leap@gmail.com
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string] $Thing
    )
    
    begin {
        Write-Verbose "Begin Block"
    }

    process {
        Write-Verbose "Process Block [$Thing]"
    }

    end {
        Write-Verbose "End Block"
    }
}

function Show-FruitColorPipe {
<#
.SYNOPSIS
    Sample function which DOES support the pipeline
.PARAMETER Fruit
    Specify a piece of fruit to learn its color
.NOTES
    Author: Ryan Leap
    Email: ryan.leap@gmail.com
#>
    [CmdletBinding()]

    param (
        [ValidateSet('Apple','Banana','Kiwi')]
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string[]] $Fruit
    )

    begin {
        $colorMap = @{
            'Apple'  = 'Red'
            'Banana' = 'Yellow'
            'Kiwi'   = 'Green'
        }
    }

    process {
        foreach ($pieceOfFruit in $Fruit) {
            Write-Host "[$pieceOfFruit]'s are [$($colorMap[$pieceOfFruit])]" -ForegroundColor $colorMap[$pieceOfFruit]
        }
    }

    end {

    }
}