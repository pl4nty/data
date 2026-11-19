-- Threat: !InfrastructureShared
-- Name: 37b3cd3404c5
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = string.match(l_0_0, "name=!#(.-!dha);")
  if l_0_1 == nil then
    return mp.INFECTED
  end
  bm.add_related_string("vname", l_0_1, bm.RelatedStringBMReport)
  bm.trigger_sig_self_propagate("SuspChildProcessLaunch", l_0_1)
  bm_AddRelatedFileFromCommandLine("BM", nil, nil, 1)
end
return mp.INFECTED
