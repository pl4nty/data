-- Threat: !InfrastructureShared
-- Name: 3e781e59beed
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
