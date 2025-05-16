-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\170b3945b2fd0\0x0000042d_luac 

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
return mp.INFECTED

