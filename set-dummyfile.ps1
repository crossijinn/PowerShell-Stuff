function Set-DummyFile {
    param (
        [string]$name="dummy", 
        [Parameter(Mandatory=$true)][string]$destination,
        [Int]$size=1,
        [Int]$number=1
    )
    
    Process{
        
        #Size in GB umrechnen
        $filesize=$size * 1073741824

        #Prüfen ob $Destination exisiertiert, falls nicht wird der Ordner angelegt
        if(-not (Test-Path $destination -PathType Container)){$null =mkdir $destination}

        #Anpassen der $number
        $number=$number+1

        #Wechsel ins richtige Arbeitsverzeichnis
        Set-Location -Path $destination

        #Anlage der Dummy File(s)
        for ($i = 1; $i -lt $number; $i++){
        fsutil.exe file createnew $name-$i $filesize
    }
    }
}