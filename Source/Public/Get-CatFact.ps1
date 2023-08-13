function Get-Catfact {
    $result = Invoke-Request -Uri "https://catfact.ninja/fact" -ContentOnly | ConvertFrom-Json
    return $result.fact
}