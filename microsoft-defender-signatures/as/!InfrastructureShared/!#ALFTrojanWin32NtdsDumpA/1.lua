-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/NtdsDump.A
-- Type: 13
-- MpAttributes: BM_Ntdsdit_Exfil

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
if not l_0_1 then
  return mp.CLEAN
end
if string.find(l_0_1, "dacpac.candence.ps1") then
  return mp.CLEAN
end
return mp.INFECTED
