-- Threat: !InfrastructureShared
-- Name: 5bb3287757d3
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.ppid ~= nil and (string.find(l_0_0.ppid, "pid:4$", 1, false) ~= nil or string.find(l_0_0.ppid, "pid:4,", 1, true) ~= nil) then
  return mp.INFECTED
end
return mp.CLEAN
