-- Threat: !InfrastructureShared
-- Name: 234788a8191b1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 4048000 then
  return mp.INFECTED
end
return mp.CLEAN
