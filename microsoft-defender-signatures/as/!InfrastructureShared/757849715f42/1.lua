-- Threat: !InfrastructureShared
-- Name: 757849715f42
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
