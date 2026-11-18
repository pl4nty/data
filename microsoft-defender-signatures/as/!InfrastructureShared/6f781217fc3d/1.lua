-- Threat: !InfrastructureShared
-- Name: 6f781217fc3d
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 300000 and mp.getfilesize() < 450000 and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
