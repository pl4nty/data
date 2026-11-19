-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/NugetAttack.D
-- Type: 13
-- MpAttributes: (SCPT:PowerShell/Nuget.A | SCPT:PowerShell/Nuget.G) & SCPT:PowerShell/Nuget.C & SCPT:PowerShell/Nuget.D & SCPT:PowerShell/Nuget.F

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if l_0_0:find("\\tools\\", 1, true) and l_0_1:find("init.ps1", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
