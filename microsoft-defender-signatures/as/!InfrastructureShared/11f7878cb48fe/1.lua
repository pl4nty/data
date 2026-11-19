-- Threat: !InfrastructureShared
-- Name: 11f7878cb48fe
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
