-- Threat: !InfrastructureShared
-- Name: 43b3d1ef14b8
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= "" and l_0_0 ~= nil then
  bm.trigger_sig(l_0_0, "BMDroppedArchiveInFTP")
end
return mp.CLEAN
