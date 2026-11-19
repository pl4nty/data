-- Threat: !InfrastructureShared
-- Name: 6261e4044d4d
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
