-- Threat: !InfrastructureShared
-- Name: 28778115392b8
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() >= 111616 and mp.getfilesize() <= 111680 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
