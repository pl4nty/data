-- Threat: !InfrastructureShared
-- Name: 8c78f66eea12
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
