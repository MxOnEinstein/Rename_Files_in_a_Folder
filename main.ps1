$folderPath = "C:\your\folder"

$fileList = Get-ChildItem -Path $folderPath

$numPhotos = $fileList.Count

$digits = 4 

for ($i = 0; $i -lt $numPhotos; $i++) {
    $currentFile = $fileList[$i]

    $newNumber = [int]($currentFile.BaseName.Substring($currentFile.BaseName.Length - $digits)) + $numPhotos
    $newFilename = $currentFile.BaseName.Substring(0, $currentFile.BaseName.Length - $digits) + $newNumber.ToString().PadLeft($digits, '0')
    
    $newPath = Join-Path -Path $currentFile.DirectoryName -ChildPath ($newFilename + $currentFile.Extension)
    
    Rename-Item -Path $currentFile.FullName -NewName $newPath
}

Write-Host "Renamed $numPhotos photos.
