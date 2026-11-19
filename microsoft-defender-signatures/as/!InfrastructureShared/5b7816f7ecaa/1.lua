-- Threat: !InfrastructureShared
-- Name: 5b7816f7ecaa
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
