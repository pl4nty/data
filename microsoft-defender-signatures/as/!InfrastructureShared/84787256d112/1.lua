-- Threat: !InfrastructureShared
-- Name: 84787256d112
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
