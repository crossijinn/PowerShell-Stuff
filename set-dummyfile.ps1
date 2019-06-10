function Set-DummyFile {
    param (
        [string]$name, 
        [string]$destination,
        [Int]$size,
        [Int]$number
    )
    
    Process{
        
        #Size in GB umrechnen
        $size=$size * 1073741824

        #Prüfen ob $Destination exisiertiert, falls nicht wird der Ordner angelegt
        if(-not (Test-Path $destination -PathType Container)){$null =mkdir $destination}

        #Anpassen der $number
        $number=$number+1
        
        #Wechsel ins richtige Arbeitsverzeichnis
        Set-Location -Path $destination

        #Anlage der Dummy File(s)
        for ($i = 1; $i -lt $number; $i++){
        fsutil.exe file createnew $name-$i $size
    }
    }
}