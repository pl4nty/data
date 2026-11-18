-- Threat: !InfrastructureShared
-- Name: d978344431c2
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
