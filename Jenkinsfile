pipeline {
    agent any
    
    stages {
        stage('Execute PowerShell on Windows') {
            steps {
                script {
                    // Define the PowerShell command you want to execute
                    def powershellCommand = '''
                        Write-Host "Hello from PowerShell"
                        # Add more PowerShell commands here
                    '''
                    
                    // Define the target Windows server details
                    def windowsServer = [
                        host: '192.168.100.5', // IP address or hostname of the Windows server
                        user: 'vboxuser', // Username for SSH authentication
                        privateKey: 
                        '''
-----BEGIN RSA PRIVATE KEY----- 
MIIEpAIBAAKCAQEAt4MDJGcfewZ44T9ekVEJ8P7SZTm+SxgI9TieMREs2V0zS/LS
B5Le6Wio1cjumzFHyEq0odtn8hnvcjJWE5zxuImQyeuALyISBfT8C1I8x+6z4aUh 
i6TvkuncyllSUOJBpLCHOCsGUnDyf3d8pasQdYGkYIJk5A74LWalHWTGUPlZDpQM
NYqXrMTbRduuD40vtkppSbjwSFLNQi3GnRo+RePJDT6/9yh8awxc1k4IRMRXQDGG
4m0kiNf2L6gUV9MIa6O8O564N14j6e1ZJoI4WX9WlJ0dqE0Vpv+63tl0bPdv5XDX 
zhyFyo+075BCCzly71qb8T4k+LccmYp2IlULCwIDAQABAoIBACOulsLSRl2+gWyS
zMmGr18rvS8vjh+92agMzT2PMGBHbfz7hvkwBqXt0r5W5oZIi8OXOw4pwklh35wd
y3zezGVsYjnQz8jaYBTGcOemoujhMhrS5/XmKSswy9yQh5/wjoD+ThyOyRjom05L
pnH0FCw0/AhD8mghvQHe7oYLnUALF36bK/6rnwVkDvbJp1E430SFeJdXsDR1sxlz 
c6SuA2kcuGoIenTE78mD6fKiECbUYv6kbSW8ufm+QdfPR66DarERs9HagoSRpr55
FtYi4xtEolnrWhv8j0L9rq+QpwhAU9SiX7ZfsIzrYkH3jR2IBP0NYocLzi/6yzpR
Bzsw30ECgYEA4Chpf/RKZO9pQm6LVgbKghBoopzSwb+/k+q/jwf/w3MewoUPq7qD
31aHq9k4CoEHwjtkHk5Rz+g+FwMbsRicQYXROF39D+fQPubwYdU0Zg6W5TIbd24q
1djEZFpdcBgwHt1G9UA32CMcBxzByHtGgBJ+yAA2iZj73JgWA87TEeECgYEA0ZR9
OVlOOhJ0hVt9dnPAzNbI8Xg9MsT3R0Kv6GMbkBNQfv5KwKPBG/8Md3tJpUXOGohh
QEaaqdE7o/Lt6YJKa5n6CIZ/MlLivwUe+Ki4AmyAtWWGnGBe5PMykLtXiuRuW9c9 
3fV3acy9Pjguin79pVssebYKVZuJw/icQL2y0msCgYEAnDPtGKo+cUnYWt+3nxIK
akpO8ApCX5tkQApUxLI5S5TcOYcJ3YySur6MuncbM06o/nPul6PSJQRcyCJ1WJqi
wJIkspfkcgIDPuIlXrd41SmTg1HAjCAsH2r3qErEVAm29rsR6HOAts/4hwhGDZPC 
FBtPV8W2O3ptAFLG/I5SzWECgYAivRkwm1PzHkIAJNUcAD3R9jwigkqqkqlmP3CG
9X6JGBp8okvjuID20gTP/TiM05BBJ5/vFoTmZw8astaqoPUS9tfR9/E3dzOsc/3Z
O6YciL2g065HV1YDXyhfgx4UoJ6GTJwtoVVkzRIFMSzNuhTzBrTNi9YUsI5aVGgZ
9xef9wKBgQCbxxqQ2ffwTDx/sBQk71gfVHEfP7+xPkdA8RShjQDdNtSL//p1EKLG
AryaJxOUv+Qc8D5ZN6wSSlbhyxKm1V2u3TQXTgZb5zWnab+WsZiQLWjw4kuGYqbx 
cTEBitort0BYgMpYVU2d+P/8gaJ+S3vEWsJJN9ZbS7ITOtNK+1NtKA==
-----END RSA PRIVATE KEY-----
''' // Private key for SSH authentication
                    ]
                    
                    // Execute PowerShell command on the Windows server using SSH key-based authentication
                    sh "ssh -i <<< ${windowsServer.privateKey} ${windowsServer.user}@${windowsServer.host} \"powershell.exe -Command '${powershellCommand}'\""
                }
            }
        }
    }
}
