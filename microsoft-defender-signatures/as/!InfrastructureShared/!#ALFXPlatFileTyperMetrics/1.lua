-- Threat: !InfrastructureShared
-- Name: !#ALF:XPlat/FileTyperMetrics
-- Type: 24
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & LUA:FileTyperReportMetrics

local l_0_0 = "FileTyperMetrics"
local l_0_1 = "FileExtMetrics"
local l_0_2 = false
local l_0_3 = GetRollingQueueHashTableAsString(l_0_0, ":", "|")
if l_0_3 ~= nil and 0 < #l_0_3 then
  mp.set_mpattribute(string.format("MpInternal_researchdata=FileTyperMetrics=%s", l_0_3))
  EraseRollingQueue(l_0_0)
  l_0_2 = true
end
l_0_3 = GetRollingQueueHashTableAsString(l_0_1, ":", "|")
if l_0_3 ~= nil and 0 < #l_0_3 then
  mp.set_mpattribute(string.format("MpInternal_researchdata=ExtensionMetrics=%s", l_0_3))
  EraseRollingQueue(l_0_1)
  l_0_2 = true
end
if not l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
