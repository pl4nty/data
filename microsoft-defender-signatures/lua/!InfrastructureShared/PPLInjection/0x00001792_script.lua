-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\PPLInjection\0x00001792_luac 

-- params : ...
-- function num : 0
local l_0_0 = (Remediation.Threat).Name
if (string.find)(l_0_0, "Behavior:Win32/PPLInjection.A", 1, true) then
  local l_0_1 = GetRollingQueueKeyValue("MpTamperRegKeyOldValues", "TreatAs")
  if not l_0_1 then
    return 
  end
  local l_0_2, l_0_3 = (string.match)(l_0_1, "(.*)|(.*)")
  if not l_0_2 or not l_0_3 then
    return 
  end
  local l_0_4 = (sysio.RegOpenKey)(l_0_2)
  if l_0_4 then
    (sysio.SetRegValueAsString)(l_0_4, "", l_0_3)
  end
end

