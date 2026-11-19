-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/NugetAttack.C
-- Type: 13
-- MpAttributes: MpIsPowerShellAMSIScan & SCPT:PowerShell/Nuget.D & SCPT:PowerShell/Nuget.E

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0:find("devenv", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
