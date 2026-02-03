#!/usr/bin/env pwsh
# Install mydearmentor skill for AI coding agents without marketplace
# Usage: .\install.ps1 [-Agent <agent>] [-Scope <scope>] [-ProjectPath <path>]

param(
    [ValidateSet("claude", "codex", "gemini", "all")]
    [string]$Agent = "all",

    [ValidateSet("global", "project")]
    [string]$Scope = "global",

    [string]$ProjectPath = (Get-Location).Path
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SourceFile = Join-Path (Split-Path -Parent $ScriptDir) "skills\mydearmentor\SKILL.md"

if (-not (Test-Path $SourceFile)) {
    Write-Error "Source file not found: $SourceFile"
    exit 1
}

function Install-ClaudeCode {
    param([string]$Scope, [string]$ProjectPath)

    if ($Scope -eq "global") {
        $TargetDir = Join-Path $env:USERPROFILE ".claude\skills\mydearmentor"
    } else {
        $TargetDir = Join-Path $ProjectPath ".claude\skills\mydearmentor"
    }

    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }

    $TargetFile = Join-Path $TargetDir "SKILL.md"
    Copy-Item $SourceFile $TargetFile -Force
    Write-Host "[Claude Code] Installed to: $TargetFile" -ForegroundColor Green
    Write-Host "  Tip: You can also use /plugin install mydearmentor@qs3c/my-dear-mentor" -ForegroundColor Gray
}

function Install-Codex {
    param([string]$Scope, [string]$ProjectPath)

    if ($Scope -eq "global") {
        $CodexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE ".codex" }
        $TargetDir = Join-Path $CodexHome "skills\mydearmentor"
    } else {
        $TargetDir = Join-Path $ProjectPath ".codex\skills\mydearmentor"
    }

    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }

    $TargetFile = Join-Path $TargetDir "SKILL.md"
    Copy-Item $SourceFile $TargetFile -Force
    Write-Host "[Codex] Installed to: $TargetFile" -ForegroundColor Green
}

function Install-GeminiCLI {
    param([string]$Scope, [string]$ProjectPath)

    if ($Scope -eq "global") {
        $TargetDir = Join-Path $env:USERPROFILE ".gemini\skills\mydearmentor"
    } else {
        $TargetDir = Join-Path $ProjectPath ".gemini\skills\mydearmentor"
    }

    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }

    $TargetFile = Join-Path $TargetDir "SKILL.md"
    Copy-Item $SourceFile $TargetFile -Force
    Write-Host "[Gemini CLI] Installed to: $TargetFile" -ForegroundColor Green
}

Write-Host "Installing mydearmentor skill..." -ForegroundColor Cyan
Write-Host "Scope: $Scope" -ForegroundColor Gray
if ($Scope -eq "project") {
    Write-Host "Project: $ProjectPath" -ForegroundColor Gray
}
Write-Host ""

switch ($Agent) {
    "claude" { Install-ClaudeCode -Scope $Scope -ProjectPath $ProjectPath }
    "codex"  { Install-Codex -Scope $Scope -ProjectPath $ProjectPath }
    "gemini" { Install-GeminiCLI -Scope $Scope -ProjectPath $ProjectPath }
    "all" {
        Install-ClaudeCode -Scope $Scope -ProjectPath $ProjectPath
        Install-Codex -Scope $Scope -ProjectPath $ProjectPath
        Install-GeminiCLI -Scope $Scope -ProjectPath $ProjectPath
    }
}

Write-Host ""
Write-Host "Done!" -ForegroundColor Green
