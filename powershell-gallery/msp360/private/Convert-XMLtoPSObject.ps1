function Convert-XMLtoPSObject {

    [cmdletbinding()]
    Param
    (
      [Parameter(Mandatory = $True, ValueFromPipeLine = $True)]
      [Xml.XmlElement[]]
      $XML
    )

    Begin {
        $PSO = @()
    }
    Process {

        function Convert-ValueType {
            [cmdletbinding()]
            Param
            (
              [Parameter(Mandatory = $True, ValueFromPipeLine = $True)]
              [AllowEmptyString()]
              [string]$InputString
            )

            Process {
                Switch -regex ($InputString) {
                    '^\d+\.\d{4}$' {
                        [Double]$DoubleValue = $InputString
                        $OutputValue = $DoubleValue
                    }
                    '^\d+$' {
                        if ($InputString -as [int] -is [int]) {
                            [int]$IntegerValue = $InputString
                        } elseif ($InputString -as [long] -is [long]) {
                            [long]$IntegerValue = $InputString
                        } else {
                            [string]$IntegerValue = $InputString
                        }
                        $OutputValue = $IntegerValue
                    }
                    '^(true|false)$' {
                        if ($InputString -imatch "true") {
                            [Bool]$BooleanValue = $True
                        } else {
                            [Bool]$BooleanValue = $False
                        }
                        $OutputValue = $BooleanValue
                    }
                    Default {
                        $OutputValue = $InputString
                    }
                }
                return $OutputValue
            }
        }

        ForEach ($Node in $XML) {
            $Properties = $Node | Get-Member -MemberType Property
            $Object = New-Object -TypeName PSObject
            Foreach ($Property in $Properties) {
                $PropertyName = $Property.Name
                Switch -Wildcard ($Property.Definition) {
                    "string*" {
                        $Value = $Node.$PropertyName | Convert-ValueType
                        Add-Member -InputObject $Object -MemberType NoteProperty -Name $PropertyName -Value $Value
                    }
                    "System.Xml.XmlElement*" {
                        $Value = $Node.$PropertyName | Convert-XMLtoPSObject
                        Add-Member -InputObject $Object -MemberType NoteProperty -Name $PropertyName -Value $Value
                    }
                    "System.Object*" {
                        $Value = @()
                        Foreach ($Item in $Node.$PropertyName) {
                            if ($Item -is [Xml.XmlElement]) {
                                $Value += $Item | Convert-XMLtoPSObject
                            } else {
                                $Value += $Item | Convert-ValueType
                            }
                        }
                        Add-Member -InputObject $Object -MemberType NoteProperty -Name $PropertyName -Value $Value
                    }
                }
            }
        }
        $PSO += $Object
    }

    End {
        Return $PSO
    }
}

# SIG # Begin signature block
