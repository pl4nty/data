-- Threat: !InfrastructureShared
-- Name: 17ab3964fd60a
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[1] and this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2] and this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3] and this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4] and this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
elseif this_sigattrlog[5] and this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5]
elseif this_sigattrlog[6] and this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6]
elseif this_sigattrlog[7] and this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7]
elseif this_sigattrlog[8] and this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8]
else
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if not l_0_0.matched or not l_0_1.ppid then
  return mp.CLEAN
end
if MpCommon.IsFriendlyProcess(l_0_1.ppid) then
  return mp.CLEAN
end
local l_0_2 = l_0_0.utf8p2
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = string.format("%s,address:%s,size:0", l_0_1.ppid, l_0_2)
mp.TriggerScanResource("ems", l_0_3)
local l_0_4 = string.format("susp_regions:%s", l_0_1.ppid)
AppendToRollingQueue(l_0_4, l_0_2)
bm.trigger_sig("ScanSuspiciousRegions", l_0_3, l_0_1.ppid)
return mp.INFECTED
