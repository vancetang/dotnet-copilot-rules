<#
.SYNOPSIS
    Install Copilot skills to ~/.copilot/skills

.PARAMETER List
    List available skills

.PARAMETER All
    Install all skills

.PARAMETER Skills
    Specific skill names to install

.EXAMPLE
    .\install-skills.ps1 -List

.EXAMPLE
    .\install-skills.ps1 -All

.EXAMPLE
    .\install-skills.ps1 dotnet-test dotnet-dependency
#>
param(
    [switch]$List,
    [switch]$All,
    [Parameter(ValueFromRemainingArguments)]
    [string[]]$Skills
)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir
$SkillsSrc = Join-Path $RepoRoot ".github\skills"
$TargetDir = Join-Path $env:USERPROFILE ".copilot\skills"

function Get-AvailableSkills {
    Get-ChildItem -Path $SkillsSrc -Directory | Where-Object {
        Test-Path (Join-Path $_.FullName "SKILL.md")
    } | ForEach-Object { $_.Name }
}

function Show-Skills {
    Write-Host "Available skills:" -ForegroundColor Cyan
    Write-Host ""

    foreach ($skillDir in Get-ChildItem -Path $SkillsSrc -Directory) {
        $skillFile = Join-Path $skillDir.FullName "SKILL.md"
        if (Test-Path $skillFile) {
            $content = Get-Content $skillFile -Raw
            $desc = ""
            if ($content -match "description:\s*(.+)") {
                $desc = $Matches[1].Substring(0, [Math]::Min(60, $Matches[1].Length)) + "..."
            }
            Write-Host ("  {0,-20} {1}" -f $skillDir.Name, $desc)
        }
    }
}

function Install-Skill {
    param([string]$SkillName)

    $src = Join-Path $SkillsSrc $SkillName
    $dest = Join-Path $TargetDir $SkillName

    if (-not (Test-Path $src)) {
        Write-Error "Skill '$SkillName' not found"
        return
    }

    Write-Host "Installing $SkillName -> $dest"

    if (-not (Test-Path $dest)) {
        New-Item -ItemType Directory -Path $dest -Force | Out-Null
    }

    Copy-Item -Path "$src\*" -Destination $dest -Recurse -Force
}

if ($List) {
    Show-Skills
    exit 0
}

$SkillsToInstall = @()

if ($All) {
    $SkillsToInstall = Get-AvailableSkills
}
elseif ($Skills -and $Skills.Count -gt 0) {
    $SkillsToInstall = $Skills
}
else {
    Write-Host "No skills specified. Use -All or provide skill names." -ForegroundColor Yellow
    Write-Host ""
    Show-Skills
    exit 1
}

if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
}

Write-Host "Installing to $TargetDir" -ForegroundColor Cyan
Write-Host ""

foreach ($skill in $SkillsToInstall) {
    Install-Skill -SkillName $skill
}

Write-Host ""
Write-Host "Done! Installed $($SkillsToInstall.Count) skill(s)." -ForegroundColor Green
