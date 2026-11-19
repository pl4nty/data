-- Threat: !InfrastructureShared
-- Name: 2db392df955e
-- Type: 21

if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = tonumber(this_sigattrlog[2].utf8p1)
if l_0_0 == nil or l_0_0 < 100000 then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_1.ppid, "M")
return mp.INFECTED
