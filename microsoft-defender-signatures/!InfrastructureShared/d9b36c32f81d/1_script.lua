-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d9b36c32f81d\1_luac 

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
local l_0_5 = this_sigattrlog[2]
local l_0_6 = this_sigattrlog[3]
local l_0_7 = this_sigattrlog[4]
local l_0_8 = this_sigattrlog[5]
for l_0_12,l_0_13 in ipairs({l_0_5, l_0_6, l_0_7, l_0_8}) do
  if l_0_13 and l_0_13.utf8p2 then
    (bm.add_related_string)((string.format)("ddb49deb_%d", l_0_12), l_0_13.utf8p2, bm.RelatedStringBMReport)
  end
end
return mp.INFECTED

