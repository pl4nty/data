-- Threat: !InfrastructureShared
-- Name: 43b334bf7b4b
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 then
  bm.trigger_sig(l_0_0, "BMDroppedArchiveInMount")
end
return mp.CLEAN
