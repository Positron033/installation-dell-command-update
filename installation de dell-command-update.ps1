#création d'un fichier temporaire
New-Item -Path "c:\temp -ItemType Directory"

#téléchargement du fichier
Invoke-WebRequest -Uri "https://dl.dell.com/FOLDER06231658M/1/Dell-Command-Update-Application-for-Windows-10_34T96_WIN_3.1.2_A00.EXE"  -OutFile "C:\temp\Dell-Command-Update-Application-for-Windows-10_34T96_WIN_3.1.2_A00.EXE" 

#verification du téléchargement du fichier
if (Test-Path -path "C:\temp\Dell-Command-Update-Application-for-Windows-10_34T96_WIN_3.1.2_A00.EXE") {
    #lancement de l'installation
    write-host "installation de dell command update en cours..." -ForegroundColor Green
    Start-Process C:\temp\Dell-Command-Update-Application-for-Windows-10_34T96_WIN_3.1.2_A00.EXE -PassThru -ArgumentList "/S" -wait 

    #suppression du fichier temporaire
    Write-Host "suppression du fichier temporaire...installation terminée" -ForegroundColor Green
    Remove-Item C:\temp -Recurse -Force  

}

else {

    if (-not (Test-Path -path "C:\temp\Dell-Command-Update-Application-for-Windows-10_34T96_WIN_3.1.2_A00.EXE"))
    {
    
        Remove-Item C:\temp -Recurse -Force
        Write-Host "téléchargement echoué ou fichier d'installation introuvable" -ForegroundColor Red

    }
}