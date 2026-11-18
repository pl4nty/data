-- Threat: !InfrastructureShared
-- Name: b0780dd381b0
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
