-- Threat: !InfrastructureShared
-- Name: 16e780a7e732f
-- Type: 21

if mp.get_mpattribute("pea_isdll") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
