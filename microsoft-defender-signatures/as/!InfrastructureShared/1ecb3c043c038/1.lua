-- Threat: !InfrastructureShared
-- Name: 1ecb3c043c038
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "srtasks.exe", 1, true) or string.find(l_0_1, "executescheduledsppcreation", 1, true) then
  return mp.CLEAN
end
if IsTechniqueObservedGlobal("T1003") and IsTacticObservedGlobal("shadowcopy_create") then
  return mp.INFECTED
end
return mp.CLEAN
