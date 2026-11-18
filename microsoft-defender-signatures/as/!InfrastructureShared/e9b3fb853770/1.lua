-- Threat: !InfrastructureShared
-- Name: e9b3fb853770
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  local l_0_1 = GetTacticsTableForPid(l_0_0.ppid)
  if l_0_1 ~= nil and type(l_0_1) == "table" and 5 < #l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
