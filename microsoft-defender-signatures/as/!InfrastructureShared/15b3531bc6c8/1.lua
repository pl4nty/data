-- Threat: !InfrastructureShared
-- Name: 15b3531bc6c8
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level <= 16384 then
  return mp.INFECTED
end
return mp.CLEAN
