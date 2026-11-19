-- Threat: !InfrastructureShared
-- Name: 14f784b1e83bb
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
