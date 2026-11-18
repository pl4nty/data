-- Threat: !InfrastructureShared
-- Name: 11478da2a68f4
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.getfilesize() < 1048000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
