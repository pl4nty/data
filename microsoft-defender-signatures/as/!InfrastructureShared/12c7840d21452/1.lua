-- Threat: !InfrastructureShared
-- Name: 12c7840d21452
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 4048000 then
  return mp.INFECTED
end
return mp.CLEAN
