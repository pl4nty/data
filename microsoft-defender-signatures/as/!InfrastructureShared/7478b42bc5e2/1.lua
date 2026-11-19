-- Threat: !InfrastructureShared
-- Name: 7478b42bc5e2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
