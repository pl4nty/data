-- Threat: !InfrastructureShared
-- Name: 4a78e8cfd09d
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
