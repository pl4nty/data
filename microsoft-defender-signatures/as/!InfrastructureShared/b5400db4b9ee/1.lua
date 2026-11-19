-- Threat: !InfrastructureShared
-- Name: b5400db4b9ee
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
