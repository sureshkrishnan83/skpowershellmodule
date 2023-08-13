function Get-Quote {
    $quote = Invoke-Request https://type.fit/api/quotes -ContentOnly | ConvertFrom-Json
    $random = Get-Random -Minimum -0 -Maximum $quote.count
    return $quote[$random]
        
    }
