-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3f3b317201576\0x0000044c_luac 

-- params : ...
-- function num : 0
local l_0_0 = GetSuspiciousAllocsInBmLog(true)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = 0
for l_0_5 in pairs(l_0_0) do
  TriggerTargetedMemoryScan(l_0_5)
  AddSuspiciousRegion(l_0_5)
  l_0_1 = l_0_1 + 1
end
if l_0_1 == 0 then
  return mp.CLEAN
end
TriggerScanBeaconing()
local l_0_6 = this_sigattrlog[14]
if l_0_6 and l_0_6.utf8p2 then
  (bm.add_related_string)("d7238133", l_0_6.utf8p2, bm.RelatedStringBMReport)
end
return mp.INFECTED

