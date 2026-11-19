-- Threat: !InfrastructureShared
-- Name: bf78a10025e7
-- Type: 21
-- Flags: 1

if peattributes.ismsil == true and mp.get_mpattribute("pea_has_msilresources") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
