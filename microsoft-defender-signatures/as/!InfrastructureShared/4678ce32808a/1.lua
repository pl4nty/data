-- Threat: !InfrastructureShared
-- Name: 4678ce32808a
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true and mp.getfilesize() < 65536 then
  return mp.INFECTED
end
return mp.CLEAN
