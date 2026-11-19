-- Threat: !InfrastructureShared
-- Name: 5bd762d2f912
-- Type: 21
-- Includes: ResearchData

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if #l_0_1 < 35 or 350 < #l_0_1 then
  return mp.CLEAN
end
set_research_data("ClickFixCmd", tostring(l_0_1), false)
return mp.INFECTED
