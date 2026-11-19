-- Threat: !InfrastructureShared
-- Name: 9f78840bf306
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true and mp.getfilesize() < 150000 then
  return mp.INFECTED
end
return mp.CLEAN
