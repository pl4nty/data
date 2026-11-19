-- Threat: !InfrastructureShared
-- Name: 1e6b34c3c3320
-- Type: 21

if this_sigattrlog == nil then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5]
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6]
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7]
end
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.utf8p1 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(l_0_0.utf8p1)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2.ppid == nil then
  return mp.CLEAN
end
bm.request_SMS(l_0_2.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 100)
return mp.INFECTED
