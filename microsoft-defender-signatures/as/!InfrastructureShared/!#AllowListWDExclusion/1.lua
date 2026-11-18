-- Threat: !InfrastructureShared
-- Name: !#AllowList:WDExclusion
-- Type: 13
-- MpAttributes: (MpIsPowerShellAMSIScan | MpIsVBScriptAMSIScan | MpIsJScriptAMSIScan)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 then
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
    if l_0_3 and l_0_4 ~= nil then
      local l_0_5 = string.lower(l_0_4)
      if string.find(l_0_5, "\\windows defender advanced threat protection\\datacollection", 1, true) ~= nil then
        return mp.INFECTED
      end
    end
  end
  return mp.CLEAN
end
return mp.CLEAN
