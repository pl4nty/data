-- Threat: !InfrastructureShared
-- Name: 8878f2be7d85
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
