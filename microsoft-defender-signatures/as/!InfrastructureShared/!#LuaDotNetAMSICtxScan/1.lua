local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_AMSI_APPNAME
L0_1, L1_1 = L0_1(L1_1, L2_1)
if not (L0_1 and L1_1) or L1_1 ~= "DotNet" and L1_1 ~= "coreclr" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "Lua:IsDotNetAMSIScan"
L2_1(L3_1)
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L2_1, L3_1 = L2_1(L3_1, L4_1)
if not L2_1 or not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = sysio
L4_1 = L4_1.GetFileNameFromProcess
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = sysio
L5_1 = L5_1.GetLastResult
L5_1 = L5_1()
L5_1 = L5_1.Success
if not L5_1 or not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:IsDotNetAMSIScan_NoProcess"
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = false
L6_1 = string
L6_1 = L6_1.lower
L7_1 = L4_1
L6_1 = L6_1(L7_1)
L4_1 = L6_1
L6_1 = #L4_1
if 15 <= L6_1 then
  L7_1 = L4_1
  L6_1 = L4_1.sub
  L8_1 = -15
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == "\\powershell.exe" then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:IsDotNetAMSIScan_PowerShell"
    L6_1(L7_1)
end
else
  L6_1 = #L4_1
  if 12 <= L6_1 then
    L7_1 = L4_1
    L6_1 = L4_1.sub
    L8_1 = -12
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= "\\wscript.exe" then
      L7_1 = L4_1
      L6_1 = L4_1.sub
      L8_1 = -12
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= "\\cscript.exe" then
        goto lbl_103
      end
    end
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:IsDotNetAMSIScan_WScript"
    L6_1(L7_1)
  else
    ::lbl_103::
    L6_1 = #L4_1
    if 17 <= L6_1 then
      L7_1 = L4_1
      L6_1 = L4_1.sub
      L8_1 = -17
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 == "\\inetsrv\\w3wp.exe" then
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "Lua:IsDotNetAMSIScan_IIS"
        L6_1(L7_1)
        L6_1 = mp
        L6_1 = L6_1.GetProcessCommandLine
        L7_1 = L3_1
        L6_1 = L6_1(L7_1)
        L7_1 = string
        L7_1 = L7_1.find
        L8_1 = L6_1
        L9_1 = "-ap \"MSExchange"
        L10_1 = 1
        L11_1 = true
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if not L7_1 then
          L7_1 = string
          L7_1 = L7_1.find
          L8_1 = L6_1
          L9_1 = "-ap \"MSUccPowerShellAppPool"
          L10_1 = 1
          L11_1 = true
          L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
          if not L7_1 then
            L7_1 = string
            L7_1 = L7_1.find
            L8_1 = L6_1
            L9_1 = "-ap \"MSUccPswsFrontEndAppPool"
            L10_1 = 1
            L11_1 = true
            L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
            if not L7_1 then
              L7_1 = string
              L7_1 = L7_1.find
              L8_1 = L6_1
              L9_1 = "-ap \"MSUccPowerShellLiveIdAppPool"
              L10_1 = 1
              L11_1 = true
              L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
              if not L7_1 then
                goto lbl_160
              end
            end
          end
        end
        L7_1 = mp
        L7_1 = L7_1.set_mpattribute
        L8_1 = "Lua:IsDotNetAMSIScan_Exchg"
        L7_1(L8_1)
        goto lbl_301
        ::lbl_160::
        L7_1 = string
        L7_1 = L7_1.find
        L8_1 = L6_1
        L9_1 = "-ap \""
        L10_1 = 1
        L11_1 = true
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if L7_1 == nil then
          L7_1 = IsExchangeServer
          L7_1 = L7_1()
          if L7_1 ~= nil then
            L7_1 = mp
            L7_1 = L7_1.set_mpattribute
            L8_1 = "Lua:IsDotNetAMSIScan_ExchgPlatform"
            L7_1(L8_1)
        end
        else
          L7_1 = string
          L7_1 = L7_1.find
          L8_1 = L6_1
          L9_1 = "-ap \"SharePoint"
          L10_1 = 1
          L11_1 = true
          L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
          if not L7_1 then
            L7_1 = string
            L7_1 = L7_1.find
            L8_1 = L6_1
            L9_1 = "-ap \"SecurityTokenServiceApplicationPool"
            L10_1 = 1
            L11_1 = true
            L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
            if not L7_1 then
              L7_1 = string
              L7_1 = L7_1.find
              L8_1 = L6_1
              L9_1 = "-ap \"ODSPNotificationListeningEndpoint"
              L10_1 = 1
              L11_1 = true
              L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
              if not L7_1 then
                L7_1 = string
                L7_1 = L7_1.find
                L8_1 = L6_1
                L9_1 = "-ap \"GridManagerAppPool"
                L10_1 = 1
                L11_1 = true
                L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
                if not L7_1 then
                  L7_1 = string
                  L7_1 = L7_1.find
                  L8_1 = L6_1
                  L9_1 = "-ap \"Grid SharePoint"
                  L10_1 = 1
                  L11_1 = true
                  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
                  if not L7_1 then
                    goto lbl_228
                  end
                end
              end
            end
          end
          L7_1 = mp
          L7_1 = L7_1.set_mpattribute
          L8_1 = "Lua:IsDotNetAMSIScan_SharePoint"
          L7_1(L8_1)
          goto lbl_301
          ::lbl_228::
          L7_1 = IsSharepointServer
          L7_1 = L7_1()
          if L7_1 ~= nil then
            L7_1 = mp
            L7_1 = L7_1.set_mpattribute
            L8_1 = "Lua:IsDotNetAMSIScan_SPPlatform"
            L7_1(L8_1)
          end
        end
    end
    else
      L6_1 = #L4_1
      if 18 <= L6_1 then
        L7_1 = L4_1
        L6_1 = L4_1.sub
        L8_1 = -18
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 == "\\runtimebroker.exe" then
          L6_1 = mp
          L6_1 = L6_1.set_mpattribute
          L7_1 = "Lua:IsDotNetAMSIScan_RuntimeBroker"
          L6_1(L7_1)
      end
      else
        L6_1 = #L4_1
        if 13 <= L6_1 then
          L7_1 = L4_1
          L6_1 = L4_1.sub
          L8_1 = -13
          L6_1 = L6_1(L7_1, L8_1)
          if L6_1 == "\\sqlservr.exe" then
            L6_1 = mp
            L6_1 = L6_1.set_mpattribute
            L7_1 = "Lua:IsDotNetAMSIScan_SQLServer"
            L6_1(L7_1)
        end
        else
          L6_1 = #L4_1
          if 41 <= L6_1 then
            L7_1 = L4_1
            L6_1 = L4_1.sub
            L8_1 = -41
            L6_1 = L6_1(L7_1, L8_1)
            if L6_1 == "\\microsoft.identityserver.servicehost.exe" then
              L6_1 = mp
              L6_1 = L6_1.set_mpattribute
              L7_1 = "Lua:IsDotNetAMSIScan_ADFSServce"
              L6_1(L7_1)
          end
          else
            L6_1 = #L4_1
            if 13 <= L6_1 then
              L7_1 = L4_1
              L6_1 = L4_1.sub
              L8_1 = -13
              L6_1 = L6_1(L7_1, L8_1)
              if L6_1 == "\\rundll32.exe" then
                L6_1 = mp
                L6_1 = L6_1.set_mpattribute
                L7_1 = "Lua:IsDotNetAMSIScan_Rundll32"
                L6_1(L7_1)
            end
            else
              L6_1 = #L4_1
              if 8 <= L6_1 then
                L7_1 = L4_1
                L6_1 = L4_1.sub
                L8_1 = -8
                L6_1 = L6_1(L7_1, L8_1)
                if L6_1 == "\\mmc.exe" then
                  L6_1 = mp
                  L6_1 = L6_1.set_mpattribute
                  L7_1 = "Lua:IsDotNetAMSIScan_MMC"
                  L6_1(L7_1)
                end
              end
            end
          end
        end
      end
    end
  end
end
::lbl_301::
L6_1 = #L4_1
if 9 <= L6_1 then
  L7_1 = L4_1
  L6_1 = L4_1.sub
  L8_1 = 2
  L9_1 = 9
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if L6_1 == ":\\users\\" then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:IsDotNetAMSIScan_Users"
    L6_1(L7_1)
    L5_1 = true
end
else
  L6_1 = #L4_1
  if 15 <= L6_1 then
    L7_1 = L4_1
    L6_1 = L4_1.sub
    L8_1 = 2
    L9_1 = 15
    L6_1 = L6_1(L7_1, L8_1, L9_1)
    if L6_1 == ":\\programdata\\" then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:IsDotNetAMSIScan_ProgramData"
      L6_1(L7_1)
      L5_1 = true
  end
  else
    L6_1 = #L4_1
    if 11 <= L6_1 then
      L7_1 = L4_1
      L6_1 = L4_1.sub
      L8_1 = 2
      L9_1 = 11
      L6_1 = L6_1(L7_1, L8_1, L9_1)
      if L6_1 == ":\\windows\\" then
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "Lua:IsDotNetAMSIScan_Windir"
        L6_1(L7_1)
        L6_1 = #L4_1
        if 20 <= L6_1 then
          L7_1 = L4_1
          L6_1 = L4_1.sub
          L8_1 = 11
          L9_1 = 20
          L6_1 = L6_1(L7_1, L8_1, L9_1)
          if L6_1 ~= "\\system32\\" then
            L7_1 = L4_1
            L6_1 = L4_1.sub
            L8_1 = 11
            L9_1 = 20
            L6_1 = L6_1(L7_1, L8_1, L9_1)
            if L6_1 ~= "\\syswow64\\" then
              goto lbl_364
            end
          end
          L6_1 = mp
          L6_1 = L6_1.set_mpattribute
          L7_1 = "Lua:IsDotNetAMSIScan_System"
          L6_1(L7_1)
        else
          ::lbl_364::
          L6_1 = #L4_1
          if 25 <= L6_1 then
            L7_1 = L4_1
            L6_1 = L4_1.sub
            L8_1 = 11
            L9_1 = 25
            L6_1 = L6_1(L7_1, L8_1, L9_1)
            if L6_1 == "\\microsoft.net\\" then
              L6_1 = mp
              L6_1 = L6_1.set_mpattribute
              L7_1 = "Lua:IsDotNetAMSIScan_Framework"
              L6_1(L7_1)
            end
          end
        end
    end
    else
      L6_1 = #L4_1
      if 17 <= L6_1 then
        L7_1 = L4_1
        L6_1 = L4_1.sub
        L8_1 = 2
        L9_1 = 17
        L6_1 = L6_1(L7_1, L8_1, L9_1)
        if L6_1 == ":\\program files\\" then
          goto lbl_396
        end
      end
      L6_1 = #L4_1
      if 23 <= L6_1 then
        L7_1 = L4_1
        L6_1 = L4_1.sub
        L8_1 = 2
        L9_1 = 23
        L6_1 = L6_1(L7_1, L8_1, L9_1)
        if L6_1 == ":\\program files (x86)\\" then
          ::lbl_396::
          L6_1 = mp
          L6_1 = L6_1.set_mpattribute
          L7_1 = "Lua:IsDotNetAMSIScan_ProgramFiles"
          L6_1(L7_1)
      end
      else
        L5_1 = true
      end
    end
  end
end
if L5_1 then
  L6_1 = mp
  L6_1 = L6_1.IsKnownFriendlyFile
  L7_1 = L4_1
  L8_1 = true
  L9_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if not L6_1 then
    L6_1 = mp
    L6_1 = L6_1.ReportLowfi
    L7_1 = L4_1
    L8_1 = 2670337877
    L6_1(L7_1, L8_1)
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
