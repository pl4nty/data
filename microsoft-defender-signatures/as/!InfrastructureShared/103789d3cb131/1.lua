-- Threat: !InfrastructureShared
-- Name: 103789d3cb131
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
