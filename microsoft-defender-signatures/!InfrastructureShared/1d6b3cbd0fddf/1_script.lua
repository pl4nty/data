-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1d6b3cbd0fddf\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = GetSuspiciousAllocsInBmLog()
if not l_0_0 then
  return mp.CLEAN
end
for l_0_4 in pairs(l_0_0) do
  TriggerTargetedMemoryScan(l_0_4)
  AddSuspiciousRegion(l_0_4)
end
TriggerScanBeaconing()
return mp.INFECTED

