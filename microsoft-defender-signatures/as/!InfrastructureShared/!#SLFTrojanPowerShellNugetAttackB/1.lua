-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/NugetAttack.B
-- Type: 13
-- MpAttributes: MpIsPowerShellAMSIScan & (SCPT:PowerShell/Nuget.A | SCPT:PowerShell/Nuget.G) & SCPT:PowerShell/Nuget.C & SCPT:PowerShell/Nuget.D

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0:find("devenv", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
