-- Threat: !InfrastructureShared
-- Name: 43b3a4032352
-- Type: 21
-- Includes: LuaFuncHelper, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = GetRealPidForScenario(l_0_0.ppid)
local l_0_2 = {}
local l_0_3 = GetRollingQueueKeysAsString("Tech-" .. l_0_1)
if l_0_3 == nil then
  l_0_3 = l_0_0.ppid .. " tech table missing"
end
l_0_2.TrackedPidTechniques = l_0_3
local l_0_4 = GetRollingQueueKeysAsString("Tact-" .. l_0_1)
if l_0_4 == nil then
  l_0_4 = l_0_0.ppid .. " tact table missing"
end
l_0_2.TrackedPidTactics = l_0_4
local l_0_5, l_0_6 = GetDetectionThresholdMetLinuxReason(l_0_0.ppid)
l_0_2.IsThresholdMet = tostring(l_0_5)
l_0_2.ThresholdMetReason = "000" .. tostring(l_0_6)
local l_0_7 = safeJsonSerialize(l_0_2)
if l_0_7 ~= nil then
  bm.add_related_string("TTData", l_0_7, bm.RelatedStringBMReport)
end
return mp.INFECTED
