-- Threat: !InfrastructureShared
-- Name: 5e7898e4732c
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
