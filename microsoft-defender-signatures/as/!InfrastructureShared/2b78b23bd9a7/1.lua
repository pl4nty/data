-- Threat: !InfrastructureShared
-- Name: 2b78b23bd9a7
-- Type: 21

if peattributes.isexe and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
