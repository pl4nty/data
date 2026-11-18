-- Threat: !InfrastructureShared
-- Name: 55b3de6f52f5
-- Type: 21

local l_0_0
local l_0_1 = 100000000
local l_0_2 = 10000000
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
  l_0_1 = 30000000
  l_0_2 = 10000000
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
  l_0_1 = 30000000
  l_0_2 = 10000000
else
  return mp.CLEAN
end
if not l_0_0.utf8p1 then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_0.utf8p1)
if not string.find(l_0_3, ":\\users\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_3, "\\citrix\\", 1, true) or string.find(l_0_3, "\\assembly\\", 1, true) or string.find(l_0_3, ".tmp", 1, true) then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_3) then
  local l_0_4 = sysio.GetFileSize(l_0_3)
  if l_0_1 > l_0_4 and l_0_2 < l_0_4 then
    local l_0_5 = bm.get_current_process_startup_info()
    bm.request_SMS(l_0_5.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 1)
    return mp.INFECTED
  end
end
return mp.CLEAN
