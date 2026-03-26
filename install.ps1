$ErrorActionPreference = "Stop"

$IGNORE = @(".DS_Store", ".git", ".gitignore", ".win", "install.sh", "install.ps1", "README.md")

$HERE = Split-Path -Parent $MyInvocation.MyCommand.Path
$HOME_DIR = [Environment]::GetFolderPath("UserProfile")

function Is-Ignored($name) {
    return $IGNORE -contains $name
}

function New-Symlink($target, $link) {
    if (Test-Path $link) {
        $item = Get-Item $link -Force
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
            Write-Output "### Warning: $link already linked"
        } else {
            Write-Output "### $link exists (skip)"
        }
    } else {
        New-Item -ItemType SymbolicLink -Path $link -Target $target | Out-Null
        Write-Output "New-Symlink $link -> $target"
    }
}

Get-ChildItem -Path $HERE -Recurse -File | ForEach-Object {
    $file = $_.FullName
    $rel = $file.Substring($HERE.Length).TrimStart("\","/")
    $name = $_.Name

    if ($rel -match "[\\/]" ) {
        $top = $rel.Split([IO.Path]::DirectorySeparatorChar)[0]
    } else {
        $top = $rel
    }

    if (Is-Ignored $name -or Is-Ignored $top) {
        Write-Output "## ignored: $rel"
        return
    }

    $link_dir = Join-Path $HOME_DIR (Split-Path $rel)
    $link_path = Join-Path $HOME_DIR $rel

    if (-not (Test-Path $link_dir)) {
        New-Item -ItemType Directory -Path $link_dir -Force | Out-Null
        Write-Output "mkdir $link_dir"
    }

    New-Symlink $file $link_path
}
