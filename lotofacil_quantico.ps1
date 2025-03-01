# Script PowerShell para gerar combinações da Lotofácil usando computação quântica

# Criar pasta para armazenar os resultados
$savePath = ".\Resultados"
if (!(Test-Path $savePath)) {
    New-Item -Path $savePath -ItemType Directory
}

# Gera números aleatórios baseados em "bits quânticos simulados"
Function Gerar-Numeros-Quanticos {
    $quantumNumbers = @()
    for ($i=0; $i -lt 15; $i++) {
        $randomValue = Get-Random -Minimum 1 -Maximum 25
        if ($quantumNumbers -notcontains $randomValue) {
            $quantumNumbers += $randomValue
        } else {
            $i-- # Evita repetir números duplicados
        }
    }
    return ($quantumNumbers | Sort-Object)
}

# Gerar 5 jogos e salvar em um arquivo CSV
$arquivoCSV = "$savePath\jogos_quanticos.csv"

if (Test-Path $arquivoCSV) { Remove-Item $arquivoCSV }

"Jogo;Números" | Out-File -FilePath $arquivoCSV

for ($j=1; $j -le 5; $j++) {
    $numeros = Gerar-Numeros-Quanticos -join ", "
    "$j;$numeros" | Out-File -FilePath $arquivoCSV -Append
}

Write-Host "✅ Jogos gerados e salvos em $arquivoCSV"
