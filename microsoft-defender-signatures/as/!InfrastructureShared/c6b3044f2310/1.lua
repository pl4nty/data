-- Threat: !InfrastructureShared
-- Name: c6b3044f2310
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info().ppid
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, ".js", 1, true) == nil then
  return mp.INFECTED
end
bm_AddRelatedFileFromCommandLine("BM")
return mp.INFECTED
