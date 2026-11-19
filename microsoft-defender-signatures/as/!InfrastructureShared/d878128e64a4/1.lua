-- Threat: !InfrastructureShared
-- Name: d878128e64a4
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
