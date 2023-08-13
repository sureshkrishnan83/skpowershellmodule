#Region './Private/Invoke-Request.ps1' 0
function Invoke-Request {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 1)]
        [uri]$Uri,

        [switch]$ContentOnly
    )

    $params = @{
        UseBasicParsing = $true
        Uri = $Uri
    }

    $result = Invoke-WebRequest @params
    if ($ContentOnly.IsPresent) {
        return $result.Content
    } else {
        return $result
    }
}
#EndRegion './Private/Invoke-Request.ps1' 22
#Region './Public/Get-CatFact.ps1' 0
function Get-Catfact {
    $result = Invoke-Request -Uri "https://catfact.ninja/fact" -ContentOnly | ConvertFrom-Json
    return $result.fact
}
#EndRegion './Public/Get-CatFact.ps1' 5
#Region './Public/Get-Quote.ps1' 0
function Get-Quote {
    $quote = Invoke-Request https://type.fit/api/quotes -ContentOnly | ConvertFrom-Json
    $random = Get-Random -Minimum -0 -Maximum $quote.count
    return $quote[$random]
        
    }
#EndRegion './Public/Get-Quote.ps1' 7
#Region './Public/Get-Weather.ps1' 0
function Get-Weather {
  Invoke-Request -Uri "https://wttr.in" -ContentOnly }
#EndRegion './Public/Get-Weather.ps1' 3
