###############################################################################
# Andy's PowerShell Profile
###############################################################################

###############################################################################
# Modules
###############################################################################

### Powershell Community Extensions
Import-Module Pscx -arg "$(Split-Path $profile -parent)\Pscx.UserPreferences.ps1"

### Posh Git
Import-Module posh-git
Enable-GitColors

###############################################################################
# Variables
###############################################################################

[System.Environment]::SetEnvironmentVariable("HOME", (Join-Path $Env:HomeDrive $Env:HomePath), "Process")

set-variable -name "vimfile"            -value "c:\program files\vim\vim72\vimrc_example.vim"
set-variable -name "p"                  -value "$profile"
set-variable -name "unxutilshome"       -value "c:\home\downloads\unxutils\usr\local\wbin"

set-variable -name "guestdesktop"       -value "c:\documents and settings\awhite\desktop"
set-variable -name "hostdesktop"        -value "z:\Users\awhite\Desktop"

###############################################################################
# Aliases/Functions
###############################################################################

set-alias -Name "which"     -Value "gcm"

set-alias -Name "reflector" -Value "c:\home\downloads\reflector\reflector\reflector.exe"

set-alias -Name "find"      -Value "${unxutilshome}\find.exe"
set-alias -Name "uman"      -Value "${unxutilshome}\man.exe"
set-alias -Name "tail"      -Value "${unxutilshome}\tail.exe"
set-alias -Name "lf"        -Value "Get-ChildItemColor"
 
function ee                 { Edit-File $p }
function ev                 { Edit-File $vimfile }
function exhere             { explorer.exe . }

#function env                { ls env: | ft -HideTableHeader }
function path               { $env:path.Split(';') }

function flogs              { find . -name *.log -print }
function elogs              { findlogs | xargs gvim }
function gologs             { find . -iname Logs -print | cd }

function la                 { ls -Force }
function lsd                { ls | sort -prop LastWriteTime -desc } 

function srch
{
    param([string]$search = $null)

    if (($search -eq $null) -or ($search -eq ""))
    {
        write-host -foregroundcolor Red "Usage: srch <search>"
        return
    }

    get-childitem -recurse -force -name |
        where-object { $_ -match "$search" }
}

# Needs some work to filter out "binary" files
function rgrep
{
    param([string]$search = $null)

    if (($search -eq $null) -or ($search -eq ""))
    {
        write-host -foregroundcolor Red "Usage: rgrep <search>"
        return
    }

    get-childitem -recurse -force -exclude *.exe,*.dll |
        where-object { $_.PSIsContainer -eq $false } |
        select-string -pattern "$search"
}

### CD Shortcuts

function back               { cd - }
function up                 { cd .. }
function up2                { cd ..\.. }
function up3                { cd ..\..\.. }
function up4                { cd ..\..\..\.. }
function up5                { cd ..\..\..\..\.. }
function up6                { cd ..\..\..\..\..\.. }
function up7                { cd ..\..\..\..\..\..\.. }
function home               { cd "c:\home" }
function tfs                { cd "c:\tfs" }
function winhome            { cd "c:\documents and settings\awhite" }
function desktop            { cd "$guestdesktop" }
function githome            { cd "c:\home\git" }
function hghome             { cd "c:\home\hg" }
function prog               { cd "c:\Program Files\" }
function bluedot            { cd "c:\Program Files\Blue Dot" }
function ameam              { cd "c:\Program Files\Blue Dot\Advanced Mobile EAM\" }
function pshome             { cd "c:\Documents and Settings\awhite\My Documents\WindowsPowerShell" }
function psroot             { cd "c:\windows\system32\WindowsPowerShell\v1.0" }
function psmods             { cd "c:\windows\system32\WindowsPowerShell\v1.0\Modules" }
function tfshome            { cd "c:\tfs" }
function eamtrunk           { cd "c:\tfs\Partner - Infor\Trunk" }
function eamcoretrunk       { cd "c:\tfs\Partner - Infor\Trunk\EamCore\Trunk" }
function eamworktrunk       { cd "c:\tfs\Partner - Infor\Trunk\EamWork\Trunk" }
function eaminvtrunk        { cd "c:\tfs\Partner - Infor\Trunk\EamInventory\Trunk" }
function eamcorecta         { cd "c:\tfs\Partner - Infor\Branches\CTA1.0\Trunk\EamCore\Trunk" }
function eamworkcta         { cd "c:\tfs\Partner - Infor\Branches\CTA1.0\Trunk\EamWork\Trunk" }
function eaminvcta          { cd "c:\tfs\Partner - Infor\Branches\CTA1.0\Trunk\EamInventory\Trunk" }
function eamcorehannaford   { cd "c:\tfs\Partner - Infor\Branches\Hannaford1.0\Trunk\EamCore\Trunk" }
function eamworkhannaford   { cd "c:\tfs\Partner - Infor\Branches\Hannaford1.0\Trunk\EamWork\Trunk" }
function eaminvhannaford    { cd "c:\tfs\Partner - Infor\Branches\Hannaford1.0\Trunk\EamInventory\Trunk" }

function mobilebin          { cd "Construction\Mobile\Source\BlueDot.Eam.Work.Mobile\bin\Debug" }
function mobilelogs         { cd "Construction\Mobile\Source\BlueDot.Eam.Work.Mobile\bin\Debug" }
function serverbin          { cd "Construction\Server\Source\BlueDot.Eam.Work.Server\" }
function serverlogs         { serverbin; cd Logs }

function scher              { cd "c:\TFS\Customer - Schering-Plough\Schering-Plough.Root\Schering-Plough" }

###############################################################################
# Git Shortcuts
###############################################################################

function gs                 { & git status }

# function gss{
# 	$cd = pwd
# 	(Get-ChildItem Library\Plugins) | % {
# 		cd $_.FullName
# 		Write-Host $_.Name -ForegroundColor Cyan
# 		& git status
# 		""
# 	}
# 	cd $cd
# 	Write-host "current project" -ForegroundColor DarkCyan
# 	& git status
# }
# function ga{
# 	& git add, .
# 	& git add, -u
# 	gs
# }
# function gitc{
# 	param(
# 	[string]$msg = (Read-Host -Prompt "Commit Message")
# 	)
# 	& git commit,-m,$msg
# }
#  
# function vsh {
#     param ($param)
#    
#     if ($param -eq $NULL)
#     {
#         "A solution was not specified, opening the first one found."
#         $solutions = get-childitem | ?{ $_.extension -eq ".sln" }
#     }
#     else
#     {
#         "Opening {0} " -f $param
#         vs $param
#         break
#     }
#
#     if ($solutions.count -gt 1)
#     {
#         "Opening {0} " -f $solutions[0].Name
#         vs $solutions[0].Name
#     }
#     else
#     {
#         "Opening {0} " -f $solutions.Name
#         vs $solutions.Name
#     }
# }

function prompt
{
#    # Fun stuff if using the standard PowerShell prompt; not useful for Console2.
#    # This, and the variables above, could be commented out.
#    if($UserType -eq "Admin")
#    {
#        $host.UI.RawUI.WindowTitle = "" + $(get-location) + " : Admin"
#        $host.UI.RawUI.ForegroundColor = "white"
#    }
#    else
#    {
#        $host.ui.rawui.WindowTitle = $(get-location)
#    }
    
    Write-Host("")

    $status_string = ""

    # check to see if this is a directory containing a symbolic reference, 
    # fails (gracefully) on non-git repos.
    $symbolicref = git symbolic-ref HEAD
    if($symbolicref -ne $NULL)
    {
        # if a symbolic reference exists, snag the last bit as our
        # branch name. eg "[master]"
        $status_string += "GIT [" + `
            $symbolicref.substring($symbolicref.LastIndexOf("/") +1) + "] "
        
        # grab the differences in this branch    
        # $differences = (git diff-index --name-status HEAD)
        
        # use a regular expression to count up the differences.
        # M`t, A`t, and D`t refer to M {tab}, etc.
        # $git_update_count = [regex]::matches($differences, "M`t").count
        # $git_create_count = [regex]::matches($differences, "A`t").count
        # $git_delete_count = [regex]::matches($differences, "D`t").count
        
        # place those variables into our string.
        # $status_string += "A:" + $git_create_count + `
            # " M:" + $git_update_count + `
            # " D:" + $git_delete_count + " "
    }
    else
    {
        # Not in a Git environment, must be PowerShell!
        $status_string = "PS "
    }
    
    # write out the status_string with the approprate color. 
    # prompt is done
    if ($status_string.StartsWith("GIT"))
    {
        Write-Host ($status_string + $(get-location) + ">") -nonewline -foregroundcolor yellow
    }
    else
    {
        Write-Host ($status_string + $(get-location) + ">") -nonewline -foregroundcolor green
    }

    return " "
}
 
function Get-ChildItemColor
{
    $fore = $Host.UI.RawUI.ForegroundColor
 
    Invoke-Expression ("Get-ChildItem -Force $args") | % `
    {
        if ($_.GetType().Name -eq 'DirectoryInfo')
        {
            $Host.UI.RawUI.ForegroundColor = 'Blue'
            echo $_
            $Host.UI.RawUI.ForegroundColor = $fore
        }
        elseif ($_.Name -match '\.(zip|tar|gz|rar)$')
        {
            $Host.UI.RawUI.ForegroundColor = 'Blue'
            echo $_
            $Host.UI.RawUI.ForegroundColor = $fore
        }
        elseif ($_.Name -match '\.(exe|bat|cmd|py|pl|ps1|psm1|vbs|rb|reg)$')
        {
            $Host.UI.RawUI.ForegroundColor = 'Green'
            echo $_
            $Host.UI.RawUI.ForegroundColor = $fore
        }
        elseif ($_.Name -match '\.(txt|cfg|conf|ini|csv|sql|xml|config)$')
        {
            $Host.UI.RawUI.ForegroundColor = 'Cyan'
            echo $_
            $Host.UI.RawUI.ForegroundColor = $fore
        }
        elseif ($_.Name -match '\.(cs|asax|aspx.cs)$')
        {
            $Host.UI.RawUI.ForegroundColor = 'Yellow'
            echo $_
            $Host.UI.RawUI.ForegroundColor = $fore
        }
        elseif ($_.Name -match '\.(aspx|spark|master)$')
        {
            $Host.UI.RawUI.ForegroundColor = 'DarkYellow'
            echo $_
            $Host.UI.RawUI.ForegroundColor = $fore
        }
        elseif ($_.Name -match '\.(sln|csproj)$')
        {
            $Host.UI.RawUI.ForegroundColor = 'Magenta'
            echo $_
            $Host.UI.RawUI.ForegroundColor = $fore
        }
        else
        {
            $Host.UI.RawUI.ForegroundColor = $fore
            echo $_
        }
    }
}

