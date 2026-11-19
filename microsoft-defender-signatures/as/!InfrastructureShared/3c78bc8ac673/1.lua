-- Threat: !InfrastructureShared
-- Name: 3c78bc8ac673
-- Type: 21

if mp.get_mpattribute("pea_isdriver") then
  return mp.INFECTED
end
return mp.CLEAN
