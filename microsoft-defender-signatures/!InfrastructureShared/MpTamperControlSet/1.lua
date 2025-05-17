-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\MpTamperControlSet\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (Remediation.Threat).Name
if (string.find)(l_0_0, "Behavior:Win32/MpTamperControlSet.B", 1, true) then
  local l_0_1 = (sysio.RegOpenKey)("HKLM\\SYSTEM\\Select")
  if l_0_1 then
    local l_0_2 = GetRollingQueueAsHashTable("MpTamperRegKeyOldValues_ControlSet")
    if not l_0_2 then
      return false
    end
    for l_0_6,l_0_7 in pairs(l_0_2) do
      local l_0_8 = (sysio.GetRegValueAsDword)(l_0_1, l_0_6)
      if l_0_8 ~= l_0_7 then
        (sysio.SetRegValueAsDword)(l_0_1, l_0_6, l_0_7)
      end
    end
  end
end

