# This script organizes files based on its name: YYYYMMDD_HHMMSS.txt
# Creating folders following the pattern: YYYY\MM\DD.
# 
# When you run this script in a folder sub-folders will be created by year\month\day and
# the file will be moved into its folder based on the file's name.

cls;

$files = Get-ChildItem;

Foreach($file in $files)
{
    if ($file.Name -match '^\d{8}' -ne $true) {        
       continue;
    }
         
    $year = $null;
    $month = $null;
    $day = $null;

    $date = $matches[0];

    if ($date -match '^\d{4}') { $year = $matches[0]; }

    if ($year -le 1978) {
        continue;
    }

    if ($date.Substring(4,2) -match '^\d{2}') { $month = $matches[0]; }

    if ($date.Substring(6,2) -match '^\d{2}') { $day = $matches[0]; }

    $folder = "$($year)\$($month)\$($day)";

    if (!(Test-Path $folder)){

        New-Item -Path $folder -ItemType directory
       
    }

    Move-Item -Path $file.Name -Destination $folder;

    Write-Output "Files copied successfully";   
    
}
