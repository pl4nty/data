-- Threat: !InfrastructureShared
-- Name: 76b3c8b8908f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
bm.trigger_sig("ESPCreateFile.A", l_0_0)
return mp.CLEAN
