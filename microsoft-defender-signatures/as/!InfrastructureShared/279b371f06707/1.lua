-- Threat: !InfrastructureShared
-- Name: 279b371f06707
-- Type: 21

local l_0_0
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  local l_0_1 = string.lower(this_sigattrlog[8].utf8p1)
  local l_0_2, l_0_3 = string.match(l_0_1, "targetprocessppid:(%d+):(%d+)")
  if l_0_2 == nil or l_0_3 == nil then
    return mp.CLEAN
  end
  l_0_0 = string.format("pid:%s,ProcessStart:%s", l_0_2, l_0_3)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_4 = bm.get_imagepath()
if l_0_4 == nil then
  return mp.CLEAN
end
l_0_4 = MpCommon.PathToWin32Path(l_0_4) or l_0_4
bm.trigger_sig("Behavior:Win32/PossibleProcessInjector.EB", l_0_4, l_0_0)
bm.add_related_process(l_0_0)
bm.add_action("SmsAsyncScanEvent", 1)
return mp.INFECTED
