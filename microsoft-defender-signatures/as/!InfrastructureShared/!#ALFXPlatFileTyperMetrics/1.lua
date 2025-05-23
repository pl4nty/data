-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFXPlatFileTyperMetrics\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "FileTyperMetrics"
local l_0_1 = GetRollingQueueHashTableAsString(l_0_0, ":", "|")
if l_0_1 ~= nil and #l_0_1 > 0 then
  (mp.set_mpattribute)((string.format)("MpInternal_researchdata=FileTyperMetrics=%s", l_0_1))
  EraseRollingQueue(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN

