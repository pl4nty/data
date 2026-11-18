-- Threat: !InfrastructureShared
-- Name: 25b3c0dec59b
-- Type: 21

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 and l_0_1 ~= nil then
  local l_0_2 = l_0_1.ppid
  if MpCommon.QueryPersistContextNoPath("amsidetct", l_0_2) then
    return mp.INFECTED
  end
end
return mp.CLEAN
