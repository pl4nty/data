-- Threat: !InfrastructureShared
-- Name: 2b786381ee0b
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
