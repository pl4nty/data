-- Threat: !InfrastructureShared
-- Name: b8b3fd18a1c4
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
mp.ReportLowfi(l_0_0, 2623644159)
bm.add_related_file(l_0_0)
bm.trigger_sig("AttackIQPayload", l_0_0)
return mp.CLEAN
