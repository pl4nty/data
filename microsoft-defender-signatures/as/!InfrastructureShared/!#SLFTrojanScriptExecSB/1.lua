-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Script/Exec.SB
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: TELPER:JSlaunchPwershell.A

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_1 and l_0_2 ~= nil then
  local l_0_3 = MpCommon.PathToWin32Path(l_0_2)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  l_0_3 = string.lower(l_0_3)
  if StringEndsWith(l_0_3, ".vbs") then
    return mp.CLEAN
  end
  if not mp.IsMotwForFile(l_0_3) then
    return mp.CLEAN
  end
  local l_0_4, l_0_5 = mp.GetMotwZoneForFile(l_0_3)
  if l_0_5 ~= nil and 3 <= l_0_5 then
    return mp.INFECTED
  end
end
return mp.CLEAN
