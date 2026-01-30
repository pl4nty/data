-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\MpTamperDrv\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (Remediation.Threat).Name
if (string.find)(l_0_0, "Behavior:Win32/MpTamperDrv.A", 1, true) then
  local l_0_1 = GetRollingQueueAsHashTable("MpTamperRegKeyOldValues_Altitude")
  if not l_0_1 then
    return false
  end
  for l_0_5,l_0_6 in pairs(l_0_1) do
    local l_0_7 = (sysio.RegOpenKey)(l_0_5)
    if l_0_7 then
      (sysio.SetRegValueAsDword)(l_0_7, "Altitude", l_0_6)
    end
  end
end

