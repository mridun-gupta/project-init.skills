<#
.SYNOPSIS
  Installs the project-init skill into AI tool skill directories.

.DESCRIPTION
  Copies skills/project-init from this repo into one or more global skill
  locations. Run from the repo root or pass -Source.

.EXAMPLE
  .\scripts\install.ps1                 # universal dir only (~/.agents/skills)
  .\scripts\install.ps1 -All            # every known location
  .\scripts\install.ps1 -Target claude,cursor   # specific tools
  .\scripts\install.ps1 -List           # show targets and exit
#>
[CmdletBinding()]
param(
  [string]$Source = (Join-Path $PSScriptRoot '..\skills\project-init'),
  [string[]]$Target = @('agents'),
  [switch]$All,
  [switch]$List
)

$ErrorActionPreference = 'Stop'
$src = (Resolve-Path $Source).Path
if (-not (Test-Path (Join-Path $src 'SKILL.md'))) { throw "No SKILL.md under $src" }

$HOME_ = $HOME
$targets = [ordered]@{
  'agents'     = Join-Path $HOME_ '.agents\skills'                                    # Devin, Cursor, Codex, Copilot, Gemini CLI, Zed, Cline
  'claude'     = Join-Path $HOME_ '.claude\skills'                                    # Claude Code
  'codex'      = Join-Path $HOME_ '.codex\skills'                                     # Codex (legacy path, still read)
  'cursor'     = Join-Path $HOME_ '.cursor\skills'                                    # Cursor native (syncs to Cloud Agents)
  'copilot'    = Join-Path $HOME_ '.copilot\skills'                                   # VS Code Copilot / Copilot CLI
  'antigravity'= Join-Path $HOME_ '.gemini\config\skills'                             # Antigravity IDE + CLI (global)
  'gemini'     = Join-Path $HOME_ '.gemini\skills'                                    # Gemini CLI
  'windsurf'   = Join-Path $HOME_ '.codeium\windsurf\skills'                          # Windsurf (channel: windsurf)
  'kiro'       = Join-Path $HOME_ '.kiro\skills'                                      # Kiro
  'devin'      = Join-Path $env:APPDATA 'devin\skills'                                # Devin CLI native (Windows)
  'amp'        = Join-Path $HOME_ '.config\agents\skills'                             # Amp
  'opencode'   = Join-Path $HOME_ '.config\opencode\skills'                           # OpenCode
  'roo'        = Join-Path $HOME_ '.roo\skills'                                       # Roo Code
}

if ($List) { $targets.GetEnumerator() | ForEach-Object { "{0,-12} {1}" -f $_.Key, $_.Value }; return }

$chosen = if ($All) { $targets.Keys } else { $Target }
foreach ($t in $chosen) {
  if (-not $targets.Contains($t)) { Write-Warning "unknown target '$t' (use -List)"; continue }
  $dest = Join-Path $targets[$t] 'project-init'
  New-Item -ItemType Directory -Force -Path $dest | Out-Null
  Copy-Item -Recurse -Force -Path (Join-Path $src '*') -Destination $dest
  Write-Host "installed -> $dest"
}
Write-Host "Done. Invoke with /project-init (or `$project-init in Codex)."
