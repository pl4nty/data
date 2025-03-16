##########################################################################
# DELL PROPRIETARY INFORMATION
#
# This software is confidential.  Dell Inc., or one of its subsidiaries, has supplied this
# software to you under the terms of a license agreement,nondisclosure agreement or both.
# You may not copy, disclose, or use this software except in accordance with those terms.
#
# Copyright 2020 Dell Inc. or its subsidiaries.  All Rights Reserved.
#
# DELL INC. MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF THE SOFTWARE,
# EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.
# DELL SHALL NOT BE LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING,
# MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.
#
#
#
##########################################################################

#$pwwd=Get-Content "c:\temp\userpwd.txt"
Configuration MultipleCatConfiguration
{
 

    Import-DscResource -ModuleName DellBIOSProvider

 
 
    Node $ComputerName {
        POSTBehavior POSTBehaviorSettings    #resource name
        {
          Category = "POSTBehavior"
          Keypad = "EnabledByNumlock"
          PowerWarn = "Disabled"
          Numlock = "Disabled"
          #Password = ""
          #SecurePassword=$pwwd.ToString()
        }

        PowerManagement PowerManagementSettings    #resource name
        {
          Category = "PowerManagement"
          BlockDefinition="1"
          AutoOnHr=15
          AutoOnMn=42
          AdvancedBatteryChargeConfiguration = "Tuesday"
          BeginningOfDay = "10:30"
          WorkPeriod = "15:45"
          PeakShiftDayConfiguration = "Saturday"
          StartTime = "10:30"
          EndTime = "12:30"
          ChargeStartTime = "13:30"          
          #Password = ""
          #SecurePassword=$pwwd.ToString()
          #PathToKey=""
        }

     

        PowerManagement PowerManagementSettings_next    #resource name
        {
          Category = "PowerManagement"
          BlockDefinition="2"
          PeakShiftDayConfiguration = "Sunday"
          StartTime = "10:30"
          EndTime = "12:30"
          ChargeStartTime = "21:45"          
          #Password = ""
          #SecurePassword=$pwwd.ToString()
        }
    }

    Node 10.194.23.55
    {
      POSTBehavior customSettings
      {
        Category = "POSTBehavior"
        Numlock = "Disabled"
      }
    }

}

# Call the configuration. 
# It will create a folder with the same name as configuration name (\POSTBehaviorConfiguration)and will contain mof output file.

MultipleCatConfiguration 


#Push Mof
Start-DscConfiguration -Path .\MultipleCatConfiguration\ -wait -verbose -debug -force


# SIG # Begin signature block
