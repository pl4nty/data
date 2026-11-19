-- Threat: !InfrastructureShared
-- Name: ba78dcc86a41
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
