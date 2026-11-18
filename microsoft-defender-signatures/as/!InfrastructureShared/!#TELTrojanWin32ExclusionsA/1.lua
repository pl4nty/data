-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/Exclusions.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (Lua:BATExt | BM_SCRIPT_OR_TEXT_FILE)

local l_0_0 = {
  ["AGGR:PowerShell/ExclusionEnviromentalVariableAppdata"] = 2,
  ["AGGR:PowerShell/ExclusionExe"] = 2,
  ["AGGR:PowerShell/ExclusionDll"] = 2,
  ["AGGR:PowerShell/ExclusionBat"] = 2,
  ["AGGR:PowerShell/ExclusionEnviromentalVariableTemp"] = 2,
  ["AGGR:PowerShell/ExclusionEnviromentalVariableUserprofile"] = 2,
  ["AGGR:PowerShell/ExclusionAppDataRoaming"] = 2
}
local l_0_1 = 0
for l_0_2, l_0_3 in pairs(l_0_0) do
  if mp.get_mpattribute(l_0_2) then
    l_0_1 = l_0_1 + l_0_3
  end
end
if 10 <= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
