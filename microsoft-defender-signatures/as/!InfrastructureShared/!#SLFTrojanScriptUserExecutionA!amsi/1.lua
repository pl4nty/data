-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Script/UserExecution.A!amsi
-- Type: 13
-- MpAttributes: CloudBlockLevelGT3 & (MpIsPowerShellAMSIScan | MpIsVBScriptAMSIScan | MpIsJScriptAMSIScan)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 then
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
    if l_0_3 and l_0_4 ~= nil then
      local l_0_5 = string.lower(l_0_4)
      if string.find(l_0_5, "\\appdata\\local\\packages\\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\\localstate\\files\\", 1, true) ~= nil or string.find(l_0_5, "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook\\", 1, true) ~= nil then
        mp.ReportLowfi(l_0_4, 705495462)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
