-- Threat: !InfrastructureShared
-- Name: fb782cc38630
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 4048000 then
  return mp.INFECTED
end
return mp.CLEAN
