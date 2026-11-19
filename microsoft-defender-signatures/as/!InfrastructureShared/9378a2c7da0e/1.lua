-- Threat: !InfrastructureShared
-- Name: 9378a2c7da0e
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
