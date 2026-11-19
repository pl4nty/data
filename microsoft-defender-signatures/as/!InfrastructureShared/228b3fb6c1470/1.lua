-- Threat: !InfrastructureShared
-- Name: 228b3fb6c1470
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not (l_0_0 and l_0_0.ppid) or isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
