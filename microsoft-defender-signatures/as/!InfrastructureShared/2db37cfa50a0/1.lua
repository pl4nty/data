-- Threat: !InfrastructureShared
-- Name: 2db37cfa50a0
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
bm.add_related_string("vname", l_0_0, bm.RelatedStringBMReport)
bm.trigger_sig_self_propagate("SuspChildProcessLaunch", l_0_0)
return mp.INFECTED
