# Variables
$directDownloadLink = "https://download1336.mediafire.com/b0umz4se9eagoLhJAYJhjejwtwQVQYbhp2Tyg5ohZsS6yDnlRyWZIVH_DLlYzILPW9yNo3Q9NxRmJ5Hql305-xLGhCi_PNdMGDVQSye1ydf7BYOmT_C163u0R_rel88sGVkI4D-6gQxBJPv6NMOEUiBBSyvfZ1EbIY__22vA6Vc/bkbndezdyx13owr/skate+3.rar"  # Your MediaFire direct link
$tempPath = "$env:TEMP\skate3.rar"  # Path to download the RAR file in the Temp folder
$desktopPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "skate3")  # Folder to extract to on Desktop

# Download the RAR file from the direct link
Invoke-WebRequest -Uri $directDownloadLink -OutFile $tempPath

# Create the destination folder on the Desktop if it doesn't exist
if (-Not (Test-Path -Path $desktopPath)) {
    New-Item -Path $desktopPath -ItemType Directory
}

# Check if 7-Zip is installed (you may need to adjust the path based on your installation)
$sevenZipPath = "C:\Program Files\7-Zip\7z.exe"

# Extract the RAR file to the Desktop
if (Test-Path -Path $sevenZipPath) {
    & $sevenZipPath x $tempPath -o"$desktopPath" -y
} else {
    Write-Host "7-Zip is not installed. Please install it to extract RAR files."
}

# Remove the RAR file from temp after extraction
Remove-Item -Path $tempPath -Force

# Notify the user that extraction is complete
Write-Host "File downloaded and extracted to $desktopPath"

# Exit the script
exit
