-- Threat: !InfrastructureShared
-- Name: 15b782e76e3f2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
