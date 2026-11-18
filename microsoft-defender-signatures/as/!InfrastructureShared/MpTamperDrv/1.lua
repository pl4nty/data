-- Threat: !InfrastructureShared
-- Name: MpTamperDrv
-- Type: 15
-- Includes: LuaFuncHelper

local l_0_0 = Remediation.Threat.Name
if string.find(l_0_0, "Behavior:Win32/MpTamperDrv.A", 1, true) then
  local l_0_1 = GetRollingQueueAsHashTable("MpTamperRegKeyOldValues_Altitude")
  if not l_0_1 then
    return false
  end
  for l_0_2, l_0_3 in pairs(l_0_1) do
    local l_0_4 = sysio.RegOpenKey(l_0_2)
    if l_0_4 then
      sysio.SetRegValueAsDword(l_0_4, "Altitude", l_0_3)
    end
  end
end
