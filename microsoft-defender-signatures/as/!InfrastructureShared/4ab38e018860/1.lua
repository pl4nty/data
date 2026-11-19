-- Threat: !InfrastructureShared
-- Name: 4ab38e018860
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = 16
local l_0_1 = this_sigattrlog[1]
if not l_0_1.matched or not l_0_1.utf8p2 then
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[2]
if not l_0_2.matched or not l_0_2.ppid then
  return mp.CLEAN
end
local l_0_3 = GetSuspiciousRegions()
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = string.format("ScanBeaconing.A:%s", l_0_2.ppid)
local l_0_5, l_0_6 = pcall(MpCommon.AtomicCounterValue, l_0_4)
if not l_0_5 then
  return mp.CLEAN
end
if not l_0_6 then
  if not pcall(MpCommon.AtomicCounterSet, l_0_4, 0, 3600) then
    return mp.CLEAN
  end
  l_0_6 = 0
end
if l_0_6 == l_0_0 then
  return mp.CLEAN
end
for l_0_7, l_0_8 in ipairs(l_0_3) do
  TriggerTargetedMemoryScan(l_0_8 + l_0_6)
end
if not pcall(MpCommon.AtomicCounterAdd, l_0_4, 1) then
  return mp.CLEAN
end
bm.trigger_sig("ScanSuspiciousRegions", l_0_1.utf8p2, l_0_2.ppid)
return mp.CLEAN
