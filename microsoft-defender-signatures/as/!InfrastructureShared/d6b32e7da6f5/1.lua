-- Threat: !InfrastructureShared
-- Name: d6b32e7da6f5
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
reportRelatedBmHits()
addRelatedProcess()
return mp.INFECTED
