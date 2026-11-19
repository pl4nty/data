-- Threat: !InfrastructureShared
-- Name: 102b33cd53a30
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if l_0_0 then
  local l_0_1 = MpCommon.GetMountedFileBackingFilePath(l_0_0)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(string.sub(l_0_1, -4))
  if l_0_2 ~= ".iso" or l_0_2 ~= ".img" then
    return mp.CLEAN
  end
  triggerMemoryScanOnProcessTree(true, true, "SMS_M", 1000, "Behavior:Win32/Qakbot.SC")
  bm.add_related_file(l_0_0)
  bm.add_related_file(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
