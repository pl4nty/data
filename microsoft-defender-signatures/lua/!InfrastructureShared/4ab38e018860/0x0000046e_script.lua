-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab38e018860\0x0000046e_luac 

-- params : ...
-- function num : 0
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
local l_0_4 = (string.format)("ScanBeaconing.A:%s", l_0_2.ppid)
local l_0_5 = pcall(MpCommon.AtomicCounterValue, l_0_4)
if not l_0_5 then
  return mp.CLEAN
end
if not MpCommon.AtomicCounterValue and not pcall(MpCommon.AtomicCounterSet, l_0_4, 0, 3600) then
  return mp.CLEAN
end
do
  local l_0_6, l_0_12 = 0
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R6 in 'UnsetPending'

  if l_0_6 == l_0_0 then
    return mp.CLEAN
  end
  for l_0_10,l_0_11 in ipairs(l_0_3) do
    local l_0_7 = nil
    -- DECOMPILER ERROR at PC70: Confused about usage of register: R11 in 'UnsetPending'

    TriggerTargetedMemoryScan(3600 + l_0_7)
  end
  if not pcall(MpCommon.AtomicCounterAdd, l_0_4, 1) then
    return mp.CLEAN
  end
  ;
  (bm.trigger_sig)("ScanSuspiciousRegions", l_0_1.utf8p2, l_0_2.ppid)
  return mp.CLEAN
end

