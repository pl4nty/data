-- Threat: !InfrastructureShared
-- Name: 65b3c439ac20
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level < 16384 then
  return mp.INFECTED
end
return mp.CLEAN
