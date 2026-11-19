-- Threat: !InfrastructureShared
-- Name: 4ab3cc3e8552
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  bm.trigger_sig("DroppedElf", this_sigattrlog[1].utf8p1)
end
return mp.CLEAN
