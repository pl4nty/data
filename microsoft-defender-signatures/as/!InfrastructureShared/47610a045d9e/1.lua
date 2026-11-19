-- Threat: !InfrastructureShared
-- Name: 47610a045d9e
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true and mp.getfilesize() < 65536 then
  return mp.INFECTED
end
return mp.CLEAN
