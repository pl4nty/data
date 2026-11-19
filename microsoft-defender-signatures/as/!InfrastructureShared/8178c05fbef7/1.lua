-- Threat: !InfrastructureShared
-- Name: 8178c05fbef7
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.getfilesize() < 1048000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
