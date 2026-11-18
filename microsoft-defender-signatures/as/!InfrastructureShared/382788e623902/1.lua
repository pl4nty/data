-- Threat: !InfrastructureShared
-- Name: 382788e623902
-- Type: 21

if mp.getfilesize() < 1024000 and pehdr.NumberOfSections == 3 and peattributes.ismsil == true and mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
