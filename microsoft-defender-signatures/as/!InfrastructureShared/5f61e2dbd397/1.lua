-- Threat: !InfrastructureShared
-- Name: 5f61e2dbd397
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
