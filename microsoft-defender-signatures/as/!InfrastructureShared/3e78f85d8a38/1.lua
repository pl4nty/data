-- Threat: !InfrastructureShared
-- Name: 3e78f85d8a38
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
