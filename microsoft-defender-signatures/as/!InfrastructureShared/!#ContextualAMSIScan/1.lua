-- Threat: !InfrastructureShared
-- Name: !#ContextualAMSIScan
-- Type: 12

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  mp.set_mpattribute("MpIsAMSIScan")
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 then
    if l_0_2 == "{8f8336b8-0515-4cc5-ab8a-204531b42a55}" then
      mp.set_mpattribute("MpIsEdgeAMSIScan")
    elseif l_0_2 == "{28a7d36f-6463-4fa1-8888-7d07eb77612f}" then
      mp.set_mpattribute("MpIsSmartScreenAMSIScan")
    elseif l_0_2 == "JScript" then
      mp.set_mpattribute("MpIsJScriptAMSIScan")
      local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
      if l_0_3 == nil then
        return mp.CLEAN
      end
      local l_0_4 = sysio.GetFileNameFromProcess(l_0_3)
      local l_0_5 = string.lower(string.sub(l_0_4, -15)):match("\\([^\\]+%.exe)$")
      if l_0_5 == "powershell.exe" then
        mp.set_mpattribute("MpPowershellJavascriptAmsiScan")
      elseif l_0_5 == "msiexec.exe" then
        mp.set_mpattribute("MpMsiexecJavascriptAmsiScan")
      elseif l_0_5 == "wscript.exe" or l_0_5 == "cscript.exe" then
        mp.set_mpattribute("MpVBJScriptInterpreterAmsiScan")
      end
    elseif l_0_2 == "VBScript" then
      mp.set_mpattribute("MpIsVBScriptAMSIScan")
      local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
      if l_0_6 == nil then
        return mp.CLEAN
      end
      local l_0_7 = sysio.GetFileNameFromProcess(l_0_6)
      local l_0_8 = string.lower(string.sub(l_0_7, -12)):match("\\([^\\]+%.exe)$")
      if l_0_8 == "wscript.exe" or l_0_8 == "cscript.exe" then
        mp.set_mpattribute("MpVBJScriptInterpreterAmsiScan")
      end
    elseif l_0_2 == "JScript.Encode" then
      mp.set_mpattribute("MpIsJScriptEncodeAMSIScan")
    elseif l_0_2 == "VBScript.Encode" then
      mp.set_mpattribute("MpIsVBScriptEncodeAMSIScan")
    elseif l_0_2 == "WMI" then
      mp.set_mpattribute("MpIsWmiAMSIScan")
      local l_0_9 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
      if l_0_9 == nil then
        return mp.CLEAN
      end
      local l_0_10 = sysio.GetFileNameFromProcess(l_0_9)
      local l_0_11 = string.lower(string.sub(l_0_10, -13)):match("\\([^\\]+%.exe)$")
      if l_0_11 == "winword.exe" or l_0_11 == "excel.exe" or l_0_11 == "powerpnt.exe" then
        mp.set_mpattribute("MpIsOfficeWmiAmsiScan")
      elseif l_0_11 == "w3wp.exe" then
        mp.set_mpattribute("MpIsIISWmiAmsiScan")
      end
    elseif l_0_2 == "Hvsi" then
      mp.set_mpattribute("MpIsWdagAMSIScan")
    elseif string.sub(l_0_2, 1, 10) == "OFFICE_VBA" then
      local l_0_12 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
      if l_0_12 == nil then
        return mp.CLEAN
      end
      local l_0_13 = sysio.GetFileNameFromProcess(l_0_12)
      local l_0_14 = string.lower(string.sub(l_0_13, -13)):match("\\([^\\]+%.exe)$")
      if l_0_14 == "winword.exe" or l_0_14 == "excel.exe" or l_0_14 == "powerpnt.exe" then
        mp.set_mpattribute("MpIsOfficeVbaAMSIScanViaOfficeProdApps")
      end
      mp.set_mpattribute("MpIsOfficeVbaAMSIScan")
    elseif string.sub(l_0_2, 1, 11) == "PowerShell_" then
      mp.set_mpattribute("MpIsPowerShellAMSIScan")
      local l_0_15 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
      if l_0_15 == nil then
        return mp.CLEAN
      end
      local l_0_16 = sysio.GetFileNameFromProcess(l_0_15)
      local l_0_17 = string.lower(string.sub(l_0_16, -10)):match("\\([^\\]+%.exe)$")
      if l_0_17 == "sqlps.exe" then
        mp.set_mpattribute("MpIsSqlpsAmsiScan")
      end
      if l_0_17 == "w3wp.exe" then
        mp.set_mpattribute("MpIsIISPowerShellAMSIScan")
      end
      local l_0_18, l_0_19 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
      if l_0_18 and l_0_19 ~= nil and string.len(l_0_19) > 5 then
        local l_0_20 = string.sub(l_0_19, -5)
        if string.match(l_0_20, ".%.ps1") or l_0_20 == ".psd1" or l_0_20 == ".psm1" then
          mp.set_mpattribute("MpPowershellHasValidAmsiContentName")
        end
      end
      if l_0_18 and l_0_19 == nil then
        mp.set_mpattribute("MpPowershellAmsiViaCmdLine")
      end
      local l_0_21 = mp.GetParentProcInfo(l_0_15)
      local l_0_22 = l_0_21.ppid
      if l_0_21 and l_0_21.image_path and l_0_22 then
        local l_0_23 = mp.GetParentProcInfo(l_0_22)
        local l_0_24 = l_0_23.ppid
        if MpCommon.DoesProcessHaveAttribute(l_0_22, "AIDiscovery:Agent") or l_0_24 and MpCommon.DoesProcessHaveAttribute(l_0_24, "AIDiscovery:Agent") then
          mp.set_mpattribute("MpIsAmsiAgenticParent")
        end
        local l_0_25 = string.lower(l_0_21.image_path):match("\\([^\\]+%.exe)$")
        if l_0_25 == "windowsterminal.exe" or l_0_25 == "wt.exe" then
          mp.set_mpattribute("MpIsWindowsTerminalAMSI")
        end
      end
    elseif l_0_2 == "Excel" then
      mp.set_mpattribute("MpIsXl4mAmsiScan")
    elseif string.sub(l_0_2, 1, 15) == "Exchange Server" then
      mp.set_mpattribute("MpIsExchangeAmsiScan")
      local l_0_26, l_0_27 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
      if l_0_26 and l_0_27 ~= nil and string.sub(l_0_27, 1, 12) == "BodyContent;" then
        mp.set_mpattribute("MpIsExchangeAmsiBodyScan")
      end
    elseif string.sub(l_0_2, 1, 17) == "SharePoint Server" then
      mp.set_mpattribute("MpIsSharePointAmsiScan")
    elseif l_0_2 == "Skype for Business Server" then
      mp.set_mpattribute("MpIsSkypeAmsiScan")
    elseif l_0_2 == "VSSAMSI" then
      mp.set_mpattribute("MpIsVssAmsiScan")
    elseif l_0_2 == "MCPSCAN" then
      mp.set_mpattribute("MpIsAiMcpAmsiScan")
    elseif l_0_2 == "Microsoft Win32 Run Dialog" then
      mp.set_mpattribute("MpIsRunDialogAmsiScan")
      local l_0_28, l_0_29 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
      if l_0_28 and l_0_29 then
        local l_0_30 = string.lower(l_0_29)
        if string.sub(l_0_30, 1, 7) ~= "http://" and string.sub(l_0_30, 1, 8) ~= "https://" then
          mp.set_mpattribute("MpIsRunDialogAmsiScanContextWeb")
        end
      end
    end
  end
end
return mp.CLEAN
