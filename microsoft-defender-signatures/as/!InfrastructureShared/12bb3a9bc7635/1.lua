-- Threat: !InfrastructureShared
-- Name: 12bb3a9bc7635
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[1].utf8p2
local l_0_1 = bm.get_current_process_startup_info()
if isnull(l_0_0) or isnull(l_0_1) then
  return mp.CLEAN
else
  l_0_1 = l_0_1.ppid
end
local l_0_2
if this_sigattrlog[2].matched then
  l_0_2 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_2 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4]
elseif this_sigattrlog[5].matched then
  l_0_2 = this_sigattrlog[5]
else
  return mp.CLEAN
end
local l_0_3, l_0_4 = string.match(l_0_2.utf8p2, "^(%d+);regionsize:(%d+);")
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = string.format("%s in %s. Executable code at base address %d", l_0_0, l_0_1, l_0_3)
bm.add_related_string("ProcessHollowSummary", l_0_5, bm.RelatedStringBMReport)
mp.TriggerScanResource("ems", string.format("%s,address:%d,size:%d,options:+", l_0_1, l_0_3, l_0_4))
return mp.INFECTED
