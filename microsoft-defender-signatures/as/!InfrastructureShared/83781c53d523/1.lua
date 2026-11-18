-- Threat: !InfrastructureShared
-- Name: 83781c53d523
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
