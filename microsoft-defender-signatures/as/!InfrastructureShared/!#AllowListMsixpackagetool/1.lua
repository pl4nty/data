-- Threat: !InfrastructureShared
-- Name: !#AllowList:Msixpackagetool
-- Type: 12
-- MpAttributes: (MpIsPowerShellAMSIScan | MpIsVBScriptAMSIScan | MpIsJScriptAMSIScan)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  if l_0_1:find("msixpackagetool.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
