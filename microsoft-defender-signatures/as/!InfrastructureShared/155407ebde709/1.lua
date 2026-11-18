-- Threat: !InfrastructureShared
-- Name: 155407ebde709
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.getfilesize() >= 200000000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
