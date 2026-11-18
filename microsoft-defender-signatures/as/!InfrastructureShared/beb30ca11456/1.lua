-- Threat: !InfrastructureShared
-- Name: beb30ca11456
-- Type: 21

if this_sigattrlog[1].matched then
  return mp.INFECTED
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and next(l_0_0) and l_0_0.command_line and l_0_0.command_line:sub(-17) == "-s RemoteRegistry" then
  return mp.INFECTED
end
return mp.CLEAN
