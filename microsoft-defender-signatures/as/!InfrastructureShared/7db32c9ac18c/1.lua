-- Threat: !InfrastructureShared
-- Name: 7db32c9ac18c
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].timestamp
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].timestamp
end
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].timestamp
end
if this_sigattrlog[5].matched then
  l_0_2 = this_sigattrlog[5].timestamp
end
if this_sigattrlog[6].matched then
  l_0_2 = this_sigattrlog[6].timestamp
end
if l_0_0.ppid == nil or string.find(l_0_0.ppid, "pid:4$", 1, false) ~= nil or string.find(l_0_0.ppid, "pid:4,", 1, true) ~= nil or l_0_1 > l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
