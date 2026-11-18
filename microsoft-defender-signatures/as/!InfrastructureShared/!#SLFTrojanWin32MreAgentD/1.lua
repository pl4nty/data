-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/MreAgent.D
-- Type: 12
-- MpAttributes: (MpIsVBScriptAMSIScan | MpIsJScriptAMSIScan) & SCPT:JSObfuse.SA

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  if l_0_1 == "ie4uinit.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
