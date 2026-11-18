-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:JS/AsrObfusPersistWscrRun.A
-- Type: 13
-- MpAttributes: ((RPF:TopLevelFile & (Nscript:Type_js | Nscript:Type_vbs)) | MpIsJScriptAMSIScan | MpIsVBScriptAMSIScan) & (SCPT:JS/AsrobfusWscrRun.A | SCPT:JS/AsrobfusWscrRun.B | SCPT:JS/AsrobfusWscrRun.C)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  if mp.get_mpattribute("SCPT:JS/AsrobfusWscrRun.A") then
    local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
    if l_0_1 and (l_0_2 == "JScript" or l_0_2 == "VBScript") then
      local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
      if l_0_3 and l_0_4 ~= nil then
        local l_0_5 = string.lower(l_0_4)
        if l_0_5:find("program_files", 1, true) or l_0_5:find(":\\windows\\", 1, true) or l_0_5:find("\\netlogon\\windows7\\", 1, true) then
          return mp.CLEAN
        end
        if MpCommon.QueryPersistContext(l_0_5, "AsrObfusWasScanned") and not MpCommon.QueryPersistContext(l_0_5, "AsrObfusPersist") and sysio.IsFileExists(l_0_5) then
          local l_0_6 = sysio.GetFileSize(l_0_5)
          if 300000 < l_0_6 then
            return mp.CLEAN
          end
          local l_0_7 = string.lower(sysio.ReadFile(l_0_5, 0, l_0_6))
          if l_0_7 == nil then
            return mp.CLEAN
          end
          if string.find(l_0_7, "wscript.shell", 1, true) == nil and string.find(l_0_7, ".run", 1, true) == nil then
            mp.ReportLowfi(l_0_5, 2502054131)
            return mp.INFECTED
          end
        end
      end
    end
  end
else
  local l_0_8 = string.lower(mp.getfilename())
  MpCommon.AppendPersistContext(l_0_8, "AsrObfusWasScanned", 0)
  if mp.get_mpattribute("SCPT:JS/AsrobfusWscrRun.B") and mp.get_mpattribute("SCPT:JS/AsrobfusWscrRun.C") then
    MpCommon.AppendPersistContext(l_0_8, "AsrObfusPersist", 0)
  end
end
return mp.CLEAN
