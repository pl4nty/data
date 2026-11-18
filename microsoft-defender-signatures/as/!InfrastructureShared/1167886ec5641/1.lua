-- Threat: !InfrastructureShared
-- Name: 1167886ec5641
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
