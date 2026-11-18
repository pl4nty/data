-- Threat: !InfrastructureShared
-- Name: MpTamperControlSet
-- Type: 15
-- Includes: LuaFuncHelper

local l_0_0 = Remediation.Threat.Name
if string.find(l_0_0, "Behavior:Win32/MpTamperControlSet.B", 1, true) then
  local l_0_1 = sysio.RegOpenKey("HKLM\\SYSTEM\\Select")
  if l_0_1 then
    local l_0_2 = GetRollingQueueAsHashTable("MpTamperRegKeyOldValues_ControlSet")
    if not l_0_2 then
      return false
    end
    for l_0_3, l_0_4 in pairs(l_0_2) do
      local l_0_5 = sysio.GetRegValueAsDword(l_0_1, l_0_3)
      if l_0_5 ~= l_0_4 then
        sysio.SetRegValueAsDword(l_0_1, l_0_3, l_0_4)
      end
    end
  end
end
