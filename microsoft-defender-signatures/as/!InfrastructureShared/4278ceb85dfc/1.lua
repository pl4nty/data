-- Threat: !InfrastructureShared
-- Name: 4278ceb85dfc
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
