-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFXPlatFileTyperMetrics\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "FileTyperMetrics"
local l_0_1 = "FileExtMetrics"
local l_0_2 = false
local l_0_3 = GetRollingQueueHashTableAsString(l_0_0, ":", "|")
if l_0_3 ~= nil and #l_0_3 > 0 then
  (mp.set_mpattribute)((string.format)("MpInternal_researchdata=FileTyperMetrics=%s", l_0_3))
  EraseRollingQueue(l_0_0)
  l_0_2 = true
end
l_0_3 = GetRollingQueueHashTableAsString(l_0_1, ":", "|")
if l_0_3 ~= nil and #l_0_3 > 0 then
  (mp.set_mpattribute)((string.format)("MpInternal_researchdata=ExtensionMetrics=%s", l_0_3))
  EraseRollingQueue(l_0_1)
  l_0_2 = true
end
if not l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED

