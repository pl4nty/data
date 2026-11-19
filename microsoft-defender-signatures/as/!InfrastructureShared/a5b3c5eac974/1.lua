-- Threat: !InfrastructureShared
-- Name: a5b3c5eac974
-- Type: 21

local l_0_0
local l_0_1 = 100000000
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
  l_0_1 = 10000000
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5]
  l_0_1 = 200000
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6]
  l_0_1 = 2500000
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7]
  l_0_1 = 300000
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8]
  l_0_1 = 3000000
else
  return mp.CLEAN
end
if not l_0_0.utf8p1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0.utf8p1
if l_0_2 ~= nil and sysio.IsFileExists(l_0_2) then
  local l_0_3 = sysio.GetFileSize(l_0_2)
  if l_0_1 < l_0_3 then
    local l_0_4 = bm.get_current_process_startup_info()
    bm.request_SMS(l_0_4.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 1)
    return mp.INFECTED
  end
end
return mp.CLEAN
