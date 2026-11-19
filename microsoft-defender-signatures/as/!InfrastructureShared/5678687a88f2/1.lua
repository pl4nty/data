-- Threat: !InfrastructureShared
-- Name: 5678687a88f2
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
