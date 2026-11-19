-- Threat: !InfrastructureShared
-- Name: 6978eb69afca
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
